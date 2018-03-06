#!/usr/bin/python
import fileinput
import matplotlib.pyplot as plt
import csv
import sys


def plot_data(k):
	#print('Plot Data lanciato')
	for i,v in k.iteritems():
		plt.plot(range(1,len(v)+1),v,'r--')
		plt.title(i)
		plt.ylabel('Total PSS (KB)')
		plt.savefig(i+'.pdf')
		plt.close()
		#plt.show()

def splitDict(k):
	nk = {}
	for i,v in k.iteritems():
		if len(v) in nk:
			nk[len(v)].append([i]+v)
		else:
			nk[len(v)] = [[i]+v]
	return nk

def writeCSVs(nk):
	l = []
	for key, value in nk.items():
		writer = csv.writer(open("CSVs/CSV_L"+str(key)+".csv",'wb'))
		for r in value:
			#print r[0]
			writer.writerow(r)


if __name__ == '__main__':
	k = {}
	lines = [line.rstrip('\r\n') for line in open(sys.argv[1],'r')]

	new_lines = []

	#for line in lines:
	#	print line

	for line in lines:
		if "( pid 3614)" in line or "( pid 3991" in line or "( pid 3123)" in line or "( pid 3077)" in line:
			new_lines.append(line)
			
	
	print "--------------------------------------------"
	
	for line in new_lines:
		line = line.strip()
		#print line
		split_line = line.split(" ")
		#print split_line
		if split_line[1] in k:
			#if (k[split_line[-1])[-1] != split_line[0]:
			k[split_line[1]].append(split_line[0].replace("K:",""))
		else:
			k[split_line[1]] = [split_line[0].replace("K:","")]
	
	
	#for key,value in k.iteritems():
	#	print key,'\n',value,'\n'	
	
	#print "--------------------------------\n--------------------------------"
	
	for key in k:
		print len(k[key])
		del k[key][1::2]
	
	#for key,value in k.iteritems():
	#	print key,'\n',value,'\n'
	
#	for line in fileinput.input():
#		print line
#		l = line.rstrip('\r\n')
#		print l
#		if not l.startswith('--'):
#			el = l.split(" ")
#			print el
#			if el[-1] in k:
#				k[el[-1]].append(el[0])
#			else:
#				k[el[-1]] = [el[0]]
    	#print k
	#plot_data(k)
	nk = splitDict(k)
	writeCSVs(nk)
