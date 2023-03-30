#language: pt

Funcionalidade: Tela de Cadastro - Checkout

    Como cliente da EBAC-SHOP
    Quero concluir meu cadastro
    Para finalizar minha compra

    Critérios de aceite:
    1 - Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos
    2 - Não deve permitir campo e-mail com formato inválido. Sistema deve inserir uma mensagem de erro
    3 - Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta

    Contexto:
        Dado que estou na tela de checkout

    Esquema do Cenário: Deve realizar cadastro quando todos os campos obrigatórios são preenchidos corretamente
        Quando eu preencho os campos obrigatórios de cadastro com os seguintes valores e clico no botão Finalizar Compra:
            | nome   | sobrenome | pais       | endereco | cidade   | cep      | telefone    | enderecoDeEmail  |
            | Pamela | Almeida   | Brasil     | Rua ABC  | Curitiba | 67890000 | 41565788909 | pamela@email.com |
            | Denis  | Karolak   | Inglaterra | Rua DEF  | Londres  | 45332123 | 5674351290  | denis@email.com  |
        Então o sistema realiza meu cadastro para finalizar minha compra
    
    Cenário: Não deve realizar cadastro quando os campos obrigatórios não são preenchidos
        Quando eu não preencho os campos obrigatórios de cadastro e clico no botão Finalizar Compra
        Então o sistema não realiza meu cadastro para finalizar minha compra e exibe uma mensagem de erro informando que sobre a obrigatoriedade do preenchimento dos campos assinalados com asteriscos 
    
    Esquema do Cenário: Não deve realizar cadastro quando o e-mail é informado com formato inválido
        Quando eu preencho todos os campos obrigatórios, preencho o <email> com formato inválido e clico no botão Finalizar compra
            | enderecoDeEmail |
            | @email.com      |
            | pamela@.com     |
            | pamela@email.   |
            | pamela@email    |
            | pamelaemail     |
            | pamelaemail.com |
            | pamela@emailcom |
            | @email          |
            | @.com           |
        Então o sistema não realiza meu cadastro e exibe uma mensagem de erro informando que o formato do e-mail informado está incorreto
    
    Cenário: Não deve realizar cadastro quando nenhum campo de cadastro é preenchido
        Quando eu não preencho nenhum campo de cadastro e clico no botão Finalizar Compra
        Então o sistema não realiza meu cadastro para finalizar minha compra e exibe uma mensagem de erro informando que sobre a obrigatoriedade do preenchimento dos campos assinalados com asteriscos 