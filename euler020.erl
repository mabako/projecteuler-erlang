-module(euler020).
-export([solve/0]).
-import(util, [sum_of_digits/1, fac/1]).

solve() -> sum_of_digits(fac(100)).
