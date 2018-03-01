% Formulate the 2D-BinPacking Problem as constraint optimization problem. N
% rectangular items each with a (probably different) given height and width have
% to be packed into rectangular bins all of the same size W × H. It can be
% assumed that the items are sorted according to non-increasing height. The goal
% is to minimize the number of bins needed to pack all items (the natural upper
% bound therefore is N – each item into one bin).

int: N =  6; /* Number of items we are considering. */
int: W = 10; /* Width of a single bin. */
int: H =  7; /* Height of a single bin. */

array [1..N] of int: w; /* Width of each item. */
array [1..N] of int: h; /* Height of each item. */

array [1..N] of var 1..N: b; /* Bin of each item. */
array [1..N] of var 0..W: x; /* Position of each item along the x-axis. */
array [1..N] of var 0..H: y; /* Position of each item along the y-axis. */

constraint forall(i, j in 1..N where b[i] == b[j] /\ i < j)(
  (x[j] + w[j] <= x[i] xor x[j] >= x[i] + w[i])
  /\
  (y[j] + h[j] <= y[i] xor y[j] >= y[i] + h[i])
);

constraint forall(i in 1..N)(
  (x[i] + w[i] <= W)
  /\
  (y[i] + h[i] <= H)
);

solve minimize max(b);

/* output (["\(b)"]); */
