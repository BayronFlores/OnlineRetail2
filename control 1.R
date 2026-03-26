# Librerías
library(dplyr)
library(readr)

# ----------------
# Pregunta 1
# ----------------

# a) Cargar datos
datos <- read_csv2("C:/Users/BAYRON/Downloads/OnlineRetail2/OnlineRetail2.csv")

# b) Estructura del dataset
str(datos)

# c) Dimensión del dataset
dim(datos)

# d) Primeras 8 filas
head(datos, 8)

# ----------------
# Limpieza (opcional pero recomendado)
# ----------------
datos <- datos %>%
  filter(Quantity > 0, UnitPrice > 0)


# ----------------
# Pregunta 2
# ----------------

# Frecuencia de compra promedio 
purchase_frequency <- n_distinct(datos$InvoiceNo) / n_distinct(datos$CustomerID)
print(purchase_frequency)

# Tamaño promedio del carrito 
basket_size <- sum(datos$Quantity) / n_distinct(datos$InvoiceNo)
print(basket_size)

# Tasa de diversidad de productos
product_diversity <- n_distinct(datos$StockCode) / nrow(df)
print(product_diversity)

# ----------------
# Pregunta 3
# ----------------

# a) Crear Revenue
datos <- datos %>%
  mutate(Revenue = Quantity * UnitPrice)

# b) Total generado
total_revenue <- sum(datos$Revenue, na.rm = TRUE)
print(total_revenue)

# c) Total de registros
total_registros <- nrow(datos)
print(total_registros)

# d) Total de ventas reales (facturas únicas)
total_ventas <- n_distinct(datos$InvoiceNo)
print(total_ventas)


# f_i) Usando registros
ticket_promedio_registros <- total_revenue / total_registros
print(ticket_promedio_registros)

# f_ii) Usando ventas reales
ticket_promedio_ventas <- total_revenue / total_ventas
print(ticket_promedio_ventas)

