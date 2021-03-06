FROM gocd/gocd-agent-docker-dind:v18.12.0

COPY requirements.txt .

RUN apk --no-cache add python3 openssl ca-certificates openblas-dev gfortran
RUN apk --update add --virtual build-dependencies python3-dev libffi-dev build-base linux-headers zlib-dev jpeg-dev \
  && pip3 install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt \
  && apk del build-dependencies \
  && ln -sf /usr/bin/python3 /usr/bin/python
