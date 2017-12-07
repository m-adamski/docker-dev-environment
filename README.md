# Docker Development Environment
This repository contain Docker and Docker Compose configuration files created for development purposes.
Environment is based on Ubuntu 16.04 with installed NGINX, Apache2, PHP-FPM, MySQL and MailHog.

### How to use it?
To use this environment you need to install Docker first. All necessary informations you can find on [Docker website](https://www.docker.com). When Docker is installed on your system just clone / download this repository and then in the main directory run commands:

```shell
$ docker-compose build
$ docker-compose up -d
```

After that you are ready to go!

### Configuration
All important configuration variables are included in ``.env`` file.

### NGINX or Apache2
To create the most powerfull environment this Docker image contain both NGINX and Apache2 Web Servers.
Becouse both of them cannot working at the same time on the same ports, you need to choose once of them. To do that, you need to open ``.env`` file and edit variable ``EXECUTE_WEB_SERVER``:

```
# Decide which Web Server will be executed [APACHE or NGINX]
EXECUTE_WEB_SERVER=APACHE
```
By default, Apache2 Web Serwer will run and response at 80, 443 ports.

### Virtual Hosts
This package was rebuild to support multiple virtual hosts. By default, two virtual hosts are defined:
* localhost
* example.com

New virtual host configuration can be add in ``modules/nginx/config/sites-available`` or ``modules/apache/config/sites-available`` directory. Every configuration is automatically linked to ``sites-enabled`` directory while starting virtual machine.

### Self-Signed SSL Certificate
In some cases you would like to use secure communication protocol (HTTPS). Environment contain already generated pair of certificate and key files, but in case of new files generation needed you need to install OpenSSL and run this command:

```shell
$ openssl req -x509 -nodes -days 20000 -newkey rsa:2048 -keyout modules\nginx\certificates\nginx.key -out modules\nginx\certificates\nginx.crt -subj /CN=localhost

$ openssl req -x509 -nodes -days 20000 -newkey rsa:2048 -keyout modules\apache\certificates\apache.key -out modules\apache\certificates\apache.crt -subj /CN=localhost
```

Note that already defined virtual hosts by default redirect to secure communication protocol.