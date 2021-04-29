FROM ubuntu:bionic
RUN apt-get update && apt-get install sudo tasksel -y
RUN sudo unminimize
