#BDD Desenvolvimento Orientado por Comportamento


Feature: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuario previamente cadastrado
    Posso acessar o sistema com meu email e senha

    @login_happy
    Scenario: Acesso
        When eu faço login com "tony@stark.com" e "pwd123"
        Then devo ser autenticado
        And devo ver "Tony Stark" na área logada

    @login_hapless
    Scenario Outline: Login sem sucesso
        When eu faço login com <email> e <senha>
        Then não devo ser autenticado
        And devo ver a mensagem de alerta <texto>

        Exemples: 
            | email             | senha     | texto                          |
            | "tony@stark.com"  | "abc123"  | "Usuário e/ou senha inválidos" |
            | "404@yahoo.com"   | "abc123"  | "Usuário e/ou senha inválidos" |
            | ""                | "abcxpto" | "Ops. Cadê o email?"           |
            | "teste@gmail.com" | ""        | "Ops. Cadê a senha?"           |

