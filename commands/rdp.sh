#! /bin/bash
#=============================================
# Microsoft Remote Desktop OSx terminal script
#=============================================

rdpTemplateFile=$HOME/dotfiles/rdp/template.rdp
rdpTempRDP=$TMPDIR/t.rdp
rdpRunCommand="/Applications/Remote Desktop Connection.app/Contents/MacOS/Remote Desktop Connection"
rdpHost=${1}

if [ "${2}" = "/console" ] ; then
    rdpHost="${rdpHost} /console";
    echo "rdpHost is: " ${rdpHost}
fi

if [ "${2}" = "-console" ] ; then
    rdpHost="${rdpHost} /console";
    echo "rdpHost is: " ${rdpHost}
fi

if [ "${2}" = "-admin" ] ; then
    rdpHost="${rdpHost} /console";
    echo "rdpHost is: " ${rdpHost}
fi

cp -f ${rdpTemplateFile} ${rdpTempRDP}

sed -i '' "s|zzxyzyz|${rdpHost}|g" ${rdpTempRDP}

open -na "${rdpRunCommand}" --args ${rdpTempRDP}
