% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
-module(euler005).
-export([smallest_multiple/1]).

smallest_multiple(N) -> smallest_multiple(N, N).
smallest_multiple(N, Number) ->
  case lists:all(fun(X) -> (Number rem X) == 0 end, lists:seq(2, N)) of
    true -> Number;
    false -> smallest_multiple(N, Number + N)
  end.
