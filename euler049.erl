-module(euler049).
-import(util, [permutations/1, digits_to_number/1, digits/1]).
-export([solve/0]).

solve() ->
  Primes = sets:filter(fun(X) -> X >= 1000 end, primes:primes_up_to(9999)),
  lists:filter(
    fun(X) -> is_list(X) end,
    lists:map(
      fun(Prime) ->
        permuted_primes(Prime, Primes)
      end,
      sets:to_list(Primes))).

permuted_primes(Prime, Primes) ->
  % Filter for any permutated primes larger than this number.
  Found = lists:filter(
    fun(Digits) ->
      (digits_to_number(Digits) > Prime) and sets:is_element(digits_to_number(Digits), Primes)
    end, permutations(digits(Prime))
  ),
  % Calculate the differences and see if we have any available primes.
  find_relevant_primes(Prime, lists:map(fun(Number) -> digits_to_number(Number) - Prime end, Found)).

% Find all primes that have both Prime + Diff and Prime + 2 * Diff as permutated values.
find_relevant_primes(_Prime, []) -> void;
find_relevant_primes(Prime, Diffs) ->
  calculate_primes(Prime, lists:filter(fun(E) -> lists:member(E * 2, Diffs) end, Diffs)).

% Since we know the actual difference between Prime, Prime + Diff and Prime + 2 * Diff, simply return those values.
calculate_primes(_Prime, []) -> void;
calculate_primes(Prime, [Length | _]) ->
  [Prime, Prime + Length, Prime + 2 * Length].
