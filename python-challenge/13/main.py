__author__ = 'phantom'


# http://www.pythonchallenge.com/pc/return/disproportional.html

if __name__ == '__main__':

    with open('./evil2.gfx', 'rb') as reader:
        data = reader.read()
        for i in range(5):
            with open('./%d.jpg' % (i, ), 'wb') as writer:
                writer.write(data[i::5])



    pass