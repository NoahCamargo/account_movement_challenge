# AccountMovementChallenge

## Usage
Para utilizar, basta rodar o seguinte comando:

```bash
docker-compose build; docker-compose run --rm web
```
Após a execução do comando o `irb` irá abrir com a classe `AccountMovementChallenge` carregada.
Para executar o cálculo do saldo, basta *rodar*:
```ruby
irb(main):001:0> AccountMovementChallenge.new('files/contas.csv', 'files/transacoes.csv').run_transactions!
123,-1900
321,4969
=> {"123"=>-1900, "321"=>4969}
irb(main):002:0>
```
Para instanciar a classe, informe o arquivo que contenha as contas e o arquivo que contenha as transações. O projeto já vira com o exemplo acima.
**Observação:** Caso queira modificar os *files* presente no projeto, rode novamente o comando `docker-compose build; docker-compose run --rm web` para que o mesmo possa ser atualizado