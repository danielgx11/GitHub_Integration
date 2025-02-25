<h1 align="center" id="title">GHApp</h1>

<p id="description">Projeto desenvolvivo processo seletivo Luizalabs.</p>

<h2>Project Screenshots:</h2>

<img src="https://github.com/user-attachments/assets/613b0b87-2ffb-4d10-b8cc-413eb645a0e4" alt="Loading-Page" width="400" height="850">
<img src=https://github.com/user-attachments/assets/5fa3d463-fea2-4b87-ba16-07eb145d5db7 alt="Loading-Page" width="400" height="850">
<img src=https://github.com/user-attachments/assets/d0ac6cff-d074-4d5d-b91a-5719f4cbf454 alt="Loading-Page" width="400" height="850">
<img src=https://github.com/user-attachments/assets/30e39ea5-2413-47df-9fd1-c9d724a5257d alt="Loading-Page" width="400" height="850">
  
<h2>🧐 Features</h2>

Features:

*   Lista de Repositórios (Filtros por linguagem, ordenação e Paginação)
*   Página de Detalhes com os PRs do Repositório em questão
*   Bottom Sheet WebView com o PR selecionado

<h2>🛠️ Guia instalação:</h2>

<p>1. Git</p>

```
Clonar Repositório
```

<p>2. Xcode</p>

```
Rodar 'make project' no terminal
```

<h2>💻 Built with</h2>

Tecnologias:

*   Swift
*   UIKit
*   Async Await
*   XCTest
*   MVVM-C
*   Factory
*   Fastlane
*   Modularização
*   SPM

Arquitetura:

- Foi utilizada uma arquitetura de camadas, inicialmente tendo Domain, Commons, Networking e Features. Na camada de Features foi utilizado MVVM-C. A integração com o backend foi realizada através de UseCases e URLSession. Pensei em utilizar MVVM-C e arquitetura em camadas para dar maior escalabilidade para o projeto, tanto no quesito novas features como também no quesito de aprimoramente das features existentes, focando sempre em alta taxa de Manutenção e testabilidade.

<h2>📋 Backlog</h2>

- [x] Setup Xcode Project (completed)
- [x] Setup Base Project with Coordinator (completed)
- [x] Criar listagem HOME com paginação (completed)
- [x] Criar layers com módulos SPM (completed)
- [x] Criar tela de detalhes de um repositório e criar testes (completed)
- [x] Implementar tela WebView do PR selecionado (completed)
- [x] Fastlane lane para rodar testes
- [ ] Testes UI
- [ ] Fastlane conecta com Testflight
- [ ] Utilizar RxSwift
- [ ] Criar módulos para cada feature
- [ ] Criar módulo DI / AppNavigation
