#!/bin/bash
cd /tmp
wget http://software.bigfix.com/download/bes/95/BESAgent-9.5.14.73-rhe6.x86_64.rpm
wget http://129.34.20.42:52311/masthead/masthead.afxm
rpm -Uvh BESAgent-9.5.14.73-rhe6.x86_64.rpm
mkdir -p /etc/opt/BESClient
cp masthead.afxm /etc/opt/BESClient/actionsite.afxm
echo '[Software\BigFix\EnterpriseClient\Settings\Client\__RelayServer1]
effective date = Mon, 10 Dec 2012 13:01:13 -0500
value = http://watxtemyz02.watson.ibm.com:52311/bfmirror/downloads/

[Software\BigFix\EnterpriseClient\Settings\Client\__RelayServer2]
effective date = Mon, 10 Dec 2012 13:01:13 -0500
value = http://129.34.20.42:52311/bfmirror/downloads/

[Software\BigFix\EnterpriseClient\Settings\Client\__RelaySelect_Automatic]
effective date = Mon, 10 Dec 2012 13:01:13 -0500
value = 0 ' > /var/opt/BESClient/besclient.config
service besclient start
chkconfig besclient on
