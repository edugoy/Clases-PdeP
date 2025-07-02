% modelados de la consigna 
padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).

% funciones pedidas
tieneHijos(Hijo) :-
    padreDe(Hijo, _).

tieneHijos(Hijo) :- 
    madreDe(Hijo, _).

hermanos(Hijo1, Hijo2) :- 
    mismoPadre(Hijo1, Hijo2),
    mismaMadre(Hijo1, Hijo2).

mismaMadre(Hijo1, Hijo2) :-
    madreDe(Madre, Hijo1),
    madreDe(Madre, Hijo2).

mismoPadre(Hijo1, Hijo2) :- 
    padreDe(Padre, Hijo1),
    padreDe(Padre, Hijo2).

medioHermano(Hijo1, Hijo2) :-
    mismoPadre(Hijo1, Hijo2),
    not(mismaMadre(Hijo1, Hijo2)).

medioHermano(Hijo1, Hijo2) :- 
    mismaMadre(Hijo1, Hijo2),
    not(mismoPadre(Hijo1, Hijo2)).

tipoDe(Tio, Sobrino) :- 
    padreDe(Padre, Sobrino),
    hermanos(Padre, Tio).

tipoDe(Tio, Sobrino) :-
    madreDe(Madre, Sobrino),
    hermanos(Madre, Tio).

abueloMultiple(Abuelo) :-
    esAbuelo(Abuelo, Nieto1),
    esAbuelo(Abuelo, Nieto2),
    Nieto1 \= Nieto2.

abueloMultiple(Abuela) :-
    esAbuela(Abuela, Nieto1),
    esAbuela(Abuela, Nieto2),
    Nieto1 \= Nieto2.

esAbuelo(Abuelo, UnNieto) :-
    padreDe(Abuelo, Papa),
    padreDe(Papa, UnNieto).

esAbuela(Abuelo, UnNieto) :-
    madreDe(Abuelo, Papa),
    madreDe(Papa, UnNieto).

descendiente(Personaje, Descendiente) :-
    padreDe(Personaje, Descendiente).

descendiente(Personaje, Descendiente) :-
    padreDe(Personaje, PersonajeMedio),
    descendiente(PersonajeMedio, Descendiente).
