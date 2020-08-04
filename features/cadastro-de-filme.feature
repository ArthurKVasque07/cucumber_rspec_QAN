@login
Feature: Cadastro de filmes    
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

    @new_movie
    Scenario Outline: Novo filme
        O gestor de catálogo cadastra um novo filme através do formulário,
        e um novo registro é inserido no catálogo NinjaFlix.
        
        Given que <codigo> é um novo filme        
        When eu faço o cadastro deste filme
        Then devo ver o novo filme na lista

    Examples:
        | codigo     | 
        | "ultimato" | 
        | "spider"   |
        | "jocker"   |


    @attempt_movie 
    Scenario Outline: Campos Obrigatórios
        O gestor de catálogo tenta cadastrar um novo filme, mas esquece
        de preencher um dos campos que são obrigatórios, em seguida, o sistema
        exibe uma notificação para o usuário.

        Given que <codigo> é um novo filme        
        When eu faço o cadastro deste filme
        Then devo ver a notificação <texto>

    Examples:
        | codigo      | texto                                               |
        | "no_title"  | "Oops - Filme sem titulo. Pode isso Arnaldo?"       |
        | "no_status" | "Oops - O status deve ser informado!"               |
        | "no_year"   | "Oops - Faltou o ano de lançamento também!"         |
        | "no_date"   | "Oops - Quase lá, só falta a data de estréia!"      |

    @dup_movie
    Scenario: Duplicado
        O gestor de catálogo tenta cadastrar um filme, porem o titulos
        já foi cadastrado em outro momento e o sistema notifica o usuário
        informando que o titulo já existe

        Given que "deadpool2" é um novo filme
        But este filme já existe no catálogo        
        When eu faço o cadastro deste filme
        Then devo ver a notificação "Oops - Este titulo já existe no Ninjaflix."
