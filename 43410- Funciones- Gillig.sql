ALTER TABLE  tratamiento ADD COLUMN dosis DECIMAL(10,2) NOT NULL DEFAULT 1
select * from tratamiento
DROP FUNCTION  iF EXISTS calcular_dosificacion;

DELIMITER $$
CREATE FUNCTION calcular_dosificacion(id_mascota INT, id_tratamiento INT)
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE peso DECIMAL(18,2);
    DECLARE dosis DECIMAL(18,2);
    DECLARE promedio DECIMAL(18,2);
    DECLARE peso_mascota DECIMAL(18,2);
    DECLARE dosis_tratamiento DECIMAL(18,2) ;
    -- peso mascota
    SELECT m.peso INTO peso_mascota
    FROM mascota m
    WHERE m.id_mascota = id_mascota;

    -- dosis del tratamiento
    SELECT t.dosis INTO dosis_tratamiento
    FROM tratamiento t
    WHERE t.id_tratamiento = id_tratamiento;
    
    -- promedio
    SET promedio = (peso_mascota + dosis_tratamiento) / 2;

    RETURN promedio;
END $$ 
DELIMITER ;

select calcular_dosificacion(1,1);  -- llamado a la funcion para el id_mascota 1 e id_tratamiento 1


DROP FUNCTION  iF EXISTS contar_consultas_mascota;
DELIMITER //
CREATE FUNCTION contar_consultas_mascota(id_mascota INT, nombre_mascota VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_consultas INT;
    -- función logica
    IF id_mascota IS NOT NULL THEN
        SELECT COUNT(*) INTO total_consultas
        FROM consulta
        WHERE id_mascota = id_mascota;
    ELSE
        SELECT COUNT(*) INTO total_consultas
		FROM consulta c
		INNER JOIN mascota m ON  c.id_mascota=m.id_mascota
		WHERE c.id_mascota = nombre_mascota;
    END IF;
    RETURN total_consultas;
END //
DELIMITER ; 

select contar_consultas_mascota(1,'Manuelita') -- llamado a la funcion para el id_mascota 1 y nombre mascota Manuelita
