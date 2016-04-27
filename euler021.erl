-module(euler021).
-export([divisors/1, amicable/1, solve/0]).


divisors(N) ->
  divisors(N, 1, []).

divisors(N, X, Divisors) when N < 2 * X -> Divisors;
divisors(N, X, Divisors) when (N rem X) == 0 ->
  divisors(N, X + 1, [X | Divisors]);
divisors(N, X, Divisors) -> divisors(N, X + 1, Divisors).

amicable(Max) ->
  [
    X ||
    X <- lists:seq(1, Max - 1),
    X /= lists:sum(divisors(X)),
    X == lists:sum(divisors(lists:sum(divisors(X))))
  ].

solve() -> lists:sum(amicable(10000)).
