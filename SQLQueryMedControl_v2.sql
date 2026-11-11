-- Crear la base de datos
CREATE DATABASE MedControl;
GO

-- Seleccionar la base de datos para trabajar en ella
USE MedControl;
GO


/* =====================================================
   1. TABLA PACIENTES
   ===================================================== */

CREATE TABLE Pacientes (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NULL,
    es_activo BIT NOT NULL DEFAULT 1
);
GO


/* =====================================================
   2. TABLA ESPECIALIDADES
   ===================================================== */

CREATE TABLE Especialidades (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(250) NULL,
    es_activa BIT NOT NULL DEFAULT 1
);
GO


/* =====================================================
   3. TABLA DOCTORES
   ===================================================== */

CREATE TABLE Doctores (
    id_doctor INT IDENTITY(1,1) PRIMARY KEY,
    codigo_medico VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NULL,
    telefono VARCHAR(20) NULL,
    correo VARCHAR(100) NULL,
    id_especialidad INT NOT NULL,
    es_activo BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_Doctores_Especialidades
        FOREIGN KEY (id_especialidad)
        REFERENCES Especialidades(id_especialidad)
);
GO


/* =====================================================
   4. TABLA SEGUROS
   ===================================================== */

CREATE TABLE Seguros (
    id_seguro INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    aseguradora VARCHAR(100) NOT NULL,
    numero_poliza VARCHAR(50) NOT NULL UNIQUE,
    porcentaje_cobertura DECIMAL(5,2) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    es_activo BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_Seguros_Pacientes
        FOREIGN KEY (id_paciente)
        REFERENCES Pacientes(id_paciente),

    CONSTRAINT CK_Seguros_Cobertura
        CHECK (porcentaje_cobertura BETWEEN 0 AND 100)
);
GO


/* =====================================================
   5. TABLA SERVICIOS
   ===================================================== */

CREATE TABLE Servicios (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(250) NULL,
    precio DECIMAL(10,2) NOT NULL,
    es_activo BIT NOT NULL DEFAULT 1,

    CONSTRAINT CK_Servicios_Precio
        CHECK (precio >= 0)
);
GO


/* =====================================================
   6. TABLA CITAS
   ===================================================== */

CREATE TABLE Citas (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_doctor INT NOT NULL,
    fecha_hora DATETIME2(0) NOT NULL,
    motivo VARCHAR(250) NOT NULL,
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'Programada',
    observaciones VARCHAR(500) NULL,

    CONSTRAINT FK_Citas_Pacientes
        FOREIGN KEY (id_paciente)
        REFERENCES Pacientes(id_paciente),

    CONSTRAINT FK_Citas_Doctores
        FOREIGN KEY (id_doctor)
        REFERENCES Doctores(id_doctor),

    CONSTRAINT CK_Citas_Estado
        CHECK (
            estado_cita IN (
                'Programada',
                'Confirmada',
                'Completada',
                'Cancelada',
                'Ausente'
            )
        ),

    CONSTRAINT UQ_Citas_Doctor_Fecha
        UNIQUE (id_doctor, fecha_hora),

    CONSTRAINT UQ_Citas_Paciente_Fecha
        UNIQUE (id_paciente, fecha_hora)
);
GO


/* =====================================================
   7. TABLA CONSULTAS  (NUEVA)
   -----------------------------------------------------
   Representa la atención médica real de una cita ya
   completada: diagnóstico y tratamiento. Recetas e
   Incapacidades ahora dependen de la consulta, no de
   la cita directamente, tal como se planteó en el
   Avance 1.
   ===================================================== */

CREATE TABLE Consultas (
    id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT NOT NULL UNIQUE,
    fecha_consulta DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    diagnostico VARCHAR(500) NOT NULL,
    tratamiento VARCHAR(500) NULL,
    observaciones VARCHAR(500) NULL,

    CONSTRAINT FK_Consultas_Citas
        FOREIGN KEY (id_cita)
        REFERENCES Citas(id_cita)
);
GO


/* =====================================================
   8. TABLA METODOS DE PAGO
   ===================================================== */

CREATE TABLE MetodosPago (
    id_metodo_pago INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    es_activo BIT NOT NULL DEFAULT 1
);
GO


/* =====================================================
   9. TABLA FACTURAS
   ===================================================== */

CREATE TABLE Facturas (
    id_factura INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT NOT NULL UNIQUE,
    id_servicio INT NOT NULL,
    id_seguro INT NULL,
    fecha_emision DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    subtotal DECIMAL(10,2) NOT NULL,
    monto_cubierto_seguro DECIMAL(10,2) NOT NULL DEFAULT 0,
    total_paciente DECIMAL(10,2) NOT NULL,
    estado_factura VARCHAR(20) NOT NULL DEFAULT 'Pendiente',

    CONSTRAINT FK_Facturas_Citas
        FOREIGN KEY (id_cita)
        REFERENCES Citas(id_cita),

    CONSTRAINT FK_Facturas_Servicios
        FOREIGN KEY (id_servicio)
        REFERENCES Servicios(id_servicio),

    CONSTRAINT FK_Facturas_Seguros
        FOREIGN KEY (id_seguro)
        REFERENCES Seguros(id_seguro),

    CONSTRAINT CK_Facturas_Subtotal
        CHECK (subtotal >= 0),

    CONSTRAINT CK_Facturas_Cobertura
        CHECK (monto_cubierto_seguro >= 0),

    CONSTRAINT CK_Facturas_TotalPaciente
        CHECK (total_paciente >= 0),

    CONSTRAINT CK_Facturas_Calculo
        CHECK (total_paciente = subtotal - monto_cubierto_seguro),

    CONSTRAINT CK_Facturas_Estado
        CHECK (
            estado_factura IN (
                'Pendiente',
                'Pagada',
                'Parcial',
                'Anulada'
            )
        )
);
GO


/* =====================================================
   10. TABLA PAGOS
   ===================================================== */

CREATE TABLE Pagos (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    id_factura INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    fecha_pago DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    monto DECIMAL(10,2) NOT NULL,
    numero_referencia VARCHAR(100) NULL,

    CONSTRAINT FK_Pagos_Facturas
        FOREIGN KEY (id_factura)
        REFERENCES Facturas(id_factura),

    CONSTRAINT FK_Pagos_MetodosPago
        FOREIGN KEY (id_metodo_pago)
        REFERENCES MetodosPago(id_metodo_pago),

    CONSTRAINT CK_Pagos_Monto
        CHECK (monto > 0)
);
GO


/* =====================================================
   11. TABLA RECETAS  (ACTUALIZADA: ahora depende de Consultas)
   ===================================================== */

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


/* =====================================================
   12. TABLA INCAPACIDADES  (ACTUALIZADA: ahora depende de Consultas)
   ===================================================== */

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
