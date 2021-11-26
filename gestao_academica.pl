/*
Autor: Cristiano Nascimento da Silva
Matrícula: 201635029
Autor: Lucas Piazzi de Castro
Matrícula: 201635003
*/

:- include('database.pl') .

/* Predicado para retornar o histórico escolar */
historico_escolar(Matricula, Lista) :- findall(Cod_Disciplina/Nota/Turma, estudante_disciplina(Matricula, Turma, Cod_Disciplina, Nota), Lista) .

/* Predicado para retornar a grade curricular, o primeiro parâmtero do findall são as variáveis que não foram passadas na chamada do predicado, depois é o predicado que irá retornar a lista, e por fim, a lista em si */
grade_curricular(Curso, Lista) :- findall(Disciplina/Vagas, curso_disciplina(Curso, Disciplina, Vagas, Turma), Lista) .

/* Predicado para retornar apenas as disciplinas do histórico escolar */
historico_disciplinas(Matricula, Lista) :- findall(Cod_Disciplina/Nota/Turma, estudante_disciplina(Matricula, Turma, Cod_Disciplina, Nota), Lista) .

/* Predicado para retornar apenas as disciplinas da grade curricular */
grade_curricular_disciplinas(Curso, Lista) :- findall(Disciplina/Vagas, curso_disciplina(Curso, Disciplina, Vagas, Turma), Lista) .

estudantes_por_disciplina(Disciplina, Lista) :- findall(Matricula/Nota, estudante_disciplina(Matricula,Disciplina,Turma,Nota), Lista) .
/*alunos_disciplina(Disciplina, Nota, ListaFiltrada) :- exclude(>(Nota), alunos_disciplina(Disciplina, Lista), ListaFiltrada) .*/
estudantes_por_disciplina(Disciplina, NotaMinima, Lista) :- findall(Matricula/Nota, estudante_disciplina(Matricula,Disciplina,Turma,Nota), Lista), Nota>NotaMinima .

cursos_por_disciplina(Disciplina, Lista) :- findall(Curso/Vagas, curso_disciplina(Curso,Disciplina,Vagas,Turma), Lista) .

disciplinas_que_faltam(Matricula, Curso, Lista) :- subtract(grade_curricular_disciplinas(Curso, Lista1),historico_escolar(Matricula, Lista2), Lista) .
