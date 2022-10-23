# Page-Rank

Am implementat algoritmul PageRank, folosind doua metode.

Metoda iterativa:
* Algoritmul este implementat cu ajutorul matricei de adiacenta A si a matricei M
* Un link al lui j catre i este retinut in matricea adiacenta cu valoarea 1
* Avem doua matrice de pagerank una care este la pasul t, alta care este la pasul t+1

Metoda algebrica:
* Se foloseste de un vector unitate
* Creeaza matricea de adiacenta A si matricea M
* Cu ajutorul acestora aflam matricea K
* Se obtine R conform formulei date in enunt

Functia PR_Inv
* Pentru aceasta functie am folosit algoritmul Gram-Schmidt pentru descompuneri
* Am apelat functia SST, care se foloseste de algoritmul de rezolvare a unui sistem superior triunghiular

Functia PageRank
* Calculeaza indicii PageRank pentru cele trei cerinte
* Se apeleaza functiile 'Iterative' si 'Algebraic' pentru calculul lui R1 si R2
* Se sorteaza elementele lui R2 descrescator
* Se foloseste functia Apartenenta pentru a calcula gradul de apartenenta
* Rezultatele obtinute sunt afisate intr-un fisier de output

