***Setting***
Library     SeleniumLibrary

***Keywords***
Acesso a página Login
    Open Browser    http://zepalheta-web:3000/  chrome
    Maximize Browser Window

Submeto minhas credenciais
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    #Click Element   xpath://button[text():'Entrar']
    Click Element   xpath://button[text()='Entrar']

Devo ver a área logada
    #Wait Until Element is Visible   //strong[text()'Sair']  5
    Wait Until Page Contains    Aluguéis    5
    Close Browser
    # BDD - Comportamento (Dado, Quando e Então)
    # BDD só é BDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

    # ATDD (Desenvolvimento guiado por teste de aceitação)
    # ATDD só é ATDD se o desenvolvedor ler a especificação e desenvolver orientado a ela