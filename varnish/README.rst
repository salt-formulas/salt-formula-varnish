
=======
varnish
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
          varnish_leonardo_majklk:
            type: leonardo
            name: leonardo_majklk
            bind:
              port: 7000
              host: 0.0.0.0
            backend:
              gunicorn1:
                host: localhost
                port: 80

And Supervisor like this::

    supervisor:
      server:
        service:
          varnish_leonardo_majklk:
            name: leonardo_majklk
            type: varnish

Note: This formulas runs varnish processes under supervisor instead of init script.

Read more
=========

* links
