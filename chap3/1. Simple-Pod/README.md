# 간단한 Pod 배포

## 1. nginx pod 배포
```bash
# nginx Pod 배포
kubectl run nginx --image=nginx

# 배포된 Pod  확인
kubectl get pod -o wide

# Pod 서비스 확인
curl {Pod IP}:80
```

## 2. Service로 Pod 외부 노출
```bash
# nginx를 외부에 노출하기 위한 NodePort Service 생성
echo service.yaml << EOF
apiVersion: v1
kind: Service
metadata:
        name: nginx-service
spec:
        ports:
                - port: 80
                  targetPort: 80
        selector:
                run: nginx
        type: NodePort
EOF

# service 배포
kubectl create -f .

# 서비스 조회
kubectl get svc
```
서비스 조회를 통해 확인한 NodePort에 대해 EC2 보안정책에 추가 후 웹 콘솔로 접속 확인