-module(util).
-export([digits/1, digits_to_number/1, sum_of_digits/1, pow/2]).


% Splits an integer into a list containing all digits of the integer.
digits(N) when is_integer(N) ->
  lists:map(fun(X) -> list_to_integer([X]) end, integer_to_list(N)).

%
digits_to_number(List) -> lists:foldl(fun(Num, Fac) -> Fac * 10 + Num end, 0, List).

% Calculates the sum of all digits of an integer.
sum_of_digits(N) when is_integer(N) ->
  lists:sum(digits(N)).

% Base ^ Exponent
pow(Base, Exponent) -> pow(Base, Exponent, 1).
pow(_, 0, Value) -> Value;
pow(Base, Exponent, Value) -> pow(Base, Exponent - 1, Value * Base).
