-module(euler016).
-import(util, [sum_of_digits/1, pow/2]).
-export([solve/1]).

solve(N) -> sum_of_digits(pow(2, N)).
