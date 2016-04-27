-module(euler015).
-export([solve/1]).

fac(1) -> 1;
fac(N) -> N * fac(N - 1).

solve(N) ->
  fac(2 * N) div (fac(N) * fac(N)).

%solve(0, _) -> 1;
%solve(_, 0) -> 1;
%solve(X, Y) -> solve(X - 1, Y) + solve(X, Y - 1).

