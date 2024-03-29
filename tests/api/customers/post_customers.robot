***Settings***

Resource    ../../../resources/pages/services.robot
Library     OperatingSystem

***Test Cases***
New Customer

    ${payload}=     Get Json  customers/flea.json
    
    Delete Customer     ${payload['cpf']}

    ${resp}=        Post Customer  ${payload}

    Status Should Be        200     ${resp}

Name is Required

    ${payload}=     Get Json  customers/no_name.json
    ${resp}=        Post Customer  ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "name" is required

Cpf is Required

    ${payload}=     Get Json  customers/no_cpf.json
    ${resp}=        Post Customer  ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "cpf" is required

Address is Required

    ${payload}=     Get Json  customers/no_address.json
    ${resp}=        Post Customer  ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "address" is required

Phone is Required

    ${payload}=     Get Json  customers/no_phone.json
    ${resp}=        Post Customer  ${payload}

    Status Should Be        400     ${resp}
    Should Be Equal         ${resp.json()['message']}       "phone_number" is required