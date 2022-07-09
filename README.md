# Introdução PlPGSQL

Exercício de aula da disciplina (TCC00335) PROJETO de BANCO DE DADOS.


Como todos sabem, o estado do Rio de Janeiro bem passando uma por uma severa crise financeira. Dessa forma, o governo estadual cogita diminuir horas de trabalho e salários de muitos funcionários. (fonte: http://oglobo.globo.com/rio/rj-estuda-reduzir-jornada-salarios-de-servidores-do-estado-20358106)

Você foi contratado para atualizar o banco de dados dos funcionários estaduais de acordo com as novas diretrizes. Considere a tabela FUNCIONARIO apresentada como base para os itens a seguir. As respostas podem ser dadas para os SGBDs mySQL, SQL Server, Oracle e PostgreSQL. Cada discente deve enviar um zip ou rar com os scripts de criação dos objetos.

1. Implemente uma função para diminuir o salário de um funcionário em um determinado percentual. A sua função deve se chamar DiminuirSalario e deve receber como parâmetros de entrada o CPF do funcionário e um valor inteiro que representa o percentual de redução.

2. Além da redução de salários, o governo prevê demissões para funcionários que faltem sem justificativa apresentada. Esse tipo de controle não existe hoje no banco de dados. Sua tarefa é desenvolver um mecanismo que controle as faltas de cada um dos funcionários. A partir da 5a (quinta) falta sem justificativa o campo ATIVO da tabela funcionário deve ser setado para 'N" significando que ele foi demitido.

Sugestão: criem uma tabela que controle as faltas e justificativas e uma trigger associada a essa tabela para verificar a quantidade de faltas.

3. O governo do estado também deseja controlar todas as promoções dos funcionários ao longo do anos. Assim como no caso das faltas, esse mecanismo não se encontra implementado no banco de dados. É sua responsabilidade implementar esse controle. Cada funcionário possui um cargo (que por simplificação pode variar entre CARGO1, CARGO2 e CARGO 3) e seu nível pode variar entre 1 e 7. Ou seja, o funcionário pode ter o CARGO1 e Nível 5 no momento, e, na próxima promoção ele terá o CARGO1 (que não muda) e Nível 6, e assim por diante. Lembrando que cada funcionário só pode aumentar seu nível de 3 em 3 anos e não pode haver interseção de períodos entre dois níveis. Além disso, um funcionário só pode ser promovido para o nível imediatamente superior ao atual, logo uma promoção do Nível 1 para o Nível 3 é proibida. Desenvolva uma função que implemente a promoção de um determinado funcionário. Sua função deve receber o CPF do funcionário e o nível para promoção como parâmetros de entrada.
