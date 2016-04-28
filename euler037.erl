-module(euler037).
-export([solve/0, trunc_left/1, trunc_right/1, truncatable_prime/1]).

trunc_right([]) -> true;
trunc_right([Head | Tail]) -> primes:is_prime(util:digits_to_number([Head | Tail])) and trunc_right(Tail).

trunc_left([]) -> true;
trunc_left([Head | Tail]) -> primes:is_prime(util:digits_to_number(lists:reverse([Head | Tail]))) and trunc_left(Tail).

truncatable_prime(N) ->
  Digits = util:digits(N),
  trunc_right(Digits) and trunc_left(lists:reverse(Digits)).

find_truncatable_primes(Limit) ->
  X = sets:to_list(sets:filter(fun(Prime) -> (Prime > 10) and truncatable_prime(Prime) end, primes:primes_up_to(Limit))),
  {X, length(X), lists:sum(X)}.

solve() ->
  find_truncatable_primes(1000000).
