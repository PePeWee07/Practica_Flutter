# Random User

Proyecto de práctica en Flutter que consume la API de **Random User** para aprender el consumo de servicios REST, manejo de estado, navegación y arquitectura por capas.

**API utilizada:** https://randomuser.me/api/

---

## 🎯 Objetivos de la práctica

A lo largo de esta práctica se implementarán las siguientes funcionalidades:

### 1. Preparación del proyecto
- Agregar el paquete `dio` para realizar peticiones HTTP.
- Agregar el paquete `provider` para manejar estados globales.
- Organizar el proyecto utilizando una arquitectura por capas:
  - `domain`
  - `infrastructure`
  - `presentation`
  - `providers`

### 2. Modelado del usuario
- Crear manualmente la entidad de dominio `User`.
- Implementar el modelo `UserModel`.
- Desarrollar el método `fromJson` para transformar la respuesta de la API en objetos de la aplicación, manejando correctamente estructuras JSON anidadas como:
  - `name`
  - `picture`
  - `location`
  - entre otras.

### 3. Obtener un usuario
- Implementar un servicio HTTP utilizando `Dio`.
- Consumir la API para obtener un único usuario.
- Mostrar la información en pantalla mediante `FutureBuilder`.

### 4. Listar múltiples usuarios
- Solicitar varios usuarios desde la API.
- Mostrar los resultados utilizando `ListView.builder`.
- Simular una vista de administración de usuarios.

### 5. Manejo de estado con Provider
- Centralizar la lógica de obtención de datos mediante `ChangeNotifier`.
- Gestionar los diferentes estados de la aplicación:
  - ⏳ Cargando
  - ✅ Datos cargados
  - ❌ Error

### 6. Pantalla de detalle
- Permitir seleccionar un usuario de la lista.
- Navegar hacia una pantalla que muestre toda su información.
- Utilizar navegación con argumentos.

### 7. Edición de perfil
- Crear un formulario utilizando `StatefulWidget`.
- Administrar los campos mediante `TextEditingController`.
- Actualizar la información del usuario utilizando el método `toJson`.

---

## 🛠️ Tecnologías utilizadas

- Flutter
- Dart
- Dio
- Provider
- Random User API