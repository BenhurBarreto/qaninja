***Settings***
Documentation   Login Tentativa
Resource        ../resources/kws.robot

***Test Cases***
Login do Administrador
    Acesso a página Login
    Submeto minhas credenciais  admin@zepalheta.com.br  pwd123
    Devo ver a área logada

Senha incorreta
    [tags]      inv_login
    Acesso a página Login
    Submeto minhas credenciais  admin@zepalheta.com.br  abc123
    Devo ver um toaster com a mensagem  Ocorreu um erro ao fazer login, cheque as credenciais.

Senha em branco
    [tags]      inv_login
    Acesso a página Login
    Submeto minhas credenciais  joao@gmail.com  ${EMPTY}
    Devo ver um toaster com a mensagem  O campo senha é obrigatório!

Email em branco
    [tags]      inv_login
    Acesso a página Login
    Submeto minhas credenciais  ${EMPTY}  123456
    Devo ver um toaster com a mensagem  O campo email é obrigatório!

Email e senha em branco
    [tags]      inv_login
    Acesso a página Login
    Submeto minhas credenciais  ${EMPTY}  ${EMPTY}
    Devo ver um toaster com a mensagem  Os campos email e senha não foram preenchidos!