CREATE TABLE veiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    quilometragem DECIMAL(10,2),
    proprietarioId INT NOT NULL,
    FOREIGN KEY (proprietarioId) REFERENCES usuarios(id)
);
