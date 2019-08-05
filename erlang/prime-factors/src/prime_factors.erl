-module(prime_factors).

-export([factors/1,next_prime/1]).


factors(X) when X <= 1-> undefined;
factors(X) ->
    factors(X, 2, []).
factors(X, X, PrimeFactors) ->
    [X|PrimeFactors];
factors(X, PrimeNumber, PrimeFactors) when X rem PrimeNumber == 0 ->
    factors(X/PrimeNumber, PrimeNumber, [PrimeNumber|PrimeFactors]);
factors(X, PrimeNumber, PrimeFactors) ->
    factors(X, next_prime(PrimeNumber), PrimeFactors).

next_prime(X) ->
    next_prime(X, 2).
next_prime(X, Y) when X / 2 < Y ->
    X;
next_prime(X, Y) when X rem Y == 0 ->
    next_prime(X+1);
next_prime(X, Y) ->
    next_prime(X, Y+1).

