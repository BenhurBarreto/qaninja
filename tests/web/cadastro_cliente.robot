***Settings***
Documentation       Cadastro de clientes
Resource            ../../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo cliente
    [Tags]      Smoke
    Dado que acesso o formulário do cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         Bon Jovi        00000001406      Rua dos Bugs, 1000      51999999999
    Quando Faço A Inclusão Deste Cliente
    Então devo ver a notificação:       Cliente cadastrado com sucesso!
    E esse cliente deve ser exibido na lista

Cliente duplicado
    Dado que acesso o formulário do cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         Adrian Smith        00000001441      Rua dos Bugs, 2000      11999999999
    Mas esse CPF já existe no sistema
    Quando Faço A Inclusão Deste Cliente
    Então devo ver a notificação de erro:       Este CPF já existe no sistema!

Campos Obrigatórios
    Dado que acesso o formulário do cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...             ${EMPTY}        ${EMPTY}        ${EMPTY}        ${EMPTY}
    Quando Faço A Inclusão Deste Cliente
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    ${EMPTY}        53695887087     Rua dos Bugs, 1000      11999999999     Nome é obrigatório

CPF é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Calebe Gael     ${EMPTY}        Rua dos Bugs, 1000      11999999999     CPF é obrigatório

Endereço é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Calebe Gael     53695887087     ${EMPTY}        11999999999     Endereço é obrigatório

Telefone incorreto
    [Template]      Validação de Campos
    João da Silva   0000001406      Rua dos Bugs, 1000  119999999   Telefone inválido

Telefone é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Calebe Gael     53695887087     Rua dos Bugs, 1000        ${EMPTY}     Telefone é obrigatório


***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário do cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...             ${nome}     ${cpf}      ${endereco}     ${telefone}
    Quando Faço A Inclusão Deste Cliente    
    Então Devo Ver O Texto:     ${saida}