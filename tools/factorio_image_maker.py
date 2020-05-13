import glob
from PIL import Image

for file in glob.glob('*.png'):
	old_image = Image.open(file)
	if old_image.size[0]==old_image.size[1]:
		
		new_image = Image.new("RGBA",(64+32+16+8,64),(255,255,255,0))
		image64 = old_image.resize((64,64))
		image32 = old_image.resize((32,32))
		image16 = old_image.resize((16,16))
		image8 = old_image.resize((8,8))

		new_image.paste(image64,(0,0))
		new_image.paste(image32,(64,0))
		new_image.paste(image16,(64+32,0))
		new_image.paste(image8,(64+32+16,0))
		
		new_image.save(file)

