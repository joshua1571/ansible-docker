FROM fedora:latest

#ENV LANG en_US.UTF-8
#ENV LC_ALL en_US.UTF-8

ENV ANSIBLE_ASK_PASS TRUE
ENV ANSIBLE_ASK_BECOME_PASS TRUE
ENV ANSIBLE_ASK_VAULT_PASS FALSE
ENV ANSIBLE_LOG_PATH /ansible
ENV ANSIBLE_HOST_KEY_CHECKING FALSE

RUN dnf check-update; \
    dnf install -y \
      gcc \
      python3 \
      python3-pip \
      wget \ 
      openssh \
      openssh-clients \
      sshpass; \
    dnf clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; 
    #ansible-galaxy collection install azure.azcollection; \
    #pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

ENTRYPOINT [ "ansible-playbook" ]

CMD ["--version"]