***Settings***
Documentation       Suite de testes de Login do Administrador

Resource    ../resources/base.robot

##criar a seção do navegador uma unica vez 
Suite Setup        Start Browser Session
Test Teardown      Take Screenshot 

### take Screnshot, printa a tela

###O que faz os staps do robot
##instrução (configura) implementa para rodar antes de todos os testes
#Suite Setup             Log To Console      Tudo aqui acontece antes da Suite
##instrução implementa para rodar depois de todos os testes
#Suite Teardown          Log To Console      Tudo aqui acontece depois da Suite
##instrução implementa para rodar antes de cada teste
#Test Setup              Log To Console      Tudo aqui acontece antes do Teste
##instrução implementa para rodar depois de cada teste
#Test Teardown           Log To Console      Tudo aqui acontece depois do Teste

***Test Cases***
Login do Administrador
#    [tags]          admin
    Go to Login page
 ##substitui pelo comando Go to login page que está em auth.robot
 #   New Browser     chromium    False
 #   New Page        https://bodytest-web-anakarla.herokuapp.com/ 

   #pode ser feito assim, se tiver nomes iguais
    #auth.Login With    admin@bodytest.com         pwd123

    Login With                    admin@bodytest.com         pwd123

 ##alterado para o de cima para otimizar a manutenção    
#    Fill Text       css=input[name=email]       admin@bodytest.com     
#    Fill Text       css=input[name=password]    pwd123
#    Click           text=Entrar

    User Should Be Logged In     Administrador
 ## comando assim substiui    
 #   Get Text        css=aside strong        should be   Administrador

    
    [Teardown]      Clear LS And Take Screenshot

Senha incorreta
    Go to Login page
    
    Login With                  admin@bodytest.com   abc123

 #   Fill Text       css=input[name=email]       admin@bodytest.com     
 #   Fill Text       css=input[name=password]    abc123
 #   Click           text=Entrar

 #   Sleep           5

 #tem até o tempo definido para deixar visivel o elemento. Não vai congelar pelo tempo definido, ele vai ter até o tempo definido
    #Wait For Elements State     css=.Toastify__toast-body       visible     5

##com o ponto na frente do css=. , buscando pela classe (a biblioteca browser vai entender que tem que buscar a classe)
    #Get Text        css=.Toastify__toast-body   should be   Usuário ou senha inválido

    ## fazer em uma unica keyword a validação de senha
    #Wait For Elements State     css=.Toastify__toast-body >> text=Usuário ou senha inválido     visible     5
##substitui o comando acima que está na auth.robot 
    Toaster Text Should Be         Usuário e/ou senha inválidos.

    [Teardown]      Thinking And Take Screenshot       2

Email não cadastrado
    Go to Login page
    Login With                     fernado@gmail.com   abc123
    Toaster Text Should Be         Usuário e/ou senha inválidos.

    [Teardown]      Thinking And Take Screenshot       2


Email incorreta
    Go to Login page
    Login With                   admin*bodytest.com         abc123

#    Fill Text       css=input[name=email]       admin&bodytest.com     
#    Fill Text       css=input[name=password]    abc123
#    Click           text=Entrar

 # Wait For Elements State     css=form span >> text=Informe um e-mail válido     visible     5
 ## subistituida pelo comando acima que está no auth.robot
    Alert Text Should Be         Informe um e-mail válido



Senha não informada
    Go to Login page
    Login With                   admin@bodytest.com         ${EMPTY}

  #  Fill Text       css=input[name=email]       admin@bodytest.com     
  #  Fill Text       css=input[name=password]    ${EMPTY}
  #  Click           text=Entrar

    Alert Text Should Be         A senha é obrigatória  

Email não informado
    Go to Login page
    Login With      ${EMPTY}            abc123

    #Fill Text       css=input[name=email]       ${EMPTY}    
    #Fill Text       css=input[name=password]    abc123
    #Click           text=Entrar

    Alert Text Should Be          O e-mail é obrigatório

Email e senha não informado
#    [tags]          temp

    Go to Login page
    Login With                     ${EMPTY}            ${EMPTY}

  #  Fill Text       css=input[name=email]       ${EMPTY}    
  #  Fill Text       css=input[name=password]    ${EMPTY}
  #  Click           text=Entrar

 # Wait For Elements State     css=form span >> text=O e-mail é obrigatório     visible     5
 # Wait For Elements State     css=form span >> text=A senha é obrigatória     visible     5
##substitui o comando abaixo
### automação App Actions

    Alert Text Should Be            O e-mail é obrigatório
    Alert Text Should Be            A senha é obrigatória