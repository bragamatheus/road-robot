*** Settings ***
Documentation       Arquivo base do projeto

Library             AppiumLibrary
Library             JSONLibrary
Resource            actions/login.resource
Resource            actions/pix.resource
Resource            actions/ted.resource
Resource            actions/perfil.resource
Resource            actions/communs.resource
Resource            actions/p2p.resource


*** Keywords ***
Iniciar sessao
    Set Appium Timeout    30

    Open Application
       ...    https://demo.perfectomobile.com/nexperience/perfectomobile/wd/hub
       ...    app=PRIVATE:road.apk
       ...    deviceName=21151FDEE00420
       ...    perfecto:securityToken=eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YmI4YmZmZS1kMzBjLTQ2MjctYmMxMS0zNTYyMmY1ZDkyMGYifQ.eyJpYXQiOjE3MTA5MzM2NjEsImp0aSI6IjRiOTk3MWYyLTczNGYtNDZhNC1iYjM4LTNjN2MxOTdkODk1YyIsImlzcyI6Imh0dHBzOi8vYXV0aC5wZXJmZWN0b21vYmlsZS5jb20vYXV0aC9yZWFsbXMvZGVtby1wZXJmZWN0b21vYmlsZS1jb20iLCJhdWQiOiJodHRwczovL2F1dGgucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL2RlbW8tcGVyZmVjdG9tb2JpbGUtY29tIiwic3ViIjoiODM1ZjcxY2QtYTU3My00YzNjLTkzMTgtNzg3M2RjZmYyZDBlIiwidHlwIjoiT2ZmbGluZSIsImF6cCI6Im9mZmxpbmUtdG9rZW4tZ2VuZXJhdG9yIiwibm9uY2UiOiJjMTJmYWEzZS1kODY0LTQ4YzEtYTM2Yy01YzA4ZjFjNDM2ZjEiLCJzZXNzaW9uX3N0YXRlIjoiYzg5YTA1MWQtNzExNy00OWM5LWFlNTgtNjUxNTI1OTU0MmNhIiwic2NvcGUiOiJvcGVuaWQgb2ZmbGluZV9hY2Nlc3MifQ.sj6wUUin6ykexveoOdipL47fgVQaAtHg90cEEwVCzWg
       ...    appPackage=br.com.road.qa.app
       ...    appActivity=com.banking.SplashActivity
       ...    autoGrantPermissions=true
       ...    unicodeKeyboard=true
       ...    platformName=Android
       ...    automationName=appium
    
    
    #...    http://127.0.0.1:4723
    #...    platformName=Android
    #...    deviceName=emulator-5554
    #...    automationName=UIAutomator2
    #...    app=${EXECDIR}/app/2024-04-22T082158.933.apk
    #...    appPackage=br.com.road.qa.app
    #...    appActivity=com.banking.SplashActivity
    #...    autoGrantPermissions=true
    #...    unicodeKeyboard=true


    # Start Screen Recording

Finalizar sessao
    Sleep    2
    Capture Page Screenshot
    # Stop Screen Recording
    Close Application
