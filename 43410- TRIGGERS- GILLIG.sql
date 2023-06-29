-- Este trigger es creado para la actualizacion de la tabla de historias clinicas
DELIMITER //
CREATE TRIGGER tr_HistoriaClinica_AfterUpdate
AFTER UPDATE ON HistoriaClinica
FOR EACH ROW
BEGIN
    INSERT INTO Log_HistoriaClinica (historia_id, fecha_hora, responsable, accion_realizada, detalles)
    VALUES (NEW.id_hc, NOW(), USER(), 'actualizar', CONCAT('Se actualizó la historia clínica por el responsable ', USER(), ' a las ', NOW()));

    -- Insertar registro en caso de creación
    IF NEW.observaciones = 'creado' THEN
        INSERT INTO Log_HistoriaClinica (historia_id, fecha_hora, responsable, accion_realizada, detalles)
        VALUES (NEW.id_hc, NOW(), USER(), 'crear', CONCAT('Se creó la historia clínica por el responsable ', USER(), ' a las ', NOW()));
    END IF;

    -- Insertar registro en caso de eliminación
    IF NEW.observaciones = 'eliminado' THEN
        INSERT INTO Log_HistoriaClinica (historia_id, fecha_hora, responsable, accion_realizada, detalles)
        VALUES (NEW.id_hc, NOW(), USER(), 'eliminar', CONCAT('Se eliminó la historia clínica por el responsable ', USER(), ' a las ', NOW()));
    END IF;
END; //

INSERT INTO log_HistoriaClinica (log_id, historia_id, fecha_hora, veterinario_id, detalles)
VALUES (5, 2, '2023-11-21 10:30:00', 1, 'actualizado');



DROP TRIGGER if exists  tr_HistoriaClinica_AfterUpdate;

UPDATE HistoriaClinica
SET observaciones = 'Estado sin cambios aparentes para el paciente'
WHERE id_hc = 1;

select * from log_historiaclinica

-- Este trigger es creado para la actualizacion de la tabla de veterinarios
DROP TRIGGER IF EXISTS tr_Veterinario_AfterInsert;

DELIMITER //
CREATE TRIGGER tr_Veterinario_AfterInsert
AFTER INSERT ON Veterinario
FOR EACH ROW
BEGIN
    INSERT INTO Log_Veterinario (fecha_hora, responsable, accion_realizada, detalles)
    VALUES (NOW(), USER(), 'crear', CONCAT('Se creó un nuevo veterinario por el responsable ', USER(), ' a las ', NOW()));
END; //

-- Tablas LOG para actualizaciones 

CREATE TABLE Log_HistoriaClinica (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  historia_id INT,
  fecha_hora DATETIME,
  veterinario_id INT,
  accion_realizada VARCHAR(50),
  detalles VARCHAR(255)
);

CREATE TABLE Log_Veterinario (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME,
  veterinario_id INT,
  accion_realizada VARCHAR(50),
  detalles VARCHAR(255)
);

select * from HistoriaClinica
select * from Log_Veterinario

