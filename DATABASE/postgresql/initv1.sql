CREATE DATABASE menu;

\c menu

CREATE TABLE Menus (
    menuid SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estado CHAR(1) NOT NULL
);

-- Tabla de Comidas
CREATE TABLE Comidas (
    comidaid SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    menuid INT,
    estado CHAR(1) NOT NULL,
    FOREIGN KEY (menuid) REFERENCES Menus(menuid)
);

-- Insertar menús
INSERT INTO Menus (nombre, estado) VALUES 
    ('Menú del Día', 'A'), 
    ('Menú Infantil', 'A');

-- Insertar comidas y relacionarlas con categorías y menús
INSERT INTO Comidas (nombre, categoria, precio, menuid, estado) VALUES 
    ('Ensalada César', 'Entrada', 9.99, 1, 'A'), 
    ('Filete de Salmón', 'Fondo', 15.99, 1, 'A'),
    ('Helado de Vainilla', 'Postre', 4.99, 1, 'A'),
    ('Refresco de Limón', 'Bebida', 2.49, 1, 'A'),
    ('Sopa de Verduras', 'Entrada', 6.99, 1, 'A'),
    ('Lasaña de Carne', 'Fondo', 12.99, 1, 'A'),
    ('Tarta de Manzana', 'Postre', 5.99, 1, 'A'),
    ('Agua Mineral', 'Bebida', 1.99, 1, 'A'),
    ('Ceviche de Pescado', 'Entrada', 8.99, 1, 'A'),
    ('Pollo a la Parrilla', 'Fondo', 10.99, 1, 'A'),
    ('Gelatina de Frutas', 'Postre', 3.99, 1, 'A'),
    ('Jugo de Naranja', 'Bebida', 2.49, 1, 'A'),
    ('Palitos de Zanahoria', 'Entrada', 5.99, 2, 'A'),
    ('Pasta con Salsa de Tomate', 'Fondo', 11.99, 2, 'A'),
    ('Helado de Chocolate', 'Postre', 4.99, 2, 'A'),
    ('Zumo de Manzana', 'Bebida', 1.99, 2, 'A'),
    ('Puré de Patatas', 'Entrada', 7.99, 2, 'A'),
    ('Pescaditos Empanizados', 'Fondo', 13.99, 2, 'A'),
    ('Yogur de Frutas', 'Postre', 3.99, 2, 'A'),
    ('Leche', 'Bebida', 1.99, 2, 'A');


CREATE VIEW Vista_Menu_Comida AS
SELECT 
	C.menuid,
    M.nombre AS nombremenu,
    C.nombre AS nombrecomida,
	c.precio,
    C.categoria
FROM 
    Menus M
JOIN 
    Comidas C ON M.menuid = C.menuid;

select * from Vista_Menu_Comida;
select * from Comidas;
select * from Menus;