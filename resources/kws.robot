***Settings***

Library     SeleniumLibrary

***Keywords***
Acesso a página Login
    Go To       http://zepalheta-web:3000

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

    Wait Until Element Contains        ${TOASTER_ERROR}       ${expect_message}
    #Close Browser

## CUSTOMERS

Dado que acesso o formulário do cadastro de clientes
    Wait Until Element Is Visible       ${NAV_CUSTOMERS}      5
    Click Element                       ${NAV_CUSTOMERS}
    Wait Until Element Is Visible       ${CUSTOMER_FORM}       5
    Click Element                       ${CUSTOMER_FORM}

Quando faço a inclusão deste cliente:
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Register New Customer       ${name}     ${cpf}      ${address}      ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains         ${TOASTER_SUCCESS}      ${expect_notice}    5