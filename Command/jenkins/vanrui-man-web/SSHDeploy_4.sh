#!/bin/bash
#解压后的名称
pro="vanrui-man-web"
pro_dir="/data/web-8087-man"

cd $pro_dir/
unzip *.zip
cp -r $pro-*/*  $pro_dir
rm -rf $pro_dir/vanrui*
/data/script/app-6009-order restart