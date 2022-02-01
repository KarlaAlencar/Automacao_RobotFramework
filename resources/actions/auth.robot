***Settings***
Documentation       Ações de autorização

***Keywords***
###abre uma seção do navegador
Go to Login page
   Go To        https://bodytest-web-anakarla.herokuapp.com/ 

###retirada daqui e levada para base.robot- esse codigo deve ser usada exclusivamente para criada uma seção 
#    New Browser     chromium    False
#    New Page        https://bodytest-web-anakarla.herokuapp.com/ 

Login With
    [Arguments]     ${email}        ${pass}

    Fill Text       css=input[name=email]               ${email}     
    Fill Text       css=input[placeholder*=senha]       ${pass}
    Click           text=Entrar

