INSERT INTO Usuarios (ID, Nome, Login, Senha, Tipo)
VALUES
    (1, 'Operador 1', 'op1', 'op1', 'loja'),
    (2, 'Operador 2', 'op2', 'op2', 'loja');

INSERT INTO Produtos (ID, Nome, QuantidadeEstoque, PrecoVenda)
VALUES
    (1, 'Produto A', 100, 10.99),
    (2, 'Produto B', 50, 24.99),
    (3, 'Produto C', 200, 5.99);


DECLARE @ProximoID INT;
SET @ProximoID = NEXT VALUE FOR SequenciaPessoa;


INSERT INTO Pessoas (ID, Nome, Endereco, Telefone)
VALUES (@ProximoID, 'João Silva', 'Rua Principal 123', '123-456-7890');


INSERT INTO PessoasFisicas (CPF, DataNascimento, PessoaID)
VALUES ('12345678901', '1990-01-15', @ProximoID);


DECLARE @ProximoIDJuridica INT;
SET @ProximoIDJuridica = NEXT VALUE FOR SequenciaPessoa;


INSERT INTO Pessoas (ID, Nome, Endereco, Telefone)
VALUES (@ProximoIDJuridica, 'Empresa XYZ', 'Avenida Comercial 456', '987-654-3210');


INSERT INTO PessoasJuridicas (CNPJ, RazaoSocial, PessoaID)
VALUES ('98765432100123', 'Empresa XYZ Ltda.', @ProximoIDJuridica);

INSERT INTO MovimentosCompra (IDUsuario, IDPessoaJuridica, IDProduto, QuantidadeComprada, PrecoUnitarioCompra, DataCompra)
VALUES
    (1, '98765432100123', 1, 50, 9.99, '2023-09-20'),
    (2, '98765432100123', 2, 30, 20.49, '2023-09-20');

INSERT INTO MovimentosVenda (IDUsuario, IDPessoaFisica, IDProduto, QuantidadeVendida, DataVenda)
VALUES
    (1, '12345678901', 1, 20, '2023-09-21'),
    (2, '12345678901', 2, 10, '2023-09-21');
