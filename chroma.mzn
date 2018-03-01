% A coloring of a graph involving the minimal number of colors is called the
% chromatic number of the graph. Formulate the problem of finding the chromatic
% number of a graph as a constrained optimization problem.

% Refer to Fig. 2 at http://www.minizinc.org/downloads/doc-latest/minizinc-tute.pdf#page=4

int: k = 10; % size of the input graph (= number of vertices)
int: nc = 10; % number of available colors (= at most the number of vertices in the graph)

% the var determining the chromatic number
var 1..nc: chrN;

% variables representing the node n1,...n10
% each can take values in 1..nc
var 1..nc: n1;
var 1..nc: n2;
var 1..nc: n3;
var 1..nc: n4;
var 1..nc: n5;
var 1..nc: n6;
var 1..nc: n7;
var 1..nc: n8;
var 1..nc: n9;
var 1..nc: n10;

% for the petersen-graph, we encode the edges
% as unequalities
constraint n1 != n2; % edge n1 - n2
constraint n2 != n3; % ...
constraint n3 != n4;
constraint n4 != n5;
constraint n5 != n1;

constraint n1 != n6;
constraint n2 != n7;
constraint n3 != n8;
constraint n4 != n9;
constraint n5 != n10;

constraint n6 != n8;
constraint n6 != n9;
constraint n7 != n9;
constraint n7 != n10;
constraint n8 != n10;

% let chrN be the maximal value which one of the 10 nodes takes
chrN = max([n1,n2,n3,n4,n5,n6,n7,n8,n9,n10]);

% solve and minimize with respect to chrN
solve minimize chrN;

% print the solution
output ["chromatic number: ", show(chrN)];
