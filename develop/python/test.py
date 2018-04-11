import webbrowser

url = 'www.baidu.com'

# Open URL in a new tab, if a browser window is already open.
# webbrowser.open_new_tab(url)

# Open URL in new window, raising the window if possible.
print(webbrowser.open_new(url))

drive = webbrowser.Chrome()

print(drive)
