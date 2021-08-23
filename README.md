# ft_services
This project consist to clusturing an docker-compose application and deploy it with Kubernetes. 



![Image alt](https://github.com/Sviridovamd/ft_services/blob/master/ft_services_logo.png)

Make sure that each redirection toward a service is done using a load balancer. FTPS,
Grafana, Wordpress, PhpMyAdmin and nginx’s kind must be "LoadBalancer". Influxdb
and MySQL’s kind must be "ClusterIP". Other entries can be present, but none of them
can be of kind "NodePort".


![Image alt](https://github.com/Sviridovamd/ft_services/blob/master/services_sub.png)

![Image alt](https://github.com/Sviridovamd/ft_services/blob/master/services.png)

![Image alt](https://github.com/Sviridovamd/ft_services/blob/master/6c190c8cedea1c57894961be9ecb3129.png)
