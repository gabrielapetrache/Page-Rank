function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	input = fopen(nume, 'r');
	N = fscanf(input, '%d', 1);	% numarul de pagini.
	A = zeros(N, N); % matricea de adiacenta
	M = zeros(N, N);
	L(1:N) = 0;

	for i = 1:N
		k = fscanf(input, "%d", 1);
		l = fscanf(input, "%d", 1);
		for j = 1:l
		  m = fscanf(input, "%d", 1);
		  if i ~= m
			A(i, m) = 1;
			L(i) = L(i) + 1;
		  end
		end
	end

	for i = 1:N
		for j = 1:N
		  if A(j, i) == 1
			M(i, j) = 1 / L(j);
		  else
			M(i, j) = 0;
		  end
		end
	end
	
	fclose(input);

	R(1:N, 1) = 1 / N;
	aux(1:N, 1) = 0;

	ok = 0;
	while(ok == 0)
	  aux = d * M * R + (1 - d) / N * ones(N, 1);
	  if abs(aux - R) < eps
		ok = 1; % s-a atins convergenta
	  else
	  	R = aux;
	  end
	end
end