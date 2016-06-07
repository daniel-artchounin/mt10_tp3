import random

def errTrans(q, encodedMessage, numberOfErrors):
	encodedMessageWithErrors = list(encodedMessage)
	if not Integer(q).is_prime_power():
		raise ValueError("The order of a finite field must be a prime power.")
	listOfIndices = random.sample(range(len(encodedMessageWithErrors)), numberOfErrors)
	for index in listOfIndices:
		listofNumbers = range(0, q)
		listofNumbers.remove(int(encodedMessageWithErrors[index]))
		encodedMessageWithErrors[index] = Integer(random.choice(listofNumbers))
	return encodedMessageWithErrors