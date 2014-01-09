#!/bin/sh
pid=`ps auxw | grep [r]ails | sed -n '1 p'|awk '{print $2}'`
kill -KILL $pid