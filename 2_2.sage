def lagrangePolynomial(q, alphas, i):
	n = len(alphas)
	if i not in range(n):
		raise ValueError("i should be less than the length of alpha and more than 0.")
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	if not Integer(q).is_prime():
		raise ValueError("Our implementation only works when the order 'q' of " +
			"the finite field is prime.")	
	FqX.<X> = GF(q,name='a')['X'] # It represents the polynomials in Fq[X]
	lPolynomial = FqX.one() # It will contain the lagrange polynomial
	for j in range(n):
		if j != i:
			lPolynomial *= (X - alphas[j])  
	return lPolynomial

def decodeGRS(q, code, vs, alphas):
	if len(vs) != len(alphas):
		raise ValueError("List v and alpha must have the same length.")
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	if not Integer(q).is_prime():
		raise ValueError("Our implementation only works when the order 'q' of " +
			"the finite field is prime.")
	originalWord = []
	FqX.<X>=GF(q, name='a')['X'] # It represents the polynomials in Fq[X]
	decodedPolynomial = FqX.zero()
	for i, alpha in enumerate(alphas):
		lPolynomial = lagrangePolynomial(q, alphas, i)		
		decodedPolynomial += code[i] * (vs[i] * lPolynomial(alpha))^-1 *  lPolynomial
	originalWord = decodedPolynomial.list()
	originalWord.reverse()
	return originalWord