# 🗃️ Modelagem Relacional: Sócio e Dependentes (SQL)

Este projeto demonstra, de forma prática e didática, a modelagem de um relacionamento **1:N (um-para-muitos)** entre **Sócio** e **Dependentes**, aplicando **boas práticas de banco de dados relacional** e **integridade referencial** com `PRIMARY KEY`, `FOREIGN KEY` e testes de violação de regras.

> Ideal para estudo, aulas de Banco de Dados e portfólio técnico.

---

## 🎯 Objetivos do Script

- Criar tabelas relacionadas por chave estrangeira
- Utilizar **PK composta**
- Garantir **integridade referencial**
- Demonstrar **erros esperados** ao violar regras do modelo
- Realizar consulta com `JOIN` entre as tabelas
- Popular o banco com dados de teste coerentes

---

## 🧱 Estrutura das Tabelas

### `tb_socio`

| Campo     | Tipo         | Regra       |
|-----------|--------------|-------------|
| id_socio  | INT          | Primary Key |
| nm_socio  | VARCHAR(100) | NOT NULL    |
| qt_idade  | INT          | NOT NULL    |

---

### `tb_dependentes`

| Campo          | Tipo         | Regra                             |
|----------------|--------------|-----------------------------------|
| id_socio       | INT          | Foreign Key → tb_socio(id_socio) |
| id_dependentes | INT          | Parte da PK composta              |
| nm_dependente  | VARCHAR(100) | NOT NULL                         |
| qt_idade       | INT          | NOT NULL                         |

**Primary Key composta:** `(id_socio, id_dependentes)`

---

## 🔗 Relacionamento

tb_socio (1) -------- (N) tb_dependentes

Um sócio pode ter vários dependentes, mas um dependente pertence a apenas um sócio.

---

## 🧪 Testes de Integridade Referencial

O script contém exemplos intencionais de erro, para demonstrar o funcionamento das regras do banco.

### ❌ Inserir dependente para sócio inexistente

```sql
INSERT INTO tb_dependentes VALUES (99, 1, 'Invalido', 10);
```

Erro esperado: violação de FOREIGN KEY.

### ❌ Tentar excluir sócio que possui dependentes

```sql
DELETE FROM tb_socio WHERE id_socio = 1;
```

**Erro esperado:** restrição de integridade referencial.

---

## 🔎 Consulta com JOIN

Listagem de Sócios e seus Dependentes:

```sql
SELECT
    s.nm_socio,
    d.nm_dependente
FROM tb_socio s
JOIN tb_dependentes d
    ON d.id_socio = s.id_socio
ORDER BY s.id_socio, d.id_dependentes;
```

---

## 🛠️ Conceitos Demonstrados

- Modelagem Relacional
- Relacionamento 1:N
- Chave Primária Simples
- Chave Primária Composta
- Chave Estrangeira (FK)
- Integridade Referencial
- Dados de Teste
- JOIN entre tabelas

---

## ▶️ Como Executar

1. Crie um banco de dados (MySQL, PostgreSQL, SQL Server, etc.)
2. Execute o script `.sql` completo
3. Teste as consultas e os comandos comentados para visualizar os erros esperados

---

## 👨‍💻 Autor

🚀 **JP**  
Estudante de Análise e Desenvolvimento de Sistemas | Foco em Back-end e Infraestrutura
🐙 GitHub: https://github.com/JP-GhOsT

---

## 📌 Observação

Este projeto tem foco didático e foi estruturado para evidenciar claramente o comportamento das restrições de integridade em um banco relacional.
