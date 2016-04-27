-module(euler012).
-export([triangle_number/1, solve/1, divisors/1]).

divisors(N) -> divisors(N, 1, []).
divisors(N, X, Divisors) when N < X * X -> Divisors;
divisors(N, X, Divisors) when N == X * X -> [X | Divisors];
divisors(N, X, Divisors) when (N rem X) == 0 ->
  divisors(N, X + 1, [X | [N div X | Divisors]]);
divisors(N, X, Divisors) -> divisors(N, X + 1, Divisors).

triangle_number(N) -> (N * (N + 1)) div 2.
solve(N) ->
  solve(N, 1).


solve(N, Current) ->
  case length(divisors(triangle_number(Current))) > N of
    true -> triangle_number(Current);
    false -> solve(N, Current + 1)
  end.
