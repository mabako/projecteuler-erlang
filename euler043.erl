-module(euler043).
-import(util, [permutations/1, digits_to_number/1]).
-export([solve/0]).

divisible_nums() -> [2, 3, 5, 7, 11, 13, 17].

divisible(_, []) -> true;
divisible([_ | Digits], [X | Tail]) ->
  ((lists:nth(1, Digits) * 100 + lists:nth(2, Digits) * 10 + lists:nth(3, Digits)) rem X == 0) and divisible(Digits, Tail).

solve() ->
  lists:sum([digits_to_number(Digits) ||
    Digits <- permutations(lists:seq(0, 9)),
    divisible(Digits, divisible_nums())
  ]).
