*** Settings ***
Documentation

Resource        ../../src/config/package.resource


*** Variables ***
${DESCRICAO}    Características:  - Marca: Redragon  - Modelo: K552  Especificações:  - Teclado Mecânico de Alto Desempenho
...    - 12 Teclas para controle Multimídia
...    - Controle de Iluminação "On-The-Fly"
...    - Sistema Nº Key Rollover para Anti-Ghosting em 100% das Teclas
...    - Funcionamento da Tecla Win Alternável (Pressione FN+Win para Desligar / Ligar a Tecla)
...    - Padrão ABNT2 - Feito Especialmente para o Mercado Brasileiro
...    - O primeiro do Mundo em ABNT2 com teclas Padrão Double Injection
...    - Fabricado com o Renomado Switch Mecânico Outemu: Brown
...    - Outemu Brown: Feedback Tátil, Resistência Média, Sem Clique Audível
...    - Iluminação com Leds Vermelhos
...    - Construção Robusta em Metal e Plástico ABS para maior Durabilidade
...    - Switch removível


${DESCRICAO_EDITADA}        Monitor Gamer AOC DESTINY 25" 240Hz 0,5ms FreeSync Premium 25G3ZM

*** Keywords ***
Validar pagina deve conter o title
    [Arguments]    ${title}
    Title Should Be    Teste automação QA

Deve poder clicar no botao Adicionar Produto
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[1]/button    5s
    Click Button                     xpath=//*[@id="root"]/div/div[1]/button

Validar se abriu modal com formulario para cadastro
    Wait Until Element Contains    xpath=//h2[contains(text(), "Cadastrar Produto")]    Cadastrar Produto    5s

Preencher formulario campo Nome
    [Arguments]    ${produto}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[1]/label    5s
    Wait Until Element Is Visible    xpath=//input[@placeholder="Digite o nome do produto"]    5s
    Input Text    xpath=//input[@placeholder="Digite o nome do produto"]    ${produto}

    Set Global Variable    ${NOME_PRODUTO}    ${produto}        # robotcode: ignore

Preencher formulario campo Preco
    [Arguments]    ${valor}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/label    5s
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/input    5s
    Input Text                       xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/input    ${valor}

    Set Global Variable    ${VALOR_PRODUTO}    ${valor}        # robotcode: ignore

Preencher formulario campo Descricao
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[3]/label    5s
    Wait Until Element Is Visible    xpath=//textarea[@placeholder="Descreva o produto"]    5s
    Input Text                       xpath=//textarea[@placeholder="Descreva o produto"]    ${DESCRICAO}

    Set Global Variable    ${TEXTO_DESCRICAO}    ${DESCRICAO}        # robotcode: ignore

Deve poder clicar no botao Salvar
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[4]/button[2]    5s
    Click Button                     xpath=//*[@id="root"]/div/div[3]/div/form/div[4]/button[2]

Validar tela de Produtos Cadastrados
    Wait Until Element Contains    xpath=//h3[contains(text(), "Produtos Cadastrados")]    Produtos Cadastrados    5s

Validar Produtos Cadastrados
    Wait Until Element Is Visible              xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/strong
    ${produto_cadastrado}        Get Text      xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/strong

    Should Be Equal    ${produto_cadastrado}    ${NOME_PRODUTO}    # robotcode: ignore
    Log                ${produto_cadastrado}
    Log                ${NOME_PRODUTO}                             # robotcode: ignore

Validar Valor do Produto Cadastrado
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]    160.00
    Log                ${VALOR_PRODUTO}                             # robotcode: ignore

Validar Descricao do Produto Cadastrado
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/p    5s
    ${descricao_cadastrada}    Get Text    xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/p

    Should Be Equal    ${descricao_cadastrada}    ${TEXTO_DESCRICAO}    # robotcode: ignore
    Log                ${descricao_cadastrada}
    Log                ${TEXTO_DESCRICAO}                             # robotcode: ignore


    ###################    Cenário 02    ###################

Deve poder clicar no botao Editar
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/ul/li/div[2]/button[1]    5s
    Click Button                     xpath=//*[@id="root"]/div/div[2]/ul/li/div[2]/button[1]

Validar se abriu modal com formulario para Editar Produto
    Wait Until Element Contains    xpath=//h2[contains(text(), "Editar Produto")]    Editar Produto    5s

Deve poder editar formulario campo Nome
    [Arguments]    ${produto_editado}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[1]/label    5s
    Input Text    xpath=//input[@placeholder="Digite o nome do produto"]    ${produto_editado}

    Set Global Variable    ${NOME_PRODUTO_EDITADO}    ${produto_editado}        # robotcode: ignore

Deve poder editar formulario campo Preco
    [Arguments]    ${valor_editado}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/label    5s
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/input    5s
    Input Text                       xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/input    ${valor_editado}

    Set Global Variable    ${VALOR_PRODUTO_EDITADO}    ${valor_editado}        # robotcode: ignore

Deve poder editar formulario campo Descricao
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[3]/label    5s
    Wait Until Element Is Visible    xpath=//textarea[@placeholder="Descreva o produto"]    5s
    Input Text                       xpath=//textarea[@placeholder="Descreva o produto"]    ${DESCRICAO_EDITADA}

Validar Produto editado
    Wait Until Element Is Visible              xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/strong
    ${captura_produto_editado}        Get Text      xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/strong

    Should Be Equal    ${captura_produto_editado}    ${NOME_PRODUTO_EDITADO}    # robotcode: ignore
    Log                ${captura_produto_editado}
    Log                ${NOME_PRODUTO_EDITADO}                             # robotcode: ignore

Validar Valor editado
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]    ${VALOR_PRODUTO_EDITADO}    # robotcode: ignore
    Log                ${VALOR_PRODUTO_EDITADO}                             # robotcode: ignore

Validar Descricao editada
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/p    5s
    ${captura_descricao_editada}    Get Text    xpath=//*[@id="root"]/div/div[2]/ul/li/div[1]/p

    Should Be Equal    ${captura_descricao_editada}    ${DESCRICAO_EDITADA}    # robotcode: ignore
    Log                ${captura_descricao_editada}
    Log                ${DESCRICAO_EDITADA}                             # robotcode: ignore


    ###################    Cenário 03    ###################

Deve poder clicar no botao Excluir
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/ul/li/div[2]/button[2]    5s
    Click Button                     xpath=//*[@id="root"]/div/div[2]/ul/li/div[2]/button[2]

Validar pagina sem produtos cadastrados
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div[2]/p    Nenhum produto cadastrado.    5s


    ###################    Cenário 04    ###################

Devera ser exibida mensagem de obrigatoriedade no campo Nome
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div[3]/div/form/div[1]/p    Nome é obrigatório    5s

Devera ser exibida mensagem de obrigatoriedade no campo Preco
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/p    Preço deve ser positivo    5s


    ###################    Cenário 05    ###################

Preencher campo Nome alfanumerico
    [Arguments]    ${alfanumerico}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[1]/label    5s
    Wait Until Element Is Visible    xpath=//input[@placeholder="Digite o nome do produto"]    5s
    Input Text    xpath=//input[@placeholder="Digite o nome do produto"]    ${alfanumerico}

Preencher campo Preco com valor
    [Arguments]    ${valor_e}
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/label    5s
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/input    5s
    Input Text                       xpath=//*[@id="root"]/div/div[3]/div/form/div[2]/input    ${valor_e}

Devera exibir mensagem de obrigatoriedade no campo Preco
    [Arguments]    ${mensagem}
    Should Be Equal As Strings    ${mensagem}    Digite um número.


    ###################    Cenário 06   ###################




    ###################    Cenário 07   ###################
Validando lista de produtos cadastrados
    Capture Page Screenshot
