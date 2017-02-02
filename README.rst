
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

Using nginx type::

    nginx:
      server:
        site:
          leonardo_majklk:
            enabled: true
            type: varnish
            name: varnish_leonardo_majklk
            host:
              name: domain.com

Read more
=========

* links

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-varnish/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-varnish

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
