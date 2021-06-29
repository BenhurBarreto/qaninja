***Settings***

Library     SeleniumLibrary

***Keywords***
Acesso a página Login
    Go To       ${base_url}

Submeto minhas credenciais
    [Arguments]     ${email}    ${password}

    Login With  ${email}    ${password}

Devo ver a área logada
    #Wait Until Element is Visible   //strong[text()'Sair']  5
    Wait Until Page Contains    Aluguéis    10
    #Close Browser
    # BDD - Comportamento (Dado, Quando e Então)
    # BDD só é BDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

    # ATDD (Desenvolvimento guiado por teste de aceitação)
    # ATDD só é ATDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

Devo ver um toaster com a mensagem
    [Arguments]       ${expect_message}

    Wait Until Element Contains        ${TOASTER_ERROR_P}       ${expect_message}
    #Close Browser

## CUSTOMERS

Dado que acesso o formulário do cadastro de clientes
    Wait Until Element Is Visible       ${NAV_CUSTOMERS}        5
    Click Element                       ${NAV_CUSTOMERS}
    Wait Until Element Is Visible       ${CUSTOMER_FORM}        5
    Click Element                       ${CUSTOMER_FORM}

E que eu tenho o seguinte cliente:
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}
    Remove Customer By Cpf      ${cpf}
    Set Test Variable       ${name}
    Set Test Variable       ${cpf}
    Set Test Variable       ${address}
    Set Test Variable       ${phone_number}

Mas esse CPF já existe no sistema
    Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}

Quando Faço A Inclusão Deste Cliente
    #[Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}
    #Remove Customer By Cpf      ${cpf}
    Register New Customer       ${name}     ${cpf}      ${address}      ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains         ${TOASTER_SUCCESS}      ${expect_notice}    5

Então devo ver a notificação de erro:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains         ${TOASTER_ERROR}      ${expect_notice}    5

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
    Wait Until Element Contains     ${LABEL_NAME}        Nome é obrigatório            5
    Wait Until Element Contains     ${LABEL_CPF}         CPF é obrigatório             5
    Wait Until Element Contains     ${LABEL_ADDRESS}     Endereço é obrigatório        5
    Wait Until Element Contains     ${LABEL_PHONE}       Telefone é obrigatório        5

Então Devo Ver O Texto:
    [Arguments]         ${expect_text}
    Wait Until Page Contains           ${expect_text}          500