import random

def errTrans(q, encodedMessage, numberOfErrors):
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	if not Integer(q).is_prime():
		raise ValueError("Our implementation only works when the order 'q' of " +
			"the finite field is prime.")
	encodedMessageWithErrors = list(encodedMessage)
	listOfIndices = random.sample(range(len(encodedMessageWithErrors)), numberOfErrors)
	for index in listOfIndices:
		listofNumbers = range(0, q)
		listofNumbers.remove(int(encodedMessageWithErrors[index]))
		encodedMessageWithErrors[index] = Integer(random.choice(listofNumbers))
	return encodedMessageWithErrors