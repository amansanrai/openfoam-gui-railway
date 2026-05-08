FROM openfoam/openfoam-dev-graphical-apps

USER root

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    novnc \
    websockify \
    xvfb \
    xterm \
    supervisor \
    && apt-get clean

RUN mkdir -p /root/.vnc

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV DISPLAY=:1

EXPOSE 8080

CMD ["/start.sh"]
