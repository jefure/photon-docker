FROM openjdk:21-jdk-slim

# Install pbzip2 for parallel extraction
RUN apt-get update && apt-get -y install pbzip2 wget && rm -rf /var/lib/apt/lists/*

WORKDIR /photon
ADD https://github.com/komoot/photon/releases/download/0.7.2/photon-opensearch-0.7.2.jar /photon/photon.jar
COPY entrypoint.sh ./entrypoint.sh

VOLUME /photon/photon_data
EXPOSE 2322

ENTRYPOINT /photon/entrypoint.sh
