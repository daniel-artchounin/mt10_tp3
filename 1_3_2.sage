def moebiusTest(n):
	for i in range(1, n+1):
		if moebius(i) not in [-1, 0, 1]:
			return False
	return True

def eulerTest(n):
	if moebius(1) != 1:
		return False
	for i in range(2, n+1):
		sumMobeius = 0
		divisors = Integer(i).divisors() # Here, we get the divisors of i
		for divisor in divisors:
			sumMobeius += moebius(divisor)
		if sumMobeius != 0:
			return False
	return True

def moebiusInversionFormulaTest(n):
	"""Indirectly returns the value of the Euler phi function on the integer n"""
	result = 0
	divisors = Integer(n).divisors() # Here, we get the divisors of n
	for divisor in divisors :
		result += (divisor * moebius(n / divisor))
	return result