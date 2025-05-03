# Documentação do Projeto de Automação Web

**Autor:** Carlos Antonio de Lima Fernandes

**Data:** 02/05/2025

**Objetivo:** Automatizar o fluxo de cadastro de produtos como desafio técnico para a vaga de QA, assegurando cobertura dos principais fluxos positivos e negativos.


# 1. Estrutura de Pastas do Projeto
``` 
DESAFIO-TECNORISE/
│
├── docs/
│
├── reports/logs/
│   ├── log.html
│   ├── output.xml
│   ├── report.html
│   └── selenium-screenshot-1.png
│
├── src/
│   ├── config/
│   │   ├── hooks.resource
│   │   └── package.resource
│   ├── page/
│   │   └── page_cadastro_produto.resource
│   ├── variables/
│   │   └── var_globals.resource
│
├── test/suites/
│   └── test_cadastro_produto.robot
│
├── venv/
├── README.md
└── requirements.txt
```

# 2. Tecnologias Utilizadas
- Robot Framework: Framework de automação baseado em palavras-chave.

- SeleniumLibrary: Para interação com elementos da interface web.

- VS Code com extensão RobotCode

- Python 3.11 + virtualenv

- Execução local e via terminal

# 3. Setup do Projeto
```
# Clonar repositório
git clone <link-do-repo>

# Criar ambiente virtual
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Instalar dependências
pip install -r requirements.txt

# Executar testes
robot --outputdir reports/logs .\test\suites\test_cadastro_produto.robot
```

# 4. Estratégia de Automação
- Design Pattern Utilizado: Page Object Model com recursos separados por responsabilidade.

- Cobertura: Validações de cadastro, edição, exclusão, campos obrigatórios e entradas inválidas.

- Execução Automatizada: Geração de logs e relatórios HTML e XML após cada execução.

- Mensagens de erro validadas: inclusive tooltips de validação do navegador.

# 5. Testes Automatizados (Detalhamento)
| ID  | Tipo de Teste | Função            | Passo a Passo                                              | Resultado Esperado                                         |
|-----|----------------|-------------------|-------------------------------------------------------------|-------------------------------------------------------------|
| 001 | Web            | Cadastro válido    | Preenche todos os campos com dados válidos e salva         | Produto listado com valor e descrição corretos              |
| 002 | Web            | Edição de produto  | Edita nome, preço e descrição após cadastro                | Produto atualizado na lista                                 |
| 003 | Web            | Exclusão de produto| Após cadastrar, clica em excluir                            | Produto removido da lista                                   |
| 004 | Web            | Campos em branco   | Tenta cadastrar sem preencher nome e preço                  | Mensagens de obrigatoriedade são exibidas                   |
| 005 | Web            | Dados inválidos    | Insere letras no campo de preço                             | Tooltip do navegador: "Digite um número."                   |
| 006 | Web            | Nome em branco     | Apenas preenche preço e descrição                           | Mensagem de obrigatoriedade no campo nome                   |


# Documentação Gerencial – Resumo e Estratégia
### Objetivo
Automatizar o fluxo de cadastro de produtos como desafio técnico para a vaga de QA, assegurando cobertura dos principais fluxos positivos e negativos.

### Escopo Validado

- Cadastro com dados válidos

- Edição e exclusão de produtos

- Validações de campos obrigatórios

- Validação de regras de negócio (ex: tipo numérico no preço)

### Ferramentas Utilizadas

- GitHub como repositório e controle de versão

- Robot Framework com Selenium para testes E2E

- Documentação e evidências automatizadas (log.html, report.html)

### Benefícios da Estratégia

- Modularização favorece reuso de código

- Cobertura de cenários críticos de entrada de dados

- Testes com rápida execução e fácil leitura de relatórios