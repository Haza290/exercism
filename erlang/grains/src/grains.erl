-module(grains).

-export([square/1, total/0]).
-import(math, [pow/2]).


square(X) -> 
    if 
        X=<0 orelse X>64 -> 
            {error, "square must be between 1 and 64"};
        true ->
            trunc(pow(2,X-1))
    end.

total() -> (1-trunc(pow(2,64)))*-1.  % using trunc to format the result as an integer
