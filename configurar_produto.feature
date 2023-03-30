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
    
    Cenário: Deve validar obrigatoriedade de seleção de cor, tamanho e quantidade do produto
        Quando eu não seleciono <campo>, seleciono os demais campos obrigatórios e clico no botão Comprar
            | campo      |
            | cor        |
            | tamanho    |
            | quantidade |
        Então o sistema não adiciona o produto ao carrinho e exibe uma mensagem de erro informando que a seleção do campo faltante é obrigatória

    Esquema do Cenário: Deve permitir até 10 produtos por venda
        Quando já adicionei <qtdeProdutosAddAoCarrinho> produtos ao carrinho e adiciono mais <qtdeProdutosParaAdd> produtos ao carrinho
        Então o sistema adiciona o produto ao carrinho e apresenta mensagem de sucesso informando que o produto foi adicionado ao carrinho

        Exemplos:
            | qtdeProdutosAddAoCarrinho | qtdeProdutosParaAdd |
            | 8                         | 1                   |
            | 9                         | 1                   |

    Cenário: Não deve permitir mais de 10 produtos por venda
        Quando já adicionei 10 produtos ao carrinho e tento adicionar mais 1 produto ao carrinho
        Então o sistema não adiciona o produto ao carrinho e exibe uma mensagem de erro informando que número máximo de produtos por venda foi atingido

    Cenário: Deve retornar ao estado original quando clico no botão Limpar
        Quando seleciono cor do produto igual a "Preto", tamanho igual a "M", quantidade igual a 2 e clico no botão Limpar
        Então o sistema retorna os campos cor, tamanho e produto ao estado original