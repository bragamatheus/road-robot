*** Settings ***
Documentation       Elementos e ações de transferencia TED

Library             AppiumLibrary
Resource            ./communs.resource


*** Keywords ***
Transferencia por TED
    [Arguments]    ${contato}    ${valor}

    Sleep    2

    Card enviar ted
    TED
    Buscar contato    ${contato}
    Meus contato
    Incluir contato
    Enviar R$    ${valor}
    Conferir informacoes e valores
    Inserir senha do cartao

Agendamento por TED
    [Arguments]    ${contato}    ${valor}

    Sleep    2

    Card enviar ted
    TED
    Buscar contato    ${contato}
    Meus contato
    Incluir contato

    Data da transferencia ted
    Selecionar uma data futura ted

    Enviar R$    ${valor}
    Conferir informacoes e valores
    Inserir senha do cartao

Novo favorecido ted
    [Arguments]    ${banco}    ${agecia}    ${conta}    ${dig}    ${nome}    ${doc}    ${valor}

    Card enviar ted
    TED
    Add novo contato

    Instituicao    ${banco}
    Tipo conta corrente
    Agencia conta e dig
    ...    ${agecia}
    ...    ${conta}
    ...    ${dig}

    Nome    ${nome}
    CPF/CNPJ    ${doc}
    Scroll app
    Adicionar novo contato
    Incluir contato
    Enviar R$    ${valor}
    Conferir informacoes e valores
    Inserir senha do cartao

Data da transferencia ted
    ${date_format} =    Set Variable    %d/%m/%Y
    ${data_atual} =    Get Current Date    result_format=${date_format}

    Sleep    2
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Data, ${data_atual}"]/com.horcrux.svg.SvgView
    Wait Until Element Is Visible    ${el}    30

    Click Element    ${el}

Selecionar uma data futura ted
    Sleep    2
    ${date_format} =    Set Variable    %d
    ${data_atual} =    Get Current Date    result_format=${date_format}

    ${dia_atual} =    Convert To Integer    ${data_atual}
    ${um_dia_depois} =    Set Variable    ${dia_atual + 1}

    ${dia} =    Set Variable    xpath=(//android.widget.TextView[@text="${um_dia_depois}"])[1]
    Click Element    ${dia}

    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Card enviar ted
    Sleep    3
    ${enviar} =    Set Variable       xpath=(//android.view.ViewGroup[@content-desc="Enviar"])[1]
    Wait Until Element Is Visible    ${enviar}    30
    Element Should Be Enabled    ${enviar}
    Click Element    ${enviar}

TED
    ${ted} =    Set Variable    xpath=//android.widget.TextView[@text="TED"]
    Wait Until Element Is Visible    ${ted}    30
    Element Should Be Enabled    ${ted}
    Click Element    ${ted}

Add novo contato
    ${novo} =    Set Variable    xpath=//android.widget.TextView[@text="Adicionar um novo contato"]
    Wait Until Element Is Visible    ${novo}    30
    Click Element    ${novo}

# Dados bancario

Buscar contato
    [Arguments]    ${contato}
    ${el} =    Set Variable    xpath=//android.widget.EditText[@resource-id="input"]

    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${contato}

Meus contato
    ${el} =    Set Variable
    ...    xpath=(//android.view.ViewGroup[contains(@content-desc, "Robsval")])[1]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Instituicao
    [Arguments]    ${banco}

# clicar no combo
    ${combo_banco} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Instituição"]
    Wait Until Element Is Visible    ${combo_banco}    30
    Element Should Be Enabled    ${combo_banco}
    Click Element    ${combo_banco}
#    buscar instituicao
    ${instituicao} =    Set Variable    xpath=//android.widget.EditText[@text="Buscar Instituição"]

    Wait Until Element Is Visible    ${instituicao}    30
    Element Should Be Enabled    ${instituicao}
    Input Text    ${instituicao}    ${banco}

#    clicar no elmento encntrado
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="301 Dock Ip S/A"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

tipo conta corrente
    ${tipo} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Tipo de Conta"]
    Wait Until Element Is Visible    ${tipo}    30
    Element Should Be Enabled    ${tipo}
    Click Element    ${tipo}

    ${conta} =    Set Variable    xpath=//android.widget.TextView[@text="Conta Corrente"]

    Wait Until Element Is Visible    ${conta}    30
    Element Should Be Enabled    ${conta}
    Click Element    ${conta}

Agencia conta e dig
    [Arguments]    ${agecia}    ${conta}    ${dig}

    ${input_agecia} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.EditText
    Wait Until Element Is Visible    ${input_agecia}    30
    Element Should Be Enabled    ${input_agecia}
    Input Text    ${input_agecia}    ${agecia}
    # Hide keyboard

    ${input_conta} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.EditText
    Wait Until Element Is Visible    ${input_conta}    30
    Element Should Be Enabled    ${input_conta}
    Input Text    ${input_conta}    ${conta}
    # Hide keyboard

    ${input_dig} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.EditText
    Wait Until Element Is Visible    ${input_dig}    30
    Element Should Be Enabled    ${input_dig}
    Input Text    ${input_dig}    ${dig}
    # Hide keyboard

# # Dados pessoais

Nome
    [Arguments]    ${nome}
    ${input_nome} =    Set Variable
    ...    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[6]/android.widget.EditText

    Wait Until Element Is Visible    ${input_nome}    30
    Element Should Be Enabled    ${input_nome}
    Input Text    ${input_nome}    ${nome}
    # Hide keyboard

CPF/CNPJ
    [Arguments]    ${doc}

    ${input_doc} =    Set Variable
    ...    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[7]//*[@index="1"]

    Wait Until Element Is Visible    ${input_doc}    30
    Element Should Be Enabled    ${input_doc}
    Input Text    ${input_doc}    ${doc}
    # Hide keyboard

Adicionar novo contato
    Sleep    2
    ${button} =    Set Variable    //android.view.ViewGroup[@resource-id="button"]

    Wait Until Element Is Visible    ${button}    30
    Click Element    ${button}

Incluir contato
    Sleep    2
    ${continuar} =    Set Variable
    ...    xpath=(//android.view.ViewGroup[@resource-id="button"])[1]

    Wait Until Element Is Visible    ${continuar}    30
    Element Should Be Enabled    ${continuar}
    Click Element    ${continuar}

Enviar R$
    [Arguments]    ${valor}

    ${input_valor} =    Set Variable    xpath=//android.widget.EditText[@text="0,00"]
    Wait Until Element Is Visible    ${input_valor}    30
    Element Should Be Enabled    ${input_valor}
    Input Text    ${input_valor}    ${valor}
    # Hide keyboard

    ${continuar} =    Set Variable    xpath=(//android.view.ViewGroup[@resource-id="button"])[2]

    Wait Until Element Is Visible    ${continuar}    30
    Element Should Be Enabled    ${continuar}
    Click Element    ${continuar}

Conferir informacoes e valores
    Sleep    1
    Wait Until Page Contains    text=Confira os valores e informações:

    ${continuar} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]

    Wait Until Element Is Visible    ${continuar}    30
    Click Element    ${continuar}

Inserir senha do cartao
    ${senha_cartao} =    Set Variable    3256

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id='smooth-pin-code-input']    30
    Input Text    xpath=//android.widget.EditText[@resource-id='smooth-pin-code-input']    ${senha_cartao}
    # Hide keyboard

    ${validar_code} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="validate-code-button"]

    Wait Until Element Is Visible    ${validar_code}    30
    Element Should Be Enabled    ${validar_code}
    Click Element    ${validar_code}

Mensagem esperada Ted realizado com sucesso
    [Arguments]    ${message}

    Sleep    5

    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="${message}"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Element Text Should Be    ${el}    ${message}

Mensagem esperada Ted agendado
    [Arguments]    ${message}

    Sleep    5

    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="${message}"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Element Text Should Be    ${el}    ${message}
