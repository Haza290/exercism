-module(isogram).
-export([is_isogram/1]).
-import(string,[to_lower/1]).

is_isogram(Word) ->
	 is_isogram(string:to_lower(Word), []).
is_isogram([], _) ->
	true;
is_isogram([H|T], Letters) when is_in_alphabet(H) -> 
	is_isogram(T, Letters);
is_isogram([H|T], Letters) when occurs(H, Letters) ->
	is_isogram(T, [H|Letters]);
is_isogram(_, _) -> false.

occurs(_, []) ->
	false;
occurs(Character, [Character|_]) ->
	true;
occurs(Character, [_|T]) ->
	occurs(Character, T).

is_in_alphabet(Character) ->
	Alphabet = "abcdefghijklmnopqrstuvwxyz",
	is_in_alphabet(Letter, Alphabet).
is_in_alphabet(_, []) -> false;
is_in_alphabet(Character, [Character|T]) -> true;
is_in_alphabet(Character, [_|T]) -> is_in_alphabet(Character, T).