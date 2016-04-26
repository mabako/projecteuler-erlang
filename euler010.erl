% After having used prime numbers for a while - namely, in problem #3 (prime factorization) and #7 (10001th prime),
% let's finally generate a few primes using a variation on the sieve of Eratosthenes.
-module(euler010).
-export([sum_of_primes_up_to/1]).

sum_of_primes_up_to(N) ->
  sum_of_primes_up_to(N, 2, lists:seq(3, N, 2)).

sum_of_primes_up_to(_, Sum, []) -> Sum;

% We only need to check up to sqrt(N) for removing numbers; once we've crossed this threshold all remaining numbers are
% prime.
sum_of_primes_up_to(N, Sum, [X | Numbers]) when X * X > N ->
  sum_of_primes_up_to(N, X + Sum, Numbers);

% Below the threshold of sqrt(N), cross out further primes.
sum_of_primes_up_to(N, Sum, [X | Numbers]) ->
  sum_of_primes_up_to(N, X + Sum, lists:filter(fun(Y) -> Y rem X /= 0 end, Numbers)).

