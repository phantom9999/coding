__author__ = 'phantom'

from PIL import Image

# http://www.pythonchallenge.com/pc/return/uzi.html

if __name__ == '__main__':

    originImage = Image.open('./wire.png')

    newImage = Image.new('RGB', (100, 100))

    #for i in range(100):
    #    newImage.putpixel((i, 0), originImage.getpixel((i, 0)))

    index = [item for item in range(0, 100)]
    index += [item for item in range(1, 101)]
    index.sort(reverse=True)

    direction = 0
    # 0 向左
    # 1 向下
    # 2 向左
    # 3 向上
    x = -1
    y = 0
    currentIndex = 0
    for i in range(10000):
        if direction == 0:
            x += 1
            pass
        elif direction == 1:
            y += 1
            pass
        elif direction == 2:
            x -= 1
            pass
        elif direction == 3:
            y -= 1
            pass

        index[currentIndex] -= 1
        if index[currentIndex] == 0:
            currentIndex += 1
            direction = (direction + 1) % 4

        newImage.putpixel((x, y), originImage.getpixel((i, 0)))





    newImage.save('./new.png')


    pass









