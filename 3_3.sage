def clef(q, syndromePolynomial, k, n):
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	if not Integer(q).is_prime():
		raise ValueError("Our implementation only works when the order 'q' of " +
			"the finite field is prime.")
	FqX.<X> = GF(q, name='a')['X'] # It represents the polynomials in Fq[X]
	r = n - k
	rSequenceJMinus1 = X^r
	rSequenceJ = syndromePolynomial
	rTemp = 0
	uSequenceJMinus1 = FqX.one()
	uSequenceJ = FqX.zero()
	uTemp = 0
	vSequenceJMinus1 = FqX.zero()
	vSequenceJ = FqX.one()
	vTemp = 0
	qSequenceJ = 0
	while(FqX(rSequenceJ).degree() >= r/2):
		qSequenceJ = FqX(rSequenceJMinus1) // FqX(rSequenceJ) 
		rTemp = rSequenceJ
		rSequenceJ = FqX(rSequenceJMinus1) % FqX(rSequenceJ) 
		rSequenceJMinus1 = rTemp
		uTemp = uSequenceJ
		uSequenceJ = uSequenceJMinus1 - uSequenceJ * qSequenceJ
		uSequenceJMinus1 = uTemp
		vTemp = vSequenceJ
		vSequenceJ = vSequenceJMinus1 - vSequenceJ * qSequenceJ
		vSequenceJMinus1 = vTemp
	sigma = (vSequenceJ(0))^(-1) * vSequenceJ
	omega = (vSequenceJ(0))^(-1) * rSequenceJ
	return sigma, omega