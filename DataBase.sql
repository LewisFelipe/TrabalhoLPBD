CREATE DATABASE lpbd;

CREATE TABLE `lpbd`.`users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `nome` VARCHAR(180) NOT NULL,
    `cpf` CHAR(16) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE `UQ_USERNAME` (`username`)
) ENGINE = InnoDB;

CREATE TABLE `lpbd`.`pontos`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_user` INT NOT NULL,
    `data_hora` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_user`) REFERENCES users(id)
) ENGINE = InnoDB;

CREATE TABLE `lpbd`.`atestados`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_user` INT NOT NULL,
    `cid` VARCHAR(8) NOT NULL,
    `data_atestado` VARCHAR(10) NOT NULL,
    `qtd_dias` INT(3) NOT NULL,
    `crm` CHAR(10) NOT NULL,
    `nome_medico` VARCHAR(255) NOT NULL,
    `obs` VARCHAR(1000) NULL,
    `data_envio` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_user`) REFERENCES users(id)
) ENGINE = InnoDB;