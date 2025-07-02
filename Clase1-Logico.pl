%Clase 1 Prolog (25 de junio)

% materia/2
% materia(Nombre, Año).

materia(paradigmas, 2).
materia(sintaxis, 2).
materia(analisis2, 2).
materia(analisis1, 1).
materia(desarolloSW, 3).

% profesor/3
% profesor(Profesor, Materia, Curso).

profesor(fede, paradigmas, k2103).
profesor(fede, desarolloSW, k3053).
profesor(bruno, sintaxis, k2103).

% esFacil/1
% una materia es fácil si está después de tercer año, si la da el profesor lautaro, o si es ingeniería y sociedad.

esFacil(NombreMateria) :- 
  materia(NombreMateria, Anio),
  Anio > 3.

esFacil(NombreMateria) :-
  profesor(lautaro, NombreMateria, _).

esFacil(ingenieriaYSociedad).

% profeDe/2
% relaciona a un profesor con los años en los que da clase.

profeDe(Profe, Anio) :-
  profesor(Profe, NombreMateria, _),
  materia(NombreMateria, Anio).

% correlativa/2
% correlativa(Materia, MateriaMadre).

correlativa(paradigmas, discreta).
correlativa(paradigmas, algoritmos).
correlativa(analisis2, analisis1).

% sonCorrelativas/2
% se cumple si dos materias son correlativas directa o indirectamente.

sonCorrelativas(Materia, MateriaMadre):-
  correlativa(Materia, MateriaMadre).

sonCorrelativas(Materia, MateriaMadre):-
  correlativa(Materia, MateriaEnElMedio),
  sonCorrelativas(MateriaEnElMedio, MateriaMadre).

% expertoEnElTema/1
% se cumple para un profesor que da dos materias correlativas.

expertoEnElTema(Profesor):-
  profesor(Profesor, Materia1, _),
  profesor(Profesor, Materia2, _),
  sonCorrelativas(Materia1, Materia2).

% masDeUnCursoDe/2
% relaciona a un profesor y una materia si da más de un curso de esa materia

masDeUnCursoDe(Profesor, NombreMateria):-
  profesor(Profesor, NombreMateria, Curso1),
  profesor(Profesor, NombreMateria, Curso2),
  Curso1 \= Curso2.

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

