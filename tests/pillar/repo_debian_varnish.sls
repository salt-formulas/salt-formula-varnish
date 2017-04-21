linux:
  system:
    enabled: true
    repo:
      varnish_repo:
        source: deb http://repo.varnish-cache.org/{{ grains.get('os')|lower }}/ {{ grains.get('oscodename') }} {{ server.repo.components | join(' ') }}
        key_id: C4DEFFEB
        key_server: keyserver.ubuntu.com
