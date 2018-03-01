% Define board size (input):
int: n = 5;

% Derive range and board from board size:
set of int: num = 1..5;
array[num,num] of var num: board;

% Define instance (input):
constraint board[2,1] = 4;
constraint board[2,5] = 2;
constraint board[3,3] = 4;
constraint board[4,5] = 4;

constraint board[1,1] > board[1,2];
constraint board[1,3] > board[1,4];
constraint board[1,4] > board[1,5];

constraint board[4,4] < board[4,5];

constraint board[5,1] < board[5,2];
constraint board[5,2] < board[5,3];

% General constraint for futoshiki:
constraint forall(x, y, z in num where x < y)(
  board[z,x] != board[z,y] /\ board[x,z] != board[y,z]
);

solve satisfy;

output 
[
  if j = 1 then "\n" else " " endif ++
    show(board[i,j])
  | i,j in num
] ++ ["\n"];