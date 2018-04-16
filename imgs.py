
import os , sys
from PIL import Image
class ImageSize:
     pass
path = raw_input()

files = os.listdir(path)
source = {}
for file in files:
    if not os.path.isdir(file):
        if " " in file:
         newfile =  file.replace(" ","")
         os.rename(os.path.join(path,file),os.path.join(path,newfile))
         print(newfile)

for name in files:
    if "png" in name or "jpg" in name:
        Size = ImageSize()
        imgpath = os.path.join(path,name)
        img = Image.open(imgpath)
        if "2x" in name:
           Size.width = img.size[0]/2
           Size.height = img.size[1]/2
        if "3x" in name:
            Size.width = img.size[0] / 3
            Size.height = img.size[1] / 3
        # print(Size.width)
        # print(Size.height)
        names = name.split("@")
        name = names[0]+"."+img.format.lower()
        source[name]=Size
        # print(name)
with open(path+"/format.txt","w") as f:
    for key, value in source.iteritems():
        f.write(key+":    "+"width:   "+str(value.width)+","+"height:   "+str(value.height)+'\n')
        # print(key)
        # print(value.width)
        # print(value.height)

