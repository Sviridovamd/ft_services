#!/bin/bash

#start minikube in virtualbox

minikube start --vm-driver=virtualbox

#setup metallb in addons list

minikube addons enable metallb
#metallb apply config
kubectl apply -f srcs/metalLB/configmap.yaml

#build docker in minikube

eval "$(minikube -p minikube docker-env)"

# NGINX POD

#setup deployment and service nginx
docker build -t nginx_image srcs/nginx
#nginx config apply
kubectl apply -f srcs/nginx/nginx.yaml

# PHPMYADMIN POD

#setup deployment and service phpmyadmin
docker build -t pma_image srcs/phpmyadmin
#phpmyadmin config apply
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# WORDPRESS POD

#setup deployment and service wordpress
docker build -t wp_image srcs/wordpress
# config apply
kubectl apply -f srcs/wordpress/wordpress.yaml

# MYSQL

#setup deployment and service mysql
docker build -t mysql_image srcs/mysql
# config apply
kubectl apply -f srcs/mysql/mysql.yaml

# FTPS

#setup deployment and service ftps
docker build -t ftps_image srcs/ftps
# config apply
kubectl apply -f srcs/ftps/ftps.yaml

# TELEGRAF

#setup deployment and service telegraf
docker build -t telegraf_image srcs/telegraf
# config apply
kubectl apply -f srcs/telegraf/telegraf.yaml

# INFLUXDB

#setup deployment and service influx
docker build -t influxdb_image srcs/influx
# config apply
kubectl apply -f srcs/influx/influxdb.yaml

# GRAFANA

#setup deployment and service grafana
docker build -t grafana_image srcs/grafana
# config apply
kubectl apply -f srcs/grafana/grafana.yaml

#open minikube dashboard

minikube dashboard
