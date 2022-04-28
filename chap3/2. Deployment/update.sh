#!/bin/bash

# 지연시간 설정
kubectl patch deploy myweb -p '{"spec": {"minReadySeconds": 10}}'

# 업데이트
# set image deploy {Deployment 이름} {Container 이름}={업데이트 할 이미지}
kubectl set image deploy myweb myweb=myweb:0.2