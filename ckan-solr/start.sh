#!/bin/bash
service jetty start
tail -f /var/log/jetty/out.log
