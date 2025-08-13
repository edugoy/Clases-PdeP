%base de datos
linea(a,[plazaMayo,peru,lima,congreso,miserere,rioJaneiro,primeraJunta,nazca]).
linea(b,[alem,pellegrini,callao,pueyrredonB,gardel,medrano,malabia,lacroze,losIncas,urquiza]).
linea(c,[retiro,diagNorte,avMayo,independenciaC,plazaC]).
linea(d,[catedral,nueveJulio,medicina,pueyrredonD,plazaItalia,carranza,congresoTucuman]).
linea(e,[bolivar,independenciaE,pichincha,jujuy,boedo,varela,virreyes]).
linea(h,[lasHeras,santaFe,corrientes,once,venezuela,humberto1ro,inclan,caseros]).

combinacion([lima, avMayo]).
combinacion([once, miserere]).
combinacion([pellegrini, diagNorte, nueveJulio]).
combinacion([independenciaC, independenciaE]).
combinacion([jujuy, humberto1ro]).
combinacion([santaFe, pueyrredonD]).
combinacion([corrientes, pueyrredonB]).

%1. estaEn/2: en qué línea está una estación.
estaEn(Linea, Estacion) :-
    linea(Linea, Estaciones),
    member(Estacion, Estaciones).
    
%2. distancia/3: dadas dos estaciones de la misma línea, cuántas estaciones hay entre ellas: por ejemplo, entre Perú y Primera Junta hay 5 estaciones.
distancia(Estacion1, Estacion2, Distancia) :-
    linea(_, Estaciones),
    nth0(Inicio, Estaciones, Estacion1),
    nth0(Fin, Estaciones, Estacion2),
    Distancia is Inicio - Fin.

%3. mismaAltura/2: dadas dos estaciones de distintas líneas, si están a la misma altura (o sea, las dos terceras, las dos quintas, etc.), por ejemplo: Pellegrini y Santa Fe están ambas segundas.
mismaAltura(Estacion1, Estacion2) :-
    linea(_, Estaciones1),
    linea(_, Estaciones2),
    Estacion1 \= Estacion2,
    nth0(Posicion, Estaciones1 , Estacion1),
    nth0(Posicion, Estaciones2, Estacion2).

%4. granCombinacion/1: se cumple para una combinación de más de dos estaciones.
granCombinacion(Combinacion) :-
    combinacion(Combinacion),
    length(Combinacion, Cantidad),
    Cantidad > 2.

%5. cuantasCombinan/2: dada una línea, relaciona esa línea con la cantidad de estaciones de esa línea que tienen alguna combinación. Por ejemplo, la línea C tiene 3 estaciones que combinan (avMayo, diagNorte e independenciaC).
cuantasCombinan(Linea, Cantidad) :-
    linea(Linea, Estaciones),
    findall(Estacion, (estaEn(Linea, Estacion), combinacion(Combinaciones), member(Estacion, Combinaciones)), EstacionesCombi),
    length(EstacionesCombi, Cantidad).

%6. lineaMasLarga/1: es verdadero para la línea con más estaciones.


%7. viajeFacil/2: dadas dos estaciones, si puedo llegar fácil de una a la otra; esto es, si están en la misma línea, o bien puedo llegar con una sola combinación.