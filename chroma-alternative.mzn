% Alternative Encoding for chroma.mzn

int: nVertices = 10; % number of vertices

set of int: Colors = 1..nVertices; % define a range "Colors"
set of int: Vertices = 1..nVertices; % define a range "Vertices"

% an array 1..nVertices, each element of type "var Color",
% i.e. element of the array can take a value from the defined range "Colors"
array[Vertices] of var Colors: vertices;

% all subsequent constraint encode the fact
% that there is an edge between two vertices,
% and therefore their value (color) must be different
% (its again the petersen graph)
constraint vertices[1] != vertices[2];
constraint vertices[2] != vertices[3];
constraint vertices[3] != vertices[4];
constraint vertices[4] != vertices[5];
constraint vertices[5] != vertices[1];

constraint vertices[1] != vertices[6];
constraint vertices[2] != vertices[7];
constraint vertices[3] != vertices[8];
constraint vertices[4] != vertices[9];
constraint vertices[5] != vertices[10];

constraint vertices[6] != vertices[8];
constraint vertices[6] != vertices[9];
constraint vertices[7] != vertices[9];
constraint vertices[7] != vertices[10];
constraint vertices[8] != vertices[10];

% let chrN be the maximal value one of the elements in "vertices" has
var Colors: chrN = max(vertices);
%  solve and minimize with respect to chrN
solve minimize chrN;

output ["chromatic number: ", show(chrN)];
