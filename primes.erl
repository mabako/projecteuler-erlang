-module(primes).
-export([is_prime/1, primes_up_to/1]).

is_prime(N) -> is_prime(N, 2).
is_prime(N, _) when N < 2 -> false;
is_prime(N, X) when X * X > N -> true;
is_prime(N, X) when (N rem X) == 0 -> false;
is_prime(N, X) -> is_prime(N, X + 1).

primes_up_to(N) ->
  primes_up_to(N, sets:from_list([2]), lists:seq(3, N, 2)).

primes_up_to(_, Primes, []) -> Primes;

% We only need to check up to sqrt(N) for removing numbers; once we've crossed this threshold all remaining numbers are
% prime.
primes_up_to(N, Primes, [X | Numbers]) when X * X > N ->
  primes_up_to(N, sets:add_element(X, Primes), Numbers);

% Below the threshold of sqrt(N), cross out further primes.
primes_up_to(N, Primes, [X | Numbers]) ->
  primes_up_to(N, sets:add_element(X, Primes), lists:filter(fun(Y) -> Y rem X /= 0 end, Numbers)).
