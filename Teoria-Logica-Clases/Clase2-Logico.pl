%codigo de la clase anterior que se usa tambien en esta clase
materia(paradigmas, 2).
materia(sintaxis, 2).
materia(analisis2, 2).
materia(analisis1, 1).
materia(desarolloSW, 3).

%Clase 2 de Prolog (2 de julio)

legajo(fede, 1231662).
legajo(ale, 1595465).
legajo(joaco, 2026399).
legajo(mili, 2140998).
legajo(francisco, 2223326).

cursada(fede, k2026, 6, 6).
cursada(ale, k2003, 6, 6).
cursada(joaco, k2003, 6 , 6).
cursada(fede, k2026, 2, 4).
cursada(fede, k2026, 8,8).

curso(k2026, sintaxis, 2007).
curso(k2026, sintaxis, 2010).
curso(k2003, paradigmas,2010).
curso(k2003, paradigmas, 2017).
curso(k2003, paradigmas, 2022).

%saber si un alumno aprobo una materia en particular (promedia 6 o mas)

aprobo(Alumno, Materia) :-
    promediaMasDe(Alumno, Materia, 6).

promociono(Alumno, Materia) :-
    promediaMasDe(Alumno, Materia, 8).

%para intentar sacarnos tanta logica de la regla anterior podemos delegar
promedio(Alumno, Materia, Promedio):- 
    cursada(Alumno, CodigoCurso, Nota1, Nota2),
    Promedio is (Nota1 + Nota2) / 2,
    curso(CodigoCurso, Materia, _).

%Nota: al momento de pasar esto a la consola va a haber un bug ya que esta asociado el CodigoCurso
%por lo que deberia de haber distintos curos por materia y alumno

promediaMasDe(Alumno, Materia, NotaMinima) :-
    promedio(Alumno, Materia, Promedio),
    Promedio >= NotaMinima.

%recurso(Alumno, Materia) :-
%   not(aprueba(Alumno,Materia)).

%en el caso del "not", si le damos datos que no estan ligados se toman como "_", por lo que 
%si queremos que nos devuelvas los que no cumplen dicha regla, debemos de darle los datos
%ya ligados, de la siguiente manera:

%recurso(Alumno, Materia) :- 
%    cursada(Alumno, Codigo, _, _),
%    curso(Codigo, Materia),
%    not(aprueba(Alumno,Materia)).

% tambien podemos delegar para que directamente pase el dato ligado si curso la materia

recurso(Alumno, Materia) :- 
    haCursado(Alumno, Materia),
    not(aprueba(Alumno,Materia)).

haCursado(Alumno, Materia) :-
    cursada(Alumno, Codigo, _, _),
    curso(Codigo, Materia).

ingresante(Alumno) :-
    legajo(Alumno, _),
    not(haCursado(Alumno, _)).

