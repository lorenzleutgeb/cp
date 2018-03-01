int: N = 6; /* Height and width of our riddle. */

% Top to Bottom is the first component.
% Left to Right is the second component.
array [1..N,1..N] of var 1..N: b;

% Each number must occur once in every box.
constraint forall(x in 1..N)(
  forall(i in 0..2)(
    forall(j in 0..1)(
      exists(m in 0..1)(
        exists(n in 0..2)(
          b[1+j*3+n,1+i*2+m] == x
        )
      )
    )
  )
);

% Each number must occur once in every row.
constraint forall(i, x in 1..N)(
  exists(j in 1..N)(b[i,j] == x)
);

% Each number must occur once in every column.
constraint forall(i, x in 1..N)(
  exists(j in 1..N)(b[j,i] == x)
);

% For each colored region, the numbers in the fields must sum up to a given number.
constraint b[1,1] + b[1,2] + b[1,3] == 6; % green
constraint b[1,4] + b[2,4] + b[2,5] == 11; % violet
constraint b[1,5] + b[1,6] == 10; % yellow
constraint b[2,1] + b[2,2] == 11; % yellow
constraint b[2,3] + b[3,3] == 7; % blue
constraint b[2,6] + b[3,6] == 4; % blue
constraint b[3,4] + b[3,5] == 8; % green
constraint b[3,1] + b[4,1] == 3; % violet
constraint b[3,2] + b[4,2] + b[5,2] == 12; % green
constraint b[4,3] + b[4,4] == 10; % violet
constraint b[4,5] + b[4,6] == 5; % yellow
constraint b[5,1] + b[6,1] == 10; % yellow
constraint b[6,2] + b[6,3] == 5;
constraint b[5,3] + b[5,4] == 7;
constraint b[6,4] + b[6,5] == 7; % violet
constraint b[5,5] + b[5,6] + b[6,6] == 10; % green

solve satisfy;

output 
[
  if j = 1 then "\n" else " " endif ++
    show(b[i,j])
  | i,j in 1..N
] ++ ["\n"];

/*
3 1 2 5 4 6
5 6 1 4 2 3
2 4 6 3 5 1
1 5 4 6 3 2
6 3 5 2 1 4
4 2 3 1 6 5