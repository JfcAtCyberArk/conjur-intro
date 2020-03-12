docker run -v /host/directory:/opt/conjur/backup --name conjur -d --restart=always \
  --security-opt seccomp:unconfined \
  -p "443:443" -p "444:444" -p "636:636" -p "5432:5432" -p "5433:5433" \
  registry.tld/conjur-appliance:5.7.2-20200311203146-4e85e30
