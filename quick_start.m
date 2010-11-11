%random measurement matrix
n = 1000; %rows
m = 300;  %columns
A = randn(m,n);

%signal we will try to reconstruct later
k = 15;           %how many non-zero coefficients in signal of interest
xs = zeros(n,1);
p = randperm(n);  %pick random coefficients to set
xs(p(1:k)) = randn(k,1);

b = A*xs;

%orthogonalize A and transform our signal b into the new basis
[Q, R] = qr(A',0);
A = Q'; b = R'\b;

opts.tol = 5e-8; %set reconstruction stopping tolerance
[x,Out] = yall1(A, b, opts);
fprintf('L2 norm error: %e\n', norm(x-xs))
