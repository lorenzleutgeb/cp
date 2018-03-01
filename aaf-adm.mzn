% Abstract argumentation frameworks allow to represent and solve conflicting
% knowledge. They consist of a set of abstract arguments and a binary relation
% between them, denoting attacks. The inherent conflicts are solved on a
% semantical level by selecting sets of arguments which are acceptable together.
% More formally, an argumentation framework (AF) is a pair F = (A, R) where
% A is a set of arguments and R ⊆ A × A is the attack relation. The pair
% (a, b) ∈ R means that a attacks b. We say that an argument a ∈ A is defended
% (in F) by a set S ⊆ A if, for each b ∈ A such that (b, a) ∈ R, there exists a
% c ∈ S such that (c, b) ∈ R.
% An argumentation framework can be represented as a directed graph. Let
% F = (A, R) be an AF with A = {a, b, c, d, e} and R = {(a, b), (b, c), (c, b),
% (d, c), (d, e), (e, e)}.
%                              
%  a ---> b <--> c <--- d ---> e
%                              V
%
% Let F = (A, R) be an AF. A set S ⊆ A is conflict-free (in F), if there are no
% a, b ∈ S, such that (a, b) ∈ R. cf(F) denotes the collection of conflict-free
% sets of F. For a conflict-free set S ∈ cf(F), it holds that S is ...
% • a stable extension, ie. S ∈ stable(F), if each a [not ∈] S is attacked by S;
% • an admissible set, ie. S ∈ adm(F), if each a ∈ S is defended by S;
% • a complete extension (of F), ie. S ∈ comp(F), if S ∈ adm(F) and
%   for each a ∈ A defended by S (in F), a ∈ S holds.
%
% We want to compute all extensions of a given semantics (stable, admissible
% or complete). Let F = (A, R) be an AF, formulate for each semantics the
% associated CSP, such that the solutions of the CSP correspond to the
% extensions of the AF F .

int: n; % Number of arguments.
set of int: argument = 1..n;

array[argument] of set of argument: attack;

predicate attacks(argument: a, argument: b) = b in attack[a];

predicate defended(argument: a, var set of argument: s) = (
  forall(b in s where attacks(b,a))(
    exists(c in s)(
      attacks(c,b)
    )
  )
);

predicate cf(var set of argument: s) = (
  forall(a, b in s)(
    not attacks(a,b)
  )
);

var set of argument: s;

constraint forall(a in s)(
  defended(a,s)
);

solve minimize card(s);