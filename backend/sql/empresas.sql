CREATE TABLE empresas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomerantasia VARCHAR(255) NOT NULL,
    razaoSocial VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(15),
    rua VARCHAR(255),
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cep VARCHAR(9)
);
