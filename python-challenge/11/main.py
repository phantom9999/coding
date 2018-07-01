__author__ = 'phantom'
"""
len(a[30]) = ?
a = [1, 11, 21, 1211, 111221,
11: 一个1
21: 二个1
1211: 一个2, 一个1
111221: 一个1, 1个2, 2个1
"""






def find(n):

    begin = '1'

    for i in range(n):
        begin += ' '
        end = ''
        current = ''
        count = 0
        for item in begin:
            if item != current:
                if count != 0:
                    end += str(count) + current
                    count = 1
                    current = item
                else:
                    current = item
                    count += 1
            else:
                count += 1
        begin = end
    print(begin)
    return begin


    pass



if __name__ == '__main__':

    print(len(find(30)))


    pass