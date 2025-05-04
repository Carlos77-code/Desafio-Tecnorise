*** Settings ***
Documentation

Resource        ../../src/page/page_cadastro_produto.resource
Resource        ../../src/config/hooks.resource

Test Setup       Abrir navegador
Test Teardown    Fechar navegador


*** Test cases ***
Cenario 01: Cadastro de produto dados validos
    [Tags]    cadastro_dados_validos
    Validar pagina deve conter o title    Teste automação QA
    Deve poder clicar no botao Adicionar Produto
    Validar se abriu modal com formulario para cadastro
    Preencher formulario campo Nome    Teclado
    Preencher formulario campo Preco    160.00
    Preencher formulario campo Descricao
    Deve poder clicar no botao Salvar
    Validar tela de Produtos Cadastrados
    Validar Produtos Cadastrados
    Validar Valor do Produto Cadastrado
    Validar Descricao do Produto Cadastrado

Cenario 02: Editar Cadastro de produto
    [Tags]    editar_cadastro
    Deve poder clicar no botao Adicionar Produto
    Validar se abriu modal com formulario para cadastro
    Preencher formulario campo Nome    Teclado
    Preencher formulario campo Preco    160.00
    Preencher formulario campo Descricao
    Deve poder clicar no botao Salvar
    Validar tela de Produtos Cadastrados
    Validar Produtos Cadastrados
    Validar Valor do Produto Cadastrado
    Validar Descricao do Produto Cadastrado
    Deve poder clicar no botao Editar
    Validar se abriu modal com formulario para Editar Produto
    Deve poder editar formulario campo Nome    Monitor
    Deve poder editar formulario campo Preco    1569.32
    Deve poder editar formulario campo Descricao
    Deve poder clicar no botao Salvar
    Validar tela de Produtos Cadastrados
    Validar Produto editado
    Validar Valor editado
    Validar Descricao editada

Cenario 03: Excluir Cadastro de produto
    [Tags]    excluir_cadastro
    Deve poder clicar no botao Adicionar Produto
    Validar se abriu modal com formulario para cadastro
    Preencher formulario campo Nome    Teclado
    Preencher formulario campo Preco    160.00
    Preencher formulario campo Descricao
    Deve poder clicar no botao Salvar
    Validar tela de Produtos Cadastrados
    Validar Produtos Cadastrados
    Validar Valor do Produto Cadastrado
    Validar Descricao do Produto Cadastrado
    Deve poder clicar no botao Excluir
    Validar pagina sem produtos cadastrados

Cenario 04: Cadastro de produto campos em branco
    [Tags]    cadastro_campos_vazios
    Deve poder clicar no botao Adicionar Produto
    Validar se abriu modal com formulario para cadastro
    Deve poder clicar no botao Salvar
    Devera ser exibida mensagem de obrigatoriedade no campo Nome
    Devera ser exibida mensagem de obrigatoriedade no campo Preco

Cenario 05: Cadastro de produto dados invalidos
    [Tags]    cadastro_dados_invalidos
    Deve poder clicar no botao Adicionar Produto
    Validar se abriu modal com formulario para cadastro
    Preencher campo Nome alfanumerico    5191sefvcwefw#$#$@
    Preencher campo Preco com valor      e
    Preencher formulario campo Descricao
    Deve poder clicar no botao Salvar
    Devera exibir mensagem de obrigatoriedade no campo Preco    Digite um número.

Cenario 06: Cadastro de produto campos Nome em branco
    [Tags]    campos_nome_vazios
    Deve poder clicar no botao Adicionar Produto
    Validar se abriu modal com formulario para cadastro
    Preencher formulario campo Preco    160.00
    Preencher formulario campo Descricao
    Deve poder clicar no botao Salvar
    Devera ser exibida mensagem de obrigatoriedade no campo Nome

Cenario 07: Cadastros multiplos de produto dados validos
    [Tags]    cadastrar_multiplos_produtos
    FOR    ${i}    IN RANGE    1    11
        Validar pagina deve conter o title    Teste automação QA
        Deve poder clicar no botao Adicionar Produto
        Validar se abriu modal com formulario para cadastro
        Preencher formulario campo Nome    Teclado
        Preencher formulario campo Preco    160.00
        Preencher formulario campo Descricao
        Deve poder clicar no botao Salvar
        Validar tela de Produtos Cadastrados
        Validar Produtos Cadastrados
        Validar Valor do Produto Cadastrado
        Validar Descricao do Produto Cadastrado
    END
    Validando lista de produtos cadastrados
