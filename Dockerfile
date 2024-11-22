FROM registry.lazycat.cloud/alpine:3.18

COPY netron-main /root/netron
COPY run.sh /root/run.sh
RUN apk update; apk add python3;
WORKDIR /root/netron/
RUN echo "" > /etc/apk/repositories \
    echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.18/main/" >> /etc/apk/repositories \
    echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.18/community/" >> /etc/apk/repositories
    
RUN python -m venv /root/v; source /root/v/bin/activate; python package.py build; python package.py install;
