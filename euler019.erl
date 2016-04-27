-module(euler019).
-export([solve/0]).

solve() ->
  lists:sum(lists:map(fun(Year) -> solve(Year) end, lists:seq(1901, 2000))).

solve(Year) ->
  lists:sum(lists:map(fun(Month) ->
    case calendar:day_of_the_week(Year, Month, 1) of 7 -> 1; _else -> 0 end end, lists:seq(1, 12))).
