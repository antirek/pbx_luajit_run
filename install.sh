#!/bin/bash

cp LuaJIT-2.0.4.tar.gz /usr/src/
cp pbx_luajit.tar.gz /usr/src/

cd /usr/src/
tar -zxf LuaJIT-2.0.4.tar.gz
tar -zxf pbx_luajit.tar.gz

cd LuaJIT-2.0.4
make PREFIX=/usr && make PREFIX=/usr install

cd ..
cd pbx_luajit
make
cp bin/Release/pbx_luajit.so $(updatedb && locate asterisk | grep modules | grep -v debug | grep usr | head -n 1)
