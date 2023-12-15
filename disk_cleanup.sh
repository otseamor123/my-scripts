#!/bin/bash

apt-get clean

apt-get autoremove -y


rm -rf ~/.local/share/Trash/*


journalctl --vacuum-time=10d


rm -rf /tmp/*

