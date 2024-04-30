*** Settings ***
Documentation       Suite contendo os testes de login

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve efetuar login com sucesso
    [Tags]    suc

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Acessar app    ${data}[login][sucesso][cpf]    ${data}[login][sucesso][senha]

Nao deve logar com CPF inválido
    [Tags]    inv

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Tentar acessar app    ${data}[login][invalido][cpf]
    Mensagem de alerta    Esse CPF está inválido.

Deve criar nova senha - esqueci senha usuario
    [Tags]    esq

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Trocar senha do app
    ...    cpf=${data}[login][esqueci][cpf]
    ...    senha=${data}[login][esqueci][senha]
    ...    confirm_senha=${data}[login][esqueci][confirma]
