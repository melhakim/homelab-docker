FROM python:3.13
RUN pip install spotdl
RUN spotdl --download-ffmpeg
ENTRYPOINT ["/usr/local/bin/spotdl"]
