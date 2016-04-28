-module(util).
-export([digits/1, digits_to_number/1, sum_of_digits/1, pow/2, fac/1, permutations/1]).

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

% n!
fac(0) -> 1;
fac(1) -> 1;
fac(N) -> N * fac(N-1).

% All Permutations of a given input
permutations([]) -> [[]];
permutations(L)  -> [[H|T] || H <- L, T <- permutations(L--[H])].
