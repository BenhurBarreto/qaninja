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