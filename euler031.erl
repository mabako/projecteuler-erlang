-module(euler031).
-export([solve/0]).

solve() ->
  length([
    {TwoPounds, OnePound, FiftyPence, TwentyPence, TenPence, FivePence, TwoPence, 200} ||
    TwoPounds <- lists:seq(0, 1),
    OnePound <- lists:seq(0, 2),
    FiftyPence <- lists:seq(0, 4),
    TwentyPence <- lists:seq(0, 10),
    TenPence <- lists:seq(0, 20),
    FivePence <- lists:seq(0, 40),
    TwoPence <- lists:seq(0, 100),
    TwoPounds * 200 + OnePound * 100 + FiftyPence * 50 + TwentyPence * 20 + TenPence * 10 + FivePence * 5 + TwoPence * 2 =< 200
  ]).
