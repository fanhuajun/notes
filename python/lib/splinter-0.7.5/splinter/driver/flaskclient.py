# -*- coding: utf-8 -*-

# Copyright 2014 splinter authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

from __future__ import with_statement

from splinter.cookie_manager import CookieManagerAPI
from splinter.request_handler.status_code import StatusCode

from .lxmldriver import LxmlDriver


class CookieManager(CookieManagerAPI):

    def __init__(self, browser_cookies):
        self._cookies = browser_cookies

    def add(self, cookies):
        if isinstance(cookies, list):
            for cookie in cookies:
                for key, value in cookie.items():
                    self._cookies.set_cookie('localhost', key, value)
                return
        for key, value in cookies.items():
            self._cookies.set_cookie('localhost', key, value)

    def delete(self, *cookies):
        if cookies:
            for cookie in cookies:
                try:
                    self._cookies.delete_cookie('localhost', cookie)
                except KeyError:
                    pass
        else:
            self._cookies.cookie_jar.clear()

    def all(self, verbose=False):
        cookies = {}
        for cookie in self._cookies.cookie_jar:
            cookies[cookie.name] = cookie.value
        return cookies

    def __getitem__(self, item):
        cookies = dict([(c.name, c) for c in self._cookies.cookie_jar])
        return cookies[item].value

    def __contains__(self, key):
        for cookie in self._cookies.cookie_jar:
            if cookie.name == key:
                return True
        return False

    def __eq__(self, other_object):
        if isinstance(other_object, dict):
            cookies_dict = dict([(c.name, c.value)
                                 for c in self._cookies.cookie_jar])
            return cookies_dict == other_object


class FlaskClient(LxmlDriver):

    driver_name = "flask"

    def __init__(self, app, user_agent=None, wait_time=2, custom_headers=None):
        app.config['TESTING'] = True
        self._browser = app.test_client()
        self._cookie_manager = CookieManager(self._browser)
        self._custom_headers = custom_headers if custom_headers else {}
        super(FlaskClient, self).__init__(wait_time=wait_time)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        pass

    def _post_load(self):
        self._forms = {}
        try:
            del self._html
        except AttributeError:
            pass
        self.status_code = StatusCode(self._response.status_code, '')

    def _do_method(self, method, url, data=None):
        self._url = url
        func_method = getattr(self._browser, method.lower())
        while True:
            self._last_urls.append(url)
            # flask doesn't expose redirect_chain, so we have to mark it
            self._response = func_method(url, headers=self._custom_headers, data=data, follow_redirects=False)
            if self._response.status_code not in (301, 302, 303, 305, 307):
                break
            url = self._response.headers['Location']
        self._url = self._last_urls[-1]
        self._post_load()

    def submit_data(self, form):
        return super(FlaskClient, self).submit(form).data

    @property
    def html(self):
        return self._response.get_data(as_text=True)
