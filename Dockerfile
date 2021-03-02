FROM ubuntu:18.04

RUN apt-get update && apt-get install -y sudo apt-utils vim apache2 apache2-utils git libbz2-dev liblzma-dev \
    python3 libapache2-mod-wsgi-py3 systemd wget libssl-dev build-essential zlib* libmysqlclient-dev locales
RUN apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/apache2 && apt install -y apache2
RUN DEBIAN_FRONTEND="noninteractive" TZ="Asia/Taipei" apt-get -y install tzdata
RUN TZ=Asia/Taipei && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get clean autoclean && apt-get autoremove --yes

RUN locale-gen zh_TW && locale-gen zh_TW.UTF-8 && update-locale LANG="zh_TW.UTF-8" LANGUAGE="zh_TW"
ADD ./envvars /etc/apache2/envvars
ADD python_env.sh /python_env.sh
RUN chmod +x /python_env.sh
RUN ./python_env.sh
