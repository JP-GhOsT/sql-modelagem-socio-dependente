-- Exemplo de modelagem 1:N entre Sócio e Dependentes
-- Demonstra uso de PK composta, FK e integridade referencial
CREATE TABLE tb_socio(
	id_socio INT PRIMARY KEY,
	nm_socio VARCHAR(100) NOT NULL,
	qt_idade INT NOT NULL
);

INSERT INTO tb_socio VALUES(1, 'João Silva', 45);
INSERT INTO tb_socio VALUES(2, 'Maria souza', 38);
INSERT INTO tb_socio VALUES(3, 'Carlos Pereira', 50);
INSERT INTO tb_socio VALUES(4, 'Ana Oliveira', 28);
INSERT INTO tb_socio VALUES(5, 'Fernando Santos', 55);
INSERT INTO tb_socio VALUES(6, 'Juliana Costa', 33);
INSERT INTO tb_socio VALUES(7, 'Roberto Almeida', 60);
INSERT INTO tb_socio VALUES(8, 'Patricia Lima', 42);
INSERT INTO tb_socio VALUES(9, 'Ricardo Gomes', 48);
INSERT INTO tb_socio VALUES(10, 'Camila Rocha', 30);

--select * from tb_socio

CREATE TABLE tb_dependentes(
	id_socio INT,
	id_dependentes INT,
	nm_dependente VARCHAR(100) NOT NULL,
	qt_idade INT NOT NULL,
	PRIMARY KEY (id_socio, id_dependentes),
	FOREIGN KEY (id_socio) REFERENCES tb_socio(id_socio)
);

--Socio 1 -> 1 Dependente
INSERT INTO tb_dependentes VALUES (1,1, 'Pedro Silva', 12);

--Socio 2 -> 2 Dependentes
INSERT INTO tb_dependentes VALUES(2,1, 'Lucas Souza', 8);
INSERT INTO tb_dependentes VALUES(2,2, 'Carlos Souza', 6);

--Socio 3 -> 2 Dependentes
INSERT INTO tb_dependentes VALUES(3,1, 'Mariana Pereira', 10);
INSERT INTO tb_dependentes VALUES(3,2, 'Rafael Pereira', 7);

--Socio 4 -> 3 dependentes
INSERT INTO tb_dependentes VALUES(4,1, 'Ana Oliveira Jr', 5);
INSERT INTO tb_dependentes VALUES(4,2, 'Bruno Oliveira', 3);
INSERT INTO tb_dependentes VALUES(4,3, 'Clara Oliveira', 1);

--Socio 5 -> 2 Dependentes
INSERT INTO tb_dependentes VALUES(5,1, 'Fernando Santos Jr', 9);
INSERT INTO tb_dependentes VALUES(5,2, 'Gabriel Santos', 6);

--ERRO ESPERADO: não é possível inserir dependente para sócio inexistente
INSERT INTO tb_dependentes VALUES(99, 1, 'Invalido', 10);

--ERRO ESPERADO: não é possível excluir sócio que possui dependentes
DELETE FROM tb_socio WHERE id_socio = 1;

--Deletar socio sem dependente -> válido
DELETE FROM tb_socio WHERE id_socio = 6;

--RESULTADO ESPERADO: socio 6 sem dependente -> exclusão permitida
SELECT *
FROM tb_dependentes
ORDER BY id_socio, id_dependentes;

--Listagem Socio + Dependente
SELECT
	s.nm_socio,
	d.nm_dependente
FROM tb_socio s, tb_dependentes d
WHERE d.id_socio = s.id_socio
ORDER BY s.id_socio, d.id_dependentes;

--drop table tb_socio