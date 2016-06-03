R.<X> = GF(2)['X'] #constructeur des polynomes à coefficients dans F2 car p=2
U  = X^(2^6)-X
U.factor() # Décomposition en polynôme unitaire et irréductible
X * (X + 1) * (X^2 + X + 1) * (X^3 + X + 1) * (X^3 + X^2 + 1) * (X^6 + X + 1) * (X^6 + X^3 + 1) * (X^6 + X^4 + X^2 + X + 1) * (X^6 + X^4 + X^3 + X + 1) * (X^6 + X^5 + 1) * (X^6 + X^5 + X^2 + X + 1) * (X^6 + X^5 + X^3 + X^2 + 1) * (X^6 + X^5 + X^4 + X + 1) * (X^6 + X^5 + X^4 + X^2 + 1)
# les degrés des polynomes -> 1, 2, 3, 6 -> chaque polynome a un degré qui divise n (avec n=6)
