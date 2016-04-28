-module(euler015).
-import(util, [fac/1]).
-export([solve/1]).

solve(N) ->
  fac(2 * N) div (fac(N) * fac(N)).

%solve(0, _) -> 1;
%solve(_, 0) -> 1;
%solve(X, Y) -> solve(X - 1, Y) + solve(X, Y - 1).

