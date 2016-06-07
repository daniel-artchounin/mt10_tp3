load("2_2.sage")

def syndrome(q, doubtfulWord, vs, alphas, k):
	if len(vs) != len(alphas):
		raise ValueError("List v and alpha must have the same length.")
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	FqX.<X> = GF(q, name='a')['X'] # It represents the polynomials in Fq[X]
	n = len(vs)
	r = n-k
	syndromePolynomial = FqX.zero()
	for i in range(n):
		term = FqX.one()
		for j in range(1, r):
			term += (FqX(alphas[i]) * X)^j
		lagrangePolyn = lagrangePolynomial(q, alphas, i)
		syndromePolynomial += FqX(doubtfulWord[i]) * (FqX(vs[i])^(-1) * (lagrangePolyn(FqX(alphas[i])))^(-1)) * term 
	return syndromePolynomial