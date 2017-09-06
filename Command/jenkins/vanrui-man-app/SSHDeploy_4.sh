#!/bin/bash
#解压后的名称
pro="vanrui-man-app"
pro_dir="/data/app-6007-man"
script_dir="/data/script/app-6007-man"

cd $pro_dir/
unzip *.zip
cp -r $pro-*/*  $pro_dir
rm -rf $pro_dir/vanrui*
$script_dir restart