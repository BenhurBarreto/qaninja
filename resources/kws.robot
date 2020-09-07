***Keywords***
Acesso a página Login
    Go To       http://zepalheta-web:3000

Submeto minhas credenciais
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    #Click Element   xpath://button[text():'Entrar']
    Click Element   xpath://button[text()='Entrar']

Devo ver a área logada
    #Wait Until Element is Visible   //strong[text()'Sair']  5
    Wait Until Page Contains    Aluguéis    5
    #Close Browser
    # BDD - Comportamento (Dado, Quando e Então)
    # BDD só é BDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

    # ATDD (Desenvolvimento guiado por teste de aceitação)
    # ATDD só é ATDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

Devo ver um toaster com a mensagem
    [Arguments]       ${expect_message}

    Wait Until Element Contains        css:div[type=error] p       ${expect_message}
    #Close Browser