#language: pt

Funcionalidade: Configurar produto

    Como cliente da EBAC-SHOP
    Quero configurar meu produto de acordo com meu tamanho e gosto
    E escolher a quantidade
    Para depois inserir no carrinho

    Critérios de aceite:
    1 - Seleções de cor, tamanho e quantidade devem ser obrigatórios
    2 - Deve permitir apenas 10 produtos por venda
    3 - Quando eu clicar no botão "Limpar" deve voltar ao estado original

    Contexto:
        Dado que estou na página do produto
    
    Cenário: Deve validar obrigatoriedade de seleção de cor do produto
        E seleciono tamanho do produto igual a "M"
        E seleciono quandidade do produto igual a 1
        Mas não seleciono uma cor para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de cor é obrigatória
        E o sistema não deve adicionar o produto ao carrinho

    Cenário: Deve validar obrigatoriedade de seleção de tamanho do produto
        E seleciono cor do produto igual a "Preto"
        E seleciono quantidade do produto igual a 2
        Mas não seleciono um tamanho para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de tamanho é obrigatória
        E o sistema não deve adicionar o produto ao carrinho

    Cenário: Deve validar obrigatoriedade de seleção de quantidade do produto
        E seleciono cor do produto igual a "Preto"
        E seleciono tamanho do produto igual a "M"
        Mas não seleciono uma quantidade para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de quantidade é obrigatória
        E o sistema não deve adicionar o produto ao carrinho
    
    Cenário: Deve validar obrigatoriedade de seleção de cor e tamanho do produto
        E seleciono quantidade do produto igual a 3
        Mas não seleciono uma cor e um tamanho para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de cor e tamanho é obrigatória
        E o sistema não deve adicionar o produto ao carrinho
    
    Cenário: Deve validar obrigatoriedade de seleção de cor e quantidade do produto
        E seleciono tamanho do produto igual a "M"
        Mas não seleciono uma cor e uma quantidade para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de cor e quantidade é obrigatória
        E o sistema não deve adicionar o produto ao carrinho
    
    Cenário: Deve validar obrigatoriedade de seleção de tamanho e quantidade
        E seleciono cor do produto igual a "Preto"
        Mas não seleciono um tamanho e uma quantidade para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de tamanho e quantidade é obrigatória
        E o sistema não deve adicionar o produto ao carrinho
    
    Cenário: Deve validar obrigatoriedade de seleção de cor, tamanho e quantidade
        E não seleciono uma cor, um tamanho e uma quantidade para o produto
        Quando clico no botão Comprar
        Então o sistema deve exibir uma mensagem de erro informando que a seleção de cor, tamanho e quantidade é obrigatória
        E o sistema não deve adicionar o produto ao carrinho
    
    Cenário: Deve adicionar o produto ao carrinho quando cor, tamanho e quantidade são selecionados
        E seleciono cor do produto igual a "Preto"
        E seleciono tamanho do produto igual a "M"
        E seleciono quantidade do produto igual a 2
        Quando clico no botão Comprar
        Então o sistema adiciona o produto ao carrinho
        E apresenta mensagem de sucesso informando que o produto foi adicionado ao carrinho  

    Esquema do Cenário: Deve permitir até 10 produtos por venda
        E já adicionei <qtdeProdutosAddAoCarrinho> produtos ao carrinho
        Quando adiciono mais <qtdeProdutosParaAdd> produtos ao carrinho
        Então o sistema adiciona o produto ao carrinho
        E apresenta mensagem de sucesso informando que o produto foi adicionado ao carrinho

        Exemplos:
            | qtdeProdutosAddAoCarrinho | qtdeProdutosParaAdd |
            | 8                         | 1                   |
            | 9                         | 1                   |
            | 1                         | 3                   |
            | 6                         | 4                   |
            | 2                         | 6                   |

    Esquema do Cenário: Não deve permitir mais de 10 produtos por venda
        E já adicionei <qtdeProdutosAddAoCarrinho> produtos ao carrinho
        Quando adiciono mais <qtdeProdutosParaAdd> produtos ao carrinho
        Então o sistema deve exibir uma mensagem de erro informando que número máximo de produtos por venda foi atingido
        E o sistema não deve adicionar o produto ao carrinho

        Exemplos:
            | qtdeProdutosAddAoCarrinho | qtdeProdutosParaAdd |
            | 10                        | 1                   |
            | 9                         | 2                   |
            | 6                         | 6                   |
            | 8                         | 5                   |
            | 4                         | 7                   |

    Cenário: Deve retornar ao estado original quando clico no botão Limpar
        E seleciono cor do produto igual a "Preto"
        E seleciono tamanho do produto igual a "M"
        E seleciono quantidade do produto igual a 2
        Quando clico no botão Limpar
        Então o sistema retorna os campos cor, tamanho e produto ao estado original