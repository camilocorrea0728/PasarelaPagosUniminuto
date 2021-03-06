USE [PasarelaPagos]
GO
/****** Object:  User [PasarelaPagos]    Script Date: 09/04/2022 23:11:27 ******/
CREATE USER [PasarelaPagos] FOR LOGIN [PasarelaPagos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Carteras]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carteras](
	[IdCartera] [int] IDENTITY(1,1) NOT NULL,
	[IdComercio] [int] NULL,
	[IdCliente] [int] NULL,
	[Descripcion] [varchar](250) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Valor] [numeric](18, 0) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Cartera_IdCartera] PRIMARY KEY CLUSTERED 
(
	[IdCartera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[IdTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[IdCartera] [int] NULL,
	[IdFranquicia] [int] NULL,
	[IdBanco] [int] NULL,
	[IdEstado] [int] NULL,
	[NumeroTarjeta] [varchar](25) NULL,
	[CVV2] [varchar](10) NULL,
	[FechaVencimientoTarjeta] [varchar](15) NULL,
	[Valor] [numeric](18, 0) NULL,
	[Cuotas] [int] NULL,
	[NombreUsuario] [varchar](250) NULL,
	[CorreoUsuario] [varchar](250) NULL,
	[CelularUsuario] [varchar](30) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Transacciones_IdTransaccion] PRIMARY KEY CLUSTERED 
(
	[IdTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_CarterasPendientesPorPago]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[Vista_CarterasPendientesPorPago]
as
SELECT a.*  FROM [PasarelaPagos].[dbo].[Carteras] a
left join [PasarelaPagos].[dbo].Transacciones b on a.IdCartera=b.IdCartera
where (b.IdTransaccion is null or b.IdEstado not in (1,2))
GO
/****** Object:  Table [dbo].[ActividadesEconomicas]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesEconomicas](
	[IdActividadEconomica] [int] IDENTITY(1,1) NOT NULL,
	[MCC] [numeric](18, 0) NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_ActividadesEconomicas_IdActividadEconomica] PRIMARY KEY CLUSTERED 
(
	[IdActividadEconomica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bancos]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bancos](
	[IdBanco] [int] IDENTITY(1,1) NOT NULL,
	[Banco] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Banco_IdBanco] PRIMARY KEY CLUSTERED 
(
	[IdBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[NombresCliente] [varchar](250) NULL,
	[Genero] [varchar](5) NULL,
	[Correo] [varchar](250) NULL,
	[Celular] [varchar](30) NULL,
	[Direccion] [varchar](max) NULL,
	[FechaNacimiento] [date] NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Cliente_IdCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comercios]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comercios](
	[IdComercio] [int] IDENTITY(1,1) NOT NULL,
	[NombreComercio] [varchar](250) NULL,
	[NitComercio] [varchar](250) NULL,
	[IdActividadEconomica] [int] NULL,
	[CamaraComercio] [varchar](max) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Comercio_IdComercio] PRIMARY KEY CLUSTERED 
(
	[IdComercio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Estados_IdEstado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Franquicias]    Script Date: 09/04/2022 23:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Franquicias](
	[IdFranquicia] [int] IDENTITY(1,1) NOT NULL,
	[Franquicia] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Franquicia_IdFranquicia] PRIMARY KEY CLUSTERED 
(
	[IdFranquicia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActividadesEconomicas] ON 

INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (1, CAST(6515 AS Numeric(18, 0)), N'Seguros de salud', CAST(N'2022-03-12T09:36:05.343' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (2, CAST(7111 AS Numeric(18, 0)), N'Actividades de arquitectura', CAST(N'2022-03-12T09:36:27.097' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (3, CAST(1523 AS Numeric(18, 0)), N'Fabricación de partes de calzado', CAST(N'2022-03-12T09:36:45.203' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (4, CAST(9609 AS Numeric(18, 0)), N'Otras actividades de servicios', CAST(N'2022-03-12T09:37:18.210' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (5, CAST(150 AS Numeric(18, 0)), N'Explotación mixta (Agrícola y pecuaria)', CAST(N'2022-03-12T09:38:25.273' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (6, CAST(710 AS Numeric(18, 0)), N'Extracción de mineras de hierro', CAST(N'2022-03-12T09:38:50.413' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (7, CAST(1090 AS Numeric(18, 0)), N'Elaboración de alimentos preparados para animales', CAST(N'2022-03-12T09:39:16.917' AS DateTime))
INSERT [dbo].[ActividadesEconomicas] ([IdActividadEconomica], [MCC], [Descripcion], [FechaCreacion]) VALUES (8, CAST(1089 AS Numeric(18, 0)), N'Elaboración de otros productos alimenticios n.c.p.', CAST(N'2022-03-12T09:39:34.900' AS DateTime))
SET IDENTITY_INSERT [dbo].[ActividadesEconomicas] OFF
GO
SET IDENTITY_INSERT [dbo].[Bancos] ON 

INSERT [dbo].[Bancos] ([IdBanco], [Banco], [FechaCreacion]) VALUES (1, N'Bancolombia', CAST(N'2022-03-12T09:30:02.750' AS DateTime))
INSERT [dbo].[Bancos] ([IdBanco], [Banco], [FechaCreacion]) VALUES (2, N'Grupo Aval', CAST(N'2022-03-12T09:30:30.133' AS DateTime))
INSERT [dbo].[Bancos] ([IdBanco], [Banco], [FechaCreacion]) VALUES (3, N'CitiBank', CAST(N'2022-03-12T09:30:38.300' AS DateTime))
INSERT [dbo].[Bancos] ([IdBanco], [Banco], [FechaCreacion]) VALUES (4, N'Davivienda', CAST(N'2022-03-12T09:31:15.210' AS DateTime))
INSERT [dbo].[Bancos] ([IdBanco], [Banco], [FechaCreacion]) VALUES (5, N'Itau', CAST(N'2022-03-12T09:31:17.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bancos] OFF
GO
SET IDENTITY_INSERT [dbo].[Comercios] ON 

INSERT [dbo].[Comercios] ([IdComercio], [NombreComercio], [NitComercio], [IdActividadEconomica], [CamaraComercio], [FechaCreacion]) VALUES (1, N'Seguros Bolivar', N'123456789', 1, N'', CAST(N'2022-03-12T09:52:09.883' AS DateTime))
INSERT [dbo].[Comercios] ([IdComercio], [NombreComercio], [NitComercio], [IdActividadEconomica], [CamaraComercio], [FechaCreacion]) VALUES (2, N'Arquitectos S.A.S', N'987654321', 2, N'', CAST(N'2022-03-12T09:52:09.890' AS DateTime))
INSERT [dbo].[Comercios] ([IdComercio], [NombreComercio], [NitComercio], [IdActividadEconomica], [CamaraComercio], [FechaCreacion]) VALUES (3, N'Brahma', N'147258369', 3, N'', CAST(N'2022-03-12T09:52:09.890' AS DateTime))
INSERT [dbo].[Comercios] ([IdComercio], [NombreComercio], [NitComercio], [IdActividadEconomica], [CamaraComercio], [FechaCreacion]) VALUES (4, N'Ventas onlines', N'963258741', 4, N'', CAST(N'2022-03-12T09:52:09.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comercios] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([IdEstado], [Estado], [FechaCreacion]) VALUES (1, N'Pendiente', CAST(N'2022-03-12T09:29:23.483' AS DateTime))
INSERT [dbo].[Estados] ([IdEstado], [Estado], [FechaCreacion]) VALUES (2, N'Aprobada', CAST(N'2022-03-12T09:29:26.947' AS DateTime))
INSERT [dbo].[Estados] ([IdEstado], [Estado], [FechaCreacion]) VALUES (3, N'Rechazada', CAST(N'2022-03-12T09:29:30.140' AS DateTime))
INSERT [dbo].[Estados] ([IdEstado], [Estado], [FechaCreacion]) VALUES (4, N'Reversada', CAST(N'2022-03-12T09:29:39.007' AS DateTime))
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Franquicias] ON 

INSERT [dbo].[Franquicias] ([IdFranquicia], [Franquicia], [FechaCreacion]) VALUES (1, N'Visa', CAST(N'2022-03-12T09:24:08.437' AS DateTime))
INSERT [dbo].[Franquicias] ([IdFranquicia], [Franquicia], [FechaCreacion]) VALUES (2, N'MasterCard', CAST(N'2022-03-12T09:24:27.143' AS DateTime))
INSERT [dbo].[Franquicias] ([IdFranquicia], [Franquicia], [FechaCreacion]) VALUES (3, N'American Xpress', CAST(N'2022-03-12T09:24:36.850' AS DateTime))
INSERT [dbo].[Franquicias] ([IdFranquicia], [Franquicia], [FechaCreacion]) VALUES (4, N'Dinners Club', CAST(N'2022-03-12T09:24:42.820' AS DateTime))
SET IDENTITY_INSERT [dbo].[Franquicias] OFF
GO
ALTER TABLE [dbo].[ActividadesEconomicas] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Bancos] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Carteras] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Comercios] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Estados] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Franquicias] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Transacciones] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Carteras]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Carteras]  WITH CHECK ADD FOREIGN KEY([IdComercio])
REFERENCES [dbo].[Comercios] ([IdComercio])
GO
ALTER TABLE [dbo].[Comercios]  WITH CHECK ADD FOREIGN KEY([IdActividadEconomica])
REFERENCES [dbo].[ActividadesEconomicas] ([IdActividadEconomica])
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD FOREIGN KEY([IdBanco])
REFERENCES [dbo].[Bancos] ([IdBanco])
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD FOREIGN KEY([IdCartera])
REFERENCES [dbo].[Carteras] ([IdCartera])
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD FOREIGN KEY([IdFranquicia])
REFERENCES [dbo].[Franquicias] ([IdFranquicia])
GO
