
@login
Feature: Remover filme
    Para que eu possa manter o catálogo atualizado  
    Sendo um gestor de catálogo que encontrou um titulo cancelado/indesejado ou que não tem bom feedback
    Posso remover este item 

  
    Scenario: Confirmar exclusão 

        Given que "dbz" está catálogo
        When eu solicito a exclusão
        And eu confirmo a solicitação    
        Then este item deve ser removida do catálogo

    @rm_movie
    Scenario: Cancelar exclusão

        Given que "10_coisas" está catálogo
        When eu solicito a exclusão
        But cancelo a solicitação
        Then este item deve permanecer no catálogo
