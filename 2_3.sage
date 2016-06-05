import random as r

def errTrans(q, encodedMessage, numberOfErrors):
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	listOfIndices = r.sample(range(len(encodedMessage)), numberOfErrors)
	for index in listOfIndices:
		listofNumbers = range(0, q)
		listofNumbers.remove(int(encodedMessage[index]))
		encodedMessage[index] = Integer(r.choice(listofNumbers))
	return encodedMessage