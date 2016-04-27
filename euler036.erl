-module(euler036).
-export([palindrome/1, solve/1]).

palindrome(N) ->
  (integer_to_list(N, 2) == lists:reverse(integer_to_list(N, 2))) and (integer_to_list(N, 10) == lists:reverse(integer_to_list(N, 10))).

solve(N) ->
  % We can skip all even numbers, since their binary representation always ends with a zero, which would not be a valid palindrome.
  lists:sum(lists:filter(fun(X) -> palindrome(X) end, lists:seq(1, N - 1, 2))).
