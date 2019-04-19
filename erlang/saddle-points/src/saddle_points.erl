-module(saddle_points).

-export([saddle_points/1]).

saddle_points(Matrix) ->
	undefined.

% Returns a list of indexs of the largest value
get_largest_indexs([H|T]) ->
	get_largest_indexs(T, H, 0, 1).
get_largest_indexs([],_,LargestIndexs,_) ->
	LargestIndexs;
get_largest_indexs([H|T], LargestValue, LargestIndexs, CurrentIndex) when LargestValue > H ->
	get_largest_indexs(T, LargestValue, LargestIndexs, CurrentIndex+1);
get_largest_indexs([H|T], LargestValue, LargestIndexs, CurrentIndex) when LargestValue == H ->
	get_largest_indexs(T, LargestValue, [CurrentIndex|LargestIndexs], CurrentIndex+1);
get_largest_indexs([H|T], LargestValue, _, CurrentIndex) when LargestValue < H ->
	get_largest_indexs(T, H, CurrentIndex, CurrentIndex+1).

% Returns a list of indexs of the smallest value
get_smallest_indexs([H|T]) ->
	get_smallest_indexs(T, H, 0, 1).
get_smallest_indexs([],_,SmallestIndexs,_) ->
		SmallestIndexs;
get_smallest_indexs([H|T], SmallestValue, SmallestIndexs, CurrentIndex) when SmallestValue < H ->
	get_smallest_indexs(T, SmallestValue, SmallestIndexs, CurrentIndex+1);
get_smallest_indexs([H|T], SmallestValue, SmallestIndexs, CurrentIndex) when SmallestValue == H ->
	get_smallest_indexs(T, SmallestValue, [CurrentIndex|SmallestIndexs], CurrentIndex+1);
get_smallest_indexs([H|T], SmallestValue, _, CurrentIndex) when SmallestValue > H ->
	get_smallest_indexs(T, H, CurrentIndex, CurrentIndex+1).

% Returns a list of all the columns
get_all_columns(Matrix) ->
	get_all_columns(Matrix, 0, get_size(Matrix), []).
get_all_columns(_, N, N, Columns) ->
	Columns;
get_all_columns(Matrix, ColumnCount, MatrixSize, Stack) ->
	get_all_columns(Matrix, ColumnCount+1, MatrixSize, [get_column(Matrix, ColumnCount)|Stack]).

% Returns a single column from a matrix
get_column(Matrix, ColumnNumber) ->
	get_column(Matrix, ColumnNumber, Column).
get_column([], _, Column) ->
	Column;
get_column([H|T], ColumnNumber, Column) ->
	get_column(T, ColumnNumber, [get_from_list(H,ColumnNumber)|Column]).

% Returns the Nth element from a list
get_from_list([H|_], 0) -> H;
get_from_list([_|T], N) ->
	get_from_list(T,N-1).

% Returns size of a list
get_size(List) ->
	get_size(List, 0).
get_size([], Count) ->
	Count;
get_size([_|T], Count) ->
	get_size(T, Count+1).