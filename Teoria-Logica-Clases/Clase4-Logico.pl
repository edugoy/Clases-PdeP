%1- De los musicales conocemos que canciones las conforman
%2- De los thrillers conocemos los asesinatos que ocurren (el asesino y la victima)
%3- De las peliculas de ciencia ficcion concemos el año en el que se situan
%4- De los dramas se sabe los segmentos "dramaticos" que la componen. Puede ser "peleas", "casorios", "asesinatos", "engaños", "funerales" o "medio hermanos"
%5- De las peliculas de comedia y drama no importa nada mas (es bait, no sirve de nada)

%Base de datos
% pelicula(Pelicula, Genero).
% trabajaEn(Pelicula, Actor/Actriz).
% premio(Premio, Actor/Actriz).
% cancion(Pelicula, cancion).
% asesinato(Pelicula, Asesino, Victima).
% anio(Pelicula, año).
% segmento(Pelicula, Segmento).
% culebron(Pelicula).
% futurista(Pelicula).
% puroSuspenso(Pelicula).

%1)
pelicula(lalaland, musical).
cancion(lalaland, cityOfStars).

%2)
pelicula(viernes13, thriller).
asesinato(viernes13, jason, fede).
asesinato(viernes13, gripe, lucas).
asesinato(viernes13, jason, rama).

%3)
pelicula(avatar, cienciaFiccion).
anio(avatar, 2154).

%4)
pelicula(orgulloYPrejucio, drama).
segmento(orgulloYPrejucio, casorio).

%6- Saber si una peli de drama es un culebrón mexicano. Esto sucede cuando tiene una pelea, un casorio, un engaño y medio hermanos.
%7- Saber si una peli de ciencia ficción es futurista, o sea que la peli ocurre en el año 3000 o más.
%8- Saber si un thriller es de puro suspenso, o sea que no muere nadie.
%9- Saber si un thriller es de un asesino serial. Esto se cumple si solo hay un asesino

%6)
culebron(Pelicula) :-
    pelicula(Pelicula, drama),
    segmento(Pelicula, pelea),
    segmento(Pelicula, casorio),
    segmento(Pelicula, enganio),
    segmento(Pelicula, medioHermano).

%7)
futurista(Pelicula) :-
    pelicula(Pelicula, cienciaFiccion),
    anio(Pelicula, Anio),
    Anio >= 3000.

%8)
puroSuspenso(Pelicula) :-
    pelicula(Pelicula, thriller),
    not(asesinato(Pelicula, _, _)).

%9)
asesinoSerial(Pelicula) :-
    pelicula(Pelicula, thriller),
    asesinato(Pelicula, Asesino, _),
    forall(asesinato(Pelicula, OtroAsesino, _), esElMismo(Asesino, OtroAsesino)).

esElMismo(Asesino, Asesino).

%otra manera de resolverlo
asesinoSerialBis(Pelicula) :-
    pelicula(Pelicula, thriller),
    asesinato(Pelicula, Asesino, _),
    not(hayOtro(Pelicula, Asesino)).

hayOtro(Pelicula, Asesino) :-
    asesinato(Pelicula, OtroAsesino, _),
    not(esElMismo(Asesino, OtroAsesino)).

%10- un thriller es un slasher si hay 5 o mas asesinatos en la pelicula
slasher(Pelicula) :-
    pelicula(Pelicula, thriller),
    cantidadAsesinatos(Pelicula, Cantidad),
    Cantidad >= 5.

%Para poder realizar esta funcion se tiene que asociar un valor a la cantidad, este valor viene de la mano de la cantidad de respuestas que da al momento de consultar las victimas de la pelicula
%Nos vamos a apoyar en listas y predicados:
% member/2 -> esto indica los elementos que conforman la lista, de la sig manera: member(Miembro, [5,7,2]), Miembro = 5; Miembro = 7; Miembro = 2
% lenght/2 -> esto indica el largo de una lista, es decir, la cantidad de elemento que conforma dicha lista, de la sig manera: length([1,2], Longitud), Longitud = 2
% sumlist/2 -> esto indica la suma de los valores que componen a la lista, de la sig manera: sumlist([1,2,3], Sumatoria), Sumatoria = 6
%Para cualquiera de estas 3 opciones se puede consultar lo ya mencionado o consulta del tipo booleanas

cantidadAsesinatos(Pelicula, Cantidad) :-
    findall(Victima, asesinato(Pelicula, _, Victima), Victimas), %Si la pelicula llega sin ligar se traduce: "Todas las victimas de todas las peliculas; Si la pelicula llega ligada se traduce: "Todas las vistimas de ESA pelicula"
    length(Victimas, Cantidad).