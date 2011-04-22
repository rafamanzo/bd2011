%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAC 426 - Bancos de dados           %%
%% IME-USP - Primeiro Semestre de 2011 %%
%% Consultas na linguagem SQL          %%
%%                                     %%
%% Primeiro Exercício-Programa         %%
%%                                     %%   
%% Rafael Reggiani Manzo 6797150       %%
%%                                     %%
%% 25/04/2011                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%(a) Obtenha os nomes das pessoas que ministraram cursos que ja cursaram (possivelmente em oferecimentos diferentes).

%  ministrantes := SELECT distinct idMinistrante, codigo FROM oferecimentoCurso;
%  alunos := SELECT distinct idAluno, codigo FROM cursandoCurso;
%  am := SELECT distinct a.idAluno FROM alunos a INNER JOIN ministrantes m ON a.idAluno=m.idMinistrante;
%  itema := SELECT distinct p.nome FROM pessoa p INNER JOIN am ON p.id=am.idAluno;

%(b) Obtenha os nomes das pessoas que cursaram todos os cursos que ja ministraram.
%  ministrantes := SELECT distinct idMinistrante, codigo FROM oferecimentoCurso;
%  alunos := SELECT distinct idAluno, codigo FROM cursandoCurso;
%  naocursamasministra := SELECT distinct m.idMinistrante FROM ministrantes m WHERE not exists (SELECT * FROM alunos a WHERE a.idAluno=m.idMinistrante and a.codigo=m.codigo);
%  itemb := SELECT distinct p.nome FROM pessoa p INNER JOIN naocursamasministra ncmm ON p.id <> ncmm.idMinistrante;

%,(c) Obtenha os cursos que so foram oferecidos uma unica vez
%  itemc := SELECT distinct oc1.codigo FROM oferecimentoCurso oc1 WHERE not exists (SELECT * FROM oferecimentoCurso oc2 WHERE (oc1.semestre <> oc2.semestre OR oc1.ano <> oc2.ano OR oc1.idMinistrante <> oc2.idMinistrante) and oc1.codigo=oc2.codigo);

%(d) Obtenha os cursos que foram oferecidos mais de uma vez, mas apenas por uma unica pessoa em todos os oferecimentos.
%  itemd := SELECT distinct c1.codigo FROM oferecimentoCurso c1 INNER JOIN oferecimentoCurso c2 ON c1.codigo=c2.codigo WHERE (c1.semestre<>c2.semestre OR c1.ano <> c2.ano) AND c1.idMinistrante=c2.idMinistrante;

%(e) Obtenha o nome, codigo do curso, ano e semestre de oferecimento de uma pessoa que ministrou e cursou simultaneamente o mesmo curso (indicío de erro).
%  iteme := SELECT distinct p.nome, c.codigo, c.ano, c.semestre FROM pessoa p INNER JOIN (oferecimentoCurso c INNER JOIN cursandoCurso a ON a.idAluno=c.idMinistrante) ON c.idMinistrante=p.id  WHERE a.codigo=c.codigo AND a.ano=c.ano AND a.semestre=c.semestre;
