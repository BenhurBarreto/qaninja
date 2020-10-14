***Settings***

Library     SeleniumLibrary

***Keywords***
Start Session
    Open Browser    about:blank   chrome
    Maximize Browser Window

Finish Session
    Close Browser

Login Session
    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    Click Element   xpath://button[text()='Entrar']