USE MedControl;
GO

/* =====================================================================
   CONSULTAS SIMPLES
   ===================================================================== */

-- 1. Listar todos los pacientes activos
SELECT id_paciente, cedula, nombre, primer_apellido, segundo_apellido, telefono
FROM Pacientes
WHERE es_activo = 1
ORDER BY primer_apellido;
GO

-- 2. Listar las citas canceladas o donde el paciente no asistió
SELECT id_cita, id_paciente, id_doctor, fecha_hora, estado_cita, observaciones
FROM Citas
WHERE estado_cita IN ('Cancelada', 'Ausente')
ORDER BY fecha_hora;
GO

-- 3. Buscar un paciente específico por su cédula
SELECT id_paciente, nombre, primer_apellido, segundo_apellido, telefono, correo
FROM Pacientes
WHERE cedula = '1-1111-1111';
GO


/* =====================================================================
   CONSULTAS CON JOIN
   ===================================================================== */

-- 4. Ver todas las citas con el nombre del paciente y del doctor que las atiende
SELECT
    c.id_cita,
    p.nombre + ' ' + p.primer_apellido AS paciente,
    d.nombre + ' ' + d.primer_apellido AS doctor,
    e.nombre AS especialidad,
    c.fecha_hora,
    c.estado_cita
FROM Citas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
JOIN Doctores d ON c.id_doctor = d.id_doctor
JOIN Especialidades e ON d.id_especialidad = e.id_especialidad
ORDER BY c.fecha_hora;
GO

-- 5. Ver las recetas emitidas junto con el paciente y la consulta que las originó
SELECT
    r.id_receta,
    p.nombre + ' ' + p.primer_apellido AS paciente,
    r.medicamento,
    r.dosis,
    r.frecuencia,
    r.duracion_dias,
    co.diagnostico
FROM Recetas r
JOIN Consultas co ON r.id_consulta = co.id_consulta
JOIN Citas ci ON co.id_cita = ci.id_cita
JOIN Pacientes p ON ci.id_paciente = p.id_paciente
ORDER BY r.fecha_emision;
GO

-- 6. Ver las facturas junto con el servicio cobrado y el método de pago utilizado
SELECT
    f.id_factura,
    s.nombre_servicio,
    f.subtotal,
    f.monto_cubierto_seguro,
    f.total_paciente,
    f.estado_factura,
    mp.nombre AS metodo_pago
FROM Facturas f
JOIN Servicios s ON f.id_servicio = s.id_servicio
LEFT JOIN Pagos pa ON pa.id_factura = f.id_factura
LEFT JOIN MetodosPago mp ON pa.id_metodo_pago = mp.id_metodo_pago
ORDER BY f.fecha_emision;
GO


/* =====================================================================
   AGREGACIONES Y AGRUPAMIENTOS
   ===================================================================== */

-- 7. Ingresos totales facturados por cada doctor
SELECT
    d.nombre + ' ' + d.primer_apellido AS doctor,
    e.nombre AS especialidad,
    SUM(f.total_paciente) AS ingresos_totales,
    COUNT(f.id_factura) AS cantidad_facturas
FROM Facturas f
JOIN Citas c ON f.id_cita = c.id_cita
JOIN Doctores d ON c.id_doctor = d.id_doctor
JOIN Especialidades e ON d.id_especialidad = e.id_especialidad
GROUP BY d.nombre, d.primer_apellido, e.nombre
ORDER BY ingresos_totales DESC;
GO

-- 8. Cantidad de citas agrupadas por estado
SELECT estado_cita, COUNT(*) AS cantidad
FROM Citas
GROUP BY estado_cita
ORDER BY cantidad DESC;
GO

-- 9. Porcentaje de cobertura promedio que ofrece cada aseguradora
SELECT aseguradora, AVG(porcentaje_cobertura) AS cobertura_promedio
FROM Seguros
GROUP BY aseguradora
ORDER BY cobertura_promedio DESC;
GO


/* =====================================================================
   CONSULTAS AVANZADAS
   ===================================================================== */

-- 10. Pacientes que tuvieron consulta pero no tienen seguro registrado
SELECT DISTINCT p.id_paciente, p.nombre, p.primer_apellido, p.telefono
FROM Pacientes p
JOIN Citas c ON c.id_paciente = p.id_paciente
JOIN Consultas co ON co.id_cita = c.id_cita
WHERE p.id_paciente NOT IN (SELECT id_paciente FROM Seguros);
GO

-- 11. Doctores cuya cantidad de citas completadas supera el promedio general
WITH CitasPorDoctor AS (
    SELECT id_doctor, COUNT(*) AS total_completadas
    FROM Citas
    WHERE estado_cita = 'Completada'
    GROUP BY id_doctor
)
SELECT
    d.nombre + ' ' + d.primer_apellido AS doctor,
    cpd.total_completadas
FROM CitasPorDoctor cpd
JOIN Doctores d ON d.id_doctor = cpd.id_doctor
WHERE cpd.total_completadas > (SELECT AVG(total_completadas) FROM CitasPorDoctor)
ORDER BY cpd.total_completadas DESC;
GO

-- 12. Facturas pendientes de pago junto con los datos de contacto del paciente
SELECT
    f.id_factura,
    p.nombre + ' ' + p.primer_apellido AS paciente,
    p.telefono,
    p.correo,
    f.total_paciente,
    f.fecha_emision
FROM Facturas f
JOIN Citas c ON f.id_cita = c.id_cita
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE f.estado_factura = 'Pendiente'
ORDER BY f.fecha_emision;
GO
