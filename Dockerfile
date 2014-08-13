FROM centos:centos6

ADD ./jpackage.repo /etc/yum.repos.d/jpackage.repo
ADD ./answers.properties /etc/spacewalk/answers.properties

RUN yum install --setopt=tsflags=nodocs -y http://yum.spacewalkproject.org/2.2/RHEL/6/x86_64/spacewalk-repo-2.2-1.el6.noarch.rpm
RUN yum install --setopt=tsflags=nodocs -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install --setopt=tsflags=nodocs -y spacewalk-setup-postgresql spacewalk-postgresql supervisor
RUN spacewalk-setup --disconnected --answer-file=/etc/spacewalk/answers.properties || cat /var/log/rhn/install_db.log
RUN exit 1

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./run-spacewalk.sh /usr/local/bin/run-spacewalk.sh

EXPOSE 80
EXPOSE 443

CMD ["/usr/local/bin/run-spacewalk.sh"]

