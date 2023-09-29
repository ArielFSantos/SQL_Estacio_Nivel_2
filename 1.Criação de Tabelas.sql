CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    Login NVARCHAR(50),
    Senha NVARCHAR(100), 

);

CREATE TABLE Pessoas (
    ID INT PRIMARY KEY,
    Nome NVARCHAR(255),
    Logradouro NVARCHAR(255),
	Cidade NVARCHAR(255),
	Estado NVARCHAR(255),
	Telefone NVARCHAR(20),
	Email NVARCHAR(255)
);

CREATE TABLE PessoasFisicas (
    CPF NVARCHAR(14) PRIMARY KEY,
    PessoaID INT UNIQUE, 
    FOREIGN KEY (PessoaID) REFERENCES Pessoas(ID)
);


CREATE TABLE PessoasJuridicas (
    CNPJ NVARCHAR(18) PRIMARY KEY,
    PessoaID INT UNIQUE,
    FOREIGN KEY (PessoaID) REFERENCES Pessoas(ID)
);

CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome NVARCHAR(255),
    QuantidadeEstoque INT,
    PrecoVenda DECIMAL(10, 2)
);

CREATE TABLE MovimentosCompra (
    ID INT PRIMARY KEY,
    IDUsuario INT,
    IDPessoaJuridica NVARCHAR(18),
    IDProduto INT,
    QuantidadeComprada INT,
    PrecoUnitarioCompra DECIMAL(10, 2),
    DataCompra DATE,
    FOREIGN KEY (IDUsuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (IDPessoaJuridica) REFERENCES PessoasJuridicas(CNPJ),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID)
);

CREATE TABLE MovimentosVenda (
    ID INT PRIMARY KEY,
    IDUsuario INT,
    IDPessoaFisica NVARCHAR(14),
    IDProduto INT,
    QuantidadeVendida INT,
    DataVenda DATE,
    FOREIGN KEY (IDUsuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (IDPessoaFisica) REFERENCES PessoasFisicas(CPF),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID)
);
