-module(euler027).
-export([prime/1, number_of_primes/1, number_of_primes_for/2]).

prime(N) -> prime(N, 2).
prime(N, _) when N < 2 -> false;
prime(N, X) when X * X > N -> true;
prime(N, X) when (N rem X) == 0 -> false;
prime(N, X) -> prime(N, X + 1).

max([Head | Tail]) when length(Tail) == 0 -> Head;
max([{A, B, Primes} | Tail]) ->
  {A2, B2, Primes2} = max(Tail),
  case Primes > Primes2 of
    true -> {A, B, Primes};
    false -> {A2, B2, Primes2}
  end.

number_of_primes(X) ->
  {A, B, NumberOfPrimes} = max(lists:map(
    fun(A) ->
      max(lists:map(fun(B) -> {A, B, number_of_primes_for(A, B)} end, lists:seq(-X, X)))
    end, lists:seq(-X + 1, X - 1))),
  io:format('~w (~w, ~w) results in ~w primes.~n', [A * B, A, B, NumberOfPrimes]).

number_of_primes_for(A, B) ->
  number_of_primes_for(A, B, 0).
number_of_primes_for(A, B, N) ->
  case prime(N * N + A * N + B) of
    true -> number_of_primes_for(A, B, N + 1) + 1;
    false -> 0
  end.
