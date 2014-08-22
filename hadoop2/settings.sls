{% set p = salt['pillar.get']('hadoop', {}) %}
{% set g  = salt['grains.get']('hadoop', {}) %}

{%- set default_master = 'master' %}
{%- set default_data_dir = '/tmp/hadoop' %}
{%- set default_map_memory = '1536' %}
{%- set default_reduce_memory = '3072' %}
{%- set default_map_java_opts = '-Xmx1024M' %}
{%- set default_reduce_java_opts = '-Xmx2560M' %}

{%- set master = g.get('master', p.get('master', default_master)) %}
{%- set data_dir = g.get('data_dir', p.get('data_dir', default_data_dir)) %}
{%- set map_memory = g.get('map_memory', p.get('map_memory', default_map_memory)) %}
{%- set reduce_memory = g.get('reduce_memory', p.get('reduce_memory', default_reduce_memory)) %}
{%- set map_java_opts = g.get('map_java_opts', p.get('map_java_opts', default_map_java_opts)) %}
{%- set reduce_java_opts = g.get('reduce_java_opts', p.get('reduce_java_opts', default_reduce_java_opts)) %}

{%- set hadoop = {} %}
{%- do hadoop.update({ 
    'master' : master,
    'data_dir' : data_dir,
    'map_memory' : map_memory,
    'reduce_memory' : reduce_memory,
    'map_java_opts' : map_java_opts,
    'reduce_java_opts' : reduce_java_opts,
}) %}
