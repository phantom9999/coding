__author__ = 'phantom'

from PIL import Image
# http://www.pythonchallenge.com/pcc/return/evil.html
# huge
# file


if __name__ == '__main__':
    originImage = Image.open('./cave.jpg')
    width = originImage.size[0]
    height = originImage.size[1]

    oddImage = Image.new('RGB', (int(width/2), int(height/2)))
    evenImage = Image.new('RGB', (int(width/2), int(height/2)))

    for x in range(width):
        for y in range(height):
            p = originImage.getpixel((x, y))
            if x % 2 == 1 and y % 2 == 1:
                # 奇数
                oddImage.putpixel((int(x/2), int(y/2)), p)
                pass
            elif x % 2 == 0 and y % 2 == 0:
                # 偶数
                evenImage.putpixel((int(x/2), int(y/2)), p)
                pass

    oddImage.save('odd.png', 'png')
    evenImage.save('even.png', 'png')



    pass










