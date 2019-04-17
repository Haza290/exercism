-module(beer_song).

-export([verse/1, sing/1, sing/2]).

verse(0) ->
  "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n";
verse(1) ->
  "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n";
verse(2) ->
  "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n";
verse(N) ->
    integer_to_list(N) ++ " bottles of beer on the wall, " ++ integer_to_list(N) ++ " bottles of beer.\nTake one down and pass it around, " ++ integer_to_list(N-1) ++ " bottles of beer on the wall.\n".

sing(N) ->
  sing(N,0).

sing(From, To) ->
  sing(From, To, "").
sing(From, To, Song) when From == To-1->
  Song;
sing(From, To, Song) ->
  sing(From-1, To, Song++verse(From)++"\n").