	function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 

	input = fopen(nume, "r");
	out_name = strcat(nume, ".out");
	output = fopen(out_name, "w");
	N = fscanf(input, "%f", 1); % numarul de pagini

	for i = 1 : N
		v1(i) = 1;
	end

	i = 1;

	while i <= N
		aux = fscanf(input, "%f", 1);
		l = fscanf(input, "%f", 1);
		j = 1;
		while j <= l
			matrix(i, j) = fscanf(input, "%f", 1);
			j = j + 1;
		end
		i = i + 1;
	end

	fprintf(output, "%d\n", N);
	fprintf(output, "\n");

	R1 = Iterative(nume, d, eps);
	fprintf(output, "%f\n", R1);
	fprintf(output, "\n");

	R2 = Algebraic(nume, d);
	fprintf(output, "%f\n", R2);
	fprintf(output, "\n");

	indice = zeros(N,1);

	for i = 1 : N
		indice(i) = i;
	end

	PR1 = R2;

	% sortarea elementelor descrescator
	for i = 1 : N - 1
		for j = i + 1 : N
			if PR1(i,1) <= PR1(j,1)
				temp = PR1(i, 1);
				PR1(i ,1) = PR1(j, 1);
				PR1(j, 1) = temp;
				aux = indice(i, 1);
				indice(i, 1) = indice(j, 1);
				indice(j, 1) = aux; 
			end
		end
	end

	i = 1;
	val1 = fscanf(input, "%f", 1);
	val2 = fscanf(input, "%f", 1);

	while i <= N
		x = PR1(i, 1);
		y = Apartenenta(x, val1, val2);
		fprintf(output, "%d %d %f\n", i, indice(i, 1), y);
		i = i + 1;
	end

	fclose(input);
	fclose(output);

	end