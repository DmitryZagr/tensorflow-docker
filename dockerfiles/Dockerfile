FROM tensorflow/tensorflow:2.0.0-gpu-py3-jupyter

RUN apt-get update && apt-get install wget

RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh && chmod +x Anaconda3-2019.07-Linux-x86_64.sh &&  \
    bash Anaconda3-2019.07-Linux-x86_64.sh -b && rm Anaconda3-2019.07-Linux-x86_64.sh
