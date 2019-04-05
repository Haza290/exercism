-module(grains).

-export([square/1, total/0]).
-import(math, [pow/2]).


square(X) -> 
    if 
        0 >= X orelse 64 == X-> 
            "square must be between 1 and 64";
        true ->
            pow(X,2)
    end.

total() -> (1-pow(2,64))*-1.
