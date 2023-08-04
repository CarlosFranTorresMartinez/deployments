CREATE DATABASE linkage;
\c linkage

CREATE TABLE assign_student_tutor (
    id uuid  NOT NULL,
    tutorId uuid  NOT NULL,
    studentId uuid  NOT NULL,
    cycleAcademy varchar(10)  NOT NULL,
    semesterAcademy varchar(5)  NOT NULL,
    career varchar(5)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT assign_student_tutor_pk PRIMARY KEY (id)
);

CREATE TABLE student (
    id uuid  NOT NULL,
    picture varchar(200)  NULL,
    fullname varchar(100)  NOT NULL,
    email varchar(100)  NOT NULL,
    career char(2)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE tutor (
    id uuid  NOT NULL,
    picture varchar(200)  NULL,
    code varchar(5)  NOT NULL,
    fullname varchar(100)  NOT NULL,
    email varchar(100)  NOT NULL,
    rol char(2)  NOT NULL,
    career char(2)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT tutor_pk PRIMARY KEY (id)
);

ALTER TABLE assign_student_tutor ADD CONSTRAINT assign_student_tutor_student
    FOREIGN KEY (studentId)
    REFERENCES student (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE assign_student_tutor ADD CONSTRAINT assign_student_tutor_tutor
    FOREIGN KEY (tutorId)
    REFERENCES tutor (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE assign_student_tutor TO develop;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE student TO develop;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE tutor TO develop;


INSERT INTO tutor VALUES(gen_random_uuid(), '', 'SA', 'SUPER ADMINISTRADOR', 'tutorias@vallegrande.edu.pe', 'SA', 'NN', 'A');