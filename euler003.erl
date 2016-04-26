% Largest prime factor
%
% The prime factors of 13195 are 5, 7, 13 and 29.
% What is the largest prime factor of the number 600851475143 ?

-module(euler003).
-export([prime_factors_of/1]).

prime_factors_of(N) -> prime_factors_of(N, 2, []).

prime_factors_of(1, _Factor, Found) -> Found;

prime_factors_of(Number, Factor, Found) when ((Number rem Factor) == 0) ->
  prime_factors_of(Number div Factor, Factor, [Factor|Found]);

prime_factors_of(Number, Factor, Found) ->
  prime_factors_of(Number, Factor + 1, Found).
