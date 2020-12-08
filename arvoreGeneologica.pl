
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

irma(X,Y):-mae(Z,X),mae(Z,Y);pai(K,X),pai(K,Y),X\==Y,sexo(X,femenino).
irmao(X,Y):-mae(Z,Y),mae(Z,Y);pai(K,Y),pai(K,Y),X\==Y,sexo(X,masculino).

primo(X,Y):-progenitor(Z,X),progenitor(K,Y),irmao(Z,K),sexo(X,masculino).
tio(X,Y):-progenitor(Z,Y),irmao(Z,X),sexo(X,masculino).

sobrinha(X,Y):-progenitor(Z,X),irmao(Z,Y);irma(Z,Y),sexo(X,femenino).
sobrinho(X,Y):-progenitor(Z,X),irmao(Z,Y);irma(Z,Y),sexo(X,masculino).



