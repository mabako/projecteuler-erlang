-module(euler030).
-import(util, [pow/2, digits/1]).
-export([solve/0]).

solve() ->
  lists:sum([
    X ||
    X <- lists:seq(2, 1000000), % arbitrary upper limit
    X == lists:sum(lists:map(fun(N) -> pow(N, 5) end, digits(X)))
  ]).
