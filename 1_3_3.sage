def Irr(p, n):
	irr = 0
	diviseurs = Integer(n).divisors()
	for d in diviseurs :
		irr += p^d * moebius(n / d)
		irr /= n
	print "Nombre de polynomes de degré "+str(n)+ " dans F"+str(p)+"[X] = " + str(int(irr))
	return int(irr)

def irr_tab():
	p	= [2,3,5]
	n = range(1,11)
	lignes = list()
	for i in n :
		colones = list()
		for j in p :
			colones.append(Irr(j,i))
		lignes.append(colones)
	return lignes

