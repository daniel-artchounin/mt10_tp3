load("1_3_1.sage")
load("1_3_2.sage")
load("1_3_3.sage")
load("1_4.sage")
load("2_1.sage")
load("2_2.sage")
load("2_3.sage")
load("3_1.sage")
load("3_3.sage")
load("3_4.sage")
load("rsa_library.sage")

import random


########################## Question 1 ##########################
print('########################## Question 1 ##########################\n')
print(P.factor())

########################## Question 2 ##########################
print('\n\n########################## Question 2 ##########################\n')
print('\n\n########################## Verification 1 ##########################\n')
n = 100
print('La fonction de Möbius est-elle vérifiée pour les {} premiers entiers naturels ?'. format(n))
print(moebiusTest(n))
print('\n\n########################## Verification 2 ##########################\n')
print('La fonction d\'Euler pour  Möbius est-elle vérifiée pour les {} premiers entiers naturels ?'.format(n))
print(eulerTest(n))
print('\n\n########################## Verification 3 ##########################\n')
print('phi({}) = {}'.format(n, euler_phi(n)))
print('moebiusInversionFormulaTest({}) = {} (utilisation de la formule d\'inversion de Mobius)'.format(n, moebiusInversionFormulaTest(n)))

########################## Question 3 ##########################
print('\n\n########################## Question 3 ##########################\n')
print('Tableau Irrp(n) pour p=2,3,5 et n = 1,...,10')
printIrr([2,3,5], range(1, 11))

########################## Question 4 ##########################
print('\n\n########################## Question 4 ##########################\n')
maxDegree = 10
printF2XIrreductiblePolynomials(maxDegree)

########################## Question 5 ##########################
print('\n\n########################## Question 5 ##########################\n')
numerisedMessage = [1, 5, 7, 10, 3, 5, 2]
vs = [2, 10, 4, 1, 6, 5, 8, 7, 9, 3]
alphas = [11, 17, 13, 20, 15, 16, 12, 18, 19, 14]
q = 23
print("Message numérisé : mn = {}".format(numerisedMessage))
print("Ordre du corps fini : q = {}".format(q))
print("Vecteur v = {}".format(vs))
print("Vecteur alpha = {}".format(alphas))
print("Appel de codeGRS()...".format(alphas))
encodedMessage = codeGRS(q, numerisedMessage, vs, alphas)
print("Message encodé : me = {}".format(encodedMessage))

########################## Question 6 ##########################
print('\n\n########################## Question 6 ##########################\n')
print("Message encodé : me = {}".format(encodedMessage))
print("Ordre du corps fini : q = {}".format(q))
print("Vecteur v = {}".format(vs))
print("Vecteur alpha = {}".format(alphas))
print("Appel de decodeGRS()...".format(alphas))
decodedMessage = decodeGRS(q, encodedMessage, vs, alphas)
print("Message décodé : md = {}".format(decodedMessage))

########################## Question 7 ##########################
print('\n\n########################## Question 7 ##########################\n')
numberOfErrors = 1
print("Message encodé : me = {}".format(encodedMessage))
print("Ordre du corps fini : q = {}".format(q))
print("Appel de errTrans() avec {} erreurs de transmission.".format(numberOfErrors)) 
encodedMessageWithErrors = errTrans(q, encodedMessage, numberOfErrors)
print("Message encodé avec {} erreur de transmission : merr = {}".format(numberOfErrors, encodedMessageWithErrors))

########################## Question 8 ##########################
print('\n\n########################## Question 8 ##########################\n')
print("Message numérisé : mn = {}".format(numerisedMessage))
print("Message encodé : me = {}".format(encodedMessage))
print("Ordre du corps fini : q = {}".format(q))
print("Vecteur v = {}".format(vs))
print("Vecteur alpha = {}".format(alphas))
print("Message encodé avec {} erreur(s) de transmission : merr = {}".format(numberOfErrors, encodedMessageWithErrors))
print("Appel de decodeGRS() sur le message encodé avec erreur(s) de transmission...".format(alphas))
decodedMessage = decodeGRS(q, encodedMessageWithErrors, vs, alphas)
print("Message décodé : md = {}".format(decodedMessage))

########################## Question 10 ##########################
print('\n\n########################## Question 10 ##########################\n')
print("Message numérisé : mn = {}".format(numerisedMessage))
print("Ordre du corps fini : q = {}".format(q))
print("Vecteur v = {}".format(vs))
print("Vecteur alpha = {}".format(alphas))
print("Message encodé : me = {}".format(encodedMessage))
print("Appel de syndrome()...")
syndromePolynomial = syndrome(q, encodedMessage, vs, alphas, len(numerisedMessage))
print("S(X) = {}".format(syndromePolynomial))
print("Message encodé avec {} erreur(s) de transmission : merr = {}".format(numberOfErrors, encodedMessageWithErrors))
syndromePolynomial = syndrome(q, encodedMessageWithErrors, vs, alphas, len(numerisedMessage))
print("S(X) = {}".format(syndromePolynomial))

########################## Question 11 ##########################
print('\n\n########################## Question 11 ##########################\n')
sigma, omega = clef(q, syndromePolynomial, len(numerisedMessage), len(vs))
FqX.<X> = GF(q, name='a')['X']
rDiff = len(vs) - len(numerisedMessage)
print('S(X) = {}'.format(syndromePolynomial))
print('Appel de clef()...')
print(sigma)
print(omega)
print('(sigma * FqX(syndromePolynomial)) % X^r = {}'.format((sigma * FqX(syndromePolynomial)) % X^rDiff))
print('omega %  X^r = {}'.format(omega %  X^rDiff))

########################## Question 12 ##########################
print('\n\n########################## Question 12 ##########################\n')
print("Message encodé : me = {}".format(encodedMessage))
print("Message encodé avec {} erreur(s) de transmission : merr = {}".format(numberOfErrors, encodedMessageWithErrors))
error = erreur(q, sigma, omega, vs, alphas)
print("Erreur : e = {}".format(error))
correction = computeDifferenceBetweenTwoLists(encodedMessageWithErrors, error)
print("Correction de l'erreur, puis obtention du message initialement encodé : merr-me = {}".format(correction))
decodedMessage = decodeGRS(q, correction, vs, alphas)
print("Message décodé : md = {}".format(decodedMessage))

########################## Question 13 ##########################
print('\n\n########################## Question 13 ##########################\n')
cle_alice = 35, 17, 17
cle_bob = 55, 21, 21
nc = 8

m1 = "Rendez-vous demain vers 14 heures"
print("m1 = '{}'\n".format(m1))

print("na = {}".format(cle_alice[0]))
print("nb = {}".format(cle_bob[0]))
print("nc = {}\n".format(nc))

m3C = protocole2Encrypting("Rendez-vous demain vers 14 heures", cle_alice[0], cle_alice[2], cle_bob[0], cle_bob[1], nc)
if cle_alice[0] > cle_bob[0]:
	print("Alice chiffre une première fois le message avec la clé publique de Bob...")
	print("Alice chiffre une deuxième fois le message déjà chiffré (une fois) avec sa clé privée...")
else:
	print("Alice chiffre une première fois le message avec sa clé privée...")
	print("Alice chiffre une deuxième fois le message déjà chiffré (une fois) avec la clé publique de Bob...")

print("m3C = {}\n".format(m3C))

q = 307
k = len(m3C)
n = 2*k

d = n - k + 1 
vs = random.sample(range(3, q), n)
alphas = random.sample(range(3, q), n)
numberOfErrors = 3

encodedMessage = codeGRS(q, m3C, vs, alphas)
print("Ordre du corps fini : q = {}".format(q))
print("Vecteur v = {}".format(vs))
print("Vecteur alpha = {}".format(alphas))
print("Message encodé : me = {}".format(encodedMessage))

print("Le message doublement crypté, puis, encodé (me) est envoyé à Bob...")

print("Appel de errTrans() avec {} erreurs de transmission.".format(numberOfErrors)) 
encodedMessageWithErrors = errTrans(q, encodedMessage, numberOfErrors)
print("Message encodé avec {} erreur(s) de transmission : merr = {}".format(numberOfErrors, encodedMessageWithErrors))
print("Appel de syndrome()...")
syndromePolynomial = syndrome(q, encodedMessageWithErrors, vs, alphas, k)
print("Appel de clef()...")
sigma, omega = clef(q, syndromePolynomial, k, len(vs))
print("Appel de erreur()...")
error = erreur(q, sigma, omega, vs, alphas)
print("Erreur : e = {}".format(error))
correction = computeDifferenceBetweenTwoLists(encodedMessageWithErrors, error)
print("Correction de l'erreur, puis, obtention du message initialement encodé : merr-me = {}".format(correction))
decodedMessage = decodeGRS(q, correction, vs, alphas)
print("Message décodé : md = {}".format(decodedMessage))

m1 = protocole2Decrypting(m3C, cle_alice[0], cle_alice[1], cle_bob[0], cle_bob[2], nc)
if cle_alice[0] > cle_bob[0]:
	print("Bob déchiffre une première fois le message chiffré avec la clé publique d'Alice...")
	print("Bob déchiffre une deuxième fois le message déjà déchiffré (une fois) avec sa clé privée...")
else:
	print("Bob déchiffre une première fois le message chiffré avec sa clé privée...")
	print("Bob déchiffre une deuxième fois le message déjà déchiffré (une fois) avec la clé publique d'Alice...")
print("m1 = '{}'".format(m1))