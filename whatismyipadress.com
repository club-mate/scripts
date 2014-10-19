#! /bin/sh
#
# Date: 2010-04-13
# Autor: kh-2030
# Last Mod.: 2010-04-13
#
# Crawls and puts out the proxy detection table of whatismyipaddress.com


proxy="`curl --connect-timeout 20 -m 42 -sS -x "$1" -A 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)' 'http://whatismyipaddress.com/proxy-check'`"

detag() {
  sed -r 's/[[:space:]]*<[^>]*>[[:space:]]*//g'
}

kv_output() {
 sed -r '
    s/( server not detected.)/\tFALSE/g
    s/( server detected.)/\tTRUE/g
    s/(IP)/&\t/g
    s/(rDNS)/\
&\t/g
    s/(TRUE|FALSE)/&\
/g
    s/(detected.)/&\
/g
    s/Test/\t/g
  '
}
output() {
echo "$proxy" | sed -n '/<!-- PAT:/p' | detag | kv_output | grep -v '^$'
}
output
