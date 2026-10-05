CREATE SCHEMA IF NOT EXISTS laboratorio;
SET search_path TO laboratorio, public;

CREATE TABLE IF NOT EXISTS categorias (
    categoria_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL UNIQUE,
    ativo boolean NOT NULL DEFAULT true
);

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL,
    email text NOT NULL UNIQUE,
    ativo boolean NOT NULL DEFAULT true,
    criado_em timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS produtos (
    produto_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria_id bigint NOT NULL REFERENCES categorias(categoria_id),
    nome text NOT NULL,
    preco numeric(12,2) NOT NULL CHECK (preco >= 0),
    estoque integer NOT NULL DEFAULT 0 CHECK (estoque >= 0),
    ativo boolean NOT NULL DEFAULT true
);

CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id bigint NOT NULL REFERENCES clientes(cliente_id),
    data_pedido timestamptz NOT NULL DEFAULT now(),
    status text NOT NULL DEFAULT 'ABERTO'
        CHECK (status IN ('ABERTO', 'PAGO', 'CANCELADO', 'ENVIADO')),
    total numeric(12,2) NOT NULL DEFAULT 0 CHECK (total >= 0)
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    pedido_id bigint NOT NULL REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    produto_id bigint NOT NULL REFERENCES produtos(produto_id),
    quantidade integer NOT NULL CHECK (quantidade > 0),
    preco_unitario numeric(12,2) NOT NULL CHECK (preco_unitario >= 0),
    PRIMARY KEY (pedido_id, produto_id)
);

CREATE INDEX IF NOT EXISTS idx_produtos_categoria ON produtos(categoria_id);
CREATE INDEX IF NOT EXISTS idx_pedidos_cliente ON pedidos(cliente_id);
CREATE INDEX IF NOT EXISTS idx_pedidos_data ON pedidos(data_pedido);
CREATE INDEX IF NOT EXISTS idx_itens_produto ON itens_pedido(produto_id);
