FROM python:3.10

RUN apt-get update && apt-get install -y \
    gdal-bin \
    libgdal-dev \
    build-essential \
    python3-dev \
    libhdf5-dev \
    libxml2-dev \
    libxslt1-dev \
    pkg-config \
    libvirt-dev \
    libffi-dev \
    libssl-dev \
    graphviz-dev \
    libcairo2-dev \
    libgirepository1.0-dev \
    && apt-get clean

ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

WORKDIR /app

RUN pip install --upgrade pip setuptools

RUN pip install --no-cache-dir numpy

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash"]
