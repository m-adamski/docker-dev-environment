#!/bin/bash
for file in /etc/nginx/sites-available/*
do
    ln -s "${file}" /etc/nginx/sites-enabled/
done
