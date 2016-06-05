def printF2XIrreductiblePolynomials(maxDegree):
	F2X.<X> = GF(2)['X']
	numberOfIrreductiblePolynomials = 0
	print('Polynômes irréductibles de F2[X] de degré inférieur ou égal à {} :'.format(maxDegree))
	for degree in range(0, maxDegree+1):
		polynomialsOfSpecDegree = F2X.polynomials(degree)
		for p in polynomialsOfSpecDegree:
			if p.is_irreducible():
				print(p)
				numberOfIrreductiblePolynomials += 1
	print("Il y a {} polynômes irréductibles de F2[X] de degré inférieur ou égal à {}.".format(numberOfIrreductiblePolynomials, maxDegree))