DROP TABLE IF EXISTS funcionarios;

CREATE TABLE funcionarios (
"nome" VARCHAR(60) NOT NULL,
"email" VARCHAR(60) NOT NULL,
"sexo" VARCHAR(10) NOT NULL,
"ddd" INTEGER,
"salario" DECIMAL,
"telefone" VARCHAR (8),
"ativo" VARCHAR(1),
"endereco" VARCHAR(70) NOT NULL,
"cpf" VARCHAR (11) NOT NULL,
"cidade" VARCHAR(20) NOT NULL,
"estado" VARCHAR(2)  NOT NULL,
"bairro" VARCHAR(20) NOT NULL,
"pais" VARCHAR(20) NOT NULL,
"login" VARCHAR(12) NOT NULL,
"senha" VARCHAR(12) NOT NULL,
"news" VARCHAR(8),
"id" SERIAL PRIMARY KEY);

-- INSERT TEST
-- INSERT INTO funcionarios (nome, email, sexo, salario, telefone, ativo, endereco, cpf, cidade, estado,bairro, pais, login, senha) VALUES('Juremias', 'email', 'sexo', 1000000, 'telefone', 'S', 'endereco', '1234', 'cidade', 'RJ', 'bairro', 'pais', 'login', 'senha');
