{%- from 'hadoop2/settings.sls' import hadoop with context %}

upload_cdh5_repo:
  file.managed:
    - name: /etc/yum.repos.d/cdh5.repo
    - source: salt://hadoop2/files/cdh5.repo
    - template: jinja
    - user: root

install_hadoop:
  file.managed:
    - name: /tmp/install_hadoop.sh
    - source: salt://hadoop2/files/install_hadoop.sh
    - template: jinja
    - mode: 755 
  cmd.run:
    - name: "/tmp/install_hadoop.sh" 
    - require: 
      - file: upload_cdh5_repo
      - file: install_hadoop
