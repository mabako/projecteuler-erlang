-module(euler092).
-import(util, [digits/1]).
-export([next/1, ends/1, solve/1]).

next(N) -> lists:foldl(fun(X, Y) -> Y + X * X end, 0, digits(N)).
ends(N) ->
  case erlang:get({'euler92', N}) of
    X when is_integer(X) -> X;
    'undefined' ->
      case N of
        1 ->
          erlang:put({'euler92', N}, 1),
          1;
        89 ->
          erlang:put({'euler92', N}, 89),
          89;
        _else -> ends(next(N))
      end
  end.

solve(1) -> 0;
solve(N) ->
  case ends(N) of
    1 -> solve(N - 1);
    89 -> 1 + solve(N - 1)
  end.
