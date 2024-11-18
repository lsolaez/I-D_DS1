# Plataforma de Farmacia Avanzada

![Logo de Farmacia](sandbox:/mnt/data/png-transparent-logo-pharmacy-pills-miscellaneous-trademark-pharmaceutical-drug-thumbnail.png)

## Descripción del Proyecto

Este proyecto tiene como objetivo desarrollar una **plataforma de farmacia avanzada** que permita a los usuarios:

- Consultar la disponibilidad de productos en tiempo real en diferentes sucursales.
- Realizar compras en línea de manera segura y eficiente.
- Elegir entre recoger productos en tienda o solicitar envío a domicilio.
- Acceder a notificaciones sobre pedidos y promociones personalizadas.
- Gestionar su historial de compras y repetir pedidos de manera sencilla.

Esta solución está diseñada para mejorar la experiencia del cliente, optimizar la gestión de inventarios y facilitar la comunicación entre la farmacia y sus usuarios.

---

## Tecnologías Utilizadas

### **Frontend**
- ![HTML](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
- ![CSS](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
- ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
- ![Handlebars](https://img.shields.io/badge/Handlebars.js-f0772b?style=for-the-badge&logo=handlebarsdotjs&logoColor=white)
- ![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)

### **Backend**
- ![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
- ![Express.js](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)

### **Base de Datos**
- ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

---

## Características Principales

### **Funciones para los Usuarios**
- Registro e inicio de sesión seguro.
- Navegación y búsqueda avanzada de productos.
- Selección de método de entrega: domicilio o recogida en tienda.
- Procesamiento de pagos con múltiples métodos (Nequi, Bancolombia, etc.).
- Historial de pedidos con opción de repetición de compras.

### **Funciones para el Administrador**
- Gestor de inventarios con actualización en tiempo real.
- Asignación de pedidos a domiciliarios.
- Visualización de reportes de ventas y gestión de usuarios.

### **Funciones para Domiciliarios**
- Asignación de pedidos y actualización del estado de entrega.
- Información sobre rutas de entrega y horarios.

---

## Estructura del Proyecto

1. **Frontend**: Interfaces desarrolladas en HTML, CSS y Handlebars.js para crear una experiencia de usuario intuitiva y responsiva.
2. **Backend**: Lógica del servidor implementada en Node.js con Express.js para manejar la comunicación con la base de datos y las API.
3. **Base de Datos**: MySQL para almacenar información de usuarios, productos, pedidos e inventarios.

---

## Instalación

### **Requisitos Previos**
- Node.js y npm instalados en tu sistema.
- Servidor MySQL operativo.

### **Pasos para Instalar**
1. Clona este repositorio:
   ```bash
   git clone https://github.com/usuario/proyecto-farmacia.git
   ```
2. Instala las dependencias:
   ```bash
   npm install
   ```
3. Configura la base de datos:
   - Crea una base de datos en MySQL.
   - Importa el archivo `DB.sql` proporcionado en la carpeta `database`.
4. Configura las variables de entorno:
   - Renombra el archivo `.env.example` a `.env`.
   - Agrega las credenciales de tu base de datos.
5. Inicia el servidor:
   ```bash
   npm start
   ```
6. Accede a la aplicación en `http://localhost:3000`.

---

## Uso

1. Los usuarios pueden registrarse o iniciar sesión.
2. Navegar por el catálogo de productos.
3. Agregar productos al carrito y seleccionar un método de entrega.
4. Realizar el pago y recibir confirmación del pedido.
5. Los administradores pueden gestionar inventarios y asignar pedidos.

---

## Equipo de Desarrollo
- **Leonardo Jesús Solaez de Moya** - Scrum Master
- **Héctor Andrés Suárez Camacho** - Frontend Developer
- **Geovani de Jesús Pérez Guerra** - Backend Developer
- **Jhon Janner Jiménez Zuleta** - Full-Stack Developer
- **Derek Fabián Pérez de Aguas** - Product Owner

