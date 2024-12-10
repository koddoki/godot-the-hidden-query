# The Hidden Querry, um jogo Educativo com foco em ensinar SQL

## Motivação

O mercado de jogos de puzzle, embora comumente tido como nichado, apresenta um grande potencial. Jogos independentes como Snakebird (Noumenon Games, 2015), Hue (Fiddlesticks Games, 2016) e Cosmic Express (Draknek, 2017) demonstraram esse potencial, acumulando faturamentos superiores a cem mil dólares desde seus respectivos lançamentos. Um elemento comum entre esses jogos é a combinação de desafios intelectuais com uma experiência altamente interativa e responsiva às ações do jogador, criando uma conexão envolvente e imersiva.

Apesar de haver uma grande variedade de jogos gratuitos disponíveis na internet que ensinam SQL, a maioria deles carece de um nível satisfatório de interatividade. Esses jogos frequentemente apresentam conteúdo estático e não conseguem estabelecer uma relação dinâmica com o jogador, tornando o aprendizado menos engajante.

Este projeto busca preencher essa lacuna ao oferecer um jogo educativo que une aprendizado de SQL com uma narrativa cativante e interações reativas às escolhas do jogador. A proposta é transformar o processo de aprendizado em uma experiência divertida e imersiva.

### Fontes

#### Renda produzida por:
* Snakebird: https://steam-revenue-calculator.com/app/357300/snakebird
* Hue: https://games-stats.com/steam/game/hue/
* Cosmic Express: https://games-stats.com/steam/game/cosmic-express/


## Requisitos

### Funcionais

* Editor de querries: O jogo deve incluir uma interface onde o jogador possa escrever, editar e executar consultas SQL.
* Simulador de Banco de Dados: O jogo deve simular um banco de dados, suportando primordialmente SELECTs para os puzzles.
* Sistema de dicas: Caso o jogador tenha dificuldades, o jogo deve reagir por meio de um sistema de dicas.
* Sistema de pontos: Em um desafio, caso o jogador falhe em um desafio, este deverá fornecer menos pontos caso o jogador tente o fazer novamente.
* O jogador deve ser capaz de se movimentar em um mapa 2D através de um sistema de botões que o movem para outras áreas.
* Áreas devem poder ser acessadas múltiplas vezes, acessar a mesma área uma segunda vez em outro momento da narrativa pode conter um desafio diferente.

### Não-Funcionais

* Narrativa: O jogo deve possuir uma narrativa de fundo.
* Portabilidade: O jogo deve ser capaz de funcionar tanto no computador quanto em dispositivos móveis.
* Progresso: O jogo deve ser capaz de salvar o progresso do jogador.
* Níveis de dificuldade: O jogo deve apresentar desafios mais difíceis de uma forma crescente.
* Estilo visual: O jogo deve apresentar um design constante, que uma tela não entre em conflito com outra.
* Arte casual: A arte do jogo deve remeter a jogos casuais.

## Metodologia

 O desenvolvimento do jogo seguiu uma abordagem Ágil Incremental. Adotei o desenvolvimento incremental ao dividir o projeto em pacotes de funcionalidades independentes. Inicialmente, criei o sistema de cutscenes, que lê um arquivo JSON e monta cenas de diálogos, alterando componentes da tela como texto e imagens. Em seguida, desenvolvi a interface gráfica para consultas SQL no banco de dados. Por fim, implementei a parte gráfica do jogo, incluindo a criação dos mapas e integração de todos os módulos.


## Tecnologias

O jogo foi desenvolvido utilizando as seguintes tecnologias:
* Godot Engine e GDScript: Escolhi a Godot por ser uma engine open source, alinhada ao meu interesse em apoiar tecnologias de código aberto. Além disso, sua flexibilidade e eficiência na criação de jogos 2D tornaram-na ideal para este projeto.

* Godot SQLite (Addon): Utilizei este addon para integrar um banco de dados diretamente no projeto, eliminando a necessidade de hospedagem externa. Isso simplifica o desenvolvimento e a portabilidade do jogo.

* Git e GitHub: O controle de versão foi realizado com o Git, garantindo rastreamento eficiente das mudanças no código e colaboração facilitada. O GitHub serviu como repositório central para armazenar e gerenciar o progresso do projeto.

## Modelagem

O projeto foi desenvolvido utilizando a arquitetura orientada a nodes, que é central ao funcionamento do Godot Engine. Cada elemento do jogo, como cenas, interações e sistemas, foi estruturado hierarquicamente em nós (nodes), seguindo o princípio de modularidade e reutilização de componentes.
Diversos componentes dentro do jogo foram reutilizados em múltiplas cenas, houve um grande foco em evitar uma duplicidade de código desnecessárias.

### Transmissão de dados entre nós
Seguindo as boas práticas do Godot, a comunicação entre nós foi realizada utilizando o padrão de "signals" e "listeners". Isso evita o acesso direto entre um nó e seu(s) pais.

* Sinais (Signals): Eventos foram definidos e emitidos para notificar mudanças ou ações importantes, como o término de um diálogo ou a execução bem-sucedida de uma consulta SQL.
* Listeners: Nós interessados em determinados eventos foram configurados para "ouvir" os sinais relevantes e reagir de forma apropriada, garantindo uma comunicação clara e eficiente.

### Tipagem

Embora o GDScript seja fracamente tipado, optei por inferir os tipos de dados sempre que possível. Isso auxilia para aumentar a legibilidade e a evitar erros comuns, especialmente ao lidar com parâmetros e retornos de funções.

## Desafios

O maior desafio do projeto foi, sem dúvida, o desenvolvimento do sistema de cutscenes. Foram necessários múltiplos protótipos até alcançar um resultado satisfatório. O esforço investido nesse sistema foi comparável ao trabalho realizado em todo o restante do projeto, o que torna um pouco frustrante o fato de ele ser algo que aparece com pouca frequência no jogo.

Por outro lado, como desenvolvi todos os componentes de uma forma que funcionem de maneira independente, sem depender de nenhum node pai, acabou ficando extremamente fácil de o reutilizar em outros projetos.

## Trabalhos Futuros

Pretendo continuar o desenvolvimento deste jogo e disponibilizá-lo gratuitamente no futuro. No entanto, ainda há áreas que precisam ser aprimoradas para que o jogo alcance um estado que me deixe satisfeito. Entre as melhorias planejadas estão:

* Adicionar recursos sonoros para enriquecer a experiência imersiva.
* Escrever uma narrativa mais envolvente e detalhada.
* Melhorar a tela de exibição do resultado das consultas SQL, tornando-a mais semelhante a uma tabela.
* Refazer os assets visuais, criando arte autoral para refletir melhor minha visão criativa; embora os assets atuais sejam Creative Commons, vejo que este é um passo necessário quando se quer ter um jogo marcante.

Apesar dessas melhorias ainda serem necessárias, sinto que a "coluna vertebral" do projeto já está concluída. Com a base sólida que foi desenvolvida, acredito que as próximas etapas serão mais fluídas e menos desafiadoras do que o que já foi realizado.
