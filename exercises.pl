% Ex 1.1 - search
search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% Ex 1.2 - search2
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, T)) :- search2(X, T).

% Ex 1.3 - search_two(Elem, List): looks for two occurences of Elem with any element in between!
% It is fully relational.
search_two(X, cons(X, cons(_, cons(X, _)))).
search_two(X, cons(_, T)) :- search_two(X, T).

% Ex 1.4: search_anytwo(Elem, List): looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).

% Ex 2.1: size(List, Size): Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))..
size(nil, zero).
size(cons(_, T), s(O)) :- size(T, O).

% Ex 2.2: sum_list(List, Sum)
sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

sum_list(cons(H, nil), H).
sum_list(cons(H, T), O2) :- sum_list(T, O), sum(H, O, O2).

% Ex 2.3.1: count(List, Element, NOccurencesSoFar, NOccurences)
count(nil, _, N, N).
count(cons(E, T), E, N, O) :- count(T, E, s(N), O).
count(cons(E, T), E2, N, O) :- E \= E2, count(T, E2, N, O).

% Ex 2.3.2: count(List, Element, NOccurences) -- tail recursive
count(List, E, N) :- count(List, E, zero, N).

% Ex 2.4: max(List, Max): Max is the biggest element in List supposing the list has at least one element
greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

max(nil, N, N).
max(cons(N, T), M, O) :- greater(N, M), max(T, N, O).
max(cons(N, T), M, O) :- max(T, M, O).

max(cons(H, T), O) :- max(cons(H, T), H, O).

% Ex 2.5: min-max(List, Min, Max)
min(nil, N, N).
min(cons(N, T), M, O) :- greater(N, M), min(T, M, O).
min(cons(N, T), M, O) :- min(T, N, O).

min(cons(H, T), O) :- min(cons(H, T), H, O).

min-max(L, MIN, MAX) :- min(L, MIN), max(L, MAX).

% Ex 3.1: same(List1, List2): are the two list exactly the same?
same(L, L).

% Ex 3.2: all_bigger(List1, List2): all elements in List1 are bigger than those in List2, 1 by 1

all_bigger(cons(H, nil), cons(H2, nil)) :- greater(H, H2).
all_bigger(cons(H, T), cons(H2, T2)) :- greater(H, H2), all_bigger(T, T2).

% Ex 3.3: sublist(List1, List2): List1 should contain elements all also in List2
sublist(cons(H, nil), L) :- search(H, L).
sublist(cons(H, T), L) :- search(H, L), sublist(T, L). 

% Ex 4.1: seq
seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).

% Ex 4.2: seqR(N, List)
seqR(s(zero), cons(zero, nil)).
seqR(s(N), cons(N, O)) :- seqR(N, O).

% Ex 4.3: seqR2(N, List)
last(nil, E, cons(E, nil)).
last(cons(H, T), E, cons(H, O)) :- last(T, E, O).

seqR2(s(zero), cons(zero, nil)).
seqR2(s(N), O) :- seqR2(N, H), last(H, N, O).
