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
