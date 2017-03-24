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