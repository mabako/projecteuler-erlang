% A variation of Problem #10.
-module(euler035).
-export([circular_primes_up_to/1, rotate/2, circular/4]).

rotate(Prime, Exp) -> trunc((Prime div 10) + Exp * (Prime rem 10)).

circular(_Prime, _Primes, 0, _Exp) -> true;
circular(Prime, Primes, StepsLeft, Exp) ->
  sets:is_element(rotate(Prime, Exp), Primes) and circular(rotate(Prime, Exp), Primes, StepsLeft - 1, Exp).

circular_primes_up_to(N) ->
  Primes = primes:primes_up_to(N),
  Set = sets:filter(fun(X) ->
    circular(X, Primes, trunc(math:log10(X)), math:pow(10, trunc(math:log10(X)))) end, Primes),
  sets:to_list(Set).
