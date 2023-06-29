
USE veterinaria;

INSERT INTO cliente (id_cliente, nombre, apellido, dni, telefono) VALUES (1, "Brenda", "Barrese", 37120625, 1154896302);
INSERT INTO cliente (id_cliente, nombre, apellido, dni, telefono) VALUES (2, "Genoveva", "Ledesma", 38590540, 1168319388);
INSERT INTO cliente (id_cliente, nombre, apellido, dni, telefono) VALUES (3, "Odd", "Torres", 96874210, 51486595);
INSERT INTO cliente (id_cliente, nombre, apellido, dni, telefono) VALUES (4, "Ignacio", "Doe", 40587495, 42252465);

INSERT INTO mascota (id_mascota, nombre, especie, peso, sexo, id_cliente) VALUES (1, "Manuelita", "Tortuga", 5.40, 'H', 1);
INSERT INTO mascota (id_mascota, nombre, especie, peso, sexo, id_cliente) VALUES (2, "Miti", "Gato", 3.50, 'H', 2);
INSERT INTO mascota (id_mascota, nombre, especie, peso, sexo, id_cliente) VALUES (3, "Fido", "Perro", 10.5, 'M', 4);
INSERT INTO mascota (id_mascota, nombre, especie, peso, sexo, id_cliente) VALUES (4, "Stich", "Canario", 2.5, 'M', 3);

INSERT INTO veterinario (id_veterinario, nombre, apellido) VALUES (1,"Marcela", "Di pretto");
INSERT INTO veterinario (id_veterinario, nombre, apellido) VALUES (2, "Juan Manuel", "Ugarte");
INSERT INTO veterinario (id_veterinario, nombre, apellido) VALUES (3, "Domingo", "Fausto");
INSERT INTO veterinario (id_veterinario, nombre, apellido) VALUES (4, "Mina", "Alfaraz");

INSERT INTO consulta (id_consulta, fecha, horario, observaciones, id_mascota, id_veterinario) VALUES (1, "2022-01-05", "18:30", "Control de rutina", 1, 1);
INSERT INTO consulta (id_consulta, fecha, horario, observaciones, id_mascota, id_veterinario) VALUES (2, "2023-05-22", "15:00", "Control de rutina", 2, 3);
INSERT INTO consulta (id_consulta, fecha, horario, observaciones, id_mascota, id_veterinario) VALUES (3, "2023-05-22", "09:00", "Control post operatorio", 4, 4);
INSERT INTO consulta (id_consulta, fecha, horario, observaciones, id_mascota, id_veterinario) VALUES (4, "2022-05-22", "00:00", "Emergencia por herida de Valin", 3, 2);

INSERT INTO historiaclinica (id_hc, observaciones, id_consulta, id_veterinario) VALUES ("1", "Presenta leve cuadro febril de 37º, posible infeccion dental", 3, 1);
INSERT INTO historiaclinica (id_hc, observaciones, id_consulta, id_veterinario) VALUES ("2", "Revision post operatoria satisfactoria, el paciente evoluciona favorablemente a la protesis", 1, 3);
INSERT INTO historiaclinica (id_hc, observaciones, id_consulta, id_veterinario) VALUES ("3", "Leve cuadro infeccioso por laceracion en pata delantera derecha provocada por trifulca en tejado", 2, 1);
INSERT INTO historiaclinica (id_hc, observaciones, id_consulta, id_veterinario) VALUES ("4", "Radiografia de torax: Normal",  4, 4);

INSERT INTO calendariodevacunas (id_cdv, farmaco, dosis, id_mascota, id_hc) VALUES (1, "Amoxicilina", 1, 1, 1);
INSERT INTO calendariodevacunas (id_cdv, farmaco, dosis, id_mascota, id_hc) VALUES (2, "Triple felina", 0.5, 2, 3);
INSERT INTO calendariodevacunas (id_cdv, farmaco, dosis, id_mascota, id_hc) VALUES (3, "Acolan", 0.2, 3, 2);
INSERT INTO calendariodevacunas (id_cdv, farmaco, dosis, id_mascota, id_hc) VALUES (4, "Ampolicina", 15, 4, 1);

INSERT INTO intervencionquirurgica (id_iq, operacion, observaciones, id_mascota, id_hc) VALUES (1, "Exploratoria", "Revision de Obstruccion con endocamara", 2, 3);
INSERT INTO intervencionquirurgica (id_iq, operacion, observaciones, id_mascota, id_hc) VALUES (2, "diagnostico limpio", "sin operacionesal momento", 4, 4);
INSERT INTO intervencionquirurgica (id_iq, operacion, observaciones, id_mascota, id_hc) VALUES (3,"Extraccion dental", "Retiro de pieza dental", 3, 1);
INSERT INTO intervencionquirurgica (id_iq, operacion, observaciones, id_mascota, id_hc) VALUES (4, "Clavo quirurgico", "Aplicacion de clavo quirurgico en falta de articulacion normal", 1, 2);

INSERT INTO tratamiento (id_tratamiento, tratamiento, observaciones, id_hc) VALUES (1, "Anti parasitario", "Primera dosis aplicada. Segunda dentro de 15 dias", 4);
INSERT INTO tratamiento (id_tratamiento, tratamiento, observaciones, id_hc) VALUES (2, "Amoxicilina", "Infeccion menor", 1);
INSERT INTO tratamiento (id_tratamiento, tratamiento, observaciones, id_hc) VALUES (3, "Anti inflamatorio", "Inflamacion en articulacion posterior", 3);
INSERT INTO tratamiento (id_tratamiento, tratamiento, observaciones, id_hc) VALUES (4, "Ambulatorio", "Especificar segun caso", 2);
