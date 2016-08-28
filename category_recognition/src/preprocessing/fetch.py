import sys
import os

f = open(sys.argv[-2], 'r')
outDir = sys.argv[-1]
os.system('mkdir ' + outDir)

im_paths = {}

line = f.readline()
while line != '':
	temp = line.strip().split(' ')
	im_path = temp[0]
	label = temp[1]
	if label not in im_paths:
		im_paths[label] = []	
	im_paths[label].append(im_path)
	line = f.readline()
f.close()

# print im_paths

for label in im_paths:
	dst = outDir +  str(label) + '/'
	os.system('mkdir ' + dst)

	src = ''	
	count = 0
	for im_path in im_paths[label]:
		count += 1
		src += 'ashishb@eldar-1.cs.utexas.edu:' + im_path + ' '
		if count>100:
			cmd = 'scp ' + src + ' ' + dst
			os.system(cmd)
			src = ''
			count = 0

	if src != '':
		cmd = 'scp ' + src + ' ' + dst
		os.system(cmd)