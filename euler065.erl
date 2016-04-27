-module(euler065).
-export([solve/1, e_frac/1]).

-import(util, [digits/1]).
e_frac(N) when (N rem 3) == 0 -> 2 * N div 3;
e_frac(_) -> 1.


solve(N) -> lists:sum(digits(solve(N, 3, 2, 2))).
solve(N, Value, _, Pos) when Pos == N -> Value;
solve(N, Minus1, Minus2, Pos) -> solve(N, e_frac(Pos + 1) * Minus1 + Minus2, Minus1, Pos + 1).
