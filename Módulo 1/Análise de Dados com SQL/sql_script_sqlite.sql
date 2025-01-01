
SELECT * FROM Album a;
SELECT count(*) as Records FROM Album a;

SELECT count(*) FROM Album a WHERE Column1 is NOT NULL;
SELECT AlbumId, Title FROM Album a WHERE Column1 is NULL;

SELECT * FROM Artist a;

SELECT * FROM Album a INNER JOIN Artist a2; /* Sintaxe é incompleta: Este código utiliza um INNER JOIN sem especificar a condição de junção entre as tabelas Album e Artist */

-- caracterizando os registros dos artistas
SELECT a2.ArtistId, a2.Name, count(*) as Records from Album a INNER JOIN Artist a2 GROUP BY 1;

/**
Não, o trecho de código que você forneceu não é válido devido a problemas semelhantes aos mencionados anteriormente. Vamos analisar o código:

### Código fornecido:
```sql
SELECT a2.ArtistId, a2.Name, COUNT(*) AS Records 
FROM Album a 
INNER JOIN Artist a2 
GROUP BY 1;
```

### Problemas:
1. **Falta de condição de junção (`ON`) no `INNER JOIN`**:
   - Um `INNER JOIN` exige que você especifique a relação entre as tabelas `Album` e `Artist`. Por exemplo:
     ```sql
     ON a.ArtistId = a2.ArtistId
     ```

2. **Uso incorreto do `GROUP BY`**:
   - O `GROUP BY 1` indica que a agregação será feita com base na primeira coluna selecionada 
(`a2.ArtistId` neste caso), mas como você também está selecionando `a2.Name`, isso causa um conflito.
   - No SQL padrão, todas as colunas no `SELECT` que não são usadas em funções de agregação devem ser incluídas na cláusula `GROUP BY`.

### Correção:
Para corrigir o código, você precisa:
1. Adicionar uma condição de junção apropriada.
2. Garantir que todas as colunas selecionadas que não estão em funções de agregação sejam incluídas no `GROUP BY`.

#### Código corrigido:
```sql
SELECT a2.ArtistId, a2.Name, COUNT(*) AS Records 
FROM Album a 
INNER JOIN Artist a2 
ON a.ArtistId = a2.ArtistId 
GROUP BY a2.ArtistId, a2.Name;
```

### Explicação:
1. **`ON a.ArtistId = a2.ArtistId`**:
   - Especifica que a relação entre as tabelas é baseada na correspondência de `ArtistId`.

2. **`GROUP BY a2.ArtistId, a2.Name`**:
   - Garante que a agregação (`COUNT(*)`) seja feita para cada combinação única de `ArtistId` e `Name`.

### Resultado:
Este código corretamente agrupa os álbuns por artista (`ArtistId`) e conta o número de registros (`COUNT(*)`) 
para cada artista, retornando também o nome do artista (`a2.Name`).
**/

SELECT a2.ArtistId, a2.Name, count(*) as Records from Album a INNER JOIN Artist a2 GROUP BY 1 ORDER BY Records LIMIT 3;
/* Trecho de código invalido */

SELECT * FROM Customer c LIMIT 10;
SELECT COUNT(*) FROM Customer c2 ;
SELECT FirstName, Address FROM Customer c;

-- Quantos clientes moram na Broadway?
SELECT count(*) FROM Customer c WHERE Address like '%Broadway%';
SELECT State, COUNT(*) AS Total FROM Customer c GROUP BY 1 ORDER BY Total DESC limit 10;


-- verificar company dos clientes
SELECT * FROM Customer c;
SELECT count(*) FROM Customer c WHERE Company IS NOT NULL;

SELECT FirstName FROM Customer c WHERE Company IS NULL;


-- Quais dos clientes são colaboradores?
SELECT * FROM Employee e ;

SELECT c.FirstName, c.LastName FROM Customer c 
	WHERE Company IS NULL AND c.FirstName IN 
		(SELECT e.FirstName FROM Employee e);

SELECT c.FirstName, c.LastName  FROM Customer c INNER JOIN Employee e WHERE c.FirstName = e.FirstName;


SELECT * FROM Invoice i LIMIT 10;
SELECT * FROM InvoiceLine il ORDER BY UnitPrice  DESC LIMIT 10;

SELECT UnitPrice, COUNT(*) AS Record  FROM InvoiceLine il GROUP BY UnitPrice;

-- Clientes que possuem Invoice associados e a quantidade para cada cliente.

SELECT c.CustomerId, c.FirstName, COUNT(*) as Record FROM Invoice i 
	INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
	GROUP BY 1 ORDER BY Record;

SELECT i.InvoiceId, il.InvoiceLineId  FROM Invoice i 
	INNER JOIN InvoiceLine il 
	INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
	GROUP BY 1
	LIMIT 100;

/** 

/* Jointure interne */
select funcionarios.nome, departamentos.nome  from funcionarios, departamentos where funcionarios.Departamento = departamentos.Funcionarios;

select first_name, film_id from actor, film_actor where actor.actor_id = film_actor.actor_id

/*On peut aussi utiliser INNER JOIN : */
select funcionarios.nome, departamentos.nome  from funcionarios INNER JOIN departamentos ON funcionarios.Departamento = departamentos.Funcionarios;

select * from film_actor order by film_id;

SELECT first_name, last_name, film_id, COUNT(*) AS Records
FROM actor 
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY first_name, last_name, film_id;

SELECT first_name, 
       MAX(last_name) AS last_name, 
       MAX(film_id) AS film_id, 
       COUNT(*) AS Records
FROM actor 
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY first_name;

SELECT first_name,  
       COUNT(*) AS Records
FROM actor 
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY first_name;

SELECT first_name, 
       MAX(last_name) AS last_name, 
       MAX(film_id) AS film_id, 
       COUNT(*) AS Records
FROM actor 
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY first_name order by Records;

SELECT first_name, 
       MAX(last_name) AS last_name, 
       MAX(film_id) AS film_id, 
       COUNT(*) AS Records
FROM actor 
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY first_name order by Records limit 3;

SELECT * FROM film_actor LIMIT 10;

SELECT city, count(*) FROM sakila.city group by city;

SELECT count(*) FROM city WHERE city like '%Akron%';

SELECT actor_id, COUNT(*) AS Total FROM film_actor c GROUP BY 1 ORDER BY Total DESC limit 10;

**/
