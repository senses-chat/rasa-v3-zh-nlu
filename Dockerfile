FROM python:3.8.11

EXPOSE 5005

WORKDIR /opt/server

ADD requirements.txt /opt/server
RUN pip install -r requirements.txt

ADD scripts/download_pretrained_model.py /tmp
RUN python /tmp/download_pretrained_model.py

ADD . /opt/server

RUN rasa train nlu

CMD ["rasa", "run", "--enable-api"]
