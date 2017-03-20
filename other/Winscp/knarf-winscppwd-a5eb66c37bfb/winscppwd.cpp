/*

  Copyright (c) 2011, Aurelien Aptel <aurelien.aptel@gmail.com>

  Permission to use, copy, modify, and/or distribute this software for any
  purpose with or without fee is hereby granted, provided that the above
  copyright notice and this permission notice appear in all copies.

  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

*/

#include <string>
#include <fstream>
#include <iostream>
#include <cstdlib>
#include <vector>

using namespace std;
typedef unsigned char uchar;

#define PW_MAGIC  0xA3
#define PW_MAXLEN 50
#define PW_FLAG   0xFF

string decrypt(string pwd, string key);

#ifdef WIN
#include <windows.h>
#define REG_MAXLEN_KEY 255
#define REG_MAXLEN_VAL 16383

const string session_path = TEXT("SOFTWARE\\Martin Prikryl\\WinSCP 2\\Sessions");

// mostly from MSDN
bool reg_get_list (string key, vector<string>& keylist, vector<string>& vallist)
{
    HKEY     hKey;
    TCHAR    achKey[REG_MAXLEN_KEY];   // buffer for subkey name
    DWORD    cbName;                   // size of name string
    TCHAR    achClass[MAX_PATH] = TEXT("");  // buffer for class name
    DWORD    cchClassName = MAX_PATH;  // size of class string
    DWORD    cSubKeys=0;               // number of subkeys
    DWORD    cbMaxSubKey;              // longest subkey size
    DWORD    cchMaxClass;              // longest class string
    DWORD    cValues;              // number of values for key
    DWORD    cchMaxValue;          // longest value name
    DWORD    cbMaxValueData;       // longest value data
    DWORD    cbSecurityDescriptor; // size of security descriptor
    FILETIME ftLastWriteTime;      // last write time

    DWORD i, retCode;

    TCHAR  achValue[REG_MAXLEN_VAL];
    DWORD cchValue = REG_MAXLEN_VAL;

    retCode = RegOpenKeyExA(HKEY_CURRENT_USER, key.c_str(), 0, KEY_READ, &hKey);
    if(retCode != ERROR_SUCCESS) {
        cout << "bark\n";
        return false;
    }

    // Get the class name and the value count.
    retCode = RegQueryInfoKey(
        hKey,                    // key handle
        achClass,                // buffer for class name
        &cchClassName,           // size of class string
        NULL,                    // reserved
        &cSubKeys,               // number of subkeys
        &cbMaxSubKey,            // longest subkey size
        &cchMaxClass,            // longest class string
        &cValues,                // number of values for this key
        &cchMaxValue,            // longest value name
        &cbMaxValueData,         // longest value data
        &cbSecurityDescriptor,   // security descriptor
        &ftLastWriteTime);       // last write time


    if (cSubKeys)
    {
        // printf( "\nNumber of subkeys: %lu\n", cSubKeys);

        for (i=0; i<cSubKeys; i++)
        {
            cbName = REG_MAXLEN_KEY;
            retCode = RegEnumKeyEx(hKey, i,
                     achKey,
                     &cbName,
                     NULL,
                     NULL,
                     NULL,
                     &ftLastWriteTime);
            if (retCode == ERROR_SUCCESS)
            {
                // printf("(%lu) %s\n", i+1, achKey);
                keylist.push_back(achKey);
            }
        }
    }

    if (cValues) {
        // printf( "\nNumber of values: %lu\n", cValues);

        for (i=0, retCode=ERROR_SUCCESS; i<cValues; i++) {
            cchValue = REG_MAXLEN_VAL;
            achValue[0] = '\0';
            retCode = RegEnumValue(hKey, i,
                                   achValue,
                                   &cchValue,
                                   NULL,
                                   NULL,
                                   NULL,
                                   NULL);

            if(retCode == ERROR_SUCCESS) {
                // printf("(%lu) %s\n", i+1, achValue);
                vallist.push_back(achValue);
            }
        }
    }
    RegCloseKey(hKey);
    return true;
}

bool reg_get_key (string location, string name, string& val)
{
    HKEY key;
    TCHAR value[1024];
    DWORD bufLen = 1024*sizeof(TCHAR);
    long ret;

    ret = RegOpenKeyExA(HKEY_CURRENT_USER, location.c_str(), 0, KEY_QUERY_VALUE, &key);
    if(ret != ERROR_SUCCESS) {
        return false;
    }
    ret = RegQueryValueExA(key, name.c_str(), 0, 0, (LPBYTE) value, &bufLen);
    RegCloseKey(key);
    if ( (ret != ERROR_SUCCESS) || (bufLen > 1024*sizeof(TCHAR)) ){
        return false;
    }
    string stringValue = string(value, (size_t)bufLen - 1);
    size_t i = stringValue.length();
    while( i > 0 && stringValue[i-1] == '\0' ){
        --i;
    }
    val = stringValue;
    return true;
}

void decrypt_registry_session (string session)
{
    const string
        kuser = TEXT("UserName"), khost = TEXT("HostName"),
        kpw = TEXT("Password"), ktunuser = TEXT("TunnelUserName"),
        ktunhost = TEXT("TunnelHostName"), ktunpw = TEXT("TunnelPassword");

    bool r = true;
    string user, host, pw;
    string path = session_path + TEXT("\\") + session;

    // normal session
    r = r && reg_get_key(path, kuser, user);
    r = r && reg_get_key(path, khost, host);
    r = r && reg_get_key(path, kpw, pw);
    if(r)
        cout << user << "@" << host << "\t" << decrypt(pw, user+host) << "\n";

    // tunnel session
    r = r && reg_get_key(path, ktunuser, user);
    r = r && reg_get_key(path, ktunhost, host);
    r = r && reg_get_key(path, ktunpw, pw);
    if(r)
        cout << user << "@" << host << "\t" << decrypt(pw, user+host) << "\n";

}

void read_registry ()
{
    vector<string> keylist, vallist;
    bool r;
    r = reg_get_list(session_path, keylist, vallist);

    for(int i = 0; i < keylist.size(); i++)
        decrypt_registry_session(keylist[i]);
}
#endif

int dec_next_char(string &s)
{
    if(s.length() <= 0)
        return 0;

    const string base = "0123456789ABCDEF";
    int a = base.find(s[0]);
    int b = base.find(s[1]);
    uchar r = (uchar) ~((a << 4) + (b << 0) ^ PW_MAGIC);
    s.erase(0, 2);

    return r;
}

string decrypt(string pwd, string key)
{
    string clearpwd;
    uchar length, flag;

    flag = dec_next_char(pwd);

    if(flag == PW_FLAG) {
        dec_next_char(pwd);
        length = dec_next_char(pwd);
    } else
        length = flag;

    pwd.erase(0, (dec_next_char(pwd))*2);

    for(int i = 0; i < length; i++)
        clearpwd += (char)dec_next_char(pwd);

    if(flag == PW_FLAG) {
        if(clearpwd.substr(0, key.length()) != key)
            clearpwd = "";
        else
            clearpwd.erase(0, key.length());
    }
    return clearpwd;
}

string clean (string s)
{
    int len = s.length();

    if(len && s[len-1] == '\r')
        s.erase(len-1, 1);

    return s;
}

void parse_wscp_conf (char* path)
{
    string l;
    string host, user, pwd;
    string tunnel_host, tunnel_user, tunnel_pwd;
    ifstream f(path);

    if(!f.is_open()) {
        cerr << "Cannot open " << path << "\n";
        exit(1);
    }

    cerr << "reading " << path << "\n";
    while(f.good()) {
        getline(f, l);
        if(l.substr(0, 9) == "UserName=") {
            user = clean(l.substr(9));
        } else if(l.substr(0, 15) == "TunnelUserName=") {
            tunnel_user = clean(l.substr(15));
        } else if(l.substr(0, 9) == "HostName=") {
            host = clean(l.substr(9));
        } else if(l.substr(0, 15) == "TunnelHostName=") {
            tunnel_host = clean(l.substr(15));
        } else if(l.substr(0, 9) == "Password=" || l.substr(0,15) == "TunnelPassword=") {
            int password_start = l.find_first_of('=') + 1;
            bool is_tunnel = password_start == 9;
            pwd = clean(l.substr(password_start));
            if(is_tunnel && !user.empty() && !host.empty() && !pwd.empty()) {
                cout << user << "@" << host << "\t"
                     << decrypt(pwd, user+host) << "\n";
            }
            else if(!is_tunnel && !tunnel_user.empty() && !tunnel_host.empty()) {
                cout << tunnel_user << "@" << tunnel_host << "\t"
                     << decrypt(pwd, tunnel_user+tunnel_host) << "\n";
            }
            user = host = pwd = "";
        }
    }
    f.close();
}

int main (int argc, char** argv)
{
    string user, host, pwd;

    switch(argc-1) {
#ifdef WIN
    case 0:
        read_registry();
        break;
#endif
    case 1:
        if(string("-h") == argv[1] || string("/?") == argv[1])
            goto help;
        parse_wscp_conf(argv[1]);
        break;
    case 3:
        user = argv[1];
        host = argv[2];
        pwd = argv[3];
        cout << user << "@" << host << "\t" << decrypt(pwd, user+host);
        break;
    help:
    default:
        cerr << "Restore stored password from WinSCP.\n"
             << "Usage:\n\t" << argv[0] << " [user host cryptedpwd | path/to/winscp.ini | -h | /? ]\n"
             << "On Windows, no options means look up in the registry.\n"
             << "\nExamples:\n"
             << "\t" << argv[0] << " foo example.com A35C4E4502235B7335F65E12961302012888799B78BAF39F5A632CA6073A333339243D312C3039723F33313F3D3739B012F6\n"
             << "\t" << argv[0] << " /tmp/winscp.ini\n";
        break;
    }

    return 0;
}
