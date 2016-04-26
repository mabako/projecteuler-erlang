-module(euler016).
-import(util, [sum_of_digits/1]).
-export([pow/2, solve/1]).

pow(Base, Exponent) -> pow(Base, Exponent, 1).

pow(_, 0, Value) -> Value;
pow(Base, Exponent, Value) -> pow(Base, Exponent - 1, Value * Base).

solve(N) -> sum_of_digits(pow(2, N)).
