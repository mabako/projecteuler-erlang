-module(euler009).
-export([pythagorean/1, pythagorean_multiply/1]).

pythagorean(N) ->
  [{A, B, C} || % find a triplet out of A, B, C
    A <- lists:seq(1, N - 2),
    B <- lists:seq(A + 1, N - 1),
    C <- lists:seq(B + 1, N),
    A + B + C == N,
    A * A + B * B == C * C
  ].


pythagorean_multiply(N) ->
  [{A, B, C} | _] = pythagorean(N),
  A * B * C.
