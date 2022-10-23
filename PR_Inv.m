function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Algoritmul Gram-Schmidt pentru a descompune matricea A in Q*R
	[m n]=size(A);
	Q = A;
	R = zeros( m, n );
	for k = 1 : n
    R( k, k ) = norm( Q( 1 : m, k ) );
	  Q( 1 : m, k ) = Q( 1 : m, k ) / R( k, k );
	  for j = k + 1 : n
		  R( k, j ) = Q( 1 : m, k )' * Q( 1 : m, j );
		  Q( 1 : m, j ) = Q(1 : m, j ) - Q( 1 : m, k ) * R( k, j );
      end
    end
  Q = Q';
  B = A;
  %calcularea inversei lui A folosind SST
  for i = 1 : n
    B(:, i) = SST(R, Q(:, i));
  end
end