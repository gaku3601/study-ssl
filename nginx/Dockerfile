FROM nginx:1.13.8

MAINTAINER gaku3601

# ツールインストール
RUN apt-get update
RUN apt-get install -y supervisor cron
RUN apt-get install -y letsencrypt

# 環境変数設定
ENV TZ=Asia/Tokyo

# supervisorの設定
ADD supervisord.conf /etc/supervisord.conf

# cronの設定
RUN printenv >> /etc/crontab
RUN mkdir /var/log/cron
RUN echo '* * * * * root date >> /var/log/cron/`date '+\\%Y-\\%m-\\%d'`.log 2>&1' >> /etc/crontab

# nginxの設定
ADD ./default.conf /etc/nginx/conf.d/default.conf

# ssl設定
RUN mkdir /usr/share/nginx/html/ssl


# 起動
CMD /usr/bin/supervisord -c /etc/supervisord.conf
