DROP TABLE IF EXISTS promocoes;

CREATE TABLE promocoes (
    cargo VARCHAR(7) NOT NULL,
    nivel INTEGER NOT NULL,
    ultimaAtualizacao DATE,
    funcionario_id INTEGER NOT NULL,
    CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

CREATE OR REPLACE FUNCTION promoverFuncionario(cpfFuncionario VARCHAR, novoNivel INTEGER) RETURNS BOOLEAN AS
$$
DECLARE
    tresAnos INTEGER := 365 * 3;
    dataDeHoje DATE := NOW();
    nivelATual INTEGER;
    ultimaAtualizacao DATE;
    funcionarioID INTEGER;
BEGIN
    -- Busca nivel e data da ultima atualizacao
    SELECT promocoes.nivel, promocoes.ultimaAtualizacao, promocoes.funcionario_id
    INTO nivelATual, ultimaAtualizacao, funcionarioID
    FROM promocoes INNER JOIN funcionarios ON funcionarios.id = promocoes.funcionario_id
    WHERE funcionarios.cpf = cpfFuncionario;

    -- verifica nivel
    IF (novoNivel - nivelATual) > 1 OR (novoNivel - nivelATual) < 0 THEN
        RETURN 0;
    END IF;

    -- verifica a data
    IF (dataDeHoje - ultimaAtualizacao) < tresAnos THEN
        RETURN 0;
    END IF;

    -- Atualiza tabela de promocoes
    UPDATE promocoes SET nivel = novoNivel, ultimaAtualizacao = date(now()) WHERE funcionario_id = funcionarioID;
    RETURN 1;
END;
$$ LANGUAGE plpgsql;


-- TESTANDO
-- CASO VERDADEIRO
-- INSERT INTO promocoes(cargo, nivel, ultimaAtualizacao, funcionario_id) VALUES (
--     'cargo1',
--     1,
-- 	date('2001-10-01'),
--     1);
-- SELECT promoverFuncionario('1234', 2);


-- -- CASO FALSO (POR DATA)
-- INSERT INTO promocoes(cargo, nivel, ultimaAtualizacao, funcionario_id) VALUES (
--     'cargo1',
--     1,
-- 	date('2019-08-06'),
--     1);
-- SELECT promoverFuncionario('1234', 2);

-- CASO FALSO (POR NIVEL)
-- INSERT INTO promocoes(cargo, nivel, ultimaAtualizacao, funcionario_id) VALUES (
--     'cargo1',
--     1,
-- 	date('2009-08-06'),
--     1);
-- SELECT promoverFuncionario('1234', 3);
