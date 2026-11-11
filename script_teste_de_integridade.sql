#-----------------------------------------------------------------------------------------------------------------
# ------------------------------------- TESTE DE INTEGRIDADE ENTRE TABELAS ---------------------------------------
#-----------------------------------------------------------------------------------------------------------------

# ---------- teste entre tabelas cliente e pedido --------------
select p.id_pedido from pedido p left join cliente c on p.id_cliente = c.id_cliente where c.id_cliente is null;
# este teste indica que não há pedido sem cliente, relação okay.

# ---------- teste entre tabelas cliente e pedido --------------
select ip.id_item_pedido from item_pedido ip left join pedido p on ip.id_pedido = p.id_pedido where p.id_pedido is null;
# este teste indica que não há item_pedido sem um pedido, relação okay.

# ---------- teste entre tabelas produtos e categoria --------------
select p.id_produto from produto p left join categoria c on p.id_categoria = c.id_categoria where c.id_categoria is null;
# este teste indica que não há pedido sem uma categoria, relação Okay.

# ---------- teste entre tabelas pedido e pagamento --------------
select pg.id_pagamento from pagamento pg left join pedido p on pg.id_pedido = p.id_pedido where p.id_pedido is null;
# este teste indica que não há pagamento sem um pedido cadastrado, relação Okay.

#-----------------------------------------------------------------------------------------------------------------
# ---------------------------------------- TESTE DE VIOLAÇÃO PROPOSITAL ------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

# ---------- Ignorando os campos Not Null --------------
insert into cliente (id_cliente) value (4);
insert into cliente (id_cliente, cpf) value (4, 12345678912);
insert into cliente (id_cliente, cpf, nome) values (4, '12345678912','Nathan'); 
insert into cliente (id_cliente, cpf, nome, email) values (4, '12345678912','Nathan','nathan@gmail.com');
# Para confirmar se todos os campos são obrigatórios, um dado foi inserido de cada vez.

# ---------- Duplicando os campos Unique --------------
insert into cliente (id_cliente, cpf, nome, email, telefone) values (1,'12345678912','Nathan','nathan@gmail.com','21999999999');
insert into cliente (id_cliente, cpf, nome, email, telefone) values (4,'12345678912','Nathan','nathan@gmail.com','21999999999');
insert into cliente (id_cliente, cpf, nome, email, telefone) values (4,'12345678912','Nathan','felipe@gmail.com','21999999999');
insert into cliente (id_cliente, cpf, nome, email, telefone) values (4,'12345678912','Nathan','felipe@gmail.com','21555555555');
# Foram inseridos dados previamente registrados e alterados um por um, até que todos os campos únicos não apresentassem duplicidade.

# ---------- Duplicando o campo Primary Key --------------
insert into cliente (id_cliente, cpf, nome, email, telefone) values (4,'12345678912','Nathan','nathan@gmail.com','21999999999');
#foi inserido uma chave já existente para conferir a integridade da chave primária.

