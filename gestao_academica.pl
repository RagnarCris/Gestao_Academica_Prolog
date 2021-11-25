/*
Autor: Cristiano Nascimento da Silva
Matrícula: 201635029
Autor: Lucas Piazzi de Castro
Matrícula: 201635003
*/

:- include('database.pl') .

/* Predicado para retornar o histórico escolar */
historico_escolar(Matricula, ) :- estudante_disciplina(Matricula, Turma, Cod_Disciplina, Nota) .

/* Predicado para retornar a grade curricular */
grade_curricular(Curso) :- curso_disciplina(Curso, Disciplina, Vagas, Turma) .
