# Minikube 설치

> Minikube 설치를 위한 EC2 생성
- 2vCore
- 2GB Memory
- 20GB Disk
- Ubuntu 20.0.4

## 1. Minikube 및 kubectl 설치
```bash
# 클러스터 구축을 위한 minikube 설치
$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
$ sudo install minikube-linux-amd64 /usr/local/bin/minikube

# 구축한 클러스터를 제어하기 위한 kubectl 설치
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# 설치정보 확인
$ minikube version

Minikube version: v1.25.2
commit: 362d5fdc0a3dbee389b3d3f1034e8023e72bd3a7

kubectl version

Client Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.5", GitCommit:"c285e781331a3785a7f436042c65c5641ce8a9e9", GitTreeState:"clean", BuildDate:"2022-03-16T15:58:47Z", GoVersion:"go1.17.8", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.3", GitCommit:"816c97ab8cff8a1c72eccca1026f7820e93e0d25", GitTreeState:"clean", BuildDate:"2022-01-25T21:19:12Z", GoVersion:"go1.17.6", Compiler:"gc", Platform:"linux/amd64"}
```

##2. 필수 패키지 설치
```bash
# 필수 패키지 설치
apt-get update
apt-get install docker.io conntrack

# minikube 실행 
minikube start --driver=none 
```