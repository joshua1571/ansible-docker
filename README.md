# workstation-setup

# Get rid of old containers
docker container prune -f

# Remove old image
docker image rm ansible-docker

# build new image
docker build -t ansible-docker:latest .

# Run test playbook
docker run -it -v "$(PWD):/root/ansible" ansible-docker -i /root/ansible/hosts /root/ansible/docker_test.yml --ask-become-pass

# Debug container environment
docker run -it --entrypoint /bin/bash ansible-docker   