#!/bin/bash

pro="vanrui-user-app"
pro_dir="/data/fan"

cd $pro_dir/$pro/target
unzip *.zip
cp -r $pro-*/*  $pro_dir
rm -rf $pro_dir/vanrui*