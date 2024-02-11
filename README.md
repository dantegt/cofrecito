# COFRECITO

### TUP Laboratorio de Programación IV - 2022
Gregori - Lagonegro - Pereyra

---

## Prototipo
Aplicación movil desarrollada en Flutter que busca conectarse con el [API de Riot Games](https://developer.riotgames.com/) para proveer información de un Invocador:
- Info del Invocador (Nombre, Nivel, Icono, Rango)
- Disponibilidad de Cofre y Maestría con cada Campeón

## Primera Entrega
- Desarrollo de las pantallas principales
  - Inicio (Buscador)
  - Perfil (Inicio "Logged in")
  - Lista de Campeones
  - Formulario de Contacto / Reporte de errores
- Implementación de [SharedPreferences](https://pub.dev/packages/shared_preferences) para almacenar localmente la información del Invocador
- Widgets personalizados: ChampionTile, SummonerTile (Listado de Campeones)
- FutureBuilder para obtener el listado de campeones desde un [json local (champions.json)](https://github.com/dantegt/cofrecito/blob/master/assets/json/champions.json)
- Provider / Theme Switch para cambiar el tema desde el menu
- Organizacion de recursos: Assets, Barrel files, Routes, Themes

## UPDATE - Entrega Final 2024
- Agregada la pantalla de Vista de un Campeón, seleccionado de la lista
- Todas las maestrias para cada campeón y la data de rankeo del invocador vienen desde [API Express JS - Lolcito](https://lolcito-express.onrender.com)
- Las imagenes se cachean con CachedNetworkImageProvider() para no cargarlas cada vez
- Se actualizaron los Shared Preferences para almacenar mas datos del usuario logueado
- El menu se condiciono para mostrar las opciones de navegacion sólo si el usuario está logueado

## Preview
![cofrecito_demo_final](https://github.com/dantegt/cofrecito/assets/8105616/27e0ef71-f304-4603-b425-0541bb810d3a)

## Probado en:
- Redmi Note 8 - API 28 - Android 9 Pie
- Pixel 3A - API 33 - Android 13 Tiramisu (Emulador)

## MVP: Objetivos
- Conectar con API Riot: Buscar un Usuario, Obtener Maestrias
- Implementar Firebase: Login de usuario, Formulario de Contacto
- Implementar scroll rápido de Lista de Campeones por abecedario
