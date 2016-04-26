% Find the n-th Prime
-module(euler007).
-export([nth_prime/1]).

nth_prime(N) ->
  nth_prime(N, 11, [2, 3, 5, 7]).

nth_prime(N, _CheckNumber, FoundPrimes) when length(FoundPrimes) == N ->
  [Prime|_Tail] = FoundPrimes,
  Prime;
nth_prime(N, CheckNumber, FoundPrimes) ->
  case prime(CheckNumber, FoundPrimes) of
    true -> nth_prime(N, CheckNumber + 2, [CheckNumber | FoundPrimes]);
    false -> nth_prime(N, CheckNumber + 2, FoundPrimes)
  end.

prime(Number, FoundPrimes) ->
  lists:all(fun(X) -> Number rem X /= 0 end, lists:filter(fun(X) -> X * X =< Number end, FoundPrimes)).

