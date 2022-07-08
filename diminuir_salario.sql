DROP FUNCTION diminuirSalario;
CREATE OR REPLACE FUNCTION diminuirSalario (cpfUsuario varchar, percentual int) RETURNS VOID AS
$$
DECLARE
   percentualFinal DECIMAL := (1.0 - percentual/100.0);
   montante integer;
   salarioNovo INTEGER;
BEGIN
   SELECT funcionario.salario INTO montante FROM funcionario WHERE funcionario.cpf = cpfUsuario;
   SELECT  montante * percentualFinal INTO salarioNovo;
   UPDATE funcionario SET salario = salarioNovo WHERE funcionario.cpf = cpfUsuario;
END;
$$ LANGUAGE plpgsql;

-- Exemplo de consulta
-- SELECT diminuirSalario('1234', 78);
-- SELECT cpf, salario FROM funcionario;
