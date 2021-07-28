*** Settings ***

Resource    ../../../resources/pages/services.robot

*** Test Cases ***
Login com Sucesso   
    ${resp}=        Post Session            admin@zepalheta.com.br             pwd123

    Status Should Be                        200                                ${resp}

Senha Incorreta
    ${resp}=        Post Session            admin@zepalheta.com.br             123456

    Status Should Be                        401                                ${resp}

Usuário não existe
    ${resp}=        Post Session            naosei@zepalheta.com.br            pwd123

    Status Should Be                        401                                ${resp}
