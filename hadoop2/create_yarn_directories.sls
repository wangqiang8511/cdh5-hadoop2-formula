tmp_folder:
  cmd.run:
    - name: hadoop fs -mkdir -p /tmp
    - user: hdfs

tmp_folder_mode:
  cmd.run:
    - name: hadoop fs -chmod -R 1777 /tmp
    - user: hdfs
    - require:
      - cmd: tmp_folder

yarn_history_folder:
  cmd.run:
    - name: hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
    - user: hdfs
    - require:
      - cmd: tmp_folder_mode

yarn_staging_owner:
  cmd.run:
    - name: hadoop fs -chown -R mapred:hadoop /tmp/hadoop-yarn/staging
    - user: hdfs
    - require:
      - cmd: yarn_history_folder

yarn_log_folder:
  cmd.run:
    - name: hadoop fs -mkdir -p /var/log/hadoop-yarn
    - user: hdfs

tmp_folder_owner:
  cmd.run:
    - name: hadoop fs -chown -R yarn:hadoop /var/log/hadoop-yarn
    - user: hdfs
    - require:
      - cmd: yarn_log_folder

history_server_done_folder:
  cmd.run:
    - name: hadoop fs -mkdir -p /user/history
    - user: hdfs

history_server_done_folder_owner:
  cmd.run:
    - name: hadoop fs -chown -R mapred:hadoop /user/history
    - user: hdfs
    - require:
      - cmd: history_server_done_folder
