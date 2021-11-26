/*
Autor: Cristiano Nascimento da Silva
Matrícula: 201635029
Autor: Lucas Piazzi de Castro
Matrícula: 201635003
*/

/* Definição de dinamicidade para os predicados*/
:- dynamic(estudante/3) .
:- dynamic(curso/2) .
:- dynamic(disciplina/2) .
:- dynamic(estudante_disciplina/4) .
:- dynamic(curso_disciplina/4) .

/* Definição de estudantes iniciais, os parâmetros são, respectivamente, nome do(a) estudante, sua matrícula e o código do curso que está matriculado(a) */
estudante('Antônio Barroso', '201625013', 'DCC') .
estudante('Cristiano Nascimento', '201635029', 'DCC') .
estudante('Lucas Piazzi', '201635003', 'DCC') .
estudante('Matheus Estevão', '201635022', 'DCC') .
estudante('Felipe Terrana', '201635019', 'DCC') .
estudante('Edson Lopes', '201635013', 'DCC') .
estudante('Carimbo Miguel', '201835023', 'DCC') .
estudante('Cauê Moura', '201325013', 'DCC') .
estudante('James Bond', '201235007', 'DCC') .
estudante('Xuxa Meneguel', '201425040', 'DCC') .

estudante('Lorem Ipslom da Silva', '201922042', 'MAT') .
estudante('Lorem Ipslom Cardoso', '201612013', 'MAT') .
estudante('Lorem Ipslom Santos', '201612018', 'MAT') .
estudante('Lorem Ipslom Rodrigues', '201822027', 'MAT') .
estudante('Lara Gama Diniz', '202012011', 'MAT') .
estudante('Lara Gama Pato', '201622013', 'MAT') .
estudante('Lara Gama da Silva', '201612015', 'MAT') .
estudante('Lara Gama Pinto', '201622021', 'MAT') .
estudante('Lara Gama Conceição', '201612006', 'MAT') .
estudante('Lara Gama Pinheiro', '201612001', 'MAT') .

/* Definição de cursos iniciais, os parâmetros são, respectivamente, código do curso e seu nome */
curso('DCC', 'Ciência da Computação') .
curso('MAT', 'Matemática') .

/* Definição de disciplinas iniciais, os parâmetros são, respectivamente, nome da disciplina e seu código */
disciplina('Algoritmos', 'DCC001') .
disciplina('Estrutura de Dados', 'DCC002') .
disciplina('Grafos', 'DCC003') .
disciplina('Banco de Dados', 'DCC004') .
disciplina('Redes', 'DCC005') .
disciplina('Computação Gráfica', 'DCC006') .
disciplina('Linguagem de Programação', 'DCC007') .
disciplina('Teoria da Computação', 'DCC008') .

disciplina('Introdução à Teoria dos Números', 'MAT001') .
disciplina('Cálculo I', 'MAT002') .
disciplina('Cálculo II', 'MAT003') .
disciplina('Cálculo III', 'MAT004') .
disciplina('Equações Diferenciais Ordinárias', 'MAT005') .

/* Definição dos relacionamentos entre estudante e disciplina, os parâmetros são, respectivamente, matrícula, código da disciplina, turma e nota */
estudante_disciplina('201625013', 'DCC001', 'DCC_DCC001', 85) .
estudante_disciplina('201635029', 'DCC001', 'DCC_DCC001', 95) .
estudante_disciplina('201635003', 'DCC001', 'DCC_DCC001', 95) .
estudante_disciplina('201635022', 'DCC001', 'DCC_DCC001', 90) .
estudante_disciplina('201635019', 'DCC001', 'DCC_DCC001', 92) .
estudante_disciplina('201635013', 'DCC001', 'DCC_DCC001', 95) .
estudante_disciplina('201835023', 'DCC001', 'DCC_DCC001', 98) .
estudante_disciplina('201325013', 'DCC001', 'DCC_DCC001', 90) .
estudante_disciplina('201235007', 'DCC001', 'DCC_DCC001', 92) .
estudante_disciplina('201425040', 'DCC001', 'DCC_DCC001', 91) .

estudante_disciplina('201922042', 'MAT002', 'MAT_MAT002', 85) .
estudante_disciplina('201612013', 'MAT002', 'MAT_MAT002', 87) .
estudante_disciplina('201612018', 'MAT002', 'MAT_MAT002', 77) .
estudante_disciplina('201822027', 'MAT002', 'MAT_MAT002', 90) .
estudante_disciplina('202012011', 'MAT002', 'MAT_MAT002', 97) .
estudante_disciplina('201622013', 'MAT002', 'MAT_MAT002', 65) .
estudante_disciplina('201612015', 'MAT002', 'MAT_MAT002', 75) .
estudante_disciplina('201622021', 'MAT002', 'MAT_MAT002', 86) .
estudante_disciplina('201612006', 'MAT002', 'MAT_MAT002', 85) .
estudante_disciplina('201612001', 'MAT002', 'MAT_MAT002', 92) .

/* Definição dos relacionamentos entre disciplina e curso, os parâmetros são, respectivamente, código do curso, código da disciplina, quantidade de vagas separadas na disciplina para tal curso e turma */
curso_disciplina('DCC','DCC001',40,'DCC_DCC001') .
curso_disciplina('DCC','DCC002',40,'DCC_DCC002') .
curso_disciplina('DCC','DCC003',40,'DCC_DCC003') .
curso_disciplina('DCC','DCC004',40,'DCC_DCC004') .
curso_disciplina('DCC','DCC005',40,'DCC_DCC005') .
curso_disciplina('DCC','DCC006',40,'DCC_DCC006') .
curso_disciplina('DCC','DCC007',40,'DCC_DCC007') .
curso_disciplina('DCC','DCC008',40,'DCC_DCC008') .
curso_disciplina('DCC','MAT001',15,'DCC_MAT001') .

curso_disciplina('MAT','MAT001',30,'MAT_MAT001') .

curso_disciplina('MAT','MAT002',30,'MAT_MAT002') .
curso_disciplina('DCC','MAT002',15,'DCC_MAT002') .
curso_disciplina('MAT','MAT003',30,'MAT_MAT003') .
curso_disciplina('DCC','MAT003',15,'DCC_MAT003') .
curso_disciplina('MAT','MAT004',30,'MAT_MAT004') .
curso_disciplina('DCC','MAT004',15,'DCC_MAT004') .
curso_disciplina('MAT','MAT005',30,'MAT_MAT005') .
curso_disciplina('DCC','MAT005',15,'DCC_MAT005') .
