*** Settings ***
Documentation       Suite contendo os testes de perfil do app road

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Variables ***
#    app
${senha}                Teste@123
${nova}                 Teste@123
${confirma}             Teste@123
#    cartao
${nova_senha}           3256
${confirma_senha}       3256


*** Test Cases ***
Deve validar dados bancarios no perfil usuario
    [Tags]    banc

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Dados bancarios

Deve validar dados pessoais no perfil usuario
    [Tags]    pess

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Dados pessoais

Deve validar segurança no perfil usuario
    [Tags]    seg

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Seguranca

Deve validar informe de rendimentos no perfil usuario
    [Tags]    rend

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Informe de rendimentos

Deve compartilhar perfil usuario
    [Tags]    com

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Compartilhar
    Scroll app

Deve sair da conta perfil usuario
    [Tags]    sai

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Scroll app
    Logoff app

Deve alterar senha do app no perfil usuario
    [Tags]    senha_app

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Seguranca
    Alterar senha do app    ${senha}    ${nova}    ${confirma}

Deve alterar senha do cartão no perfil usuario
    [Tags]    senha_cart

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Seguranca
    Alterar senha do cartao    ${nova_senha}    ${confirma_senha}

Deve validar politicas e termos no perfil usuario
    [Tags]    pol

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Acessar politicas e termos

    Sleep    5

Deve validar politica de privacidade no perfil usuario
    [Tags]    pol_pri

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Acessar politicas e termos
    Politica de privacidade

    Sleep    5

Deve validar Termos de uso no perfil usuario
    [Tags]    term

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Acessar politicas e termos
    Termos de uso

    Sleep    5

Deve validar encerrar conta no perfil do usuario
    [Tags]    enc

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    cpf=${data}[login][sucesso][cpf]    senha=${data}[login][sucesso][senha]
    Perfil do usuario
    Acessar encerrar conta
