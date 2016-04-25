% Problem 1: Multiples of 3 and 5

% If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.

-module(euler001).
-export([sum_multiples/1]).

sum_multiples(Number) ->
  sum_multiples(Number - 1, 0).

sum_multiples(0, Sum) ->
  Sum;

sum_multiples(Current_number, Sum) when ((Current_number rem 3) == 0) or ((Current_number rem 5) == 0) ->
  sum_multiples(Current_number - 1, Sum + Current_number);

sum_multiples(Current_number, Sum) ->
  sum_multiples(Current_number - 1, Sum).
