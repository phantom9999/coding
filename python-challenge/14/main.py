__author__ = 'phantom'


import xmlrpclib
# http://www.pythonchallenge.com/pc/return/italy.html


if __name__ == '__main__':

    s = xmlrpclib.Server('http://www.pythonchallenge.com/pc/phonebook.php')

    print (s.system.listMethods())

    print (s.phone('Bert'))




    pass





