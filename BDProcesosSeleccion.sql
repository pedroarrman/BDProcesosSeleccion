/**
 *bdtrabajadoresInternos.sql
 *Script de creacción de la base de datos
 */

/** borra la base de datos si existe. */
drop database if exists BDProcesosSeleccion;

/** Crea la base de datos. */
create database BDProcesosSeleccion;

/** Crea el usuario para acceder a la base de datos. */
create or replace user 'UBDProcesosSeleccion'@'localhost'
        identified by 'Lo-1234-lo';

/** concede privilegios al usuario para acceder a la base de datos. */
grant select, insert, update, delete on UBDProcesosSeleccion.*
    to 'UBDProcesosSeleccion'@'localhost';

/** Selecciona la base de datos. */
use BDProcesosSeleccion;

/** Crea las tablas. */
CREATE TABLE Candidaturas (
    ID_Candidatura INT,
    ID_Proceso INT,
    Sexo VARCHAR(255),
    Estado VARCHAR(255),
    CONSTRAINT PK_Candidaturas PRIMARY KEY (ID_Candidatura)
);

CREATE TABLE Contratos (
    ID_Contrato INT,
    ID_Candidatura INT,
    Fecha_Contrato DATETIME,
    CONSTRAINT PK_Contratos PRIMARY KEY (ID_Contrato),
    CONSTRAINT FK_Candidaturas_Contratos FOREIGN KEY (ID_Candidatura) 
        REFERENCES Candidaturas (ID_Candidatura)
);

CREATE TABLE ProcesosDeSeleccion (
    ID_Proceso INT,
    Nombre_Proceso VARCHAR(255),
    Fecha_Inicio DATETIME,
    Fecha_Fin DATETIME,
    Descripcion VARCHAR(255),
    CONSTRAINT PK_ProcesosDeSeleccion PRIMARY KEY (ID_Proceso)
);

CREATE TABLE Fases (
    ID_Fase INT,
    ID_Proceso INT,
    Estado VARCHAR(255),
    Fecha_Fase DATETIME,
    CONSTRAINT PK_Fases PRIMARY KEY (ID_Fase),
    CONSTRAINT FK_Procesos_Fases FOREIGN KEY (ID_Proceso) 
        REFERENCES ProcesosDeSeleccion (ID_Proceso)
);

ALTER TABLE Candidaturas 
    ADD CONSTRAINT FK_Procesos_Candidaturas FOREIGN KEY (ID_Proceso) 
    REFERENCES ProcesosDeSeleccion (ID_Proceso);
