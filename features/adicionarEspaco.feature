Feature: Adicionar espaços

    As administrador do sistema
    I want to cadastrar novos espaços (salas, laboratórios, auditórios, outros)
    So that eles fiquem disponíveis na área de gerenciamento

    Scenario: Administrador acessa a página de adição de espaço
        Given o administrador está na página inicial
        When clica no botão "Adicionar"
        Then é redirecionado para a página "Adicionar novo espaço"
        And os campos "Tipo" e "Identificador" estão visíveis
        And os botões "Cancelar" e "Adicionar" estão visíveis

    Scenario: Administrador preenche e confirma os dados de um novo espaço
        Given o administrador está na página "Adicionar novo espaço"
        When seleciona o tipo "Laboratórios"
        And preenche o identificador com "Lab 2"
        And clica no botão "Adicionar"
        Then o novo espaço "Lab 2" é adicionado à lista de Laboratórios
        And o administrador é redirecionado para a página inicial
        And o botão "Lab 2" aparece na interface

    Scenario: Administrador tenta adicionar espaço sem preencher o identificador
        Given o administrador está na página "Adicionar novo espaço"
        When seleciona o tipo "Salas"
        And deixa o campo "Identificador" vazio
        And clica no botão "Adicionar"
        Then uma mensagem de erro é exibida indicando que o identificador é obrigatório
        And o espaço não é cadastrado
        And o administrador permanece na página "Adicionar novo espaço"

    Scenario: Administrador cancela o cadastro de novo espaço
        Given o administrador está na página "Adicionar novo espaço"
        When clica no botão "Cancelar"
        Then retorna para a página inicial
        And nenhum novo espaço é cadastrado
