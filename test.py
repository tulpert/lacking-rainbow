#!/usr/bin/python3

import os
import re
import sys
import time
import yaml
import json
import random
import datetime
import tempfile

from os import path
from subprocess import check_output

def main():
    traverse = False
    part = os.path.split(sys.argv[1])
    part = sys.argv[1].split('/')
    currentelement = ''
    i = 0
    finalarray = []
    while i < len(part):
        # Check for eventual meta.yaml file
        metafile = currentelement + 'meta.yaml'
        currentelement = currentelement + str(part[i])
        if os.path.isfile(metafile):
            print (" - Found META file: " + str(metafile))
            finalarray = joinX(finalarray, metafile)

        # print ("Working in directory ------> " + str(currentelement))
        # print (str(i) + ': ' + currentelement)
        if os.path.isfile(currentelement):
            # Check if we have found the actual config file
            if currentelement == sys.argv[1]:
                print (" === Found the file!!!! === : " + str(currentelement))
        currentelement = currentelement + '/'
        i = i+1

    print ("FinalArray: " + str(finalarray))

def joinX(existingarray: dict,configfile: str) -> dict:
    if os.path.isfile(configfile):
        try:
            with open(configfile, 'r') as stream:
                filearray = yaml.load(stream)
                print ("Filearray: " + str(filearray))
        except Exception as e:
            print ("Error: " + str(e))
    return existingarray

main()
