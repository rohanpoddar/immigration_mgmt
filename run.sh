#!/bin/sh
sh kill-server.sh
rake db:drop
rake db:create
rake db:migrate:reset
rake db:seed
rake db:test:load
rake test
echo "STARTING SERVER"
nohup rails s > server.out &
RETURNVALUE=$?
if [ $RETURNVALUE -gt 0 ] ; then
    echo "FAILED TO START"
else
    echo "STARTED SERVER"
fi
