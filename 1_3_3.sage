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