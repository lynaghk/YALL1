    |
    |                   .                __     __      _      _     __
    |           .       |                \ \   / //\   | |    | |   /_ |    .
    |           |       |                 \ \_/ //  \  | |    | |    | |    |
    |           |       |                  \   // /\ \ | |    | |    | |    |
    |           |       |        .          | |/ ____ \| |____| |____| |    |
    |  .        |       |        |          |_/_/    \_\______|______|_|    |
    |  |        |       |        |     .       Your ALgorithms for L1       |
    x--^-----^--+-------+-----*--+-----^------------*--------,---*----------+--
    |


YALL1 is an Matlab/Octave package for solving eight different L1-norm minimization problems.

Download the latest version via git:

    git clone http://github.com/lynaghk/YALL1/

and use it by adding `yall1.m` to your Matlab or Octave path:

    path(path, '/home/yourname/YALL1')

An example of using YALL1 for basis pursuit (min ||x||_1 such that Ax = b):

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






Copyright
---------

The original package is available at [http://yall1.blogs.rice.edu/](http://yall1.blogs.rice.edu/)

This version is slightly modified for Octave compatibility.

YALL1: Your ALgorithms for L1

COPYRIGHT (c) 2010 Yin Zhang, Junfeng Yang, and Wotao Yin.

YALL1 is distributed under the terms of the GNU General Public License 3.0.
http://www.gnu.org/copyleft/gpl.html

Permission to use, copy, modify, and distribute this software for
any purpose without fee is hereby granted, provided that this entire
notice is included in all copies of any software which is or includes
a copy or modification of this software and in all copies of the
supporting documentation for such software.
This software is being provided "as is", without any express or
implied warranty.  In particular, the authors do not make any
representation or warranty of any kind concerning the merchantability
of this software or its fitness for any particular purpose.
