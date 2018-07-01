__author__ = 'phantom'

import collections


if __name__ == '__main__':

    data = collections.defaultdict(int)

    with open('./data.txt') as reader:
        content = reader.read().strip().replace('\n', '')
        for item in content:
            data[item] += 1


    dataList = [[key, value] for key, value in data.items()]
    dataList.sort(key=lambda item: item[1])
    print(dataList)
    #aeilquty
    #equality
    pass



