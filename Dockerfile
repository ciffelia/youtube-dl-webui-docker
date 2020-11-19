FROM python:3.9-alpine

RUN apk --no-cache add ffmpeg && \
    pip install youtube-dl Flask

COPY ./youtube-dl-webui /ytdl-webui/source

WORKDIR /ytdl-webui/source
RUN python setup.py install

ENTRYPOINT ["youtube-dl-webui", "--config", "/ytdl-webui/config/youtube-dl-webui.json"]
