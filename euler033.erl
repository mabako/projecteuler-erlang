-module(euler033).
-export([solve/0]).

solve() ->
  lists:foldl(fun({Num, Den}, {Num2, Den2}) -> {Num * Num2, Den * Den2} end, {1, 1},
    [
      {Numerator div 10, Denominator rem 10} ||
      Denominator <- lists:seq(10, 99),
      Numerator <- lists:seq(10, Denominator - 1),
      (Numerator rem 10) == (Denominator div 10),
      Numerator / Denominator == (Numerator div 10) / (Denominator rem 10)
    ]).
