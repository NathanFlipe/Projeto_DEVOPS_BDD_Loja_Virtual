# ----------------------Inserindo dados na tabela cliente ----------------------------
insert into cliente (nome, cpf, telefone, email) values ('Nathan', '12345678912', '21999999999', 'nathan@gmail.com');
insert into cliente (nome, cpf, telefone, email) values ('Andreza', '98765432198', '21888888888', 'Andreza@gmail.com');
insert into cliente (nome, cpf, telefone, email) values ('Claudio', '19283745625', '21777777777', 'claudio@gmail.com');

# ----------------------Inserindo dados na tabela categoria ----------------------------
insert into categoria (nome_categoria, descricao, status) values ('Smartphones', 'Telefones moveis', 1);
insert into categoria (nome_categoria, descricao, status) values ('Notbook', 'Computadores portateis', 1);
insert into categoria (nome_categoria, descricao, status) values ('Relogio', 'Relogios de pulso', 1);

# ----------------------Inserindo dados na tabela fornecedor ----------------------------
insert into fornecedor (nome_empresa, cnpj, email, telefone, data_cadastro, nome_contato, endereco) values ('EletronicosLTDA', '10203040506070', 'eletronicosltda@gmail.com', '21999999999','2026-11-01', 'Juliana', 'Av. Edgar Roméro');
insert into fornecedor (nome_empresa, cnpj, email, telefone, data_cadastro) values ('EletroLTDA', '90807060504030', 'eletroltda@gmail.com', '21888888888','2026-11-01');
insert into fornecedor (nome_empresa, cnpj, email, telefone, data_cadastro, nome_contato, endereco) values ('LTDAEletros', '97865423102536', 'ltdaeletros@gmail.com', '21777777777','2025-10-25', 'Jorge', 'Av. Nilo Peçanha');

# ----------------------Inserindo dados na tabela produto ----------------------------
insert into produto (id_categoria, nome_produto, preco, estoque_produto) values (3, 'Smart Watch', 399.99, 100);
insert into produto (id_categoria, nome_produto, preco, estoque_produto) values (1, 'Redmi note 9s', 1280.59, 80);
insert into produto (id_categoria, nome_produto, preco, estoque_produto) values (2, 'Notbook', 1999.99, 60);
insert into produto (id_categoria, nome_produto, preco, estoque_produto) values (2, 'NetBook', 1723.99, 60);

# ----------------------Inserindo dados na tabela pedido ----------------------------
insert into pedido (id_cliente, data_pedido, valor_total, status_pedido, data_entrega, endereco_entrega) values (1,'2026-10-20', 1680.58, 1, '2026-11-02', 'Rua Ribeiro 150');
insert into pedido (id_cliente, data_pedido, valor_total, status_pedido, data_entrega, endereco_entrega) values (2,'2026-10-26', 399.99, 1, '2026-11-05', 'Rua Jorge Silve 98');
insert into pedido (id_cliente, data_pedido, valor_total, status_pedido, endereco_entrega) values (3,'2026-10-20', 1999.99, 2, 'Rua Lacerda 1245');

# ----------------------Inserindo dados na tabela item_pedido ----------------------------
insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values (1, 2, 1, 1280.59);
insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values (1, 1, 1, 399.99);
insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values (2, 1, 1, 399.99);
insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values (3, 3, 1, 1999.99);

# ----------------------Inserindo dados na tabela item_pedido ----------------------------
insert into pagamento (id_pedido, data_pagamento, valor_pagamento, forma_pagamento) values (2, '2026-11-01', 399.99, 'a vista');
insert into pagamento (id_pedido, data_pagamento, valor_pagamento, forma_pagamento) values (1, '2026-10-30', 1680.58, 'parcelado');
insert into pagamento (id_pedido, data_pagamento, valor_pagamento, forma_pagamento) values (3, '2026-11-02', 1999.99, 'parcelado');

# ----------------------Inserindo dados na tabela pagamento_parcelado ----------------------------
insert into pagamento_parcelado (id_pagamento, num_parcela) values (2, 10);
insert into pagamento_parcelado (id_pagamento, num_parcela) values (3, 5);

# ----------------------Inserindo dados na tabela pagamento_a_vista ----------------------------
insert into pagamento_a_vista (id_pagamento, tipo, desconto) values (1, 'Pix', 0);

# ----------------------Inserindo dados na tabela produto_tem_fornecedor ----------------------------
insert into produto_tem_fornecedor (id_produto, id_fornecedor) values (3, 1);
insert into produto_tem_fornecedor (id_produto, id_fornecedor) values (1, 2);
insert into produto_tem_fornecedor (id_produto, id_fornecedor) values (2, 3);
insert into produto_tem_fornecedor (id_produto, id_fornecedor) values (4, 2);


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------ Criando index e View -----------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ---------------------- index ----------------------------
create index idx_nome_cliente on cliente (nome);
select * from cliente where nome = 'Claudio';

# ---------------------- View - informações do produto e fornecedor ----------------------------
create view view_fornecedor_produto  as select f.nome_empresa, f.cnpj, p.nome_produto, p.preco, p.estoque_produto from fornecedor f join produto_tem_fornecedor ptf on f.id_fornecedor = ptf.id_fornecedor join produto p on ptf.id_produto = p.id_produto;
select *from view_fornecedor_produto;

# ---------------------- View - informações pedido e pagamento ----------------------------
create view view_pedido_pagamento as select p.id_pedido, p.data_pedido, p.valor_total, pg.valor_pagamento, pg.forma_pagamento, pg.data_pagamento from pedido p join pagamento pg on p.id_pedido = pg.id_pedido;
select * from view_pedido_pagamento;

