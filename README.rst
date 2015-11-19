
=======
Varnish
=======

Varnish cache.

Sample pillars
==============

Single varnish service

.. code-block:: yaml

    varnish:
      server:
        enabled: true
        version: 4.0
        lookup:
          leonardo-majklk:
            type: leonardo
            name: majklk
            bind:
              port: 7000
              host: localhost
            backend:
              gunicorn1:
                host: localhost
                port: 8001
              gunicorn2:
                host: localhost
                port: 8002

    supervisor:
      server:
        service:
          varnish_majklk:
            name: majklk
            type: varnish

Read more
=========

* links
