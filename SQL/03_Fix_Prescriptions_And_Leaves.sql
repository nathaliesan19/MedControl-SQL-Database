USE MedControl;
GO

/* =====================================================
   Corregir Recetas e Incapacidades para que usen
   id_consulta en vez de id_cita.
   No afecta a las demás tablas ni a sus datos.
   ===================================================== */

DROP TABLE Recetas;
GO

DROP TABLE Incapacidades;
GO

CREATE TABLE Recetas (
    id_receta INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT NOT NULL,
    fecha_emision DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    medicamento VARCHAR(100) NOT NULL,
    dosis VARCHAR(50) NOT NULL,
    frecuencia VARCHAR(100) NOT NULL,
    duracion_dias INT NOT NULL,
    indicaciones VARCHAR(500) NULL,

    CONSTRAINT FK_Recetas_Consultas
        FOREIGN KEY (id_consulta)
        REFERENCES Consultas(id_consulta),

    CONSTRAINT CK_Recetas_Duracion
        CHECK (duracion_dias > 0)
);
GO

CREATE TABLE Incapacidades (
    id_incapacidad INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT NOT NULL UNIQUE,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo VARCHAR(250) NOT NULL,
    observaciones VARCHAR(500) NULL,

    CONSTRAINT FK_Incapacidades_Consultas
        FOREIGN KEY (id_consulta)
        REFERENCES Consultas(id_consulta),

    CONSTRAINT CK_Incapacidades_Fechas
        CHECK (fecha_fin >= fecha_inicio)
);
GO

/* =====================================================
   Volver a insertar los datos de prueba de Recetas
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
   Volver a insertar el dato de prueba de Incapacidades
   ===================================================== */
INSERT INTO Incapacidades (id_consulta, fecha_inicio, fecha_fin, motivo, observaciones) VALUES
(4, '2026-09-03', '2026-09-10', 'Reposo por sospecha de angina', 'Reevaluar en la próxima cita');
GO
