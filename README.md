Docker command to create image

docker build -t tasks-manager .


Run the container

docker run -p 8080:8080 -e PORT=8080 tasks-manager