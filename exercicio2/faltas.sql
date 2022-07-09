DROP TABLE IF EXISTS faltas;


CREATE TABLE IF NOT EXISTS faltas (
    funcionario_id INTEGER NOT NULL,
    justificativa VARCHAR(250) NOT NULL,
    CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

CREATE OR REPLACE FUNCTION checkJustificativaFaltas() RETURNS TRIGGER AS
$$
DECLARE
  quantidade_faltas INTEGER;
  faltas_injustificadas INTEGER;
BEGIN
  SELECT count(*) INTO quantidade_faltas FROM faltas WHERE faltas.funcionario_id = NEW.funcionario_id AND justificativa = '';

  IF quantidade_faltas > 5 THEN
    UPDATE funcionarios SET ativo = 'N' WHERE id = NEW.funcionario_id;
  END IF;

	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;


CREATE TRIGGER checkJustificativa
  AFTER INSERT
  ON faltas
  FOR EACH ROW
  EXECUTE PROCEDURE checkJustificativaFaltas();


-- Trigger test
-- ALTER TABLE faltas ENABLE TRIGGER checkJustificativa;
-- INSERT INTO faltas(funcionario_id, justificativa) VALUES (1, '');
-- INSERT INTO faltas(funcionario_id, justificativa) VALUES (1, '');
-- INSERT INTO faltas(funcionario_id, justificativa) VALUES (1, '');
-- INSERT INTO faltas(funcionario_id, justificativa) VALUES (1, '');
-- INSERT INTO faltas(funcionario_id, justificativa) VALUES (1, '');
-- INSERT INTO faltas(funcionario_id, justificativa) VALUES (1, '');
-- SELECT id, nome, ativo FROM funcionarios WHERE id = 1;
