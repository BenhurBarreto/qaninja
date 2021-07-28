**Settings***
Documentation           Camada de serviços do projeto de automação

Library     RequestsLibrary
Library     Collections
Resource    helpers.robot

**Variables***
${base_url_api}     http://zepalheta-api:3333

***Keywords***

Post Session

# Helpers
    [Arguments]     ${email}        ${password}

    Create Session  zp-api          ${base_url_api}

    &{headers}=     Create Dictionary       Content-Type=application/json
    &{payload}=     Create Dictionary       email=${email}        password=${password}

    ${resp}=        Post Request        zp-api      /sessions       data=${payload}   headers=${headers}

    [return]          ${resp}

# POST /Sessions
Get Session Token
    ${resp}=        Post Session  admin@zepalheta.com.br  pwd123

    ${token}        Convert To String       Bearer ${resp.json()['token']}

    [return]        ${token}

# POST /customers
Post Customer
    [Arguments]     ${payload}

    Create Session      zp-api      ${base_url_api}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       content-type=application/jason          authorization=${token}

    ${resp}=        Post Request        zp-api    /customers      data=${payload}    headers=${headers}

    [Return]        ${resp}

# PUT /customers
Put Customer
    [Arguments]     ${payload}      ${user_id}

    Create Session      zp-api      ${base_url_api}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       content-type=application/jason          authorization=${token}

    ${resp}=        Put Request        zp-api    /customers      data=${payload}    headers=${headers}

    [Return]        ${resp}

# GET /customers
Get Customers
    
    Create Session      zp-api      ${base_url_api}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       content-type=application/json       authorization=${token}
    ${resp}=        Get Request     zp-api      /customers      headers=${headers}

    [Return]    ${resp}

# GET /customer
Get Unique Customer

    [Arguments]     ${user_id}

    Create Session      zp-api      ${base_url_api}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       content-type=application/json       authorization=${token}
    ${resp}=        Get Request     zp-api      /customers/${user_id}      headers=${headers}

    [Return]    ${resp}

# DELETE /customers
Delete Customer
    [Arguments]     ${cpf}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       content-type=application/jason          authorization=${token}

    ${resp}=     Delete Request      zp-api      /customers/${cpf}        headers=${headers}
    