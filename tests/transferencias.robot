*** Settings ***
Documentation       Suite contendo os testes de transferencia PIX, TED e P2P

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve visualizar saldo da conta
    [Tags]    saldo

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]
    Exibir saldo

Deve realizar transferencia PIX
    [Tags]    pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Transferencia PIX chave CPF/CNPJ
    ...    chave=${data}[transferencia][pix][chave]
    ...    valor=${data}[transferencia][pix][valor]
    ...    desc=${data}[transferencia][pix][descricao]

    Mensagem esperada Pix realizado com sucesso    message=Pix realizado com sucesso!

Deve realizar transferencia TED por favorecido
    [Tags]    ted

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Transferencia por TED
    ...    contato=${data}[transferencia][ted][contato]
    ...    valor=${data}[transferencia][ted][valor]

    Mensagem esperada Ted realizado com sucesso    message=Transferência realizada com sucesso!

Deve realizar transferencia P2P
    [Tags]    p2p

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Transferencia por P2P
    ...    conta=${data}[transferencia][p2p][conta]
    ...    valor=${data}[transferencia][p2p][valor]
    Mensagem transferência realizada com sucesso    message=Transferência realizada com sucesso!

Deve realizar agendamento de transferencia PIX
    [Tags]    pix_age

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Agendamento PIX chave CPF/CNPJ
    ...    chave=${data}[transferencia][pix_age][chave]
    ...    valor=${data}[transferencia][pix_age][valor]
    ...    desc=${data}[transferencia][pix_age][descricao]

    Mensagem esperada Pix agendado    message=Pix agendado com sucesso!

Deve realizar agendamento de transferencia P2P
    [Tags]    p2p_age

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Agendamento por P2P
    ...    conta=${data}[transferencia][p2p_age][conta]
    ...    valor=${data}[transferencia][p2p_age][valor]

    Mensagem esperada P2P agendado    message=Transferência agendada com sucesso!

Deve realizar transferencia TED novo favorecido
    [Tags]    ted_nov

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Novo favorecido ted
    ...    ${data}[transferencia][ted_novo][banco]
    ...    ${data}[transferencia][ted_novo][agencia]
    ...    ${data}[transferencia][ted_novo][conta]
    ...    ${data}[transferencia][ted_novo][dig]
    ...    ${data}[transferencia][ted_novo][nome]
    ...    ${data}[transferencia][ted_novo][doc]
    ...    ${data}[transferencia][ted_novo][valor]

    Mensagem esperada Ted realizado com sucesso    message=Transferência realizada com sucesso!

Deve realizar agendamento de transferencia TED
        [Tags]    ted_age

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transferencia.json    encoding=utf-8

    Acessar app    cpf=${data}[transferencia][login][cpf]    senha=${data}[transferencia][login][senha]

    Agendamento por TED
    ...    contato=${data}[transferencia][ted][contato]
    ...    valor=${data}[transferencia][ted][valor]

    Mensagem esperada Ted agendado    message=Transferência agendada com sucesso!
