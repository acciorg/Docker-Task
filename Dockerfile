FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y python-pip \
    && apt-get install -y git
WORKDIR /myapp
RUN git clone https://github.com/Sysnove/flask-hello-world.git .
RUN pip install -r requirements.txt
RUN sed -i 's/run()/run(host="0.0.0.0",port=5000)/' hello.py
CMD python hello.py
EXPOSE 5000
