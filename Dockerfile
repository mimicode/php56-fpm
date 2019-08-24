FROM centos:6.6
LABEL maintainer="leitao.zhang@phpstu.com"
ENV PATH $PATH:/usr/local/bin
COPY file_tar/ /usr/local/src/ 
RUN  chmod +x  /usr/local/src/install.sh && /usr/local/src/install.sh 
EXPOSE 9056
CMD [ "/usr/local/bin/php56" ]

