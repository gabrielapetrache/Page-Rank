function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	input = fopen (nume, 'r+');
	linie = fgets(input);
	k = str2num(linie);	% numarul de pagini
	N = k;
	A = zeros(N, N); % matricea de adiacenta
	M = zeros(N, N);

	v1 = zeros(N, 1); % vectorul unitate
	for i=1:N
	  v1(i) = 1;
	end

	n = 1;

	while k~=0
	  line = fgets(input);
	  v = str2num(line);
	  L = length(v);
	  c = v(2);

	  for i=3:L
		if v(i) == v(1)
		  c = c - 1;
		else
			A(v(1), v(i)) = 1;
		end
	  end

	  inv_M(n, n) = 1 / c;
	  n = n + 1;
	  k = k - 1;
	end
	
	for i = 1:N
	  A(i,i) = 0; % eliminam diagonala principala
	end
	
	fclose(input);

	K = (inv_M * A)'; 
	dK = eye(N, N) - d * K;
	inv_dK = PR_Inv(dK);
	
	R = inv_dK * (1 - d) / N * ones(N,1);

end