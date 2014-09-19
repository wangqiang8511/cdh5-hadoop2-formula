{% set p = salt['pillar.get']('hadoop', {}) %}
{% set g  = salt['grains.get']('hadoop', {}) %}

{%- set default_master = 'master' %}
{%- set default_data_dir = '/tmp/hadoop' %}
{%- set default_map_memory = '1536' %}
{%- set default_reduce_memory = '3072' %}
{%- set default_map_java_opts = '-Xmx1024M' %}
{%- set default_reduce_java_opts = '-Xmx2560M' %}
{%- set default_set_s3_key = False %}
{%- set default_s3_key = '' %}
{%- set default_s3_secret = '' %}

{%- set master = g.get('master', p.get('master', default_master)) %}
{%- set data_dir = g.get('data_dir', p.get('data_dir', default_data_dir)) %}
{%- set map_memory = g.get('map_memory', p.get('map_memory', default_map_memory)) %}
{%- set reduce_memory = g.get('reduce_memory', p.get('reduce_memory', default_reduce_memory)) %}
{%- set map_java_opts = g.get('map_java_opts', p.get('map_java_opts', default_map_java_opts)) %}
{%- set reduce_java_opts = g.get('reduce_java_opts', p.get('reduce_java_opts', default_reduce_java_opts)) %}
{%- set set_s3_key = g.get('set_s3_key', p.get('set_s3_key', default_set_s3_key)) %}
{%- set s3_key = g.get('s3_key', p.get('s3_key', default_s3_key)) %}
{%- set s3_secret = g.get('s3_secret', p.get('s3_secret', default_s3_secret)) %}

{%- set hadoop = {} %}
{%- do hadoop.update({ 
    'master' : master,
    'data_dir' : data_dir,
    'map_memory' : map_memory,
    'reduce_memory' : reduce_memory,
    'map_java_opts' : map_java_opts,
    'reduce_java_opts' : reduce_java_opts,
    'set_s3_key' : set_s3_key,
    's3_key' : s3_key,
    's3_secret' : s3_secret
}) %}
