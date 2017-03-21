#!/bin/bash
#解压后的名称
pro="vanrui-user-app"
pro_dir="/data/fan"

cd $pro_dir/
unzip *.zip
cp -r $pro-*/*  $pro_dir
rm -rf $pro_dir/vanrui*