*** Settings ***
Documentation       Elementos e ações de transferencia PIX

Library    AppiumLibrary
Resource    ./communs.resource

*** Keywords ***
Transferencia PIX chave CPF/CNPJ
    [Arguments]    ${chave}    ${valor}    ${desc}
    Card pix
    Card enviar pix
    Tipo de chave CPF/CNPJ
    Digite o CPF/CNPJ    ${chave}
    Scroll app
    Botao CONTINUAR
    Valor da transferencia    ${valor}
    Descricao    ${desc}
    Scroll app
    Botao CONTINUAR Transferencia
    Conferir transferência
    Senha transacional
    Finalizar transferencia

Agendamento PIX chave CPF/CNPJ
    [Arguments]    ${chave}    ${valor}    ${desc}
    Card pix
    Card enviar pix
    Tipo de chave CPF/CNPJ
    Digite o CPF/CNPJ    ${chave}
    
    Scroll app
    Botao CONTINUAR

    Data da transferencia
    Selecionar uma data futura

    Valor da transferencia    ${valor}
    Descricao    ${desc}
    Scroll app
    Botao CONTINUAR Transferencia
    Conferir transferência
    Senha transacional
    Finalizar transferencia

Card pix
    Sleep    3
    ${el} =    Set Variable
    ...    xpath=//android.view.ViewGroup[@content-desc="access-pix"]/com.horcrux.svg.SvgView
    Wait Until Element Is Visible    ${el}    30

    Click Element    ${el}

###    Area do pix    ###

Card enviar pix
    Sleep    1
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Enviar"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Tipo de chave CPF/CNPJ
    Sleep    1
    ${chave} =    Set Variable    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]

    Wait Until Element Is Visible    ${chave}    30
    Click Element    ${chave}

Digite o CPF/CNPJ
    [Arguments]    ${chave}

    Sleep    1
    ${el} =    Set Variable    xpath=//android.widget.EditText[@text="Digite ou cole o CPF/CNPJ"]

    Wait Until Element Is Visible    ${el}    30

    Input Text    ${el}    ${chave}
    # Hide keyboard

Botao CONTINUAR
    Sleep    1

    ${el} =    Set Variable    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[9]

    Wait Until Element Is Visible    ${el}    30

    Click Element    ${el}

Valor da transferencia
    [Arguments]    ${valor}

    Sleep    1

    ${el} =    Set Variable    xpath=//android.widget.EditText[@text="0,00"]
    Wait Until Element Is Visible    ${el}
    Input Text    ${el}    ${valor}
    # Hide keyboard

Descricao
    [Arguments]    ${desc}

    Sleep    1

    ${el} =    Set Variable    xpath=//android.widget.EditText[@text="Digite a descrição"]
    Wait Until Element Is Visible    ${el}

    Input Text    ${el}    ${desc}
    # Hide keyboard

Botao CONTINUAR Transferencia
    Sleep    2
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]

    Wait Until Element Is Visible    ${el}
    Click Element    ${el}

Conferir transferência
    Sleep    2

    ${el} =    Set Variable    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup

    Wait Until Element Is Visible    ${el}
    Click Element    ${el}

Senha transacional
    Sleep    2
    ${senha_cartao} =    Set Variable    3256

    ${el} =    Set Variable    xpath=//android.widget.EditText[@resource-id="smooth-pin-code-input"]

    Wait Until Element Is Visible    ${el}

    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${senha_cartao}
    # Hide keyboard

Finalizar transferencia
    Sleep    3

    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="FINALIZAR"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Mensagem esperada Pix realizado com sucesso

    [Arguments]    ${message}
    Sleep    5

    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Pix realizado com sucesso!"]

    Wait Until Element Is Visible    ${el}    30
    Element Text Should Be    ${el}    ${message}


Mensagem esperada Pix agendado

    [Arguments]    ${message}
    Sleep    5

    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Pix agendado com sucesso!"]

    Wait Until Element Is Visible    ${el}    30
    Element Text Should Be    ${el}    ${message}

    

