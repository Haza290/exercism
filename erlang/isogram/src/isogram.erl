-module(isogram).
-export([is_isogram/1]).
-import(string,[to_lower/1]).

is_isogram(Word) ->
	 is_isogram(string:to_lower(Word), []).
is_isogram([], _) ->
	true;
is_isogram([H|T], Letters) ->
	Alphabet_bool = is_in_alphabet(H),
	if
		Alphabet_bool ->
			Occurs_bool = occurs(H, Letters),
			if
				Occurs_bool ->
					false;
				true ->
					is_isogram(T, [H|Letters])
			end;
		true ->
			is_isogram(T, Letters)			
	end;
is_isogram(_, _) -> false.

occurs(_, []) ->
	false;
occurs(Letter, [Letter|_]) ->
	true;
occurs(Letter, [_|T]) ->
	occurs(Letter, T).

is_in_alphabet(Character) ->
	Alphabet = "abcdefghijklmnopqrstuvwxyz",
	is_in_alphabet(Character, Alphabet).
is_in_alphabet(_, []) -> false;
is_in_alphabet(Character, [Character|_]) -> true;
is_in_alphabet(Character, [_|T]) -> is_in_alphabet(Character, T).