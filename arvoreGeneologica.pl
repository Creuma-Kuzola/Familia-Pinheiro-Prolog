
/* Progenitores */

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
irma(X,Y):-mae(Z,X),mae(Z,Y);pai(K,X),pai(K,Y),X\==Y,sexo(X,femenino).
irmao(X,Y):-mae(Z,Y),mae(Z,Y);pai(K,Y),pai(K,Y),X\==Y,sexo(X,masculino).



