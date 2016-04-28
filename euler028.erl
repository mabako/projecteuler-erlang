% 43 44 45 46 47 48 49
% 42 21 22 23 24 25 26
% 41 20  7  8  9 10 27
% 40 19  6  1  2 11 28
% 39 18  5  4  3 12 29
% 38 17 16 15 14 13 30
% 37 36 35 34 33 32 31

-module(euler028).
-export([solve/1]).

lower_left(N) -> 4 * (N - 1) * (N - 1) + 1.
upper_right(N) -> (2 * N - 1) * (2 * N - 1).
upper_left(N) -> 4 * N * N - 6 * N + 3.
lower_right(N) -> 4 * N * N - 10 * N + 7.

sum_for(1) -> 1;
sum_for(N) -> lower_left(N) + upper_right(N) + upper_left(N) + lower_right(N) + sum_for(N - 1).

solve(GridSize) -> sum_for(GridSize div 2 + 1).
