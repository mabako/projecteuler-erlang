-module(euler032).
-import(util, [digits/1]).
-export([pandigital/3, solve/0]).

pandigital(A, B, C) ->
  lists:sort(digits(A) ++ digits(B) ++ digits(C)) == lists:seq(1, 9).

solve() ->
  lists:sum(sets:to_list(sets:from_list([
    X * Y ||
    % X should have at most 4 digits (exactly when Y has 1), for the total number of digits not to exceed 9.
    X <- lists:seq(2, 10000),
    Y <- lists:seq(2, min(X, 100)),
    pandigital(X, Y, X * Y)
  ]))).
