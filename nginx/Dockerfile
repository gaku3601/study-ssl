FROM nginx:1.13.8

RUN apt-get update
RUN apt-get install -y supervisor cron
RUN apt-get install -y locales locales-all

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# supervisorの設定
ADD supervisord.conf /etc/supervisord.conf

# cronの設定
RUN mkdir /var/log/cron
RUN echo '* * * * * root date >> /var/log/cron/`date '+\\%Y-\\%m-\\%d'`.log 2>&1' >> /etc/crontab

# 起動
CMD /usr/bin/supervisord -c /etc/supervisord.conf
