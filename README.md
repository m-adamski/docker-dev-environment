# Docker Development Environment
This repository contain Docker and Docker Compose configuration files created for development purposes.
Environment is based on Ubuntu 14.04 with installed Apache2, PHP7.1-FPM, MySQL and MailHog.

### How to use it?
To use this environment you need to install Docker first. All necessary informations you can find on [Docker website](https://www.docker.com). When Docker is installed on your system just clone / download this repository and then in the main directory run commands:

```shell
$ docker-compose build
$ docker-compose up -d
```

After that you are ready to go! Write your code in project directory and check result on ``http://localhost``

### Configuration
All important configuration variables are included in ``.env`` file.

### Self-Signed SSL Certificate
In some cases you would like to use secure communication protocol (HTTPS). Environment contain already generated pair of certificate and key files, but in case of new files generation needed you need to instal OpenSSL and run this command:

```shell
$ openssl req -x509 -nodes -days 20000 -newkey rsa:2048 -keyout modules\apache\cert\server.local.key -out modules\apache\cert\server.local.cert -subj /CN=localhost
```