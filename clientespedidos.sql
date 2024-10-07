-- Inserta al menos cinco nuevos clientes en la tabla «clientes».
INSERT INTO clientes (nombre, direccion, telefono) VALUES
('Muriel Sanchez', 'Avenida Laguna Grande 480', '12345678'),
('María López', 'Los Olivos 322', '23456789'),
('Cristobal Nova', 'Hernan Branas 402', '34567891'),
('Ana Toro', 'Santa Juana 24', '45678912'),
('Pedro Díaz', 'Villa Madera Los Duraznos 408', '56789123');

SELECT *
FROM clientes;

-- Inserta al menos diez nuevos pedidos en la tabla «pedidos». Asegúrate de asignar correctamente el cliente correspondiente a cada pedido utilizando la columna «cliente_id».
INSERT INTO pedidos (cliente_id, fecha, total) VALUES
(1, '2024-10-01', 250.000),
(1, '2024-10-02', 150.000),
(2, '2024-10-03', 300.000),
(2, '2024-10-04', 200.000),
(3, '2024-10-05', 100.000),
(4, '2024-10-06', 450.000),
(4, '2024-10-07', 300.000),
(5, '2024-10-08', 600.000),
(5, '2024-10-09', 350.000),
(5, '2024-10-10', 200.000);

SELECT *
FROM pedidos;

-- Proyecta todos los clientes de la tabla «clientes» y sus respectivos pedidos.
SELECT clientes.nombre, pedidos.id_pedido AS pedido_id, pedidos.fecha, pedidos.total
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.cliente_id;

-- Proyecta todos los pedidos realizados por un cliente específico, utilizando su ID.
SELECT * FROM pedidos WHERE cliente_id = 1;

-- Calcula el total de todos los pedidos para cada cliente.
SELECT clientes.nombre, SUM(pedidos.total) AS total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.cliente_id
GROUP BY clientes.nombre;

-- Elimina un cliente específico de la tabla «clientes» y todos sus pedidos asociados de la tabla «pedidos».
DELETE FROM pedidos WHERE cliente_id = 3;
DELETE FROM clientes WHERE id_cliente = 3;

-- Proyecta los tres clientes que han realizado más pedidos, ordenados de forma descendente por el número de pedidos.
SELECT clientes.nombre, COUNT(pedidos.id_pedido) AS num_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.cliente_id
GROUP BY clientes.nombre
ORDER BY num_pedidos DESC
LIMIT 3;


-- Entrega un archivo .sql que contenga todas las consultas que ejecutaste en el entorno de trabajo. 
