#language: pt

Funcionalidade: Login na plataforma

    Como cliente da EBAC-SHOP
    Quero fazer o login (autenticação) na plataforma
    Para visualizar meus pedidos

    Critérios de aceite:
    1 - Ao inserir dados válidos deve ser direcionado para a tela de checkout
    2 - Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta "Usuário ou senha inválidos"

    Contexto:
        Dado que estou na página de login da plataforma

    Esquema do Cenário: Deve realizar login com sucesso e apresentar a tela de checkout quando usuário e senha informados são válidos
        Quando informo o <username> e a <password> e clico no botão Login
        Então o sistema realiza login na plataforma com sucesso e apresenta a tela de checkout

        Exemplos:
            | username                 | password     |
            | usuariovalido1@teste.com | senhavalida1 |
            | usuariovalido2@teste.com | senhavalida2 |
            | usuariovalido3@teste.com | senhavalida3 |

    Esquema do Cenário: Não deve realizar login e deve exibir mensagem de alerta quando usuário e/ou senha informador são inválidos
        Quando informo o <username> e a <password> e clico no botão Login
        Então o sistema não realiza login na plataforma e apresenta a mensagem de alerta "Usuário ou senha inválidos"

        Exemplos:
            | username                  | password      |
            | usuarioinvalido@teste.com | senhavalida1  |
            | usuariovalido@teste.com   | senhainvalida |
            | null                      | senhavalida2  |
            | usuariovalido3@teste.com  | null          |
            | null                      | null          |