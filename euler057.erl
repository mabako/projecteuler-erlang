-module(euler057).
-export([solve/1, num_of_digits/1]).

num_of_digits(N) -> length(integer_to_list(N)).
value(Numerator, Denominator) ->
  case num_of_digits(Numerator) > num_of_digits(Denominator) of
    true -> 1;
    false -> 0
  end.

step(0, _, _, Count) -> Count;
step(N, {NumeratorMinus1, NumeratorMinus2}, {DenominatorMinus1, DenominatorMinus2}, Count) ->
  NewNumerator = 2 * NumeratorMinus1 + NumeratorMinus2,
  NewDenominator = 2 * DenominatorMinus1 + DenominatorMinus2,
  step(N - 1, {NewNumerator, NumeratorMinus1}, {NewDenominator, DenominatorMinus1}, Count + value(NewNumerator, NewDenominator)).



solve(N) -> step(N, {1, 1}, {1, 0}, 0).
