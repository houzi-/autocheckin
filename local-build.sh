#!/bin/sh

MODULE="autocheckin"
VERSION="2.0"
TITLE="签到狗3.0"
DESCRIPTION="每日批量自动签到"
HOME_URL="Module_autocheckin.asp"
CHANGELOG="修正更新"

# Check and include base
rm -f ${MODULE}.tar.gz
#清理mac os 下文件
rm -f $MODULE/.DS_Store
rm -f $MODULE/*/.DS_Store

rm -f ${MODULE}.tar.gz
tar -zcvf ${MODULE}.tar.gz $MODULE
md5value=`md5sum ${MODULE}.tar.gz|tr " " "\n"|sed -n 1p`
cat > ./version <<EOF
$VERSION
$md5value
EOF
cat version

DATE=`date +%Y-%m-%d_%H:%M:%S`
cat > ./config.json.js <<EOF
{
"module":"$MODULE",
"version":"$VERSION",
"md5":"$md5value",
"home_url":"$HOME_URL",
"title":"$TITLE",
"description":"$DESCRIPTION",
"changelog":"$CHANGELOG",
"build_date":"$DATE"
}
EOF
