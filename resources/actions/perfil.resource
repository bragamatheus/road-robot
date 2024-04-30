*** Settings ***
Documentation       Elementos e ações de perfil do usuario

Library             AppiumLibrary
Resource            ./communs.resource
Resource            login.resource


*** Keywords ***
Perfil do usuario
    Sleep    5
    ${el} =    Set Variable    xpath=(//android.widget.TextView[contains(@index, '0')])[1]

    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Dados bancarios
    Wait Until Page Contains
    ...    text=CPF/CNPJ

    Wait Until Page Contains
    ...    text=Instituição

    Wait Until Page Contains
    ...    text=Conta Digital Road

    Wait Until Page Contains
    ...    text=Agência

    Wait Until Page Contains
    ...    text=Conta Corrente

Dados pessoais
    Sleep    3
    ${el} =    Set Variable    xpath=//*[@text="Dados pessoais"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}

    Click Element    ${el}

    Wait Until Page Contains
    ...    text=CPF/CNPJ

    Wait Until Page Contains
    ...    text=Telefone Celular

    Wait Until Page Contains
    ...    text=E-mail

    Wait Until Page Contains
    ...    text=Endereço

Seguranca
    Sleep    3
    ${el} =    Set Variable    xpath=//*[@text="Segurança"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}

    Click Element    ${el}

    Wait Until Page Contains
    ...    text=Segurança

Informe de rendimentos
    Sleep    3
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Informe de rendimentos"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

    Wait Until Page Contains
    ...    text=Seu Informe de Rendimentos será enviado para:

Compartilhar
    Sleep    3
    ${el} =    Set Variable    xpath=//*[@text="Compartilhar"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}

    Click Element    ${el}

Voltar menu ajuda
    Sleep    3
    ${el} =    Set Variable
    ...    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}

    Click Element    ${el}

Logoff app
    Sleep    2
    ${sair} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Sair"]
    Wait Until Element Is Visible    ${sair}    30
    Click Element    ${sair}

    Sleep    3
    ${sim_sair} =    Set Variable
    ...    xpath=(//android.view.ViewGroup[@resource-id="button"])[1]
    Wait Until Element Is Visible    ${sim_sair}    30
    Click Element    ${sim_sair}

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Toque em Acessar para continuar"]    30

Alterar senha do app
    [Arguments]    ${senha}    ${nova}    ${confirma}

    alterar senha
    senha atual    ${senha}
    nova senha    ${nova}
    confirmar senha    ${confirma}
    button confirmar alteracao senha
    sms alterar senha
    confirmar sms alterar senha
    mensagem confirmacao alteracao senha

alterar senha
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Alterar senha do app"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains
    ...    text=Alterar senha do aplicativo

    # # # Hide keyboard

senha atual
    [Arguments]    ${senha}

    ${senha_atual} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.widget.EditText
    Wait Until Element Is Visible    ${senha_atual}    30
    Input Text    ${senha_atual}    ${senha}
    # # # Hide keyboard

nova senha
    [Arguments]    ${nova}
    ${senha_nova} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.view.ViewGroup/android.widget.EditText
    Wait Until Element Is Visible    ${senha_nova}    30
    Input Text    ${senha_nova}    ${nova}
    # # # Hide keyboard

confirmar senha
    [Arguments]    ${confirma}

    Sleep    1
    ${senha_conf} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup/android.widget.EditText
    Wait Until Element Is Visible    ${senha_conf}    30
    Input Text    ${senha_conf}    ${confirma}
    # # # Hide keyboard

button confirmar alteracao senha
    Sleep    2
    ${button} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]
    Wait Until Element Is Visible    ${button}    30
    Click Element    ${button}

sms alterar senha
    Sleep    4
    ${sms} =    Set Variable    xpath=//android.widget.EditText[@resource-id='verification-code-input']

    Wait Until Element Is Visible    ${sms}    30
    Input Text    ${sms}    000000
    # # # Hide keyboard

confirmar sms alterar senha
    Sleep    3
    ${button} =    Set Variable    xpath=(//android.view.ViewGroup[@resource-id="button"])[2]
    Wait Until Element Is Visible    ${button}    30
    Click Element    ${button}

mensagem confirmacao alteracao senha
    Sleep    4
    Wait Until Page Contains
    ...    text=Sucesso

    Wait Until Page Contains
    ...    text=A senha do aplicativo foi redefinida com sucesso!

Alterar senha do cartao
    [Arguments]    ${nova_senha}    ${confirma_senha}
    alterar senha cartao
    Digite a senha atual
    Continuar senha cartao
    Sleep    3
    # # # Hide keyboard
    Digite sua nova senha    ${nova_senha}
    Confirme sua nova senha    ${confirma_senha}
    Continuar nova senha cartao
    mensagem confirmacao alteracao senha cartao

    Sleep    5

Alterar senha cartao
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Alterar senha do cartão"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Digite a senha atual
    Sleep    2
    ${senha_cartao} =    Set Variable    3256

    ${el} =    Set Variable    xpath=//android.widget.EditText[@resource-id="smooth-pin-code-input"]

    Wait Until Element Is Visible    ${el}

    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${senha_cartao}
    # # # Hide keyboard

Continuar senha cartao
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Continuar"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Digite sua nova senha
    [Arguments]    ${senha}

    ${el} =    Set Variable
    ...    xpath=//android.widget.EditText[@resource-id="set-password-new-pin-input"]
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${senha}

Confirme sua nova senha
    [Arguments]    ${nova}
    ${senha_nova} =    Set Variable
    ...    xpath=//android.widget.EditText[@resource-id="set-password-confirm-new-pin-input"]
    Wait Until Element Is Visible    ${senha_nova}    30
    Input Text    ${senha_nova}    ${nova}

Continuar nova senha cartao
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="button"]
    # //android.view.ViewGroup[@content-desc="Continuar"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

mensagem confirmacao alteracao senha cartao
    Sleep    5
    Wait Until Page Contains
    ...    text=Sucesso

    Wait Until Page Contains
    ...    text=A senha do seu cartão foi redefinida com sucesso!

Acessar politicas e termos
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Políticas e Termos"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains
    ...    text=Políticas e Termos

Politica de privacidade
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Política de privacidade"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Termos de uso
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Termos de uso"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Acessar encerrar conta
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Encerrar conta"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains
    ...    text=Encerramento de conta


    Wait Until Page Contains
    ...    text=Após o encerramento da conta, não será possível acessar o app após o cancelamento.
