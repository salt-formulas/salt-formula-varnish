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