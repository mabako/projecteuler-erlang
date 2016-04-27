-module(euler022).
-author("mabako").
-export([solve/1]).

read_file_into_lists(Filename) ->
  {ok, Data} = file:read_file(Filename),

  % Remove all quotation marks, and split by commas.
  BinaryList = binary:split(binary:replace(Data, <<"\"">>, <<"">>, [global]), [<<",">>], [global]),

  % Convert the list of binary data to list of strings.
  lists:map(fun(X) -> binary_to_list(X) end, BinaryList).

solve(Filename) ->
  Names = read_file_into_lists(Filename),
  SortedNames = lists:sort(Names),
  [{NameValues, _}] = [lists:mapfoldl(fun(Name, Position) ->
    {name_value(Name) * Position, Position + 1} end, 1, SortedNames)],
  lists:sum(NameValues).

name_value([]) -> 0;
name_value([Head | Tail]) ->
  (Head - 64) + name_value(Tail).
