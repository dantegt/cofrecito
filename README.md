# COFRECITO

### TUP Laboratorio de Programación IV - 2022
Gregori - Lagonegro - Pereyra

---

## Mockup
Aplicación movil desarrollada en Flutter que busca conectarse con el [API de Riot Games](https://developer.riotgames.com/) para proveer información de un Invocador:
- Info del Invocador (Nombre, Nivel, Icono, Rango)
- Disponibilidad de Cofre y Maestría con cada Campeón

## Primera Entrega
- Desarrollo de las pantallas principales
  - Inicio (Buscador)
  - Perfil (Inicio "Logged in")
  - Lista de Campeones
  - Formulario de Contacto / Reporte de errores
- Implementación de SharedPreferences para almacenar localmente la información del Invocador
- Widgets personalizados: ChampionTile, SummonerTile (Listado de Campeones)
- FutureBuilder para obtener el listado de campeones desde un json local (champions.json)
- Provider / Theme Switch para cambiar el tema desde el menu
- Organizacion de recursos: Assets, Barrel files, Routes, Themes

## Probado en:
- Redmi Note 8 - API 28 - Android 9 Pie
- Pixel 3A - API 33 - Android 13 Tiramisu (Emulador)

## MVP: Objetivos
- Conectar con API Riot: Buscar un Usuario, Obtener Maestrias
- Implementar Firebase: Login de usuario, Formulario de Contacto
- Implementar scroll rápido de Lista de Campeones por abecedario
