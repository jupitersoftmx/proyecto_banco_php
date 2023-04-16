# 🛍️ Tienda Online 💳

Este repositorio contiene el código para una tienda online básica que acepta diferentes métodos de pago y muestra la información de la transacción en un modal.

## 📦 Requisitos

- Servidor web con PHP
- Base de datos MySQL
- Bootstrap 4
- jQuery

## 🛠️ Instalación

1. Clona este repositorio en tu servidor web.
2. Importa el archivo `tienda_online.sql` en tu base de datos MySQL.
3. Configura las credenciales de la base de datos en el archivo `peticion.php`.
4. Abre el archivo `formulario.php` en tu navegador y realiza transacciones de prueba.

## 🧪 Pruebas

Puedes realizar pruebas utilizando cURL desde la línea de comandos.

### Pago con tarjeta

```sh
curl -X POST -d "nombre=Juan%20Perez&email=juan%40example.com&pass=12345&direccion_entrega=Calle%20123&estado=Aceptado&paymentMethod=tarjeta&total_carrito=100" http://localhost:12346/peticion.php
```

### Pago con PayPal

```sh
curl -X POST -d "nombre=Juan%20Perez&email=juan%40example.com&pass=12345&direccion_entrega=Calle%20123&estado=Aceptado&paymentMethod=paypal&total_carrito=100" http://localhost:12346/peticion.php

```

### Pago en sucursal

```sh
curl -X POST -d "nombre=Juan%20Perez&email=juan%40example.com&pass=12345&direccion_entrega=Calle%20123&estado=Aceptado&paymentMethod=sucursal&total_carrito=100" http://localhost:12346/peticion.php

```

### Licencia

Este proyecto se encuentra bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.
Este archivo README.md contiene una descripción del proyecto, los requisitos, instrucciones de instalación, comandos cURL para pruebas y la información de la licencia.
