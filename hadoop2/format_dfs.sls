{%- from 'hadoop2/settings.sls' import hadoop with context %}

remove_current_hdfs_dir:
  cmd.run:
    - name: "rm -rf {{hadoop.data_dir}}/hadoop-hdfs"
    - user: root

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
      - cmd: remove_current_hdfs_dir

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

format_namenode:
  cmd.run:
    - name: "hdfs namenode -format"
    - user: hdfs
    - require:
      - file: create_hdfs_folder_cache
