# ----------------------------- consulta (1) tabela categoria, # GROUP BY #  ------------------------------
select id_categoria, count(*) as total_produtos from produto group by id_categoria;

# ----------------------------- consulta (2) tabela categoria, # HAVING #  ------------------------------
select id_categoria, count(*) as total_produtos from produto group by id_categoria having count(*) >1;

# ----------------------------- consulta (3) tabelas peido e cliente, # JOIN #  ------------------------------
select pedido.id_pedido, cliente.nome from pedido inner join cliente on pedido.id_cliente = cliente.id_cliente;

# ----------------------------- consulta (4) tabela produto, # SUBCONSULTA # ------------------------------
select nome_produto, preco from produto where preco > (select avg (preco) from produto);

# ----------------------------- consulta (5) tabela cliente ------------------------------
select nome, cpf, email, telefone from cliente;

# ----------------------------- consulta (6) tabela produto ------------------------------
select id_categoria as 'identificação da categoria', nome_produto as 'nome do produto', preco, estoque_produto as estoque from produto;

# ----------------------------- consulta (7) tabela categoria ------------------------------
select nome_categoria as 'Nome da categoria', descricao as descrição, status from categoria;

# ----------------------------- consulta (8) item_pedido ------------------------------
select id_pedido as 'Num. do pedido', id_produto as 'Num. do produto', quantidade, preco_unitario as 'Preço unitário' from item_pedido;

# ----------------------------- consulta (9) tabela fornecedor  ------------------------------
select nome_empresa as 'Nome da empresa', cnpj, email, telefone, data_cadastro as 'data do cadastro', endereco, nome_contato as 'Nome para contato' from fornecedor;

# ----------------------------- consulta (10) tabela pagamento ------------------------------
select id_pedido as 'Num. pedido', valor_pagamento as 'Valor do pagamento', data_pagamento as 'Data do pagamento', forma_pagamento as 'Forma de pagamento' from pagamento;

# ----------------------------- consulta (11) tabela pagamento_parcelado  ------------------------------
select id_pagamento as 'Num. pagamento', num_parcela as 'Num. de parcela(s)' from pagamento_parcelado;

# ----------------------------- consulta (12) tabela pagamento_a_vista ------------------------------
select id_pagamento as 'Num. pagamento', tipo, desconto from pagamento_a_vista;

# ----------------------------- consulta (13) tabela peido  ------------------------------
select id_pedido as 'Num. pedido', id_cliente as 'Num. Cliente', data_pedido as 'Data do pedido', status_pedido as 'Situação do pedido',
valor_total as 'Valor total', data_entrega as 'Data da entrega', endereco_entrega as 'Endereço da entrega' from pedido;