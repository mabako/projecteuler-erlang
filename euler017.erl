-module(euler017).
-export([solve/1, words/1]).

words(N) ->
  case N of
    1 -> "one";
    2 -> "two";
    3 -> "three";
    4 -> "four";
    5 -> "five";
    6 -> "six";
    7 -> "seven";
    8 -> "eight";
    9 -> "nine";
    10 -> "ten";
    11 -> "eleven";
    12 -> "twelve";
    13 -> "thirteen";
    14 -> "fourteen";
    15 -> "fifteen";
    16 -> "sixteen";
    17 -> "seventeen";
    18 -> "eighteen";
    19 -> "nineteen";
    20 -> "twenty";
    30 -> "thirty";
    40 -> "forty";
    50 -> "fifty";
    60 -> "sixty";
    70 -> "seventy";
    80 -> "eighty";
    90 -> "ninety";
    _default -> if
                  N == 1000 -> "onethousand";
                  (N rem 100) == 0 -> words(N div 100) ++ "hundred";
                  N >= 100 -> words(N div 100) ++ "hundredand" ++ words(N rem 100);
                  true -> words(10 * (N div 10)) ++ words(N rem 10)
                end
  end.

solve(N) ->
  lists:sum(lists:map(fun(X) -> length(words(X)) end, lists:seq(1, N))).
