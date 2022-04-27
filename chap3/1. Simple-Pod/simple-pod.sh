#!/bin/bash

sudo kubectl run nginx --image=nginx

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
sudo kubectl create -f .