%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAC 426 - Bancos de dados                 %%
%% IME-USP - Primeiro Semestre de 2011       %%
%% Consultas na linguagem Algebra Relacional %%
%%                                           %%
%% Primeiro Exercício-Programa               %%
%%                                           %%   
%% Rafael Reggiani Manzo 6797150             %%
%%                                           %%
%% 25/04/2011                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%(a) Obtenha os nomes das pessoas que ministraram cursos que ja cursaram (possivelmente em oferecimentos diferentes).

%  ministrantes(id, cod) := project idMinistrante, codigo (oferecimentoCurso);
%  alunos(id, cod) := project idAluno, codigo (cursandoCurso);
%  itema := project nome (pessoa njoin (ministrantes intersect alunos));

%(b) Obtenha os nomes das pessoas que cursaram todos os cursos que ja ministraram.

%  ministrantes(id, c) := project idMinistrante, codigo (oferecimentoCurso);
%  alunos(id, c) := project idAluno, codigo (cursandoCurso);
%  pess(id) := project id ((project id (pessoa)) difference (project id (ministrantes difference alunos)));
%  itemb := project nome (pess njoin pessoa);

%(c) Obtenha os cursos que s ́ foram oferecidos uma unica vez.

%  cursos := project codigo, ano, semestre, idMinistrante (oferecimentoCurso);
%  cursos1(codigo1,ano1,semestre1,idMinistrante1) := cursos;
%  p := cursos product cursos1;
%  maisdeumavez := select (codigo=codigo1) and ((ano<>ano1) or (semestre<>semestre1) or (idMinistrante<>idMinistrante1)) (p);
%  itemc := project codigo ((project codigo (cursos)) difference (project codigo (maisdeumavez)));

%(d) Obtenha os cursos que foram oferecidos mais de uma vez, mas apenas por uma unica pessoa em todos os oferecimentos.

%  cursos := project codigo, ano, semestre, idMinistrante (oferecimentoCurso);
%  cursos1(codigo1,ano1,semestre1, idMinistrante1) := cursos;
%  p := cursos product cursos1;
%  maisdeumavez := select (codigo=codigo1) and (idMinistrante=idMinistrante1) and ((ano<>ano1) or (semestre<>semestre1)) (p);
%  itemd := project codigo (maisdeumavez);

%(e) Obtenha o nome, codigo do curso, ano e semestre de oferecimento de uma pessoa que ministrou e cursou simultaneamente o mesmo curso (indicío de erro).

%  cursando(codigoc, anoc, semestrec, idAluno) := project codigo, ano, semestre, idAluno (cursandoCurso);
%  oferecimento(codigoo, anoo, semestreo, idMinistrante) := project codigo, ano, semestre, idMinistrante (oferecimentoCurso);
%  p := select (codigoc = codigoo) and (anoc = anoo) and (semestrec = semestreo) and (idAluno = idMinistrante) (cursando product oferecimento);
%  iteme(nome, codigo, ano, semestre) := project nome, codigoc, anoc, semestrec (select idAluno=id (p product pessoa));
