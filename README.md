# Dockerized Ansible

Ansible installed via Pip in Alpine-based image.

# Usage

Image intended to be a drop-in replacement of `ansible` command line tool in a
Docker environment:

    $ docker run --rm adegtyarev/ansible ansible --version
    ansible 2.5.0
      config file = None
      configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
      ansible python module location = /usr/lib/python3.6/site-packages/ansible
      executable location = /usr/bin/ansible
      python version = 3.6.3 (default, Nov 21 2017, 14:55:19) [GCC 6.4.0]

For example, let's say we have `./src` with Ansible playbooks base directory
and an inventory file `./hosts`:

    ANSIBLE_PLAYBOOK_CMD="docker run --rm -t \
        -e ANSIBLE_HOST_KEY_CHECKING=no \
        -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
        -v $PWD/hosts:/etc/ansible/hosts:ro \
        -v $PWD/src:/src \
        -v /tmp:/tmp \
        adegtyarev/ansible \
        ansible-playbook"

This will share SSH agent socket with Ansible client so that it like being
running from the current console:

    $ANSIBLE_PLAYBOOK_CMD playbook.yaml

## Author

Alexey Degtyarev
