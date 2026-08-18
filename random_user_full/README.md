# random_user_full

Práctica de la arquitectura (Clean Architecture + BLoC + Package by Feature),
consumiendo `https://randomuser.me/api/`.

---

## Orden de construcción

**De adentro hacia afuera. Cada paso solo puede apoyarse en los anteriores.**

```
1. domain        Entity  →  Repository (contrato)  →  UseCase
2. data          Model   →  Mapper  →  DataSource  →  RepositoryImpl
3. presentation  Event   →  State   →  Bloc        →  Screen/Widgets
4. app           service_locator  →  main
```

### 1️⃣ domain — el negocio

| # | Archivo | Pregunta que responde |
|---|---|---|
| 1 | `user_entity.dart` | ¿Qué dato maneja mi app? |
| 2 | `user_repository.dart` | ¿Qué operaciones necesito? *(solo firmas)* |
| 3 | `get_random_user.dart` | ¿Qué hace el negocio? *(una clase por operación)* |

✅ Ningún archivo importa Flutter, dio ni `data/`.

### 2️⃣ data — la infraestructura

| # | Archivo | Pregunta |
|---|---|---|
| 4 | `user_random_model.dart` | ¿Cómo viene el JSON? |
| 5 | `user_mapper.dart` | ¿Cómo paso de Model a Entity? |
| 6 | `user_random_data_source.dart` + `_impl` | ¿De dónde saco el JSON? *(devuelve **models**)* |
| 7 | `user_repository_impl.dart` | Ata datasource + mapper *(devuelve **entidades**)* |

✅ El datasource devuelve models; el repositorio devuelve entidades.

### 3️⃣ presentation — la pantalla

| # | Archivo | Pregunta |
|---|---|---|
| 8 | `user_event.dart` | ¿Qué puede pasar? *(en pasado: `UserRequested`)* |
| 9 | `user_state.dart` | ¿Cómo se puede ver la pantalla? *(sealed)* |
| 10 | `user_bloc.dart` | evento → use case → estado |
| 11 | `home_screen.dart` + widgets | Pintar el estado *(`switch` exhaustivo)* |

✅ El bloc recibe el **use case**, nunca el repositorio.

### 4️⃣ app — el ensamblaje

| # | Archivo | Pregunta |
|---|---|---|
| 12 | `app/di/service_locator.dart` | ¿Quién recibe qué? |
| 13 | `main.dart` | `configureDependencies()` antes de `runApp` |

✅ Es el **único** archivo de la app que puede importar `data/`.

---

## Responsabilidades por pieza

| Capa | Pieza | Su trabajo | NO le toca |
|---|---|---|---|
| domain | `UserEntity` | Objeto limpio que usa toda la app. Definir igualdad (`props`) | Saber de JSON, HTTP ni Flutter |
| domain | `UserRepository` (contrato) | Declarar **qué** datos se pueden pedir | Decir **cómo** se obtienen |
| domain | `GetRandomUser` (use case) | Una operación de negocio con nombre. Filtrar, ordenar, validar, orquestar | Estado de UI, HTTP, JSON |
| data | `RandomUser` (model) | Conocer el JSON. `fromJson` | Salir de `data/` |
| data | `UserMapper` | Traducir Model → Entity | Reglas de negocio |
| data | `UserRandomDataSourceImpl` | Hablar con **una** fuente. Devolver models | Decidir qué fuente usar |
| data | `UserRepositoryImpl` | Decidir **de dónde** salen los datos (red vs caché) y mapear | Reglas de negocio. Saber de HTTP |
| presentation | `UserBloc` | Evento → use case → estado. Traducir excepciones a mensajes | Lógica de negocio. Construir widgets |
| presentation | `HomeScreen` / widgets | Pintar el estado, disparar eventos, estado efímero | Llamar repositorios o use cases directo |
| app | `service_locator` | Armar el grafo | Contener lógica. Registrar blocs |

### Una pregunta por capa

```
domain        →  ¿QUÉ hace el negocio?          (Dart puro, no depende de nadie)
data          →  ¿CÓMO consigo los datos?
presentation  →  ¿CUÁNDO los pido y CÓMO se ven?
app           →  ¿QUIÉN recibe qué?
```

---

## Convenciones

### Nombres

| Pieza | Convención | Ejemplo real |
|---|---|---|
| Entidad | sin sufijo `Entity` | `AppMenuItem`, `StudentCard` |
| Model | sufijo `Model` | `AppMenuModel`, `CareerModel` |
| Datasource | marca el origen | `AppMenuRemoteDataSource` |
| Use case | verbo primero | `GetActiveMenus`, `LoginWithBiometric`, `Logout` |
| Evento | **en pasado** | `AppMenuRequested`, `PhotoSubmitted` |
| Handler del bloc | según el evento | `AppMenuRequested` → `_onRequested` |


### DI

```dart
// El <> con el tipo ABSTRACTO. Si lo omites, se registra bajo el Impl y nadie lo pide así.
serviceLocator.registerLazySingleton<UserRepository>(
  () => UserRepositoryImpl(serviceLocator<UserRandomDataSource>()),
);
```

| Qué | Cómo se registra | Por qué |
|---|---|---|
| Datasources, repositories, servicios, `Dio` | `registerLazySingleton` | una instancia compartida (y las cachés funcionan) |
| Use cases | `registerFactory` | no guardan estado, son desechables |
| **Blocs** | **no se registran** | `BlocProvider` los crea y los cierra con la pantalla |

**¿Escribir el `<>`?** Si la clase tiene contrato abstracto → sí, siempre. Si no (use cases, `Dio`) → da igual.
Si te equivocas, **no avisa el compilador**: revienta en runtime.

**¿Qué va al DI?** Lo que se construye una vez y se comparte. Utils puros (funciones estáticas sin
dependencias) NO. Lo que toca el mundo exterior (reloj, azar, disco, red, dispositivo) SÍ.


## Pendientes de la práctica

- [ ] Excepciones tipadas en el datasource (`NoInternetException`, `ServerUnavailableException`)
- [ ] `common/network/` con el `Dio` configurado (baseUrl + interceptores) en vez del `Dio()` pelado
- [ ] Pantalla de lista de usuarios (`GetRandomUsers` ya existe, `list_users.dart` está vacío)
- [ ] Botón para volver a pedir usuario (y ver el `droppable()` en acción)
- [ ] Estado `Empty` para la lista vacía
- [ ] Tests: model, bloc (`bloc_test` + `mocktail`), widget con `serviceLocator.reset()`
