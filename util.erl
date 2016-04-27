-module(util).
-export([digits/1, sum_of_digits/1]).


% Splits an integer into a list containing all digits of the integer.
digits(N) when is_integer(N) ->
  lists:map(fun(X) -> list_to_integer([X]) end, integer_to_list(N)).

% Calculates the sum of all digits of an integer.
sum_of_digits(N) when is_integer(N) ->
  lists:sum(digits(N)).
