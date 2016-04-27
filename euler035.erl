% A variation of Problem #10.
-module(euler035).
-export([circular_primes_up_to/1, rotate/2, circular/4]).

rotate(Prime, Exp) -> trunc((Prime div 10) + Exp * (Prime rem 10)).

circular(_Prime, _Primes, 0, _Exp) -> true;
circular(Prime, Primes, StepsLeft, Exp) ->
  sets:is_element(rotate(Prime, Exp), Primes) and circular(rotate(Prime, Exp), Primes, StepsLeft - 1, Exp).

circular_primes_up_to(N) ->
  Primes = primes_up_to(N, sets:from_list([2]), lists:seq(3, N, 2)),
  Set = sets:filter(fun(X) -> circular(X, Primes, trunc(math:log10(X)), math:pow(10, trunc(math:log10(X)))) end, Primes),
  sets:to_list(Set).

primes_up_to(_, Primes, []) -> Primes;

% We only need to check up to sqrt(N) for removing numbers; once we've crossed this threshold all remaining numbers are
% prime.
primes_up_to(N, Primes, [X | Numbers]) when X * X > N ->
  primes_up_to(N, sets:add_element(X, Primes), Numbers);

% Below the threshold of sqrt(N), cross out further primes.
primes_up_to(N, Primes, [X | Numbers]) ->
  primes_up_to(N, sets:add_element(X, Primes), lists:filter(fun(Y) -> Y rem X /= 0 end, Numbers)).
