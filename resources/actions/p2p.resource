*** Settings ***
Documentation       Elementos e ações de transferencia P2P

Library             AppiumLibrary
Resource            ./communs.resource


*** Keywords ***
Transferencia por P2P
    [Arguments]    ${conta}    ${valor}

    Card enviar p2p
    Entre contas Road
    Numero da conta digital    ${conta}
    Botao continuar conta
    Botao continuar contato
    Enviar P2P R$    ${valor}
    Botao continuar valor
    Botao continuar confirmacao valores
    Senha transacional
    Botao continuar confirmacao

Agendamento por P2P
    [Arguments]    ${conta}    ${valor}

    Card enviar p2p
    Entre contas Road
    Numero da conta digital    ${conta}
    Botao continuar conta
    Botao continuar contato
    Enviar P2P R$    ${valor}

    Data da transferencia p2p
    Selecionar uma data futura p2p

    

    Botao continuar valor
    Botao continuar confirmacao valores
    Senha transacional
    Botao continuar confirmacao

Data da transferencia p2p
   
    ${date_format} =    Set Variable    %d/%m/%Y
    ${data_atual} =    Get Current Date    result_format=${date_format}

    Sleep    2
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Data, ${data_atual}"]/com.horcrux.svg.SvgView
    Wait Until Element Is Visible    ${el}    30

    Click Element    ${el}

Selecionar uma data futura p2p
    Sleep    2
    ${date_format} =    Set Variable    %d
    ${data_atual} =    Get Current Date    result_format=${date_format}

    ${dia_atual} =    Convert To Integer    ${data_atual}
    ${um_dia_depois} =    Set Variable    ${dia_atual + 1}
    
    ${dia} =    Set Variable    xpath=(//android.widget.TextView[@text="${um_dia_depois}"])[1]
    Click Element    ${dia}           

    
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]
    Wait Until Element Is Visible    ${el}    30
    Click Element       ${el}  






Card enviar p2p
    Sleep    3
    ${enviar} =    Set Variable    xpath=(//android.view.ViewGroup[@content-desc="Enviar"])[1]
    Wait Until Element Is Visible    ${enviar}    30
    Element Should Be Enabled    ${enviar}
    Click Element    ${enviar}

Entre contas Road
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Entre contas Road"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Numero da conta digital
    [Arguments]    ${conta}

    ${el} =    Set Variable    xpath=//android.widget.EditText[@index="1"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Input Text    ${el}    ${conta}
    # Hide keyboard

Botao continuar conta
    Sleep    2
    ${el} =    Set Variable    xpath=//*[@text="Continuar"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Botao continuar contato
    Sleep    3
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Enviar P2P R$
    [Arguments]    ${valor}

    ${input_valor} =    Set Variable    xpath=//android.widget.EditText[@text="0,00"]
    Wait Until Element Is Visible    ${input_valor}
    Element Should Be Enabled    ${input_valor}
    Input Text    ${input_valor}    ${valor}
    # Hide keyboard

Botao continuar valor
    ${el} =    Set Variable    xpath=(//android.view.ViewGroup[@resource-id="button"])[2]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Botao continuar confirmacao valores
    Sleep    1
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Senha transacional
    ${senha_cartao} =    Set Variable    3256

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="smooth-pin-code-input"]    30
    Input Text    xpath=//android.widget.EditText[@resource-id="smooth-pin-code-input"]    ${senha_cartao}
    # Hide keyboard

Botao continuar confirmacao
    Sleep    2
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Mensagem transferência realizada com sucesso
    [Arguments]    ${message}

    Sleep    8

    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Transferência realizada com sucesso!"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Element Text Should Be    ${el}    ${message}

Mensagem esperada P2P agendado
    [Arguments]    ${message}

    Sleep    8

    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Transferência agendada com sucesso!"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Element Text Should Be    ${el}    ${message}
