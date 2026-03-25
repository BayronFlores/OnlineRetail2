# Librerías
library(dplyr)
library(readr)

# ----------------
# Pregunta 1
# ----------------

# a) Cargar datos
datos <- read_csv2("OnlineRetail2.csv")

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

