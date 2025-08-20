pelicula(viernes13, thriller).
pelicula(lalaland, musical).
pelicula(volverAlFuturo, cienciaFiccion).
pelicula(orgulloYPrejuicio, drama).
pelicula(dune, cienciaFiccion).
pelicula(starWars3, accion).
pelicula(terminator, accion).

trabajaEn(starWars3, natailePortman).
trabajaEn(starWars3, ewanMcGregor).
trabajaEn(terminator, arnoldSchwarzenegger).
trabajaEn(lalaland, emmaStone).
trabajaEn(lalaland, ryanGosling).
trabajaEn(orgulloYPrejuicio, keiraKnightleg).
trabajaEn(volverAlFuturo, michaelFox).
trabajaEn(volverAlFuturo, christopherLloyd).
trabajaEn(dune, timothyChamame).
trabajaEn(viernes13, kevinBacon).

premio(mejorActriz, natailePortman).
premio(mejorActriz, emmaStone).


critica1(Pelicula, Estrellas) :-
    pelicula(Pelicula, _),
    %findall(trabajaEn, trabajaEn(Pelicula, trabajaEn), trabajaEnes) NO LO NECESITAMOS
    findall(Puntaje, (trabajaEn(Pelicula, trabajaEn), puntajetrabajaEnes(trabajaEn, Puntaje)), Puntajes),
    sum_list(Puntajes, Estrellas).

puntajetrabajaEnes(trabajaEn, 5) :-
    premio(mejorActriz, trabajaEn).

puntajetrabajaEnes(ryanGosling, 5).

puntajetrabajaEnes(trabajaEn, 1) :-
    premio(_, trabajaEn).

%cambiamos la base de conocimiento 
trabajaEn(starWars3, natailePortman).
trabajaEn(starWars3, ewanMcGregor).
trabajaEn(terminator, arnoldSchwarzenegger).
trabajaEn(lalaland, emmaStone).
trabajaEn(lalaland, ryanGosling).
trabajaEn(orgulloYPrejuicio, keiraKnightleg).
trabajaEn(volverAlFuturo, michaelFox).
trabajaEn(volverAlFuturo, christopherLloyd).
trabajaEn(dune, timothyChamame).
trabajaEn(viernes13, kevinBacon).

director(georgeLucas, starWars3).

compositor(johaWilliams, starWars3, [marchaImperial]).

productor(stevenSpielberg, starWars3, 1000000).

guionista(feli, dune, 30000).

%con esto en mente tambien debemos de cambiar la manera en la que se suman estrella por la critica
critica2(Pelicula, trabajaEn) :-
    pelicula(Pelicula, _),
    puntajetrabajaEnes(Pelicula, PuntajetrabajaEnes),
    puntajeDirectores(Pelicula, PuntajeDirectores),
    puntajeCompositores(Pelicula, PuntajeCompositores),
    puntajeGuionista(Pelicula, PuntajeGuionista),
    puntajeProductores(Pelicula, PuntajeProductores),
    Estrellas is PuntajetrabajaEnes + PuntajeCompositores + PuntajeDirectores + PuntajeGuionista + PuntajeProductores.

puntajetrabajaEnes(trabajaEn, 5) :-
    premio(mejorActriz, trabajaEn).

puntajetrabajaEnes(ryanGosling, 5).

puntajetrabajaEnes(trabajaEn, 1) :-
    premio(_, trabajaEn).

puntajeDirectores(Pelicula, Puntaje) :-
    findall(UnPuntaje, puntajeUnSoloDirector(Pelicula, UnPuntaje), Puntajes),
    sum_list(Puntajes, Puntaje).

%queda definir puntajeUnSoloDirector 

puntajeCompositores(Pelicula, Puntaje) :-
    findall(UnPuntaje, puntajeUnSoloCompositor(Pelicula, UnPuntaje), Puntajes),
    sum_list(Puntajes, Puntaje).

puntajeGuionista(Pelicula, Puntaje) :-
    findall(UnPuntaje, puntajeUnSoloGuionista(Pelicula, UnPuntaje), Puntajes),
    sum_list(Puntajes, Puntaje).

puntajeProductores(Pelicula, Puntaje) :-
    findall(UnPuntaje, puntajeUnSoloProductor(Pelicula, UnPuntaje), Puntajes),
    sum_list(Puntajes, Puntaje).

puntajeUnSoloDirector(Pelicula, 10) :-
    director(Director, Pelicula),
    premio(mejorDirector, Director).

puntajeUnSoloProductor(Pelicula, 10) :-
    productor(stevenSpielberg, Pelicula, _).

puntajeProductores(Pelicula, Puntaje) :-
    productor(_, Pelicula, Presupuesto),
    Puntaje is Presupuesto * -0.01.

%esta solucion si bien funciona no nos sirve ya que las misma repite mucha logica por lo cual no es escalable, lo que vamos a conocer ahora son los Functores que nos ayudara a no repetir logica y ayudarnoe en la escalabilidad

%vamos a volver a cambiar la base de datos
%Lo que hicimos fue agregar un functor al final de todo para mantener un mismo predicado "trabajaEn" y el functor cumple la funcion de decirnos en que trabaja y si cumple con alguna caracteristica
trabajaEn(starWars3, natailePortman, actriz).
trabajaEn(starWars3, ewanMcGregor, actriz).
trabajaEn(terminator, arnoldSchwarzenegger, actriz).
trabajaEn(lalaland, emmaStone, actriz).
trabajaEn(lalaland, ryanGosling, actriz).
trabajaEn(orgulloYPrejuicio, keiraKnightleg, actriz).
trabajaEn(volverAlFuturo, michaelFox, actriz).
trabajaEn(volverAlFuturo, christopherLloyd, actriz).
trabajaEn(dune, timothyChamame, actriz).
trabajaEn(viernes13, kevinBacon, actriz).
trabajaEn(starWars3, georgeLucas, director).
trabajaEn(starWars3, johndWilliams, compositor([marchaImperial], berkeleg)).
trabajaEn(starWars3, stevenSpielberg, productor(1000000)).
trabajaEn(dune, feli, guionista(30000)).

critica(Pelicula, Estrellas) :-
    pelicula(Pelicula, _),
    findall(Puntaje, puntaje(Pelicula, Puntaje), Puntajes),
    sum_list(Puntajes, Estrellas).

puntaje(Pelicula, Puntaje) :-
    trabajaEn(Pelicula, Trabajador, Rol),
    puntajeRol(Trabajador, Rol, Puntaje).

puntajeRol(stevenSpielberg, productor(_), 10).
puntajeRol(_, productor(Presupuesto), Puntaje) :-
    Puntaje is Presupuesto * -0,01.

puntajeRol(Director, director, 2) :-
    premio(mejorDirector, Director).

puntajeRol(_, compositor(Piezas,_), Puntaje) :-
    length(Piezas, CantPiezas),
    Puntaje is CantPiezas * 0,25.

puntajeRol(_, guionista(CantidadPabaras), Puntaje) :-
    Puntaje is CantidadPabaras / 1000.

puntajeRol(ryanGosling, actriz, 5).
puntajeRol(Actor, actriz, 5) :-
    premio(mejorActriz, Actor).
puntajeRol(Actor, actriz, 1) :-
    not(premio(mejorActriz, Actor)),
    premio(_, Actor).
