load("1_3_1.sage")
load("1_3_2.sage")
load("1_3_3.sage")
load("1_4.sage")
load("2_1.sage")
load("2_2.sage")
load("2_3.sage")
load("3_1.sage")

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
print(irrTab())

########################## Question 4 ##########################
print('\n\n########################## Question 4 ##########################\n')
maxDegree = 10
printF2XIrreductiblePolynomials(maxDegree)

########################## Question 5 ##########################
print('\n\n########################## Question 5 ##########################\n')
numerisedMessage = [1, 5, 7, 10, 3, 5, 2]
vs = [2, 10, 4, 1, 6, 5, 8, 7, 9, 3]
alphas = [11, 17, 13, 20, 15, 16, 12, 18, 19, 14]
q = 11
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
numberOfErrors = 3
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
syndromeEvaluation = syndrome(q, encodedMessage, vs, alphas, len(numerisedMessage))
print("S(X) = {}".format(syndromeEvaluation))
print("Message encodé avec {} erreur(s) de transmission : merr = {}".format(numberOfErrors, encodedMessageWithErrors))
syndromeEvaluation = syndrome(q, encodedMessageWithErrors, vs, alphas, len(numerisedMessage))
print("S(X) = {}".format(syndromeEvaluation))