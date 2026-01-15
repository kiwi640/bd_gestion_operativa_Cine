1. Caso de Base de Datos Transaccional (OLTP) 
Sistema: Gestión Operativa "Cine".  
Objetivo: Administrar las operaciones diarias en tiempo real, garantizando la concurrencia y la integridad en la 
venta de boletos y productos. 
(7 Tablas): 
• Películas: (ID, título, género, duración, clasificación). 
• Salas: (ID, número, capacidad, tipo_pantalla). 
• Funciones: (ID, FK_Pelicula, FK_Sala, horario). Vincula películas con espacios físicos. 
• Clientes: (ID, nombre, correo, puntos_frecuencia). 
• Boletos: (ID, FK_Funcion, FK_Venta, asiento, precio). Registra la reserva física. 
• Productos_Dulcería: (ID, nombre, categoría, stock, precio). Control de inventario. 
• Ventas: (ID, FK_Cliente, fecha, total). Encabeza la transacción de compra. 
Relaciones Principales: El modelo se basa en relaciones de uno a muchos (1:N): una Película tiene múltiples 
Funciones, una Función genera muchos Boletos, y un Cliente puede registrar diversas Ventas. Se asegura que 
un asiento no sea asignado dos veces mediante restricciones de integridad en la tabla Boletos. 
2. Caso de Base de Datos Dimensional (BI) 
Sistema: Data Warehouse de Inteligencia de Negocios "Cine".  
Objetivo: Consolidar datos históricos para el análisis estratégico de rentabilidad, preferencias de audiencia y 
optimización de recursos. 
Estructura del Modelo (Esquema Estrella - 6 Tablas): 
• Tabla de Hechos (Fact_Ventas): Centraliza las métricas del negocio. 
• Atributos: ID_Tiempo, ID_Pelicula, ID_Sucursal, ID_Cliente, ID_Producto. 
• Métricas: Cantidad de tickets, ingresos por taquilla, ingresos por dulcería, descuentos aplicados. 
• Tablas de Dimensiones (Atributos para filtrar y agrupar): 
• Dim_Tiempo: (Fecha, día de la semana, mes, trimestre, año, es_feriado). 
• Dim_Pelicula: (Título, género, idioma, estudio, clasificación). 
• Dim_Sucursal: (Nombre, ciudad, región, tipo_zona). 
• Dim_Cliente: (Rango_edad, género, nivel_lealtad). 
• Dim_Producto: (Categoría_snack, tamaño, proveedor). 
Propósito del Análisis: A través de relaciones de uno a muchos desde las Dimensiones hacia la Tabla de 
Hechos, el sistema permite realizar "Drill-down" para: 
• Identificar la correlación entre géneros de películas y el consumo de snacks específicos por ciudad. 
• Analizar picos de ocupación de salas comparando periodos vacacionales frente a días laborales. 
• Evaluar el retorno de inversión de promociones según el perfil demográfico del cliente.
