DELIMITER $$
CREATE OR REPLACE FUNCTION INSERT_LOGIN(P_USERNAME VARCHAR(255), P_PASSWORD VARCHAR(255), P_NOME VARCHAR(180), P_CPF VARCHAR(14))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE V_RETURN INT(11);
	DECLARE V_QTD INT(11);
    SET V_RETURN := 0;
    SELECT COUNT(*) INTO V_QTD FROM USERS WHERE username = P_USERNAME;
    SET V_RETURN := ((CASE WHEN TRIM(P_USERNAME) IS NULL THEN 1 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_USERNAME) > 255 THEN 2 ELSE 0 END) +
                    (CASE WHEN TRIM(P_PASSWORD) IS NULL THEN 4 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_PASSWORD) > 255 THEN 8 ELSE 0 END) +
                    (CASE WHEN TRIM(P_USERNAME) IS NULL THEN 16 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_NOME) > 180 THEN 32 ELSE 0 END) +
                    (CASE WHEN TRIM(P_CPF) IS NULL THEN 64 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_CPF) <> 14 THEN 128 ELSE 0 END) +
                    (CASE WHEN V_QTD <> 0 THEN 256 ELSE 0 END));
    IF V_RETURN = 0 THEN
        INSERT INTO users (username, password, nome, cpf) VALUES (P_USERNAME, P_PASSWORD, P_NOME, P_CPF);
    END IF;
    RETURN V_RETURN;
END $$
DELIMITER ;;

DELIMITER $$
CREATE OR REPLACE FUNCTION INSERT_PONTO(P_USERNAME VARCHAR(255), P_DATAHORA VARCHAR(255))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE V_RETURN INT(11);
    SELECT id INTO V_RETURN FROM USERS WHERE username = P_USERNAME;
    IF V_RETURN <> 0 THEN
        INSERT INTO pontos (id_user, data_hora) VALUES (V_RETURN, P_DATAHORA);
    END IF;
    RETURN V_RETURN;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE FUNCTION INSERT_ATESTADO(P_USERNAME VARCHAR(255), P_CID VARCHAR(8), P_DATA VARCHAR(10), P_DIAS INT(3),
                                            P_CRM CHAR(10), P_NOME_MEDICO VARCHAR(255), P_OBS VARCHAR(1000), P_DATA_ENVIO VARCHAR(20))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE V_RETURN INT(11);
	DECLARE V_ID_LOGIN INT(11);
    SELECT id INTO V_ID_LOGIN FROM USERS WHERE username = P_USERNAME;
    SET V_RETURN := ((CASE WHEN TRIM(P_USERNAME) IS NULL THEN 1 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_USERNAME) > 255 THEN 2 ELSE 0 END) +
                    (CASE WHEN TRIM(P_CID) IS NULL THEN 8 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_CID) > 8 THEN 16 ELSE 0 END) +
                    (CASE WHEN TRIM(P_DATA) IS NULL THEN 32 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_DATA) > 10 THEN 64 ELSE 0 END) +
                    (CASE WHEN TRIM(P_CRM) IS NULL THEN 128 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_CRM) > 10 THEN 256 ELSE 0 END) +
                    (CASE WHEN P_DIAS < 0 THEN 512 ELSE 0 END) +
                    (CASE WHEN P_DIAS > 999 THEN 1024 ELSE 0 END) +
                    (CASE WHEN TRIM(P_NOME_MEDICO) IS NULL THEN 2048 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_NOME_MEDICO) > 255 THEN 4096 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_OBS) > 1000 THEN 8192 ELSE 0 END) +
                    (CASE WHEN TRIM(P_DATA_ENVIO) IS NULL THEN 8192 ELSE 0 END) +
                    (CASE WHEN V_ID_LOGIN IS NULL THEN 16384 ELSE 0 END));
    IF V_RETURN = 0 THEN
        INSERT INTO atestados (id_user, cid, data_atestado, qtd_dias, crm, nome_medico, obs, data_envio)
            VALUES (V_ID_LOGIN, P_CID, P_DATA, P_DIAS, P_CRM, P_NOME_MEDICO, P_OBS, P_DATA_ENVIO);
    END IF;
    RETURN V_RETURN;
END $$
DELIMITER ;;

DELIMITER $$
CREATE OR REPLACE FUNCTION UPDATE_LOGIN(P_USERNAME VARCHAR(255), P_PASSWORD VARCHAR(255))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE V_RETURN INT(11);
	DECLARE V_QTD INT(11);
    SET V_RETURN := 0;
    SELECT COUNT(*) INTO V_QTD FROM USERS WHERE username = P_USERNAME;
    SET V_RETURN := ((CASE WHEN TRIM(P_USERNAME) IS NULL THEN 1 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_USERNAME) > 255 THEN 2 ELSE 0 END) +
                    (CASE WHEN TRIM(P_PASSWORD) IS NULL THEN 4 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_PASSWORD) > 255 THEN 8 ELSE 0 END) +
                    (CASE WHEN V_QTD <> 1 THEN 16 ELSE 0 END));
    IF V_RETURN = 0 THEN
        UPDATE users SET password = P_PASSWORD WHERE username = P_USERNAME;
    END IF;
    RETURN V_RETURN;
END $$
DELIMITER ;;

DELIMITER $$
CREATE OR REPLACE FUNCTION VALIDATE_LOGIN(P_USERNAME VARCHAR(255), P_PASSWORD VARCHAR(255))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE V_RETURN INT(11);
	DECLARE V_QTD INT(11);
    SET V_RETURN := 0;
    SELECT COUNT(*) INTO V_QTD FROM USERS WHERE username = P_USERNAME;
    SET V_RETURN := ((CASE WHEN TRIM(P_USERNAME) IS NULL THEN 1 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_USERNAME) > 255 THEN 2 ELSE 0 END) +
                    (CASE WHEN TRIM(P_PASSWORD) IS NULL THEN 4 ELSE 0 END) +
                    (CASE WHEN LENGTH(P_PASSWORD) > 255 THEN 8 ELSE 0 END) +
                    (CASE WHEN V_QTD <> 1 THEN 16 ELSE 0 END));
    IF V_RETURN = 0 THEN
        SELECT COUNT(*) INTO V_QTD FROM users WHERE username = P_USERNAME AND password = P_PASSWORD;
        IF V_QTD <> 1 THEN
        	SET V_RETURN := V_RETURN + 32;
    	END IF;
    END IF;
    RETURN V_RETURN;
END $$
DELIMITER ;;