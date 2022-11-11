#!/bin/bash

echo "Criando imagens docker file....."

docker build -t flaviodevfrazao/projetoapp-backend:1.0 backend/.
docker build -t flaviodevfrazao/projetoapp-database:1.0 database/.

echo "Upload das imagens no DockerHub......"

docker push flaviodevfrazao/projetoapp-backend:1.0
docker push flaviodevfrazao/projetoapp-database:1.0

echo "Criando serviços no cluster kubernets....."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml