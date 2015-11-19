{%- if pillar.varnish is defined %}
include:
{%- if pillar.varnish.server is defined %}
- varnish.server
{%- endif %}
{%- endif %}
