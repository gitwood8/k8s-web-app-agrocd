#!/usr/bin/bash
echo -e "\n\n======================= Stopping Container =======================\n\n"
docker stop $(docker ps -q)
echo -e "\n\n======================= Building the Container =======================\n\n"
docker build -t qwe .
echo -e "\n\n======================= Runnig the Container =======================\n\n"
docker run -d --name QWE -p 1234:80 qwe 
echo -e "\n\n======================= Container Started =======================\n\n"
docker ps
exit 0