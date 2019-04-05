-module(leap).
-export([leap_year/1]).


leap_year(Year) -> 
    if
        0 == Year rem 400 ->
            true;
        0 == Year rem 100 ->
            false;
        0 == Year rem 4 ->
            true;
        true ->
            false
    end.