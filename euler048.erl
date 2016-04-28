-module(euler048).
-export([solve/1]).

solve(1) -> 1;
solve(N) -> (util:pow(N, N) + solve(N-1)) rem 10000000000.
