/*
Autor: Cristiano Nascimento da Silva
Matrícula: 201635029
Autor: Lucas Piazzi de Castro
Matrícula: 201635003
*/

:- include('database.pl') .

/* Predicados para pegar o nome da disciplina de acordo com curso e estudante */
nome_disciplina(Matricula, Disciplina, Nota) :- estudante_disciplina(Matricula, Cod_Disciplina, _, Nota), disciplina(Disciplina, Cod_Disciplina) .
nome_disciplina(Curso, Disciplina) :- curso_disciplina(Curso, Cod_Disciplina, _, _), disciplina(Disciplina, Cod_Disciplina) .

nome_estudante(Matricula,Disciplina,Nota,Nome) :- estudante_disciplina(Matricula, Disciplina, _, Nota), estudante(Nome,Matricula,_) .

nome_curso(Curso,Disciplina,Vagas,Nome) :- curso_disciplina(Curso,Disciplina,Vagas,_), curso(Curso, Nome).

ultimo_elemento([X], X).
ultimo_elemento([Y|Tail], X):- ultimo_elemento(Tail, X). 
verifica_nota(NotaMinima, L) :- ultimo_elemento(L, X), X >= NotaMinima .

/* Predicado para retornar o histórico escolar */
historico_escolar(Matricula, Lista) :- findall(Disciplina/Nota, nome_disciplina(Matricula, Disciplina, Nota), Lista) .

/* Predicado para retornar a grade curricular, o primeiro parâmtero do findall são as variáveis que não foram passadas na chamada do predicado, depois é o predicado que irá retornar a lista, e por fim, a lista em si */
grade_curricular(Curso, Lista) :- findall(Disciplina, nome_disciplina(Curso, Disciplina), Lista) .

/* Predicado para retornar apenas as disciplinas do histórico escolar */
historico_disciplinas(Matricula, Lista) :- findall(Disciplina, nome_disciplina(Matricula, Disciplina, _), Lista) .

estudantes_por_disciplina(Disciplina, Lista) :- findall([Nome,Nota], nome_estudante(Matricula,Disciplina,Nota,Nome), Lista) .
estudantes_por_disciplina(Disciplina, NotaMinima, Success) :- findall([Nome,Nota], nome_estudante(Matricula,Disciplina,Nota,Nome), Lista), include(verifica_nota(NotaMinima),Lista, Success) .

/* Predicado para pegar o tamanho da lista */
list_length([], 0 ).
list_length([_|Xs], L ) :- list_length(Xs,N) , L is N+1 .

/* Predicado que calcula o ira de um(a) estudante */
ira(Matricula, Ira) :- findall(Nota, estudante_disciplina(Matricula, _, _, Nota), Lista), sum_list(Lista, Soma), list_length(Lista,Tam),  Ira is Soma/Tam.

/* Predicado que retorna lista de cursos que possuem uma dada disciplina */
cursos_por_disciplina(Disciplina, Lista) :- findall([Curso,Vagas], nome_curso(Curso,Disciplina,Vagas,Nome), Lista) .

/* Predicado que retorna lista de disciplinas que faltam */
disciplinas_que_faltam(Matricula, Curso, Lista) :- grade_curricular(Curso, Lista1), historico_disciplinas(Matricula, Lista2), subtract(Lista1,Lista2, Lista) .

estudante_ira(Nome, Curso, Ira) :- estudante(Nome,Matricula,Curso), estudante_disciplina(Matricula, Disciplina, _, Nota), ira(Matricula, Ira). 

estudante_nota_disciplina(Nome, Curso, Nota, Disciplina) :- estudante(Nome,Matricula,Curso), estudante_disciplina(Matricula, Disciplina, _, Nota). 

estudantes_por_curso(Curso, Lista) :- findall(Nome, estudante(Nome,_,Curso), Lista) .
estudantes_por_curso(Curso, NotaMinima, Disciplina, Success) :- findall([Nome,Nota], estudante_nota_disciplina(Nome,Curso,Nota,Disciplina), Lista), include(verifica_nota(NotaMinima),Lista, Success) . .
estudantes_por_curso(Curso, IraMinimo, Success) :- findall([Nome,Ira], estudante_ira(Nome,Curso,Ira), Lista), include(verifica_nota(IraMinimo),Lista, Success) .
