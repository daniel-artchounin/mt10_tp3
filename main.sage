load("1_3_1.sage")
load("1_3_2.sage")
load("1_3_3.sage")

########################## Question 1 ##########################
print('########################## Question 1 ##########################\n')
print(P.factor())

########################## Question 2 ##########################
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
print('########################## Question 3 ##########################\n')
print('Tableau Irrp(n) pour p=2,3,5 et n = 1,...,10')
printIrr([2,3,5], range(1, 11))
print(irr_tab())