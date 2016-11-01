#! /bin/bash

cd '/home/vlad/Programs/My_projects/games/Omega Chess Nim'
hg status
hg commit
hg bookmark -r default master
hg push Omega_Chess
