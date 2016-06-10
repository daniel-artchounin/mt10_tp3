def codeGRS(q, word, vs, alphas):
	if len(vs) != len(alphas):
		raise ValueError("List v and alpha must have the same length.")
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	if not Integer(q).is_prime():
		raise ValueError("Our implementation only works when the order 'q' of " +
			"the finite field is prime.")
	code = []
	FqX.<X> = GF(q, name='a')['X'] # It represents the polynomials in Fq[X]
	f = FqX.zero() # A polynomial which will have its coefficients in Fq
	for i, letter in enumerate(word):
		if letter < 0 or letter >= q:
			raise ValueError("The given word is not valid.")
		f += Integer(word[-(i+1)]) * X^i
	for i, alpha in enumerate(alphas):
		code.append(vs[i] * f(alpha))
	return code