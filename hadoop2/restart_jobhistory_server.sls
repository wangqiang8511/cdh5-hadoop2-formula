restart_jobhistory_server:
  cmd.run:
    - name: service hadoop-mapreduce-historyserver restart
    - user: root
