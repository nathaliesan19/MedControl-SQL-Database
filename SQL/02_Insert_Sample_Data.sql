USE MedControl;
GO

/* =====================================================
   1. PACIENTES
   ===================================================== */
INSERT INTO Pacientes (cedula, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, telefono, correo, es_activo) VALUES
('1-1111-1111', 'Juan', 'Pérez', 'Rojas', '1985-03-12', '8888-1111', 'juan.perez@example.com', 1),
('2-2222-2222', 'María', 'Gómez', 'Vindas', '1990-07-22', '8888-2222', 'maria.gomez@example.com', 1),
('3-3333-3333', 'Ana', 'Solís', 'Chacón', '1978-11-05', '8888-3333', 'ana.solis@example.com', 1),
('4-4444-4444', 'Carlos', 'Fernández', 'Mora', '2000-01-30', '8888-4444', 'carlos.fernandez@example.com', 1),
('5-5555-5555', 'Laura', 'Jiménez', 'Alvarado', '1995-09-14', '8888-5555', 'laura.jimenez@example.com', 1),
('6-6666-6666', 'Pedro', 'Ramírez', 'Castro', '1966-05-02', '8888-6666', 'pedro.ramirez@example.com', 1),
('7-7777-7777', 'Sofía', 'Vargas', 'Núñez', '2010-12-19', '8888-7777', 'sofia.vargas@example.com', 1),
('8-8888-8888', 'Diego', 'Castillo', 'Brenes', '1982-08-08', '8888-8888', 'diego.castillo@example.com', 0),
('9-1234-5678', 'Gabriela', 'Araya', 'Solano', '1988-02-17', '8888-9001', 'gabriela.araya@example.com', 1),
('10-2345-6789', 'Esteban', 'Mora', 'Villalobos', '1975-06-24', '8888-9002', 'esteban.mora@example.com', 1),
('1-2233-4455', 'Karla', 'Chinchilla', 'Rojas', '1993-04-09', '8888-9003', 'karla.chinchilla@example.com', 1),
('2-3344-5566', 'Luis', 'Hernández', 'Zúñiga', '1960-10-11', '8888-9004', 'luis.hernandez@example.com', 1),
('3-4455-6677', 'Valeria', 'Núñez', 'Salazar', '2005-01-28', '8888-9005', 'valeria.nunez@example.com', 1),
('4-5566-7788', 'Andrés', 'Villalobos', 'Cordero', '1998-12-03', '8888-9006', 'andres.villalobos@example.com', 1),
('5-6677-8899', 'Melissa', 'Chaves', 'Umaña', '1983-07-19', '8888-9007', 'melissa.chaves@example.com', 1),
('6-7788-9900', 'José', 'Rodríguez', 'Elizondo', '1970-09-25', '8888-9008', 'jose.rodriguez@example.com', 1),
('7-8899-0011', 'Natalia', 'Barrantes', 'Cascante', '2015-03-08', '8888-9009', 'natalia.barrantes@example.com', 1),
('8-9900-1122', 'Ricardo', 'Quesada', 'Monge', '1955-11-30', '8888-9010', 'ricardo.quesada@example.com', 1),
('9-0011-2233', 'Daniela', 'Sánchez', 'Porras', '1992-05-16', '8888-9011', 'daniela.sanchez@example.com', 1),
('10-1122-3344', 'Mauricio', 'Vega', 'Alfaro', '1980-08-21', '8888-9012', 'mauricio.vega@example.com', 0);
GO

/* =====================================================
   2. ESPECIALIDADES
   ===================================================== */
INSERT INTO Especialidades (nombre, descripcion, es_activa) VALUES
('Medicina General', 'Atención primaria y chequeos generales', 1),
('Pediatría', 'Atención médica para niños', 1),
('Ginecología', 'Salud reproductiva femenina', 1),
('Cardiología', 'Salud del corazón y sistema circulatorio', 1),
('Dermatología', 'Salud de la piel', 1);
GO

/* =====================================================
   3. DOCTORES
   ===================================================== */
INSERT INTO Doctores (codigo_medico, nombre, primer_apellido, segundo_apellido, telefono, correo, id_especialidad, es_activo) VALUES
('MED-001', 'Roberto', 'Alpízar', 'García', '2222-1001', 'roberto.alpizar@medcontrol.com', 1, 1),
('MED-002', 'Carmen', 'Loría', 'Barrantes', '2222-1002', 'carmen.loria@medcontrol.com', 2, 1),
('MED-003', 'Alejandro', 'Salas', 'Quesada', '2222-1003', 'alejandro.salas@medcontrol.com', 3, 1),
('MED-004', 'Marcela', 'Ureña', 'Campos', '2222-1004', 'marcela.urena@medcontrol.com', 4, 1),
('MED-005', 'Fabián', 'Rojas', 'Méndez', '2222-1005', 'fabian.rojas@medcontrol.com', 5, 1);
GO

/* =====================================================
   4. SEGUROS
   ===================================================== */
INSERT INTO Seguros (id_paciente, aseguradora, numero_poliza, porcentaje_cobertura, fecha_vencimiento, es_activo) VALUES
(1, 'INS Seguros', 'POL-1001', 80.00, '2027-06-30', 1),
(2, 'MAPFRE Seguros', 'POL-1002', 70.00, '2027-01-15', 1),
(3, 'INS Seguros', 'POL-1003', 100.00, '2026-12-31', 1),
(5, 'Pan-American Life', 'POL-1004', 50.00, '2027-09-01', 1);
GO

/* =====================================================
   5. SERVICIOS
   ===================================================== */
INSERT INTO Servicios (nombre_servicio, descripcion, precio, es_activo) VALUES
('Consulta General', 'Consulta médica general', 25000.00, 1),
('Consulta Especializada', 'Consulta con médico especialista', 40000.00, 1),
('Examen de Sangre', 'Hemograma completo', 15000.00, 1),
('Electrocardiograma', 'Estudio de actividad cardíaca', 30000.00, 1),
('Consulta Pediátrica', 'Consulta médica para niños', 28000.00, 1);
GO

/* =====================================================
   6. CITAS
   ===================================================== */
INSERT INTO Citas (id_paciente, id_doctor, fecha_hora, motivo, estado_cita, observaciones) VALUES
(1, 1, '2026-09-02 08:00:00', 'Chequeo general', 'Completada', NULL),
(7, 2, '2026-09-02 09:00:00', 'Control de niño sano', 'Completada', NULL),
(2, 3, '2026-09-03 10:00:00', 'Control ginecológico anual', 'Completada', NULL),
(6, 4, '2026-09-03 11:00:00', 'Dolor en el pecho', 'Completada', NULL),
(3, 5, '2026-09-04 14:00:00', 'Revisión de lunar', 'Completada', NULL),
(4, 1, '2026-09-05 08:30:00', 'Dolor de garganta', 'Programada', NULL),
(5, 4, '2026-09-05 09:30:00', 'Chequeo cardíaco', 'Cancelada', 'Paciente canceló por motivos laborales'),
(8, 1, '2026-09-06 10:00:00', 'Consulta general', 'Ausente', 'Paciente no se presentó'),
(9, 1, '2026-09-08 08:00:00', 'Dolor de cabeza', 'Completada', NULL),
(10, 4, '2026-09-08 09:00:00', 'Chequeo cardíaco de rutina', 'Completada', NULL),
(11, 3, '2026-09-08 10:00:00', 'Control ginecológico anual', 'Completada', NULL),
(12, 1, '2026-09-09 08:00:00', 'Chequeo general', 'Programada', NULL),
(13, 5, '2026-09-09 09:00:00', 'Revisión de acné', 'Completada', NULL),
(14, 1, '2026-09-09 10:00:00', 'Dolor abdominal', 'Completada', NULL),
(15, 3, '2026-09-10 08:00:00', 'Consulta prenatal', 'Completada', NULL),
(16, 4, '2026-09-10 09:00:00', 'Control de hipertensión', 'Completada', NULL),
(17, 2, '2026-09-10 10:00:00', 'Vacunación', 'Completada', NULL),
(18, 1, '2026-09-11 08:00:00', 'Chequeo general', 'Cancelada', 'Paciente reprogramó'),
(19, 5, '2026-09-11 09:00:00', 'Revisión de manchas en la piel', 'Completada', NULL),
(20, 1, '2026-09-11 10:00:00', 'Consulta general', 'Ausente', 'Paciente no se presentó');
GO

/* =====================================================
   7. CONSULTAS
   -----------------------------------------------------
   Solo se crea consulta para las citas con estado
   'Completada' (id_cita 1 a 5).
   ===================================================== */
INSERT INTO Consultas (id_cita, fecha_consulta, diagnostico, tratamiento, observaciones) VALUES
(1, '2026-09-02 08:15:00', 'Paciente sano, sin hallazgos relevantes', 'Ninguno, control en 1 año', NULL),
(2, '2026-09-02 09:10:00', 'Desarrollo acorde a la edad', 'Continuar esquema de vacunación', NULL),
(3, '2026-09-03 10:20:00', 'Control ginecológico normal', 'Ninguno', NULL),
(4, '2026-09-03 11:15:00', 'Sospecha de angina, se requiere electrocardiograma', 'Reposo y seguimiento cardiológico', 'Se refiere a examen adicional'),
(5, '2026-09-04 14:10:00', 'Lunar benigno', 'Observación periódica', NULL),
(9, '2026-09-08 08:15:00', 'Cefalea tensional', 'Analgésico y manejo del estrés', NULL),
(10, '2026-09-08 09:10:00', 'Función cardíaca normal', 'Continuar hábitos saludables', NULL),
(11, '2026-09-08 10:15:00', 'Control ginecológico normal', 'Ninguno', NULL),
(13, '2026-09-09 09:10:00', 'Acné leve a moderado', 'Tratamiento tópico', NULL),
(14, '2026-09-09 10:10:00', 'Gastritis leve', 'Dieta blanda y antiácido', NULL),
(15, '2026-09-10 08:15:00', 'Embarazo de 12 semanas, evolución normal', 'Suplemento de ácido fólico', NULL),
(16, '2026-09-10 09:10:00', 'Hipertensión arterial controlada', 'Continuar medicación antihipertensiva', NULL),
(17, '2026-09-10 10:10:00', 'Esquema de vacunación al día', 'Aplicar próxima dosis según calendario', NULL),
(19, '2026-09-11 09:10:00', 'Manchas benignas en la piel', 'Seguimiento anual', NULL);
GO

/* =====================================================
   8. METODOS DE PAGO
   ===================================================== */
INSERT INTO MetodosPago (nombre, es_activo) VALUES
('Efectivo', 1),
('Tarjeta', 1),
('Transferencia', 1),
('Seguro', 1);
GO

/* =====================================================
   9. FACTURAS
   -----------------------------------------------------
   Una factura por cada cita completada (id_cita 1 a 5).
   ===================================================== */
INSERT INTO Facturas (id_cita, id_servicio, id_seguro, fecha_emision, subtotal, monto_cubierto_seguro, total_paciente, estado_factura) VALUES
(1, 1, 1, '2026-09-02 08:30:00', 25000.00, 20000.00, 5000.00, 'Pagada'),
(2, 5, NULL, '2026-09-02 09:30:00', 28000.00, 0.00, 28000.00, 'Pagada'),
(3, 2, 2, '2026-09-03 10:40:00', 40000.00, 28000.00, 12000.00, 'Pagada'),
(4, 4, NULL, '2026-09-03 11:30:00', 30000.00, 0.00, 30000.00, 'Pendiente'),
(5, 2, 3, '2026-09-04 14:30:00', 40000.00, 40000.00, 0.00, 'Pagada'),
(9, 1, NULL, '2026-09-08 08:30:00', 25000.00, 0.00, 25000.00, 'Pagada'),
(10, 2, NULL, '2026-09-08 09:30:00', 40000.00, 0.00, 40000.00, 'Pagada'),
(11, 2, NULL, '2026-09-08 10:30:00', 40000.00, 0.00, 40000.00, 'Pendiente'),
(13, 2, NULL, '2026-09-09 09:30:00', 40000.00, 0.00, 40000.00, 'Pagada'),
(14, 1, NULL, '2026-09-09 10:30:00', 25000.00, 0.00, 25000.00, 'Pagada'),
(15, 2, NULL, '2026-09-10 08:30:00', 40000.00, 0.00, 40000.00, 'Parcial'),
(16, 2, NULL, '2026-09-10 09:30:00', 40000.00, 0.00, 40000.00, 'Pagada'),
(17, 5, NULL, '2026-09-10 10:30:00', 28000.00, 0.00, 28000.00, 'Pagada'),
(19, 2, NULL, '2026-09-11 09:30:00', 40000.00, 0.00, 40000.00, 'Pendiente');
GO

/* =====================================================
   10. PAGOS
   -----------------------------------------------------
   No se registra pago para la factura 4 (Pendiente) ni
   para la factura 5 (total_paciente = 0, cubierta 100%
   por el seguro).
   ===================================================== */
INSERT INTO Pagos (id_factura, id_metodo_pago, fecha_pago, monto, numero_referencia) VALUES
(1, 1, '2026-09-02 08:30:00', 5000.00, NULL),
(2, 2, '2026-09-02 09:30:00', 28000.00, 'REF-0001'),
(3, 3, '2026-09-03 10:40:00', 12000.00, 'REF-0002'),
(6, 1, '2026-09-08 08:30:00', 25000.00, NULL),
(7, 2, '2026-09-08 09:30:00', 40000.00, 'REF-0003'),
(9, 3, '2026-09-09 09:30:00', 40000.00, 'REF-0004'),
(10, 1, '2026-09-09 10:30:00', 25000.00, NULL),
(11, 2, '2026-09-10 08:30:00', 20000.00, 'REF-0005'),
(12, 3, '2026-09-10 09:30:00', 40000.00, 'REF-0006'),
(13, 1, '2026-09-10 10:30:00', 28000.00, NULL);
GO

/* =====================================================
   11. RECETAS
   ===================================================== */
INSERT INTO Recetas (id_consulta, fecha_emision, medicamento, dosis, frecuencia, duracion_dias, indicaciones) VALUES
(2, '2026-09-02', 'Multivitamínico pediátrico', '5 ml', 'Una vez al día', 30, 'Tomar con el desayuno'),
(4, '2026-09-03', 'Ácido acetilsalicílico', '100 mg', 'Una vez al día', 90, 'Tomar después del almuerzo'),
(5, '2026-09-04', 'Crema hidratante', 'Aplicar capa fina', 'Dos veces al día', 15, 'Evitar exposición solar directa'),
(9, '2026-09-09', 'Peróxido de benzoilo', 'Aplicar capa fina', 'Una vez al día', 60, 'Aplicar en la noche, evitar exposición solar'),
(10, '2026-09-09', 'Omeprazol', '20 mg', 'Una vez al día en ayunas', 14, 'Tomar 30 minutos antes del desayuno'),
(12, '2026-09-10', 'Losartán', '50 mg', 'Una vez al día', 90, 'Tomar en la mañana');
GO

/* =====================================================
   12. INCAPACIDADES
   ===================================================== */
INSERT INTO Incapacidades (id_consulta, fecha_inicio, fecha_fin, motivo, observaciones) VALUES
(4, '2026-09-03', '2026-09-10', 'Reposo por sospecha de angina', 'Reevaluar en la próxima cita');
GO
