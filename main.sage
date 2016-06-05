load("1_3_1.sage")
load("1_3_2.sage")
load("1_3_3.sage")

########################## Question 1 ##########################
print('########################## Question 1 ##########################\n')
print(U.factor())

########################## Question 2 ##########################
print('\n\n########################## Verification 1 ##########################\n')

print('La fonction de Möbius est-elle vérifiée pour les 100 premiers entiers naturels ?')
print(test_moebius(100))
print('\n\n########################## Verification 2 ##########################\n')
print('La fonction d\'Euler pour  Möbius est-elle vérifiée pour les 100 premiers entiers naturels ?')
print(test_euler(100))
print('\n\n########################## Verification 3 ##########################\n')
test_mobius(100)

########################## Question 3 ##########################
print('########################## Question 3 ##########################\n')
print('Tableau Irrp(n) pour p=2,3,5 et n =1,...,10')
print irr_tab()
