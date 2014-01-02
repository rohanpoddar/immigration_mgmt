#!/bin/sh
pid=`ps auxw | grep [r]ails | sed -n '1 p'|awk '{print $2}'`
kill -KILL $pid
rake db:migrate
rake db:drop
rake db:create
rake db:migrate
rake db:seed
rake test
echo "STARTING SERVER"
nohup rails s > server.out &
RETURNVALUE=$?
if [ $RETURNVALUE -gt 0 ] ; then
    echo "FAILED TO START"
else
    echo "STARTED SERVER"
fi
