git clone https://github.com/upszot/UTN-FRA_SO_Ansible.git

cd https://github.com/upszot/UTN-FRA_SO_Ansible.git
cd ejemplo_02

vim inventory
[testing]

[desarrollo]
192.168.56.2

[produccion]


vim playbook.yml
        WEB_SERVICE: "{% if   ansible_facts['os_family']  == 'Debian' %}apache2
                      {% elif ansible_facts['os_family'] == 'RedHat'  %}httpd
                      {% endif %}"

    - name: "Muestro nombre del servicio:"
      debug:
        msg: "nombre: {{ WEB_SERVICE }}"

    - name: "Run the equivalent of 'apt update' as a separate step"
      become: yes
      ansible.builtin.apt:
        update_cache: yes
      when: ansible_facts['os_family'] == "Debian"

    - name: "Instalando apache "
      become: yes
      package:
        name: "{{ item }}"
        state: present
      with_items:
        - "{{ WEB_SERVICE }}"



ssh-keygen

cat ~/.ssh/id_rsa.pub

copiamos la clave ssh

ansible-playbook -i inventory playbook.yml

ssh vagrant@192.168.56.2

sudo apt list --installed |grep apache

