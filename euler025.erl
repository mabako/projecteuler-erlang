-module(euler025).
-import(util, [pow/2]).
-export([fib/1]).

fib(N) -> fib(1, 1, 2, util:pow(10, N - 1)).
fib(Minus1, _Minus2, IndexToCalculate, N) when Minus1 > N -> {IndexToCalculate, Minus1};
fib(Minus1, Minus2, IndexToCalculate, N) -> fib(Minus1 + Minus2, Minus1, IndexToCalculate + 1, N).
