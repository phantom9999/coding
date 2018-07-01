__author__ = 'phantom'

import re


if __name__ == '__main__':
    allString = ''
    with open('./data.txt') as reader:
        allString = reader.read().strip().replace('\n', '')
    print(re.findall('[a-z]+[A-Z]{3}[a-z][A-Z]{3}[a-z]+', allString))
    #['l', 'i', 'n', 'k', 'e', 'd', 'l', 'i' 's', 't'
    #linkedlist

    pass









