#!/bin/sh
kill -KILL `ps auxw | grep [r]ails | awk '{print $2}'`
kill -9 `ps auxw | grep [r]ake | sed -n '1 p'|awk '{print $2}'`
kill -KILL `ps auxw | grep [p]sql | sed -n '1 p'|awk '{print $2}'`
