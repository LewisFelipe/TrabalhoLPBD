CREATE DATABASE lpbd;

CREATE TABLE `lpbd`.`users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE `UQ_USERNAME` (`username`)
) ENGINE = InnoDB;

CREATE TABLE `lpbd`.`pontos`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `idUser` INT NOT NULL,
    `dataHora` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`idUser`) REFERENCES users(id)
) ENGINE = InnoDB;

CREATE TABLE `lpbd`.`atestados`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `idUser` INT NOT NULL,
    `nome` VARCHAR(180) NOT NULL,
    `cpf` VARCHAR(16) NOT NULL,
    `cid` VARCHAR(8) NOT NULL,
    `dataAtestado` VARCHAR(10) NOT NULL,
    `qtdDias` VARCHAR(3) NOT NULL,
    `obs` VARCHAR(255) NOT NULL,
    `arquivoBase64` VARCHAR(8000) NULL,
    `dataEnvioAtestado` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`idUser`) REFERENCES users(id)
) ENGINE = InnoDB;

