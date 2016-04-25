-module(euler002).
-author("mabako").

-export([fibonacci/1]).

fibonacci(UpperLimit) -> fibonacci_sum(0, UpperLimit, 1, 1).

% Check if we're exceeding the upper limit imposed
fibonacci_sum(Sum, UpperLimit, NumberMinus1, NumberMinus2) when NumberMinus1 + NumberMinus2 > UpperLimit -> Sum;

% Is the new term even?
fibonacci_sum(Sum, UpperLimit, NumberMinus1, NumberMinus2) when ((NumberMinus1 + NumberMinus2) rem 2) == 0 ->
  Value = NumberMinus1 + NumberMinus2,
  fibonacci_sum(Sum + Value, UpperLimit, Value, NumberMinus1);

fibonacci_sum(Sum, UpperLimit, NumberMinus1, NumberMinus2) ->
  fibonacci_sum(Sum, UpperLimit, NumberMinus1 + NumberMinus2, NumberMinus1).
