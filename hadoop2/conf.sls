{%- from 'hadoop2/settings.sls' import hadoop with context %}

upload_config_files:
  file.recurse:
    - name: /etc/hadoop/conf.distribute
    - source: salt://hadoop2/files/config
    - template: jinja
    - user: root

create_hadoop_folder:
  file.directory:
    - name: {{hadoop.data_dir}}
    - user: root 
    - group: root
    - makedirs: True

create_hdfs_folder:
  file.directory:
    - name: {{hadoop.data_dir}}/hadoop-hdfs
    - user: hdfs
    - group: hadoop
    - dir_mode: 777
    - file_mode: 777
    - recurese:
      - user
      - group
      - mode
    - require:
      - file: create_hadoop_folder

create_hdfs_folder_cache:
  file.directory:
    - name: {{hadoop.data_dir}}/hadoop-hdfs/cache
    - user: hdfs
    - group: hadoop
    - dir_mode: 777
    - file_mode: 777
    - recurese:
      - user
      - group
      - mode
    - require:
      - file: create_hdfs_folder

create_mapreduce_folder:
  file.directory:
    - name: {{hadoop.data_dir}}/hadoop-mapreduce
    - user: mapred
    - group: hadoop
    - dir_mode: 777
    - file_mode: 777
    - recurese:
      - user
      - group
      - mode
    - require:
      - file: create_hadoop_folder

create_mapreduce_folder_cache:
  file.directory:
    - name: {{hadoop.data_dir}}/hadoop-mapreduce/cache
    - user: mapred 
    - group: hadoop
    - dir_mode: 777
    - file_mode: 777
    - recurese:
      - user
      - group
      - mode
    - require:
      - file: create_mapreduce_folder

create_yarn_folder:
  file.directory:
    - name: {{hadoop.data_dir}}/hadoop-yarn
    - user: yarn
    - group: hadoop
    - dir_mode: 777
    - file_mode: 777
    - recurese:
      - user
      - group
      - mode
    - require:
      - file: create_hadoop_folder

create_yarn_folder_cache:
  file.directory:
    - name: {{hadoop.data_dir}}/hadoop-yarn/cache
    - user: yarn
    - group: hadoop
    - dir_mode: 777
    - file_mode: 777
    - recurese:
      - user
      - group
      - mode
    - require:
      - file: create_yarn_folder


hadoop_conf_install_alternatives:
  alternatives.install:
    - name: hadoop-conf
    - link: /etc/hadoop/conf
    - path: /etc/hadoop/conf.distribute
    - priority: 40
    - require:
      - file: upload_config_files

hadoop_conf_set_alternatives:
  alternatives.set:
    - name: hadoop-conf
    - path: /etc/hadoop/conf.distribute
    - require:
      - alternatives: hadoop_conf_install_alternatives
