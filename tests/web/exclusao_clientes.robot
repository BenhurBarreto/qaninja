***Settings***
Documentation       Cadastro de clientes
Resource            ../../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Remover Cliente
    Dado que eu tenho um cliente indesejado:
    ...     Bob Dylan       11122233344     Rua dos Bugs, 2000      51988887777
    E acesso a lista de clientes
    Quando eu removo esse cliente
    Então devo ver a notificação:       Cliente removido com sucesso!
    E esse cliente não deve aparecer na lista