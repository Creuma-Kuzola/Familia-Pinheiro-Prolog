
/******* Factos ********/
/******* Progenitores ****/

progenitor(jose,joao).
progenitor(jose,ana).
progenitor(maria,joao).
progenitor(maria,ana).
progenitor(joao,mario).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(helena,carlos).
progenitor(mario,carlos).

/* Sexo */

sexo(ana,femenino).
sexo(maria,femenino).
sexo(helena,femenino).
sexo(joana,femenino).

sexo(jose,masculino).
sexo(joao,masculino).
sexo(mario,masculino).
sexo(carlos,masculino).

/* Regras */

mae(X,Y):-progenitor(X,Y),sexo(X,femenino).
pai(X,Y):-progenitor(X,Y),sexo(X,masculino).

filho(X,Y):-progenitor(Y,X),sexo(X,masculino).
filha(X,Y):-progenitor(Y,X),sexo(X,femenino).

irma(X, Y) :- progenitor(Z, X), progenitor(Z, Y), sexo(X, femenino), X \== Y.
irmao(X,Y):-progenitor(Z,X),progenitor(Z,Y), sexo(X,masculino), X \== Y.

primo(X,Y):-progenitor(Z,X),progenitor(K,Y),irmao(Z,K),sexo(X,masculino), X\==Y.
tio(X,Y):-progenitor(Z,Y),irmao(X,Z),sexo(X,masculino).
tia(X,Y):-progenitor(Z,Y),irma(X,Z),sexo(X,femenino).

sobrinha(X,Y):-progenitor(Z,X),irmao(Z,Y);irma(Z,Y),sexo(X,femenino).
sobrinho(X,Y):-progenitor(Z,X),irmao(Z,Y);irma(Z,Y),sexo(X,masculino).

/*
avô(X,Y):-pai(Z,Y);mae(Z,Y),pai(X,Z);mae(X,Z).
avó(X,Y):-mae(Z,Y);pai(Z,Y),mae(X,Z);pai(X,Z).*/

avô(X,Y):-progenitor(Z,Y),progenitor(X,Z),sexo(X,masculino).
avó(X,Y):-progenitor(Z,Y),progenitor(X,Z),sexo(X,femenino).

descendente(X,Y):-progenitor(Y,X).
descendente(X,Y):-progenitor(Z,X),progenitor(Z,Y).

