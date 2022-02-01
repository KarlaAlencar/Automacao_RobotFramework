***Settings***
Documentation           Tudo começa aqui, meu arquivo base do projeto de automação

Library     Browser
Library     libs/DeloreanLibrary.py

Resource    actions/auth.robot
Resource    actions/Students.robot

Resource    actions/nav.robot
Resource    actions/components.robot

***Keywords***
Start Browser Session
    New Browser     chromium    False
    New Page        about:blank

    ###cria a sessao como about:black para abrir uma pagina em branco antes.

Start Admin Session
    Start Browser Session
    Go to Login page
    Login With                    admin@bodytest.com         pwd123
    User Should Be Logged In      Administrador

Clear LS And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]         ${timeout}

    Sleep           ${timeout}
    Take Screenshot


