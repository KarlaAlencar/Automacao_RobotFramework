# Arquivo responsavel pelo cadastro de alunos

***Settings***
Documentation           Cadastro de alunos

Resource           ../resources/base.robot

Suite Setup        Start Admin Session

***Test Cases***
Novo aluno
##dicionario de dados (chave e valor)- Super variavel
    &{student}      Create Dictionary     name=Fernanda Sales     email=fernanda_sales@gmail.com      age=35      weight=92        feet_tall=1.60

    Remove Student                 ${student.email}
    Go To Students
    Go To Form Student
    New Studant                    ${student}
    Toaster Text Should Be         Aluno cadastrado com sucesso.

    [Teardown]      Thinking And Take Screenshot       2

Não deve permitir email duplicado
    [tags]          dup

    &{student}      Create Dictionary     name=João Henrique     email=joao@gmail.com      age=20      weight=70        feet_tall=1.75

    Insert Student                 ${student}   
    Go To Students
    Go To Form Student
    New Studant                    ${student}
    Toaster Text Should Be         Email já existe no sistema.

    [Teardown]      Thinking And Take Screenshot       2

Todos os campos devem ser obrigatórios
    [tags]      temp


    
    Go To Students
    Go To Form Student
    Submit Studend Form

    Alert Text Should Be        Nome é obrigatório
    Alert Text Should Be        O e-mail é obrigatório
    Alert Text Should Be        idade é obrigatória
    Alert Text Should Be        o peso é obrigatório
    Alert Text Should Be        a Altura é obrigatória