# Treinamento FTeam

Aplicativo de treinamento em flutter para entender a arquitetura implementada pela FTeam utilziando microfrontend.

## Proposta do exercício

### Desenvolver um app de exemplo monorepo utilizando:

* Modular
* Triple
* CleanArch
* Hive
* Monorepo & MicroFrontend

### Estrutura monorepo
* App
* Dependencies
* Core
* Modulos temporários

**Obs:** o package design sistems não será criado por enquanto, com isso, o design do app será desenvolvido no próprio “App”.

O app deve conter:
Uma tela para exibir as tarefas;
Uma tela para adicionar tarefas;
Possibilidade de alterar o Theme (light theme e dark theme).

### As tarefas devem conter:

* Título;
* Descrição;
* Data de criação (createdAt);
* Data de execução da trefa (executedAt);
* Data alvo.

**Obs:** Não podem ser adicionadas tarefas com a data alvo para o mesmo dia, apenas para amanhã.

As tarefas devem ser salvas no banco de dados local utilizando Hive.
