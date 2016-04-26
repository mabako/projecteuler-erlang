-module(euler016).
-export([sum_of_digits/1,pow/2, solve/1]).

pow(Base, Exponent) -> pow(Base, Exponent, 1).

pow(_, 0, Value) -> Value;
pow(Base, Exponent, Value) -> pow(Base, Exponent - 1, Value * Base).

sum_of_digits(N) ->
  lists:sum(lists:map(fun(X) -> list_to_integer([X]) end, integer_to_list(N))).

solve(N) -> sum_of_digits(pow(2, N)).
