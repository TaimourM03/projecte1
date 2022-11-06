FROM ubuntu:22.04
MAINTAINER Taimour Mahroof tmahroof21@ilg.cat
RUN apt-get update && apt-get -y upgrade

#Instación de los servicios:
RUN apt-get install -y apache2 supervisor python3.10 mysql-server openssh-server
#Directorios para los servicios; apache2,ssh,supervisor:
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
#PUERTOS: 80,443:apache2; 9001:supervisor; 3306:mysql; 22:ssh
EXPOSE 80 443 9001 3306 22

#Copiamos el fichero de supervisor al directorio dentro de ubuntu:
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord","-n"]
