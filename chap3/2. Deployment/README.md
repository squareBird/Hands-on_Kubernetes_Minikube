# Deploymenet 배포 및 버전관리

## 1. Container Image Build

`Docker runtime`을 이용한 `Container image` 생성.

> 소스
temp-0.0.1-SNAPSHOT.jar
temp-0.0.2-SNAPSHOT.jar

```bash
# 0.1, 0.2 버전 웹 어플리케이션 컨테이너 이미지 생성
$ chmod +x docker-build-0.1.sh
$ chmod +x docker-build-0.2.sh

# 컨테이너 이미지 조회
$ docker images

REPOSITORY                                TAG       IMAGE ID       CREATED          SIZE
myweb                                     0.2       067c40fbe6dd   38 minutes ago   677MB
myweb                                     0.1       48d5c9c62b38   39 minutes ago   677MB
```

## 2. Deployment 배포
```yaml
# Deployment yaml 파일

apiVersion: apps/v1
kind: Deployment
metadata:
  name: myweb
  labels:
    app: myweb
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myweb
  template:
    metadata:
      labels:
        app: myweb
    spec:
      containers:
        - name: myweb
          image: myweb:0.1
          ports:
            - containerPort: 8080
```

```yaml
# service yaml 파일

apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: myweb
  ports:
    - port: 8080
      targetPort: 8080
```

```bash
# Deployment 및 service 배포
$ kubectl apply -f .

# Pod 및 Service 확인
$ kubectl get pod
$ kubectl get svc
```

## 3. Deployment 버전 업그레이드
```bash
# 지연시간 설정
kubectl patch deploy myweb -p '{"spec": {"minReadySeconds": 10}}'

# webapp:0.2 버전으로 업데이트
kubectl set image deploy myweb myweb=myweb:0.2
```
