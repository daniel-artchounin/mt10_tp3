F2X.<X> = GF(2)['X'] # F2[X]: polynomes à coefficient dans F2
P  = X^(2^6)-X
# Décomposition en polynôme unitaire et irréductible
#X * (X + 1) * (X^2 + X + 1) * (X^3 + X + 1) * (X^3 + X^2 + 1) * (X^6 + X + 1) * (X^6 + X^3 + 1) * (X^6 + X^4 + X^2 + X + 1) * (X^6 + X^4 + X^3 + X + 1) * (X^6 + X^5 + 1) * (X^6 + X^5 + X^2 + X + 1) * (X^6 + X^5 + X^3 + X^2 + 1) * (X^6 + X^5 + X^4 + X + 1) * (X^6 + X^5 + X^4 + X^2 + 1)
# les degrés des polynomes -> 1, 2, 3, 6 -> chaque polynome a un degré qui divise n (avec n=6)