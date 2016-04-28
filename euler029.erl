-module(euler029).
-export([solve/1]).

solve(N) ->
  sets:size(sets:from_list([
    util:pow(A, B) ||
    A <- lists:seq(2, N),
    B <- lists:seq(2, N)
  ])).
