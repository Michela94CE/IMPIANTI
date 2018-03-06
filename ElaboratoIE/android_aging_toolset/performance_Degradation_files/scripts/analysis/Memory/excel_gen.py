#!/usr/bin/python
import fileinput
import matplotlib.pyplot as plt
import csv


def plot_data(k):

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
	for line in fileinput.input():
		l = line.rstrip('\r\n')
		#print l
		if not l.startswith('--'):
			el = l.split(" ")
			if el[-1] in k:
				k[el[-1]].append(el[0])
			else:
				k[el[-1]] = [el[0]]
    #print k
	#plot_data(k)
	nk = splitDict(k)
	writeCSVs(nk)
