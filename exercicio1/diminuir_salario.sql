DROP FUNCTION diminuirSalario;
CREATE OR REPLACE FUNCTION diminuirSalario (cpfUsuario varchar, percentual int) RETURNS VOID AS
$$
DECLARE
   percentualFinal DECIMAL := (1.0 - percentual/100.0);
   montante INTEGER;
   salarioNovo INTEGER;
BEGIN
   SELECT funcionarios.salario INTO montante FROM funcionarios WHERE funcionarios.cpf = cpfUsuario;
   SELECT  montante * percentualFinal INTO salarioNovo;
   UPDATE funcionarios SET salario = salarioNovo WHERE funcionarios.cpf = cpfUsuario;
END;
$$ LANGUAGE plpgsql;

-- QUERY test
-- SELECT diminuirSalario('1234', 78);
-- SELECT cpf, salario FROM funcionarios;
