-module(euler034).
-import(util, [digits/1, fac/1]).
-export([solve/1]).

solve(N) ->
  lists:sum([
    X ||
    X <- lists:seq(3, N),
    lists:sum(lists:map(fun(Y) -> fac(Y) end, digits(X))) == X
  ]).
