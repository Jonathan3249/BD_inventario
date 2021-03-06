USE [Inventario]
GO
/****** Object:  Table [dbo].[Cargos_facturas]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos_facturas](
	[Id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_cargo] [nvarchar](50) NULL,
	[cantidad_cargo] [numeric](18, 0) NULL,
	[Id_pagos] [int] NULL,
 CONSTRAINT [PK_Cargos_facturas] PRIMARY KEY CLUSTERED 
(
	[Id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_categoria] [nvarchar](50) NULL,
	[Descripcion_categoria] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Direccion] [nchar](10) NULL,
	[Telefono] [numeric](18, 0) NULL,
	[Fecha_ingreso] [datetime] NULL,
	[Nota_cliente] [text] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compras]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compras](
	[Id_compras] [int] IDENTITY(1,1) NOT NULL,
	[Id_proveedor] [int] NOT NULL,
	[Fecha_compra] [datetime] NULL,
	[Total_compra] [numeric](18, 0) NULL,
	[abono_compra] [numeric](18, 0) NULL,
	[Nota] [text] NULL,
	[Id_usuario] [int] NULL,
	[Forma_pago] [nvarchar](50) NULL,
 CONSTRAINT [PK_compras] PRIMARY KEY CLUSTERED 
(
	[Id_compras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_compras]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_compras](
	[Detalles_compras] [int] IDENTITY(1,1) NOT NULL,
	[Id_compras] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad_compra] [int] NULL,
	[Iva_compra] [numeric](18, 0) NULL,
	[Descuento_compra] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Detalles_compras] PRIMARY KEY CLUSTERED 
(
	[Detalles_compras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_factura]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_factura](
	[Id_detalles] [int] IDENTITY(1,1) NOT NULL,
	[Id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_venta] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[Id_detalles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[codigo_empresa] [int] NULL,
	[Nombre_empresa] [text] NULL,
	[Fecha_apertura] [datetime] NULL,
	[Pie_factura] [nvarchar](50) NULL,
	[Regimen_empresa] [text] NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[Id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Id_factura] [int] IDENTITY(1,1) NOT NULL,
	[Id_cliente] [int] NOT NULL,
	[Id_vendedor] [int] NOT NULL,
	[Id_detalles] [int] NOT NULL,
	[Id_cargo] [int] NOT NULL,
	[Id_empresa] [int] NOT NULL,
	[Fecha_emision] [datetime] NULL,
	[Subtotal] [numeric](18, 0) NULL,
	[Total] [numeric](18, 0) NULL,
	[Descuento] [numeric](18, 0) NULL,
	[Iva] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[Id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[Id_pagos] [int] IDENTITY(1,1) NOT NULL,
	[Forma_pago] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[Id_pagos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_producto] [int] IDENTITY(1,1) NOT NULL,
	[Id_stock] [int] NOT NULL,
	[Id_categoria] [int] NOT NULL,
	[Nombre_producto] [nvarchar](50) NULL,
	[Descripcion_producto] [nvarchar](50) NULL,
	[Precio_producto] [numeric](18, 0) NULL,
	[Codigo_producto] [int] NOT NULL,
	[Fecha_vencimiento] [datetime] NULL,
	[Fecha_pedido] [datetime] NULL,
	[Fecha_ingreso] [datetime] NULL,
	[Impuesto_producto] [numeric](18, 0) NULL,
	[Codigo_barra1] [int] NULL,
	[Codigo_barra2] [int] NULL,
	[Precio_venta] [nchar](10) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_proveedores] [nvarchar](50) NULL,
	[Direccion_proveedores] [nvarchar](50) NULL,
	[Telefono] [numeric](18, 0) NULL,
	[Email] [nvarchar](50) NULL,
	[Fecha_ingreso] [datetime] NULL,
	[codigo_proveedor] [int] NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id_stock] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Id_proveedor] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Existencias_min] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[id_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_administrador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NULL,
	[Pass] [nvarchar](10) NULL,
	[Nivel_usuario] [int] NULL,
	[Codigo_usuario] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_administrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedores]    Script Date: 30/03/2020 17:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedores](
	[Id_vendedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[codigo_vendedor] [int] NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Id_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cargos_facturas]  WITH CHECK ADD  CONSTRAINT [FK_Cargos_facturas_Pagos] FOREIGN KEY([Id_pagos])
REFERENCES [dbo].[Pagos] ([Id_pagos])
GO
ALTER TABLE [dbo].[Cargos_facturas] CHECK CONSTRAINT [FK_Cargos_facturas_Pagos]
GO
ALTER TABLE [dbo].[compras]  WITH CHECK ADD  CONSTRAINT [FK_compras_Proveedores] FOREIGN KEY([Id_proveedor])
REFERENCES [dbo].[Proveedores] ([Id_proveedor])
GO
ALTER TABLE [dbo].[compras] CHECK CONSTRAINT [FK_compras_Proveedores]
GO
ALTER TABLE [dbo].[compras]  WITH CHECK ADD  CONSTRAINT [FK_compras_Usuarios] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_administrador])
GO
ALTER TABLE [dbo].[compras] CHECK CONSTRAINT [FK_compras_Usuarios]
GO
ALTER TABLE [dbo].[Detalles_compras]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_compras_compras] FOREIGN KEY([Id_compras])
REFERENCES [dbo].[compras] ([Id_compras])
GO
ALTER TABLE [dbo].[Detalles_compras] CHECK CONSTRAINT [FK_Detalles_compras_compras]
GO
ALTER TABLE [dbo].[Detalles_compras]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_compras_Productos] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO
ALTER TABLE [dbo].[Detalles_compras] CHECK CONSTRAINT [FK_Detalles_compras_Productos]
GO
ALTER TABLE [dbo].[Detalles_factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_factura_Productos] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO
ALTER TABLE [dbo].[Detalles_factura] CHECK CONSTRAINT [FK_Detalles_factura_Productos]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cargos_facturas] FOREIGN KEY([Id_cargo])
REFERENCES [dbo].[Cargos_facturas] ([Id_cargo])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cargos_facturas]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Clientes] FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[Clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Clientes]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Detalles_factura] FOREIGN KEY([Id_detalles])
REFERENCES [dbo].[Detalles_factura] ([Id_detalles])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Detalles_factura]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Empresa] FOREIGN KEY([Id_empresa])
REFERENCES [dbo].[Empresa] ([Id_empresa])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Empresa]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Vendedores] FOREIGN KEY([Id_vendedor])
REFERENCES [dbo].[Vendedores] ([Id_vendedor])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Vendedores]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([Id_categoria])
REFERENCES [dbo].[Categorias] ([Id_categoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Productos] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Productos]
GO
