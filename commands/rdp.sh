#! /bin/bash
#=============================================
# Microsoft Remote Desktop OSx terminal script
#=============================================

rdpTemplateFile=$HOME/dotfiles/rdp/template.rdp
rdpTempRDP=$TMPDIR/t.rdp
rdpRunCommand="/Applications/Microsoft Remote Desktop.app/Contents/MacOS/Microsoft Remote Desktop"
rdpHost=${1}

if [ "${1}" = "" ]; then
  echo "Please type a valid hostname/IP"
  exit
fi

if [ "${2}" = "/console" ]; then
  rdpHost="${rdpHost} /console";
  echo "rdpHost is: " ${rdpHost}
fi

if [ "${2}" = "-console" ]; then
  rdpHost="${rdpHost} /console";
  echo "rdpHost is: " ${rdpHost}
fi

if [ "${2}" = "-admin" ]; then
  rdpHost="${rdpHost} /console";
  echo "rdpHost is: " ${rdpHost}
fi

cp -f ${rdpTemplateFile} ${rdpTempRDP}
sed -i "s|zzxyzyz|${rdpHost}|g" ${rdpTempRDP}

open -na "${rdpRunCommand}" ${rdpTempRDP}
