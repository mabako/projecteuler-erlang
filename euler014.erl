% Collatz Sequence
-module(euler014).
-export([collatz_max/1]).

collatz(1, Count) -> Count;
collatz(N, Count) when (N rem 2) == 0 -> collatz(N div 2, Count + 1);
collatz(N, Count) -> collatz(3 * N + 1, Count + 1).

collatz_max(N) ->
  find_max(lists:map(fun(X) -> collatz(X, 1) end, lists:seq(1, N)), 0, 0, 1).

find_max([], Max, MaxPosition, _Position) -> {Max, MaxPosition};
find_max([Head | Tail], Max, _MaxPosition, Position) when Head > Max ->
  find_max(Tail, Head, Position, Position + 1);
find_max([_ | Tail], Max, MaxPosition, Position) ->
  find_max(Tail, Max, MaxPosition, Position + 1).
