__author__ = 'phantom'

import zipfile

"""
****************************************************************
****************************************************************
**                                                            **
**   OO    OO    XX      YYYY    GG    GG  EEEEEE NN      NN  **
**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE  NN    NN   **
**   OO    OO XXX  XXX YYY   YY  GG GG     EE       NN  NN    **
**   OOOOOOOO XX    XX YY        GGG       EEEEE     NNNN     **
**   OOOOOOOO XX    XX YY        GGG       EEEEE      NN      **
**   OO    OO XXX  XXX YYY   YY  GG GG     EE         NN      **
**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE     NN      **
**   OO    OO    XX      YYYY    GG    GG  EEEEEE     NN      **
**                                                            **
****************************************************************
 **************************************************************
 oxygen
 hockey


"""


if __name__ == '__main__':




    zips = zipfile.ZipFile('./channel.zip')
    print(zips.namelist())

    begin = '90052'
    comments = []

    for i in range(1000):
        content = zips.read(begin + '.txt')
        fields = content.strip().split(' ')
        comments.append(zips.getinfo(begin + '.txt').comment)
        if ' '.join(fields[:3]) == 'Next nothing is':
            begin = fields[-1]
            print(begin)
        else:
            print(content)
            break

    print(''.join(comments))







