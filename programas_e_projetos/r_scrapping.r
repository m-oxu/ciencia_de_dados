{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "name": "scrapper_2.ipynb",
      "provenance": []
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R"
    },
    "language_info": {
      "name": "R"
    }
  },
  "cells": [
    {
      "cell_type": "code",
      "metadata": {
        "id": "13AilNMuXCYm"
      },
      "source": [
        "library(rvest)\n",
        "library(stringr)\n",
        "library(tidyverse)"
      ],
      "execution_count": 245,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "VDpCQT3Rn75r"
      },
      "source": [
        "html1 <- 'https://www.boatos.org/saude/enfermeira-nova-ordem-mundial-desligando-oxigenio.html'"
      ],
      "execution_count": 250,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "i5dm8eEHBVgm"
      },
      "source": [
        "raspa_e_salva <- function(url, fake_or_real){\n",
        "    #Pega o título da matéria\n",
        "    html <- read_html(url)\n",
        "\n",
        "    processa_titulo <- html %>%\n",
        "        html_nodes('title')\n",
        "        titulo_limpo <- html_text(processa_titulo)\n",
        "\n",
        "    #Pega o texto\n",
        "    processa_texto <- html %>%\n",
        "        html_nodes('.red')\n",
        "        texto_limpo <- html_text(processa_texto)\n",
        "\n",
        "    #tabela <- rbind(tabela, tibble(titulos = titulo,\n",
        "    df <- data.frame(titulos = titulo_limpo,\n",
        "        textos = texto_limpo,\n",
        "        verdadeira = fake_or_real\n",
        "    )\n",
        "}"
      ],
      "execution_count": 255,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "r-eo8BqdBpum"
      },
      "source": [
        "# O que esse programa pode fazer? Basicamente, a mesma coisa que o scrapper em Python,\n",
        "# mas várias vezes mais fácil e incomparavelmente mais limpo. A função raspa_e_salva()\n",
        "# fará todo o trabalho para nós. Crie uma variável, em nosso exemplo será 'df'. Chame\n",
        "# a função raspa_e_salva() onde ela recebe como parâmetro a sua URL, e se a notícia\n",
        "# é verdadeira ou falsa. Ela raspa o texto e já salva como um dataframe!"
      ],
      "execution_count": 248,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "93ft3H1ZFQo-"
      },
      "source": [
        "noticia <- raspa_e_salva('https://www.boatos.org/saude/enfermeira-nova-ordem-mundial-desligando-oxigenio.html', 1)"
      ],
      "execution_count": 256,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 251
        },
        "id": "gTw58D8cFWa4",
        "outputId": "419d5e6f-8606-4134-b2ca-ec77901c9570"
      },
      "source": [
        "noticia"
      ],
      "execution_count": 257,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "  titulos                                                                                            \n",
              "1 Enfermeira denuncia que Nova Ordem Mundial está desligando oxigênio de pacientes de Covid-19 #boato\n",
              "  textos                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \n",
              "1 ENFERMEIRA ARRISCA O EMPREGO E A VIDA, E FAZ DENÚNCIA CABULOSA! “Estão matando todo mundo aí dentro”, “Cadê os direitos humanos?”…. É o que disse as corajosas enfermeiras. Entubam as pessoas e baixam o oxigênio, essa é a técnica que a Nova Ordem Mundial está impondo nos hospitais. E Vc? Também teve parentes assassinados nos hospitais? Eles não querem nos curar, e sim nos matar. A Redução Populacional da Nova Ordem Mundial trabalha assim, desse jeito nos hospitais, peguem a visão. Donos de hospitais, diretores, médicos e enfermeiros matando pessoas em nome de uma macabra agenda, a Agenda 2030 da Nova Ordem Mundial. Infelizmente já sabíamos disso via desdobramento astral, mas tinha que aparecer alguém lá de dentro pra falar essa verdade. Lembrando que essa técnica, esse Modus Operandi está em todos os hospitais e UPAs em todo território nacional, e por esse motivo não liberam o Tratamento Precoce(Ivermectina, Zinco e Hidroxicloroquina) que é ZERO mortes. Mas a culpa é do Presidente da República, não tá vendo?!?!?! Parabéns a essa Guerreira da Luz, e que o Universo dê toda proteção necessária a ela. Divulguem as massas se tiverem coragem!!!!!\n",
              "  verdadeira\n",
              "1 1         "
            ],
            "text/latex": "A data.frame: 1 × 3\n\\begin{tabular}{lll}\n titulos & textos & verdadeira\\\\\n <chr> & <chr> & <dbl>\\\\\n\\hline\n\t Enfermeira denuncia que Nova Ordem Mundial está desligando oxigênio de pacientes de Covid-19 \\#boato & ENFERMEIRA ARRISCA O EMPREGO E A VIDA, E FAZ DENÚNCIA CABULOSA! “Estão matando todo mundo aí dentro”, “Cadê os direitos humanos?”…. É o que disse as corajosas enfermeiras. Entubam as pessoas e baixam o oxigênio, essa é a técnica que a Nova Ordem Mundial está impondo nos hospitais. E Vc? Também teve parentes assassinados nos hospitais? Eles não querem nos curar, e sim nos matar. A Redução Populacional da Nova Ordem Mundial trabalha assim, desse jeito nos hospitais, peguem a visão. Donos de hospitais, diretores, médicos e enfermeiros matando pessoas em nome de uma macabra agenda, a Agenda 2030 da Nova Ordem Mundial. Infelizmente já sabíamos disso via desdobramento astral, mas tinha que aparecer alguém lá de dentro pra falar essa verdade. Lembrando que essa técnica, esse Modus Operandi está em todos os hospitais e UPAs em todo território nacional, e por esse motivo não liberam o Tratamento Precoce(Ivermectina, Zinco e Hidroxicloroquina) que é ZERO mortes. Mas a culpa é do Presidente da República, não tá vendo?!?!?! Parabéns a essa Guerreira da Luz, e que o Universo dê toda proteção necessária a ela. Divulguem as massas se tiverem coragem!!!!! & 1\\\\\n\\end{tabular}\n",
            "text/markdown": "\nA data.frame: 1 × 3\n\n| titulos &lt;chr&gt; | textos &lt;chr&gt; | verdadeira &lt;dbl&gt; |\n|---|---|---|\n| Enfermeira denuncia que Nova Ordem Mundial está desligando oxigênio de pacientes de Covid-19 #boato | ENFERMEIRA ARRISCA O EMPREGO E A VIDA, E FAZ DENÚNCIA CABULOSA! “Estão matando todo mundo aí dentro”, “Cadê os direitos humanos?”…. É o que disse as corajosas enfermeiras. Entubam as pessoas e baixam o oxigênio, essa é a técnica que a Nova Ordem Mundial está impondo nos hospitais. E Vc? Também teve parentes assassinados nos hospitais? Eles não querem nos curar, e sim nos matar. A Redução Populacional da Nova Ordem Mundial trabalha assim, desse jeito nos hospitais, peguem a visão. Donos de hospitais, diretores, médicos e enfermeiros matando pessoas em nome de uma macabra agenda, a Agenda 2030 da Nova Ordem Mundial. Infelizmente já sabíamos disso via desdobramento astral, mas tinha que aparecer alguém lá de dentro pra falar essa verdade. Lembrando que essa técnica, esse Modus Operandi está em todos os hospitais e UPAs em todo território nacional, e por esse motivo não liberam o Tratamento Precoce(Ivermectina, Zinco e Hidroxicloroquina) que é ZERO mortes. Mas a culpa é do Presidente da República, não tá vendo?!?!?! Parabéns a essa Guerreira da Luz, e que o Universo dê toda proteção necessária a ela. Divulguem as massas se tiverem coragem!!!!! | 1 |\n\n",
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A data.frame: 1 × 3</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>titulos</th><th scope=col>textos</th><th scope=col>verdadeira</th></tr>\n",
              "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>Enfermeira denuncia que Nova Ordem Mundial está desligando oxigênio de pacientes de Covid-19 #boato</td><td>ENFERMEIRA ARRISCA O EMPREGO E A VIDA, E FAZ DENÚNCIA CABULOSA! “Estão matando todo mundo aí dentro”, “Cadê os direitos humanos?”…. É o que disse as corajosas enfermeiras. Entubam as pessoas e baixam o oxigênio, essa é a técnica que a Nova Ordem Mundial está impondo nos hospitais. E Vc? Também teve parentes assassinados nos hospitais? Eles não querem nos curar, e sim nos matar. A Redução Populacional da Nova Ordem Mundial trabalha assim, desse jeito nos hospitais, peguem a visão. Donos de hospitais, diretores, médicos e enfermeiros matando pessoas em nome de uma macabra agenda, a Agenda 2030 da Nova Ordem Mundial. Infelizmente já sabíamos disso via desdobramento astral, mas tinha que aparecer alguém lá de dentro pra falar essa verdade. Lembrando que essa técnica, esse Modus Operandi está em todos os hospitais e UPAs em todo território nacional, e por esse motivo não liberam o Tratamento Precoce(Ivermectina, Zinco e Hidroxicloroquina) que é ZERO mortes. Mas a culpa é do Presidente da República, não tá vendo?!?!?! Parabéns a essa Guerreira da Luz, e que o Universo dê toda proteção necessária a ela. Divulguem as massas se tiverem coragem!!!!!</td><td>1</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ]
          },
          "metadata": {
            "tags": []
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "d_Y-bGDDFnUn"
      },
      "source": [
        "noticia2 <- raspa_e_salva('https://www.boatos.org/mundo/franca-nao-tem-vacinacao-so-usa-ivermectina-hidroxicloroquina.html', 1)"
      ],
      "execution_count": 259,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 383
        },
        "id": "-WH8zt9iFuFX",
        "outputId": "ff4511fd-8ef7-4b35-f435-9b1582260cc7"
      },
      "source": [
        "noticia2"
      ],
      "execution_count": 260,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "  titulos                                                                 \n",
              "1 França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato\n",
              "2 França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato\n",
              "3 França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato\n",
              "  textos                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      \n",
              "1 Versão 1: Brasileiro que está em Paris, França, desmente os jornais e a televisão no Brasil sobre vacina. Na França não tem vacina pra ninguém. Tratam o povo com IVERMECTINA e HIDROXICLOROQUINA. Versão 2: Na França, não há confinamento e nem vacinas, há tratamento, que no Brasil foi totalmente politizado Versão 3: BRASILEIROS NA FRANÇA EM PANDEMIA DESMENTEM OS JORNAIS E AS TELEVISÕES Na França não tem vacina pra ninguém. Tratam o povo com ivermectina e hidroxicloroquina… Confira o que disse o rapaz.                                                                                                                                                                                                                                                                                                                                    \n",
              "2 Transcrição: Então mãe. Agora eu tô perto da Torre Eiffel aqui, galera na Rua transito de carro, normal, tá vendo aquela barraquinha aí? Essa barraquinha aí é de teste de Covid. É de graça você faz o teste. Na porta de quase todas as farmácias aqui de Paris tem. Nas cidades em volta não é tanto, mas aqui em toda cidade tem. Pessoal fala que francês não passa no sinal vermelho, ó aí que mentira. Você faz o teste em 15 minutos está pronto, entendeu? Aqui não se fala em vacina. Tanto que a vacina da Pfizer agora foi proibida aqui porque deu, coagulou, deu coágulos em diversas pessoas aqui também. Que era a única que tava sendo usada, vacina da China aqui que não entrou, na França, de jeito nenhum, né? Sputnik, nenhuma. Era só da Pfizer mesmo, mas agora parou também. E não tava tendo campanha de vacinação nenhuma, zero. \n",
              "3 Aqui é teste, deu positivo você já sai com os medicamentos. Aqui eles utilizam muito hidroxicloroquina, zinco, vitamina D, vitamina C, anticoagulante. São seis, se eu não me engano. É tratamento, entendeu? Aqui é tratamento. E muita gente usa ivermectina que é para não adoecer, né? Então tem o tratamento precoce e tem o tratamento inicial. Não se fala não vacina aqui na França. Mas é isso. Muita fake News aí no Brasil. Muita mentira. É o que eu falo é, o governo ele fala “vai fazer confinamento”, mas é só de boca para fora, entendeu? Nunca tem nada. Só fala só. Vou fazer outra filmagem aqui no parque na hora que eu chegar.                                                                                                                                                                                                      \n",
              "  verdadeira\n",
              "1 1         \n",
              "2 1         \n",
              "3 1         "
            ],
            "text/latex": "A data.frame: 3 × 3\n\\begin{tabular}{lll}\n titulos & textos & verdadeira\\\\\n <chr> & <chr> & <dbl>\\\\\n\\hline\n\t França não tem vacinação e só usa ivermectina e hidroxicloroquina \\#boato & Versão 1: Brasileiro que está em Paris, França, desmente os jornais e a televisão no Brasil sobre vacina. Na França não tem vacina pra ninguém. Tratam o povo com IVERMECTINA e HIDROXICLOROQUINA. Versão 2: Na França, não há confinamento e nem vacinas, há tratamento, que no Brasil foi totalmente politizado Versão 3: BRASILEIROS NA FRANÇA EM PANDEMIA DESMENTEM OS JORNAIS E AS TELEVISÕES Na França não tem vacina pra ninguém. Tratam o povo com ivermectina e hidroxicloroquina… Confira o que disse o rapaz.                                                                                                                                                                                                                                                                                                                                     & 1\\\\\n\t França não tem vacinação e só usa ivermectina e hidroxicloroquina \\#boato & Transcrição: Então mãe. Agora eu tô perto da Torre Eiffel aqui, galera na Rua transito de carro, normal, tá vendo aquela barraquinha aí? Essa barraquinha aí é de teste de Covid. É de graça você faz o teste. Na porta de quase todas as farmácias aqui de Paris tem. Nas cidades em volta não é tanto, mas aqui em toda cidade tem. Pessoal fala que francês não passa no sinal vermelho, ó aí que mentira. Você faz o teste em 15 minutos está pronto, entendeu? Aqui não se fala em vacina. Tanto que a vacina da Pfizer agora foi proibida aqui porque deu, coagulou, deu coágulos em diversas pessoas aqui também. Que era a única que tava sendo usada, vacina da China aqui que não entrou, na França, de jeito nenhum, né? Sputnik, nenhuma. Era só da Pfizer mesmo, mas agora parou também. E não tava tendo campanha de vacinação nenhuma, zero.  & 1\\\\\n\t França não tem vacinação e só usa ivermectina e hidroxicloroquina \\#boato & Aqui é teste, deu positivo você já sai com os medicamentos. Aqui eles utilizam muito hidroxicloroquina, zinco, vitamina D, vitamina C, anticoagulante. São seis, se eu não me engano. É tratamento, entendeu? Aqui é tratamento. E muita gente usa ivermectina que é para não adoecer, né? Então tem o tratamento precoce e tem o tratamento inicial. Não se fala não vacina aqui na França. Mas é isso. Muita fake News aí no Brasil. Muita mentira. É o que eu falo é, o governo ele fala “vai fazer confinamento”, mas é só de boca para fora, entendeu? Nunca tem nada. Só fala só. Vou fazer outra filmagem aqui no parque na hora que eu chegar.                                                                                                                                                                                                       & 1\\\\\n\\end{tabular}\n",
            "text/markdown": "\nA data.frame: 3 × 3\n\n| titulos &lt;chr&gt; | textos &lt;chr&gt; | verdadeira &lt;dbl&gt; |\n|---|---|---|\n| França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato | Versão 1: Brasileiro que está em Paris, França, desmente os jornais e a televisão no Brasil sobre vacina. Na França não tem vacina pra ninguém. Tratam o povo com IVERMECTINA e HIDROXICLOROQUINA. Versão 2: Na França, não há confinamento e nem vacinas, há tratamento, que no Brasil foi totalmente politizado Versão 3: BRASILEIROS NA FRANÇA EM PANDEMIA DESMENTEM OS JORNAIS E AS TELEVISÕES Na França não tem vacina pra ninguém. Tratam o povo com ivermectina e hidroxicloroquina… Confira o que disse o rapaz.                                                                                                                                                                                                                                                                                                                                     | 1 |\n| França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato | Transcrição: Então mãe. Agora eu tô perto da Torre Eiffel aqui, galera na Rua transito de carro, normal, tá vendo aquela barraquinha aí? Essa barraquinha aí é de teste de Covid. É de graça você faz o teste. Na porta de quase todas as farmácias aqui de Paris tem. Nas cidades em volta não é tanto, mas aqui em toda cidade tem. Pessoal fala que francês não passa no sinal vermelho, ó aí que mentira. Você faz o teste em 15 minutos está pronto, entendeu? Aqui não se fala em vacina. Tanto que a vacina da Pfizer agora foi proibida aqui porque deu, coagulou, deu coágulos em diversas pessoas aqui também. Que era a única que tava sendo usada, vacina da China aqui que não entrou, na França, de jeito nenhum, né? Sputnik, nenhuma. Era só da Pfizer mesmo, mas agora parou também. E não tava tendo campanha de vacinação nenhuma, zero.  | 1 |\n| França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato | Aqui é teste, deu positivo você já sai com os medicamentos. Aqui eles utilizam muito hidroxicloroquina, zinco, vitamina D, vitamina C, anticoagulante. São seis, se eu não me engano. É tratamento, entendeu? Aqui é tratamento. E muita gente usa ivermectina que é para não adoecer, né? Então tem o tratamento precoce e tem o tratamento inicial. Não se fala não vacina aqui na França. Mas é isso. Muita fake News aí no Brasil. Muita mentira. É o que eu falo é, o governo ele fala “vai fazer confinamento”, mas é só de boca para fora, entendeu? Nunca tem nada. Só fala só. Vou fazer outra filmagem aqui no parque na hora que eu chegar.                                                                                                                                                                                                       | 1 |\n\n",
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A data.frame: 3 × 3</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>titulos</th><th scope=col>textos</th><th scope=col>verdadeira</th></tr>\n",
              "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato</td><td>Versão 1: Brasileiro que está em Paris, França, desmente os jornais e a televisão no Brasil sobre vacina. Na França não tem vacina pra ninguém. Tratam o povo com IVERMECTINA e HIDROXICLOROQUINA. Versão 2: Na França, não há confinamento e nem vacinas, há tratamento, que no Brasil foi totalmente politizado Versão 3: BRASILEIROS NA FRANÇA EM PANDEMIA DESMENTEM OS JORNAIS E AS TELEVISÕES Na França não tem vacina pra ninguém. Tratam o povo com ivermectina e hidroxicloroquina… Confira o que disse o rapaz.                                                                                                                                                                                                                                                                                                                                    </td><td>1</td></tr>\n",
              "\t<tr><td>França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato</td><td>Transcrição: Então mãe. Agora eu tô perto da Torre Eiffel aqui, galera na Rua transito de carro, normal, tá vendo aquela barraquinha aí? Essa barraquinha aí é de teste de Covid. É de graça você faz o teste. Na porta de quase todas as farmácias aqui de Paris tem. Nas cidades em volta não é tanto, mas aqui em toda cidade tem. Pessoal fala que francês não passa no sinal vermelho, ó aí que mentira. Você faz o teste em 15 minutos está pronto, entendeu? Aqui não se fala em vacina. Tanto que a vacina da Pfizer agora foi proibida aqui porque deu, coagulou, deu coágulos em diversas pessoas aqui também. Que era a única que tava sendo usada, vacina da China aqui que não entrou, na França, de jeito nenhum, né? Sputnik, nenhuma. Era só da Pfizer mesmo, mas agora parou também. E não tava tendo campanha de vacinação nenhuma, zero. </td><td>1</td></tr>\n",
              "\t<tr><td>França não tem vacinação e só usa ivermectina e hidroxicloroquina #boato</td><td>Aqui é teste, deu positivo você já sai com os medicamentos. Aqui eles utilizam muito hidroxicloroquina, zinco, vitamina D, vitamina C, anticoagulante. São seis, se eu não me engano. É tratamento, entendeu? Aqui é tratamento. E muita gente usa ivermectina que é para não adoecer, né? Então tem o tratamento precoce e tem o tratamento inicial. Não se fala não vacina aqui na França. Mas é isso. Muita fake News aí no Brasil. Muita mentira. É o que eu falo é, o governo ele fala “vai fazer confinamento”, mas é só de boca para fora, entendeu? Nunca tem nada. Só fala só. Vou fazer outra filmagem aqui no parque na hora que eu chegar.                                                                                                                                                                                                      </td><td>1</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ]
          },
          "metadata": {
            "tags": []
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "YHN7mcBLFwds"
      },
      "source": [
        ""
      ],
      "execution_count": null,
      "outputs": []
    }
  ]
}