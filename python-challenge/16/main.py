__author__ = 'phantom'


import datetime

# http://www.pythonchallenge.com/pc/return/mozart.html


if __name__ == '__main__':



    for i in range(0, 10):
        for j in range(0, 10):
            year = 1006 + i * 100 + j * 10
            week = datetime.datetime(year, 1, 26).weekday()
            #print(year)
            #print(week)
            if week == 0 and year % 4 == 0:
                print(year)



    pass
