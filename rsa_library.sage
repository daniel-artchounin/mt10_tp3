import random
from sage.crypto.util import bin_to_ascii

def numerise(message, N):
	"""Encoding of a message."""
	S3 = BinaryStrings()
	binaryMessage = S3.encoding(message)
	# print(binaryMessage) # Test
	packetLength = floor(ln(N)/ln(2)) # Computation of the logarithm base 2
	binaryMessageLength = len(binaryMessage)
	numberOfSameLengthPackets = binaryMessageLength//packetLength
	lengthOfTheLastPacket = binaryMessageLength%packetLength
	# print(lengthOfTheLastPacket) # Test
	digitization = []
	for i in range(numberOfSameLengthPackets):
		packet = str(binaryMessage[i*packetLength:i*packetLength+packetLength])
		packet = int(str(packet), base=2)
		digitization.append(packet)
	if lengthOfTheLastPacket != 0:
		packet = str(binaryMessage[numberOfSameLengthPackets*packetLength:])
		packet = int(str(packet), base=2)
		digitization.append(packet)
	digitization.append(lengthOfTheLastPacket)
	return digitization

def alphabetise(integersList, N):
	"""Decoding of a message."""
	numberOfInts = len(integersList)
	S3 = BinaryStrings()
	binaryMessage = ""
	lengthOfTheLastPacket = integersList[-1]
	packetLength = floor(ln(N)/ln(2)) # Computation of the logarithm base 2	
	if lengthOfTheLastPacket != 0:
		numberOfSameLengthPackets = numberOfInts - 2
	else:
		numberOfSameLengthPackets = numberOfInts - 1
	for number in integersList[:numberOfSameLengthPackets]:
		bin = str(Integer(number).binary())		
		while len(bin) != packetLength:
			bin = "0" + bin
		binaryMessage += bin
	if lengthOfTheLastPacket != 0:
		bin = str(Integer(integersList[numberOfSameLengthPackets]).binary())	
		# print(lengthOfTheLastPacket) # Test
		# print(len(bin)) # Test
		while len(bin) != lengthOfTheLastPacket:
			bin = "0" + str(bin)
		binaryMessage += bin
	return bin_to_ascii(binaryMessage)	

def cleRSA(m):
	s = random.randint(3, 4)
	t = random.randint(3, 4)
	p = random_prime(2^s, lbound=2^m)
	q = random_prime(2^t, lbound=2^m)
	phi = (p - 1)*(q - 1)
	n = p * q
	e = ZZ.random_element(phi)
	while gcd(e, phi) != 1:
		e = ZZ.random_element(phi)
	bezout = xgcd(e, phi)
	d = Integer(mod(bezout[1], phi))
	return n, e, d

def cleRSA2048():
	s = random.randint(2048, 2055)
	t = random.randint(2055, 2062)
	p = random_prime(2^s, lbound=2^2048)
	q = random_prime(2^t, lbound=2^2048)
	phi = (p - 1)*(q - 1)
	n = p * q
	e = ZZ.random_element(phi)
	while gcd(e, phi) != 1:
		e = ZZ.random_element(phi)
	bezout = xgcd(e, phi)
	d = Integer(mod(bezout[1], phi))
	return n, e, d

def chiffrement(message, publicKey, N) :
	"""Encrypting of a message."""
	return map(power_mod, message, [publicKey] * len(message), [N] * len(message))

def dechiffrement(message, privateKey, N) :
	"""Decrypting of a message."""	
	return chiffrement(message, privateKey, N)

def protocole1Encrypting(m1, s1, NA, dA, NB, eB, NC) :
	"""Encrypting of the first protocole."""	
	m1C = numerise(m1, NC)
	s1C = numerise(s1, NC)
	
	m2C = chiffrement(m1C, eB, NB)
	s2C = chiffrement(s1C, dA, NA)
	
	return m2C, s2C
	
def protocole1Decrypting(m2C, s2C, NA, eA, NB, dB, NC) :
	"""Decrypting of the first protocole."""	
	m1C = dechiffrement(m2C, dB, NB)
	s1C = dechiffrement(s2C, eA, NA)
	
	m1 = alphabetise(m1C, NC)
	s1 = alphabetise(s1C, NC)
	
	return m1, s1


def protocole2Encrypting(m1, NA, dA, NB, eB, NC) :
	"""Encrypting of the second protocole."""	
	if NA > NB:			
		m1C = numerise(m1, NC)
		m2C = chiffrement(m1C, eB, NB)
		m3C = chiffrement(m2C, dA, NA)		
	elif NA < NB:		
		m1C = numerise(m1, NC)
		m2C = chiffrement(m1C, dA, NA)
		m3C = chiffrement(m2C, eB, NB)
	else:
		raise ValueError("NA and NB couldn't be equals")
	return m3C

def protocole2Decrypting(m3C, NA, eA, NB, dB, NC) :
	"""Decrypting of the second protocole."""	
	if NA > NB:
		m2C = dechiffrement(m3C, eA, NA)
		m1C = dechiffrement(m2C, dB, NB)
		m1 = alphabetise(m1C, NC)
	elif NA < NB:
		m2C = dechiffrement(m3C, dB, NB)
		m1C = dechiffrement(m2C, eA, NA)
		m1 = alphabetise(m1C, NC)
	else:
		raise ValueError("NA and NB couldn't be equals")
	return m1