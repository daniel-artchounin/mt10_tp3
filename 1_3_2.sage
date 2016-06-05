def test_moebius(n):
	for i in range(1,n+1):
		if moebius(i) not in [-1,0,1]:
			return false
	return true

def test_euler(n):
	if moebius(1) != 1:
		return false
	for i in range(2,n+1):
		res = 0
		d = Integer(i).divisors()
		for j in d:
			res = res + moebius(j)
		if res != 0:
			return false
	return true

def FEuler(n) :
	diviseurs = Integer(n).divisors()
	f = 0
	for diviseur in diviseurs :
		f += euler_phi(diviseur)
	return f

def test_mobius(n) :
	f = 0
	diviseurs = Integer(n).divisors()
	for diviseur in diviseurs :
		f += FEuler(diviseur) * moebius(n / diviseur)
		
	print "Test Moebius pour 100 = " + str(f)
