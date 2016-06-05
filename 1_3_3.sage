def Irr(p, n):
	irr = 0
	divisors = Integer(n).divisors()
	for divisor in divisors :
		irr += p^divisor * moebius(n / divisor)
	irr /= n
	return int(irr)

def printIrr(p, n):
	for i in n :
		for j in p :
			print("Nombre de polynomes de degré {}, irréductibles et unitaires, de F{}[X] : {}".format(i, j, Irr(j, i)))

def irrTab(): # Je pense qu'il voulait parler d'un tableau dans le rapport ;-)
	p = [2,3,5]
	n = range(1, 11)
	lignes = list()
	for i in n :
		colones = list()
		for j in p :
			colones.append(Irr(j,i))
		lignes.append(colones)
	return lignes

