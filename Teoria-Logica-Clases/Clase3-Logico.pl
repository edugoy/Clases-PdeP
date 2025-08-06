%Base de datos
% pelicula(Titulo, Genero).
% trabajaEn(Titulo, Actor).
% premio(Premio, Actor).

pelicula(starWars3, accion).
trabaja(starWars3, nataliePortman).
trabajaEn(starWars3, ewanMcGregor).
premio(oscar, nataliePortman).

% imperdible/1 -> no hay actor que no haya ganado un premio
%imperdible(Pelicula) :-
%    not(trabajaEn(Pelicula, Actor)),
%    not(premio(_, Actor)).
% Estas lineas previas de un intento de predicado no serviria, ya que en caso de poner alguna pelicula o dato que no sea una pelicula toma invierte el valor de verdad falso (ya que no esta en la base de dato) y lo convierte en verdadero 

% La manera correcta seria asi:
imperdible(Pelicula) :-
    pelicula(Pelicula, _),
    not(trabajaEn((Pelicula, Actor), not(premio(_, Actor)))).

% vamos a meojorarlo un poco mas, delegando

imperdible2(pelicula) :-
    pelicula(Pelicula, _),
    not(actorSinPremio(Pelicula, Actor)).

actorSinPremio(Pelicula, Actor) :-
    trabajaEn(Pelicula, Actor),
    not(premio(_, Actor)).

% Tercer version de imperdible

imperdible3(Pelicula) :-
    pelicula(Pelicula, _),
    forall(trabajaEn(Pelicula, Actor), premio(_, Actor)).

% actorDramatico/1 es dramatico cuando todas las peliculas en las que participo son de drama

actorDramatico(Actor) :-
    trabajaEn(_, Actor), %en este caso esta linea seria redundante, puede estar o no
    forall(trabajaEn(Pelicula, Actor), pelicula(Pelicula, drama)).

% nuevo predicado: critica(Pelicula, Estrellas)
critica(Pelicula, Estrellas).
%unanime/1 es unanime si todas las criticas fueron la misma

unanime(Pelicula) :-
    pelicula(Pelicula, _),
    critica(Pelicula, Critica1),
    forall(critica(Pelicula, Critica2), sonLaMisma(Critica1, Critica2)).

sonLaMisma(Critica, Critica).

% criticaMasAlta/2 nos dice la critica mas alta de una pelicula

criticaMasAlta(Pelicula, CriticaMayor) :-
    pelicula(Pelicula, _),
    critica(Pelicula, CriticaMayor),
    forall(critica(Pelicula, CriticaMenor), CriticaMenor =< CriticaMayor).