load("2_2.sage")

def erreur(q, sigma, omega, vs, alphas):
	if len(vs) != len(alphas):
		raise ValueError("List v and alpha must have the same length.")
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	FqX.<X> = GF(q, name='a')['X'] # It represents the polynomials in Fq[X]
	n = len(vs)
	bIndices = []
	for index in range(n):
		if sigma( (FqX( alphas[index] ))^(-1) ) == 0:
			bIndices.append(index)
	sigmasDerivative = [ 0 ] * n
	# Here, the goal is to compute the derivative of sigma
	# for each inverse of alpha indexed by b, b in bIndices
	for bIndex in bIndices: 
		minusAlphaB = - FqX(alphas[bIndex])
		sigmasDerivativeB = FqX.one()
		for bPrimeIndex in bIndices:
			if bPrimeIndex != bIndex:
				sigmasDerivativeB *= FqX.one() - (FqX(alphas[bPrimeIndex]) * FqX(alphas[bIndex])^(-1))
		sigmasDerivative[bIndex] = minusAlphaB * sigmasDerivativeB 
	errors = [Integer(0)] * n
	for bIndex in bIndices:
		lagrangePolynom = lagrangePolynomial(q, alphas, bIndex)
		uB = (FqX(vs[bIndex]))^(-1) * lagrangePolynom(alphas[bIndex])^(-1)
		errors[bIndex] = (-FqX(alphas[bIndex])) * omega( (FqX(alphas[bIndex]))^(-1) ) * (uB * sigmasDerivative[bIndex] )^(-1)
		errors[bIndex] = FqX(errors[bIndex])
	return errors

def computeDifferenceBetweenTwoLists(l1, l2):
	if len(l1) != len(l2):
		raise ValueError("List v and alpha must have the same length.")
	n = len(l1)
	l3 = [ 0 ] * n
	for i in range(n):
		l3[i] = l1[i] - l2[i]
	return l3