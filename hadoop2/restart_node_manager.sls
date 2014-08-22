restart_node_manager:
  cmd.run:
    - name: service hadoop-yarn-nodemanager restart
    - user: root
