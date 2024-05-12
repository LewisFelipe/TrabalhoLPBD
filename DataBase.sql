CREATE DATABASE lpbd;

CREATE TABLE `lpbd`.`users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE `UQ_USERNAME` (`username`)
) ENGINE = InnoDB;