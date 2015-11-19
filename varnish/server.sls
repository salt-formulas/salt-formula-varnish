{%- from "varnish/map.jinja" import server with context %}

{%- if server.enabled %}

{# just now #}
{% if salt['grains.get']('os_family') == 'Debian' -%}
varnish_repo:
  pkgrepo.managed:
    - name: deb http://repo.varnish-cache.org/{{ salt['grains.get']('os')|lower }}/ {{ salt['grains.get']('oscodename')}} {{ server.repo.components | join(' ') }}
    - file: /etc/apt/sources.list.d/varnish.list
    - keyid: C4DEFFEB
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: varnish_pkg
{% elif salt['grains.get']('os_family') == 'RedHat' -%}
  {% for component in server.repo.components %}
varnish_repo_{{ component }}:
  pkgrepo.managed:
    - name: varnish
    - humanname: Varnish for Enterprise Linux el6 - $basearch
    - baseurl: http://repo.varnish-cache.org/redhat/{{ component }}/el6/$basearch
    - gpgcheck: 0
    - require_in:
      - pkg: varnish_pkg
  {% endfor %}
{%- endif %}

varnish_pkg:
  pkg.installed:
    - names: {{ server.pkgs }}
{#    - version: {{ server.get("version", "4.0") }} #}

{%- for lookup_name, lookup in server.get('lookup', {}).iteritems() %}

lookup_config_{{ lookup_name }}:
  file.managed:
  - name: /etc/varnish/{{ lookup.name }}.vcl
  - source: salt://{{ lookup.type }}/files/varnish.vcl
  - mode: 644
  - template: jinja
  - defaults:
    service_name: "{{ lookup_name }}"
    lookup: {{ lookup }}
  - require:
    - pkg: varnish_pkg

{%- endfor %}

{%- endif %}
