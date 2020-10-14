***Settings***
Documentation       Cadastro de clientes
Resource        ../resources/base.robot

Test Setup      Start Session
Test Teardown   Finish Session

***Test Cases***
Novo cliente
    Dado que acesso o formulário do cadastro de clientes
    #Quando faço a inclusão deste cliente:
    #...         Bon Jovi        00000001406      Rua dos Bugs, 1000      51999999999
    #Então devo ver a notificação:       Cliente cadastrado com sucesso!

***Keywords***
Dado que acesso o formulário do cadastro de clientes
    Click Element       css:a[href$=customers]
    Click Element       css:a[href$=register]