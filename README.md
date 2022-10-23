# Page-Rank

I implemented the PageRank algorithm, using two methods.

Iterative method:
- The algorithm is implemented using the adjacency matrix A and the matrix M
- A link of j to i is retained in the adjacent matrix with the value 1
- We have two pagerank matrices, one which is at step t, another which is at step t+1

Algebraic method:
- It uses a unit array
- Create the adjacency matrix A and the matrix M
- With their help we find the matrix K
- R is obtained according to the formula given in the statement

Function PR_Inv
- For this function I used the Gram-Schmidt decomposition algorithm
- I called the SST function, which is used by the algorithm for solving an upper triangular system

PageRank function
- Calculate PageRank indices for the three requirements
- The 'Iterative' and 'Algebraic' functions are called for the calculation of R1 and R2
- The elements of R2 are sorted in descending order
- The Membership function is used to calculate the degree of membership
- The obtained results are displayed in an output file
