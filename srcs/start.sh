#!/bin/sh

service nginx start
service nginx status

while true; do sleep 1000; done
