USE veterinaria;

CREATE VIEW vista_mascota_hembra AS
SELECT id_mascota, nombre
FROM mascota
WHERE sexo = "H";

select * from vista_mascota_hembra
-----------------------------------------------------------------------------
select * from intervencionquirurgica
select * from vista_intervencionquirurgica_limpio

CREATE VIEW vista_intervencionquirurgica_limpio AS
SELECT id_iq, id_mascota, observaciones
FROM intervencionquirurgica
WHERE observaciones LIKE '%limpia%';
----------------------------------------------------------------------------
SELECT id_consulta, id_mascota FROM consulta WHERE observaciones = 'control de rutina';

CREATE VIEW vista_consulta_rutina AS
SELECT id_consulta, id_mascota
FROM consulta
WHERE observaciones = "control de rutina";
---------------------------------------------------------------------
SELECT id_cliente, nombre
FROM cliente
WHERE telefono = '1168319388';

CREATE VIEW vista_cliente_contacto AS
SELECT id_cliente, nombre
FROM cliente
WHERE telefono = 1168319388;
-----------------------------------------------------------------------------
SELECT id_veterinario, nombre
FROM veterinario
WHERE apellido = 'Fausto';

CREATE VIEW vista_veterinario_nombre AS
SELECT id_veterinario, nombre
FROM veterinario
WHERE apellido = "Fausto";
----------------------------------------------------------------------------
SELECT * FROM VW_idconsulta_nombres;

CREATE OR REPLACE VIEW VW_idconsulta_nombres AS
	SELECT con.id_consulta , c.nombre AS nombre_cliente, m.nombre AS nombre_mascota, v.nombre AS nombre_veterinario
	FROM cliente AS c
	JOIN mascota AS m ON c.id_cliente = m.id_cliente
	JOIN consulta AS con ON con.id_mascota=m.id_mascota 
	JOIN veterinario AS v ON  v.id_veterinario  =  con.id_veterinario;

CREATE OR REPLACE VIEW VW_idconsulta_nombres_2 AS
	SELECT con.id_consulta , c.nombre AS nombre_cliente, m.nombre AS nombre_mascota, v.nombre AS nombre_veterinario
	FROM consulta AS con
	JOIN mascota AS m ON m.id_mascota = con.id_mascota
	JOIN cliente AS c ON m.id_cliente= c.id_cliente
	JOIN veterinario AS v ON  v.id_veterinario  =  con.id_veterinario;
