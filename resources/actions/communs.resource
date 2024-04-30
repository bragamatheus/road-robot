*** Settings ***
Documentation       Elementos e ações communs do app

Library             AppiumLibrary
Library             DateTime


*** Keywords ***
Scroll app
    Swipe By Percent    50    90    50    10    3000


Exibir saldo
    Sleep    3
    ${exibe_saldo} =    Set Variable    xpath=//android.widget.HorizontalScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1][@index='1']  
    
    Wait Until Element Is Visible    ${exibe_saldo}    60
    Element Should Be Enabled    ${exibe_saldo}
    Click Element    ${exibe_saldo}

    Wait Until Element Is Visible    //android.widget.TextView[@content-desc="label-current-balance"]    30

Data da transferencia
    Sleep    3

    ${el} =    Set Variable
    ...    xpath=//android.view.ViewGroup[@resource-id="undefined-open-button"]/com.horcrux.svg.SvgView

    Wait Until Element Is Visible    ${el}    30

    Click Element    ${el}

Selecionar uma data futura
   Sleep    1

   ${date_format} =    Set Variable    %d
   ${data_atual} =    Get Current Date    result_format=${date_format}

   ${dia_atual} =    Convert To Integer    ${data_atual}
   ${um_dia_depois} =    Set Variable    ${dia_atual + 1}

   ${dia} =    Set Variable    xpath=//android.widget.TextView[@text="${um_dia_depois}"]
   Click Element    ${dia}

   ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="undefined-button"]
   Wait Until Element Is Visible    ${el}    30
   Click Element    ${el}

