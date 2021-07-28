***Settings***

Resource    ../../../resources/pages/services.robot
Library     OperatingSystem

***Test Cases***
Update a Customer
    # Cliente origem
    ${payload}=     Get Json  customers/slash.json
    # Cadastra o cliente
    Delete Customer  ${payload}
    ${resp}=        Post Customer  ${payload}
    # Pega o ID do cliente
    ${user_id}=     Convert to String        ${resp.json()['id']}
    # Muda a massa para um novo nome
    Set Dictionary      ${payload}      name    Saul Hudson
    # Solicita a alteração para a api
    ${resp}     Put Customer  ${payload}  ${user_id}

    Status Should Be        204     ${resp}
    # Obtem os dados do cliente para validar se o nome foi alterado
    ${resp}     Get Unique Customer  ${user_id}

    Should Be Equal     ${resp.json()['name']}      Saul Hudson