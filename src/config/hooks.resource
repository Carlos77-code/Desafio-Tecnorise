*** Settings ***
Documentation            Este é o arquivo de configuração do robot

Resource            package.resource
Resource            ../variables/var_globals.resource

*** Keywords ***
Abrir navegador
    Open Browser            ${URL}       ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser