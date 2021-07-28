***Settings***

Resource    ../../../resources/pages/services.robot

***Test Cases***
Delete Customer

    ${origin}       Get Json  customers/delete.json
    Delete Customer  ${origin['cpf']}
    ${resp}=        Post Customer  ${origin}
    
    ${resp}=        Delete Customer  ${origin['cpf']}
    Status Should Be        204     ${resp}
    

Customer Not Found

    ${resp}     Delete Customer  951.648.369-98

    Status Should Be        404                             ${resp}
    Shloud Be Equal         ${resp.json()['message']}       Customer not found