USE [Historiainador]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[codAdministrador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Apellido] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[codAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[codRegistro] [int] IDENTITY(1,1) NOT NULL,
	[CodUsuario] [int] NULL,
	[Nombre_Usuario] [varchar](30) NULL,
	[Contraseña] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Admin](
	[codRegistro_Admin] [int] IDENTITY(1,1) NOT NULL,
	[codRegistro] [int] NULL,
	[codAdministrador] [int] NULL,
	[Descripción] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[codRegistro_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usu_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usu_Admin](
	[codUsu_Admin] [int] IDENTITY(1,1) NOT NULL,
	[codUsuario] [int] NOT NULL,
	[codAdministrador] [int] NOT NULL,
	[Descripción] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[codUsu_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[codUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](80) NULL,
	[Apellidos] [varchar](80) NULL,
	[Correo] [varchar](40) NULL,
	[Telefono] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [fk_codUsuarioR] FOREIGN KEY([CodUsuario])
REFERENCES [dbo].[Usuario] ([codUsuario])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [fk_codUsuarioR]
GO
ALTER TABLE [dbo].[Registro_Admin]  WITH CHECK ADD  CONSTRAINT [fk_codAdminR] FOREIGN KEY([codAdministrador])
REFERENCES [dbo].[Administrador] ([codAdministrador])
GO
ALTER TABLE [dbo].[Registro_Admin] CHECK CONSTRAINT [fk_codAdminR]
GO
ALTER TABLE [dbo].[Registro_Admin]  WITH CHECK ADD  CONSTRAINT [fk_codRegistroR] FOREIGN KEY([codRegistro])
REFERENCES [dbo].[Registro] ([codRegistro])
GO
ALTER TABLE [dbo].[Registro_Admin] CHECK CONSTRAINT [fk_codRegistroR]
GO
ALTER TABLE [dbo].[Usu_Admin]  WITH CHECK ADD  CONSTRAINT [fk_codAdmin] FOREIGN KEY([codAdministrador])
REFERENCES [dbo].[Administrador] ([codAdministrador])
GO
ALTER TABLE [dbo].[Usu_Admin] CHECK CONSTRAINT [fk_codAdmin]
GO
ALTER TABLE [dbo].[Usu_Admin]  WITH CHECK ADD  CONSTRAINT [fk_codUsuario] FOREIGN KEY([codUsuario])
REFERENCES [dbo].[Usuario] ([codUsuario])
GO
ALTER TABLE [dbo].[Usu_Admin] CHECK CONSTRAINT [fk_codUsuario]
GO
/****** Object:  StoredProcedure [dbo].[BuscarAdministrador]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarAdministrador] 
@codAdministrador int
as
select*  from Administrador where codAdministrador=@codAdministrador
GO
/****** Object:  StoredProcedure [dbo].[BuscarRegistro]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarRegistro]
@codRegistro int
as
select*  from Registro where codRegistro=@codRegistro
GO
/****** Object:  StoredProcedure [dbo].[BuscarRegistro_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarRegistro_Admin]
@codRegistro_Admin int
as
select*  from Registro_Admin where codRegistro_Admin=@codRegistro_Admin
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsu_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarUsu_Admin] 
@codUsu_Admin int
as
select*  from Usu_Admin where codUsu_Admin=@codUsu_Admin 
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarUsuario]
@codUsuario int
as
select*  from Usuario where codUsuario=@codUsuario
GO
/****** Object:  StoredProcedure [dbo].[eliminarAdministrador]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarAdministrador]
@codAdministrador int 

as
delete from Administrador  where @codAdministrador=@codAdministrador
GO
/****** Object:  StoredProcedure [dbo].[EliminarRegistro]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarRegistro]
@codRegistro int 

as
delete from Registro  where codRegistro=@codRegistro
GO
/****** Object:  StoredProcedure [dbo].[EliminarRegistro_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarRegistro_Admin]
@codRegistro_Admin int 

as
delete from Registro_Admin  where  codRegistro_Admin=@codRegistro_Admin 
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsu_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarUsu_Admin]
@codUsu_Admin int

as
delete from Usu_Admin  where codUsu_Admin=@codUsu_Admin 
GO
/****** Object:  StoredProcedure [dbo].[eliminarUsuario]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarUsuario]

@codUsuario int  

as 
delete from Usuario  where codUsuario=@codUsuario
GO
/****** Object:  StoredProcedure [dbo].[ingresoAdministrador]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ingresoAdministrador]


@Nombre varchar(40),
@Apellido varchar(50)

as


insert into Administrador values(@Nombre,@Apellido)
GO
/****** Object:  StoredProcedure [dbo].[ingresoRegistro]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ingresoRegistro]


@CodUsuario int,
@Nombre_Usuario varchar(30),
@Contraseña varchar(30)
as


insert into Registro values( @CodUsuario,@Nombre_Usuario ,@Contraseña )
GO
/****** Object:  StoredProcedure [dbo].[IngresoRegistro_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IngresoRegistro_Admin]

@codRegistro int ,
@codAdministrador int  ,
@Descripción varchar(100)


as


insert into Registro_Admin values(@codRegistro,@codAdministrador,@Descripción )
GO
/****** Object:  StoredProcedure [dbo].[ingresoUsu_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ingresoUsu_Admin]                       
@codUsuario int ,
@codAdministrador int ,
@Descripción varchar(100)

as

insert into Usu_Admin values(@codUsuario ,@codAdministrador,@Descripción)
GO
/****** Object:  StoredProcedure [dbo].[ingresoUsuario]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ingresoUsuario]


@Nombres varchar(80),
@Apellidos varchar(80),
@Correo varchar(40),
@Telefono int 
as

insert into Usuario values(@Nombres,@Apellidos,@Correo,@Telefono)
GO
/****** Object:  StoredProcedure [dbo].[ModificarAdministrador]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ModificarAdministrador]
@codAdministrador int ,
@Nombre varchar(40),
@Apellido varchar(50)


as

UPDATE Administrador SET Nombre=@Nombre,Apellido=@Apellido
where codAdministrador=@codAdministrador
GO
/****** Object:  StoredProcedure [dbo].[ModificarRegistro]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ModificarRegistro]
@codRegistro int ,
@CodUsuario int,
@Nombre_Usuario varchar(30),
@Contraseña varchar(30)

as

UPDATE Registro SET CodUsuario=@CodUsuario ,Nombre_Usuario=@Nombre_Usuario,Contraseña=@Contraseña 
where codRegistro=@codRegistro
GO
/****** Object:  StoredProcedure [dbo].[ModificarRegistro_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ModificarRegistro_Admin]
@codRegistro_Admin int,
@codRegistro int ,
@codAdministrador int  ,
@Descripción varchar(100)


as

UPDATE Registro_Admin SET codRegistro=@codRegistro,codAdministrador=@codAdministrador, Descripción=@Descripción where codRegistro_Admin=@codRegistro_Admin
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsu_Admin]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ModificarUsu_Admin]
@codUsu_Admin int,
@codUsuario int ,
@codAdministrador int ,
@Descripción varchar(100)


as

UPDATE Usu_Admin SET  codUsuario=@codUsuario , codAdministrador=@codAdministrador , Descripción=@Descripción 
where codUsu_Admin=@codUsu_Admin 
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 23/07/2021 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ModificarUsuario]

@codUsuario int ,  
@Nombres varchar(80),
@Apellidos varchar(80),
@Correo varchar(40),
@Telefono int 
as

UPDATE Usuario SET Nombres=@Nombres,Apellidos=@Apellidos,Correo=@Correo,Telefono=@Telefono
 where  codUsuario=@codUsuario
GO
