__author__ = 'phantom'

import PIL.Image as Image



if __name__ == '__main__':

    data = Image.open('./oxygen.png')


    width = data.size[0]
    height = data.size[1]
    # 43
    #for i in range(height):
    #    p = data.getpixel((1, i))
    #    print(i)
    #    print(p)
    # 608
    #for i in range(width):
    #    if i % 1 == 0:
    #        p = data.getpixel((i, 44))
    #        print(i)
    #        print(p)

    string = ''
    for i in range(0, 610):
        p = data.getpixel((i, 44))
        string += chr(p[0])

    print(string)
    #sssssmmmmmmmaaaaaaarrrrrrrttttttt       ggggggguuuuuuuyyyyyyy,,,,,,,       yyyyyyyooooooouuuuuuu       mmmmmmmaaaaaaadddddddeeeeeee       iiiiiiittttttt.......       ttttttthhhhhhheeeeeee
    # nnnnnnneeeeeeexxxxxxxttttttt       llllllleeeeeeevvvvvvveeeeeeelllllll       iiiiiiisssssss       [[[[[[[111111100000005555555,,,,,,,
    # 111111111111110000000,,,,,,,       111111111111116666666,,,,,,,       111111100000001111111,,,,,,,       111111100000003333333,,,,,,,
    # 111111111111114444444,,,,,,,       111111100000005555555,,,,,,,       111111111111116666666,,,,,,,       111111122222221111111]]]]]]]]ow
    # smart guy, you made it. the next level is [105, 110, 116, 101, 103, 114, 105, 116, 121]
    newList = [105, 110, 116, 101, 103, 114, 105, 116, 121]
    for item in newList:
        print(chr(item))
    #integrity
    pass




