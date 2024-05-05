CREATE DATABASE menu;

\c menu

-- Tabla de Menús
CREATE TABLE comida (
        comidaId SERIAL NOT NULL,
        nombre varchar(50) NOT NULL,
        categoria varchar(10) NOT NULL,
        estado char(1) NOT NULL,
        CONSTRAINT comida_pk PRIMARY KEY (comidaId)
    );

-- Table: menu
CREATE TABLE menu (
        menuId SERIAL NOT NULL,
        nombre varchar(20) NOT NULL,
        comidaId int NOT NULL,
        estado char(1) NOT NULL,
        CONSTRAINT menu_pk PRIMARY KEY (menuId)
    );

ALTER TABLE menu 
ADD CONSTRAINT comida_menu_comida 
FOREIGN KEY (comidaId) 
REFERENCES comida (comidaId) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- Insertar comidas y relacionarlas con categorías y menús
INSERT INTO comida (nombre, categoria, estado)
VALUES
    ('Ensalada César', 'Entrada', 'A'),
    ('Filete de Salmón', 'Fondo', 'A'),
    ('Helado de Vainilla', 'Postre', 'A'),
    ('Refresco de Limón', 'Bebida', 'A'),
    ('Sopa de Verduras', 'Entrada', 'A'),
    ('Lasaña de Carne', 'Fondo', 'A'),
    ('Tarta de Manzana', 'Postre', 'A'),
    ('Agua Mineral', 'Bebida', 'A'),
    ('Ceviche de Pescado', 'Entrada', 'A'),
    ('Pollo a la Parrilla', 'Fondo', 'A'),
    ('Gelatina de Frutas', 'Postre', 'A'),
    ('Jugo de Naranja', 'Bebida', 'A'),
    ('Palitos de Zanahoria', 'Entrada',  'A'),
    ('Pasta con Salsa de Tomate', 'Fondo',  'A'),
    ('Helado de Chocolate', 'Postre',  'A'),
    ('Zumo de Manzana', 'Bebida',  'A'),
    ('Puré de Patatas', 'Entrada',  'A'),
    ('Pescaditos Empanizados', 'Fondo',  'A'),
    ('Yogur de Frutas', 'Postre',  'A'),
    ('Leche', 'Bebida',  'A');

CREATE VIEW
    Vista_Menu_Comida AS
SELECT
    M.menuId,
    M.nombre AS nombreMenu,
    C.nombre AS nombreComida,
    C.categoria
FROM
    menu M
    JOIN comida C ON M.comidaId = C.comidaId;