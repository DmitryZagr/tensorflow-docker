#!/bin/bash -   

if [ -n "$1" ]
then
    command=$1
    container_name=tensorflow

    if [ "$command" == "up" ]; then
        docker run -d  --name $container_name --restart=always --gpus all --memory=58g --cpus=7  -p 8888:8888  -v $(realpath data):/tf/notebooks-persistent -v $(realpath config/jupyter_notebook_config.json):/root/.jupyter/jupyter_notebook_config.json:ro tensorflow/tensorflow:2.0.0-gpu-py3-jupyter
    elif [ "$command" == "down" ]; then
        docker stop $container_name
        docker rm $container_name
    elif [ "$command" == "up-basic" ]; then
        docker run -d  --name $container_name --restart=always --gpus all --memory=58g --cpus=7  -p 8888:8888  -v $(realpath data):/tf/notebooks-persistent -v $(realpath config/jupyter_notebook_config.json):/root/.jupyter/jupyter_notebook_config.json:ro tensorflow/tensorflow:2.0.0-py3-jupyter
    elif [ "$command" == "down-basic" ]; then
        docker stop $container_name
        docker rm $container_name
    else
        echo "Unknown argument: \"$command\""
    fi
else
    echo "No parameters found. "
fi
