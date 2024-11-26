-- Active: 1727176056121@@127.0.0.1@5432@20242_fatec_ipi_pbdi_luisaugusto@public

SELECT * FROM student_predict;

-- EXERCICIO 1
DROP TABLE IF EXISTS student_p2;
CREATE TABLE student_p2(
    ID_S SERIAL PRIMARY KEY,
	STUDENTID VARCHAR,
    AGE INT,
    GENDER INT,
    HS_TYPE INT,
    SCHOLARSHIP INT,
    WORK INT,
    ACTIVITY INT,
    PARTNER INT,
    SALARY INT,
    TRANSPORT INT,
    LIVING INT,
    MOTHER_EDU INT,
    FATHER_EDU INT,
    N_SIBLINGS INT,
    KIDS INT,
    MOTHER_JOB INT,
    FATHER_JOB INT,
    STUDY_HRS INT,
    READ_FREQ INT,
    READ_FREQ_SCI INT,
    ATTEND_DEPT INT,
    IMPACT INT,
    ATTEND INT,
    PREP_STUDY INT,
    PREP_EXAM INT,
    NOTES INT,
    LISTENS INT,
    LIKES_DISCUSS INT,
    CLASSROOM INT,
    CUML_GPA INT,
    EXP_GPA INT,
    COURSE INT,
    GRADE INT
);

ALTER TABLE student_predict DROP COLUMN AGE;
ALTER TABLE student_predict DROP COLUMN GENDER;
ALTER TABLE student_predict DROP COLUMN HS_TYPE;
ALTER TABLE student_predict DROP COLUMN WORK;
ALTER TABLE student_predict DROP COLUMN ACTIVITY;
ALTER TABLE student_predict DROP COLUMN PARTNER;
ALTER TABLE student_predict DROP COLUMN TRANSPORT;
ALTER TABLE student_predict DROP COLUMN LIVING;
ALTER TABLE student_predict DROP COLUMN N_SIBLINGS;
ALTER TABLE student_predict DROP COLUMN KIDS;
ALTER TABLE student_predict DROP COLUMN MOTHER_JOB;
ALTER TABLE student_predict DROP COLUMN FATHER_JOB;
ALTER TABLE student_predict DROP COLUMN STUDY_HRS;
ALTER TABLE student_predict DROP COLUMN READ_FREQ;
ALTER TABLE student_predict DROP COLUMN READ_FREQ_SCI;
ALTER TABLE student_predict DROP COLUMN ATTEND_DEPT;
ALTER TABLE student_predict DROP COLUMN IMPACT;
ALTER TABLE student_predict DROP COLUMN ATTEND;
ALTER TABLE student_predict DROP COLUMN NOTES;
ALTER TABLE student_predict DROP COLUMN LISTENS;
ALTER TABLE student_predict DROP COLUMN LIKES_DISCUSS;
ALTER TABLE student_predict DROP COLUMN CLASSROOM;
ALTER TABLE student_predict DROP COLUMN CUML_GPA;
ALTER TABLE student_predict DROP COLUMN EXP_GPA;
ALTER TABLE student_predict DROP COLUMN COURSE;
ALTER TABLE student_predict DROP COLUMN GRADE;

-- EXERCICIO 2
CREATE OR REPLACE PROCEDURE sp_aprovados_pais_phds(
    OUT v_res INT
) LANGUAGE plpgsql
AS $$
    BEGIN
        v_res := COUNT(ID_S) FROM student_p2 WHERE father_edu = 6 AND mother_edu = 6 AND GRADE > 0;
        RAISE NOTICE '%', v_res;
    END;
$$

-- EXERCICIO 3
CREATE OR REPLACE PROCEDURE sp_aprovados_sozinho(
    OUT v_aprovado INT
) LANGUAGE plpgsql
AS $$
    BEGIN
        v_aprovado := COUNT(ID_S) FROM student_p2 WHERE PREP_STUDY = 1 AND GRADE > 0;
    END;
$$

-- EXERCICIO 4
CREATE OR REPLACE FUNCTION fn_alunos_salario_estudos(
) RETURNS INT
    LANGUAGE plpgsql AS $$
    DECLARE
        v_resultado INT;
    BEGIN
        SELECT COUNT(ID_S) FROM student_p2 WHERE prep_exam = 2 AND salary = 5 
        INTO v_resultado;
        RETURN v_resultado;
    END;
    $$;

-- EXERCICIO 5
