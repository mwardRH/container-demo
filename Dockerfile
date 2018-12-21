FROM fedora:latest
MAINTAINER Matthew Ward <>

RUN pip3 install pelican
RUN dnf install -y git
RUN dnf install -y nginx

RUN git clone https://github.com/mwardRH/container-demo.git
RUN cd container-Demo
RUN pelican ./src/

RUN rm -rf /usr/share/nginx/html/index.html
RUN rsync -avP src/output/* /usr/share/nginx/html/

EXPOSE 80

CMD [ "/usr/sbin/nginx" ]
