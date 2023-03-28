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
        E preencho os campos obrigatórios de cadastro com os seguintes valores:
            | nome   | sobrenome | pais       | endereco | cidade   | cep      | telefone    | enderecoDeEmail  |
            | Pamela | Almeida   | Brasil     | Rua ABC  | Curitiba | 67890000 | 41565788909 | pamela@email.com |
            | Denis  | Karolak   | Inglaterra | Rua DEF  | Londres  | 45332123 | 5674351290  | denis@email.com  |
        Quando eu clico no botão Finalizar Compra
        Então o sistema realiza meu cadastro para finalizar minha compra
    
    Cenário: Não deve realizar cadastro quando os campos obrigatórios não são preenchidos
        E não preencho os campos obrigatórios de cadastro
        Quando eu clico no botão Finalizar Compra
        Então o sistema deve exibir uma mensagem de erro informando que sobre a obrigatoriedade do preenchimento dos campos assinalados com asteriscos 
        E o sistema não realiza meu cadastro para finalizar minha compra
    
    Esquema do Cenário: Não deve realizar cadastro quando o e-mail é informado com formato inválido
        E preencho os campos obrigatórios de cadastro com os seguintes valores:
            | nome   | sobrenome | pais   | endereco | cidade   | cep      | telefone    | enderecoDeEmail |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | @email.com      |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | pamela@.com     |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | pamela@email.   |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | pamela@email    |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | pamelaemail     |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | pamelaemail.com |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | pamela@emailcom |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | @email          |
            | Pamela | Inacio    | Brasil | Rua PAM  | Curitiba | 32145009 | 41332114568 | @.com           |
        Quando eu clico no botão Finalizar Compra
        Então o sistema deve exibir uma mensagem de erro informando que o formato do e-mail informado está incorreto
        E o sistema não realiza meu cadastro para finalizar minha compra
    
    Cenário: Não deve realizar cadastro quando nenhum campo de cadastro é preenchido
        E não preencho nenhum campo de cadastro
        Quando eu clico no botão Finalizar Compra
        Então o sistema deve exibir uma mensagem de erro informando que sobre a obrigatoriedade do preenchimento dos campos assinalados com asteriscos 
        E o sistema não realiza meu cadastro para finalizar minha compra