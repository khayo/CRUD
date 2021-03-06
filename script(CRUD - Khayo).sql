USE [master]
GO
/****** Object:  Database [CRUD]    Script Date: 22/11/2020 18:01:40 ******/
CREATE DATABASE [CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CRUD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUD] SET RECOVERY FULL 
GO
ALTER DATABASE [CRUD] SET  MULTI_USER 
GO
ALTER DATABASE [CRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRUD', N'ON'
GO
ALTER DATABASE [CRUD] SET QUERY_STORE = OFF
GO
USE [CRUD]
GO
/****** Object:  Table [dbo].[diretores]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diretores](
	[iddiretor] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filmes]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filmes](
	[idfilme] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NULL,
	[id_diretor] [int] NULL,
	[dataLancamento] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAlteraDiretor]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <22/11/2020>
-- Description:	<Altera um diretor>
-- =============================================
CREATE PROCEDURE [dbo].[spAlteraDiretor]
	@id INT,
	@nome VARCHAR(50)
AS
BEGIN
	UPDATE dbo.diretores SET nome = @nome WHERE iddiretor = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spAlteraFilme]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Altera um filme existente>
-- =============================================
CREATE PROCEDURE [dbo].[spAlteraFilme]
	@idfilme INT,
	@nome VARCHAR(50),
	@diretor VARCHAR(50),
	@dataLancamento DATETIME

AS

DECLARE @id_diretor INT;

BEGIN
	EXECUTE dbo.spVerificaDiretor @diretor,  @id_diretor OUTPUT; 
	UPDATE dbo.filmes set nome = @nome, id_diretor = @id_diretor, dataLancamento = @dataLancamento 
	WHERE idfilme = @idfilme;
END
GO
/****** Object:  StoredProcedure [dbo].[spApagarDiretorPorId]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <22/11/2020>
-- Description:	<Apaga um diretor>
-- =============================================
CREATE PROCEDURE [dbo].[spApagarDiretorPorId]
	@id INT
AS
BEGIN
	DELETE FROM dbo.diretores WHERE iddiretor = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spApagarFilmePorId]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Apaga o filme com o id indicado>
-- =============================================
CREATE PROCEDURE [dbo].[spApagarFilmePorId]

@id int

AS
BEGIN
	DELETE FROM dbo.filmes WHERE idfilme=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarDiretorPorId]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <22/11/2020>
-- Description:	<Busca um diretor pelo id>
-- =============================================
CREATE PROCEDURE [dbo].[spBuscarDiretorPorId]
	@id INT
AS
BEGIN
	SELECT * FROM dbo.diretores WHERE iddiretor = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarFilmePorId]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Busca o filme com o id indicado>
-- =============================================
CREATE PROCEDURE [dbo].[spBuscarFilmePorId] 
	@idfilme INT
AS
BEGIN
	SELECT f.idfilme AS [id], f.nome [nome], f.dataLancamento AS [dataLancamento], d.nome AS [diretor] FROM dbo.filmes AS f, dbo.diretores AS d
	WHERE d.iddiretor = f.id_diretor
	AND f.idfilme = @idfilme;
END
GO
/****** Object:  StoredProcedure [dbo].[spDiretores_GetAll]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Insere um filme e um diretor as tabelas>
-- =============================================
CREATE PROCEDURE [dbo].[spDiretores_GetAll]
AS
BEGIN	
	SELECT * FROM dbo.diretores;		
END
GO
/****** Object:  StoredProcedure [dbo].[spFilmes_GetAll]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Busca todos os dados da tabela filmes>
-- =============================================
CREATE PROCEDURE [dbo].[spFilmes_GetAll] 
AS
BEGIN
	SELECT f.idfilme AS [id], f.nome [nome], f.dataLancamento AS [dataLancamento], d.nome AS [diretor] FROM dbo.filmes AS f, dbo.diretores AS d
	WHERE d.iddiretor = f.id_diretor
	ORDER BY f.idfilme;
END

GO
/****** Object:  StoredProcedure [dbo].[spInserirDiretor]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <22/11/2020>
-- Description:	<Adiciona um diretor>
-- =============================================
CREATE PROCEDURE [dbo].[spInserirDiretor]
	@nome varchar(50)
AS
BEGIN
	INSERT INTO dbo.diretores(nome) VALUES(@nome);
END
GO
/****** Object:  StoredProcedure [dbo].[spInserirFilme]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Insere um novo filme>
-- =============================================
CREATE PROCEDURE [dbo].[spInserirFilme]
	@nome VARCHAR(50),
	@diretor VARCHAR(50),
	@dataLancamento DATETIME

AS

DECLARE @id_diretor INT;

BEGIN
	EXECUTE dbo.spVerificarDiretor @diretor,  @id_diretor OUTPUT; 
	INSERT INTO dbo.filmes(nome, id_diretor, dataLancamento) VALUES(@nome, @id_diretor, @dataLancamento);
END

	
	
GO
/****** Object:  StoredProcedure [dbo].[spVerificarDiretor]    Script Date: 22/11/2020 18:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Khayo Vannucci Rodrigues>
-- Create date: <18/11/2020>
-- Description:	<Insere um filme e um diretor as tabelas>
-- =============================================
CREATE PROCEDURE [dbo].[spVerificarDiretor]
	@nomeDiretor varchar(50),
	@iddiretor INT OUTPUT

	AS
	BEGIN
	IF @nomeDiretor = (SELECT nome FROM dbo.diretores WHERE nome = @nomeDiretor)
	BEGIN 
		SELECT @iddiretor = iddiretor FROM dbo.diretores WHERE nome = @nomeDiretor;
	END
	ELSE
	BEGIN
		INSERT INTO dbo.diretores(nome) VALUES( @nomeDiretor);
		SELECT @iddiretor = iddiretor FROM dbo.diretores WHERE nome = @nomeDiretor;
	END
END
GO
USE [master]
GO
ALTER DATABASE [CRUD] SET  READ_WRITE 
GO
