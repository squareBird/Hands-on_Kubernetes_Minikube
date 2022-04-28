#!/bin/bash

# 인자 2개로 감시
while true; do wget -O- -q $1:$2; echo -e '\n'; sleep 1; done