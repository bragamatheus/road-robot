*** Settings ***
Documentation       Elementos e ações de login

Library             AppiumLibrary
Resource            ./communs.resource


*** Keywords ***
Acessar app
    [Arguments]    ${cpf}    ${senha}

    Preciona botao comecar
    Preencher campo cpf de boas vindas    ${cpf}
    Botao contiunar de boas vindas
    Preencher campo senha de ola    ${senha}
    Botao confirmar de ola
    Botoao continuar de dispositivo diferente
    Codigo validacao SMS
    Botao continuar de codigo de validacao SMS
    Botao acessar conta

Mensagem de alerta
    [Arguments]    ${expected_message}

    Wait Until Element Is Visible    //android.widget.TextView[@text="${expected_message}"]    30
    Element Text Should Be    //android.widget.TextView[@text="${expected_message}"]    ${expected_message}

Preciona botao comecar
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Começar"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Boas-vindas,"]    30

Preencher campo cpf de boas vindas
    [Arguments]    ${cpf}

    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="CPF"]//android.widget.EditText

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Input Text    ${el}    ${cpf}
    # Hide keyboard

Botao contiunar de boas vindas
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Continuar"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Preencher campo senha de ola
    [Arguments]    ${senha}

    Sleep    4
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Senha"]//android.widget.EditText
    Wait Until Element Is Visible    ${el}    60
    Input Text    ${el}    ${senha}
    # Hide keyboard

Botao confirmar de ola
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Confirmar"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Botoao continuar de dispositivo diferente
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="continue-authorization-device"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Codigo validacao SMS
    ${valor} =    Set Variable    000000
    ${el} =    Set Variable    xpath=//*[@resource-id='verification-code-input']
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Sleep    5
    Input Text    ${el}    ${valor}
    # Hide keyboard

Botao continuar de codigo de validacao SMS
    ${el} =    Set Variable     xpath=//android.view.ViewGroup[@content-desc="CONTINUAR"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Botao acessar conta
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="access-account"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

###    Fluxo para troca de senha    ###

Esqueceu a sua senha
    ${senha} =    Set Variable    xpath=//android.widget.TextView[@text="Esqueceu a sua senha?"]
    Wait Until Element Is Visible    ${senha}    30
    Click Element    ${senha}

Esqueci minha senha informe seu CPF/CNPJ
    [Arguments]    ${cpf}
    ${cpf_usuario} =    Set Variable    xpath=//android.widget.EditText[@content-desc="input-document"]
    Wait Until Element Is Visible    ${cpf_usuario}    30
    Input Text    ${cpf_usuario}    ${cpf}
    # Hide keyboard

Confirmar esqueci minha senha
    Click Element    accessibility_id=button-continue

    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@text="Siga as instruções abaixo para criar uma senha segura:"]    30

Criar nova senha
    ${el} =    Set Variable    accessibility_id=button-i-understood
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Digite sua senha
    [Arguments]    ${senha}

    ${el} =    Set Variable    accessibility_id=input-new-password
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Input Text    ${el}    ${senha}
    # Hide keyboard

Confirme a senha
    [Arguments]    ${confirme_senha}

    ${el} =    Set Variable    accessibility_id=input-confirm-new-password
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Input Text    ${el}    ${confirme_senha}
    # Hide keyboard

Continuar troca de senha
    ${el} =    Set Variable    accessibility_id=continue-reset-password
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Codigo SMS
    ${el} =    Set Variable    xpath=//android.widget.EditText[@resource-id="verification-code-input"]
                                    
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Input Text    ${el}    000000
    # Hide keyboard

Senha trocada com sucesso
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Você redefiniu sua senha com sucesso!"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}

Trocar senha do app
    [Arguments]    ${cpf}    ${senha}    ${confirm_senha}

    Preciona botao comecar
    Preencher campo cpf de boas vindas    ${cpf}
    Botao contiunar de boas vindas
    Esqueceu a sua senha
    Esqueci minha senha informe seu CPF/CNPJ    ${cpf}
    Confirmar esqueci minha senha
    Criar nova senha
    Digite sua senha    ${senha}
    Confirme a senha    ${confirm_senha}
    Continuar troca de senha
    Codigo validacao SMS
    Botao continuar de codigo de validacao SMS
    # Codigo SMS     #Codigo validacao SMS   #Senha transacional
    Senha trocada com sucesso
    ### obs ver com os dev sobre o porque nao passa a troca de senha na automacao

Tentar acessar app
    [Arguments]    ${cpf}

    Preciona botao comecar
    Preencher campo cpf de boas vindas    ${cpf}
    Botao contiunar de boas vindas
