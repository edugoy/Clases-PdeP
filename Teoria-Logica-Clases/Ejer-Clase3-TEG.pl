paisContinente(americaDelSur, argentina).
paisContinente(americaDelSur, bolivia).
paisContinente(americaDelSur, brasil).
paisContinente(americaDelSur, chile).
paisContinente(americaDelSur, ecuador).
paisContinente(europa, alemania).
paisContinente(europa, espania).
paisContinente(europa, francia).
paisContinente(europa, inglaterra).
paisContinente(asia, aral).
paisContinente(asia, china).
paisContinente(asia, india).
paisContinente(asia, afganistan).
paisContinente(asia, nepal).

paisImportante(argentina).
paisImportante(alemania).

limitrofes(argentina, brasil).
limitrofes(bolivia, brasil).
limitrofes(bolivia, argentina).
limitrofes(argentina, chile).
limitrofes(espania, francia).
limitrofes(alemania, francia).
limitrofes(nepal, india).
limitrofes(china, india).
limitrofes(nepal, china).
limitrofes(afganistan, china).

ocupa(argentina, azul).
ocupa(bolivia, rojo).
ocupa(brasil, verde).
ocupa(chile, negro).
ocupa(ecuador, rojo).
ocupa(alemania, azul).
ocupa(espania, azul).
ocupa(francia, azul).
ocupa(inglaterra, azul).
ocupa(aral, verde).
ocupa(china, negro).
ocupa(india, verde).
ocupa(afganistan, verde).

continente(americaDelSur).
continente(europa).
continente(asia).

%1. estaEnContinente/2: relaciona un jugador y un continente si el jugador ocupa al menos un país en el continente.

estaEnContinente(Jugador, Continente) :-
    continente(Continente),
    paisContinente(Continente, Pais),
    ocupa(Pais, Jugador).

%2. ocupaContinente/2: relaciona un jugador y un continente si el jugador ocupa totalmente el continente.

ocupaContinente(Jugador, Continente) :-
    continente(Continente), jugador(Jugador),
    forall(paisContinente(Continente, Pais), ocupa(Pais, Jugador)).

%3. cubaLibre/1: es verdadero para un país si nadie lo ocupa.
cubaLibre(Pais) :-
    paisContinente(_, Pais),
    not(ocupa(Pais, _)).

%4. leFaltaMucho/2: relaciona a un jugador si está en un continente pero le falta ocupar otros 2 países o más.
leFaltaMucho(Jugador, Continente) :-
    estaEnContinente(Jugador, Continente),
    paisContinente(Continente, Pais1),
    not(ocupa(Pais1, Jugador)),
    paisContinente(Continente, Pais2),
    not(ocupa(Pais2, Jugador)),
    Pais1 \= Pais2. 