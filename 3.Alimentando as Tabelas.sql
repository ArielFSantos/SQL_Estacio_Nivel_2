INSERT INTO Usuarios (ID, Login, Senha)
VALUES
    (1, 'op1', 'op1'),
    (2, 'op2', 'op2');

INSERT INTO Produtos (ID, Nome, QuantidadeEstoque, PrecoVenda)
VALUES
    (1, 'Produto A', 100, 10.99),
    (2, 'Produto B', 50, 24.99),
    (3, 'Produto C', 200, 5.99);


DECLARE @ProximoID INT;
SET @ProximoID = NEXT VALUE FOR SequenciaPessoa;


INSERT INTO Pessoas (ID, Nome, Logradouro,Cidade,Estado, Telefone,Email)
VALUES (@ProximoID, 'João Silva', 'Rua Principal 123','Goiania','GO', '1111-2222','joao@gmail.com');


INSERT INTO PessoasFisicas (CPF, PessoaID)
VALUES ('12345678901', @ProximoID);


DECLARE @ProximoIDJuridica INT;
SET @ProximoIDJuridica = NEXT VALUE FOR SequenciaPessoa;


INSERT INTO Pessoas (ID, Nome, Logradouro,Cidade,Estado, Telefone,Email)
VALUES (@ProximoIDJuridica, 'Marcos Souza', 'Rua Principal 231','Teresina','PI', '2121-1212','marcos@gmail.com');


INSERT INTO PessoasJuridicas (CNPJ, PessoaID)
VALUES ('41247954631874',  @ProximoIDJuridica);

INSERT INTO MovimentosCompra (ID, IDUsuario, IDPessoaJuridica, IDProduto, QuantidadeComprada, PrecoUnitarioCompra, DataCompra)
VALUES
    (1, 1, '41247954631874', 1, 50, 9.99, '2023-09-20'),
    (2, 2, '41247954631874', 2, 30, 20.49, '2023-09-20');


INSERT INTO MovimentosVenda (ID, IDUsuario, IDPessoaFisica, IDProduto, QuantidadeVendida, DataVenda)
VALUES
    (1, 1, '12345678901', 1, 20, '2023-09-21'),
    (2, 2, '12345678901', 2, 10, '2023-09-21');

