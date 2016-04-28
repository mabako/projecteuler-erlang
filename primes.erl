-module(primes).
-export([is_prime/1]).

is_prime(N) -> is_prime(N, 2).
is_prime(N, _) when N < 2 -> false;
is_prime(N, X) when X * X > N -> true;
is_prime(N, X) when (N rem X) == 0 -> false;
is_prime(N, X) -> is_prime(N, X + 1).

