#!/bin/bash
#解压后的名称
pro="vanrui-order-app"
pro_dir="/data/app-6009-order"
script_dir="/data/script/app-6009-order"

cd $pro_dir/
unzip *.zip
cp -r $pro-*/*  $pro_dir
rm -rf $pro_dir/vanrui*
$script_dir restart