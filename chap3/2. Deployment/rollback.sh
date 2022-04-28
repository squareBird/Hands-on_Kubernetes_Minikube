#!/bin/bash

# 버전 보기
# kubectl rollout history deployment

kubectl rollout undo deploy myweb

# 특정 버전으로 돌아가기
#kubectl rollout undo deploy myweb --to-revision=1