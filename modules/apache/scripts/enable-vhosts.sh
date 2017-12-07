#!/bin/bash
for file in /etc/apache2/sites-available/*
do
    ln -s "${file}" /etc/apache2/sites-enabled/
done
