***Settings***
Documentation       Cadastro de clientes

***Test Cases***
Novo cliente
    Dado que acesso o formulário do cadastro de clientes
    Quando faço a inclusão deste cliente:
    ...         Bon Jovi        00000001406      Rua dos Bugs, 1000      51999999999
    Então devo ver a notificação:       Cliente cadastrado com sucesso!