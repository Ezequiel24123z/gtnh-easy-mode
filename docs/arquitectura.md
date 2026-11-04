# Arquitectura, distribución y organización

## Por qué un overlay y no un fork

| Opción | Qué es | Pros | Contras |
|---|---|---|---|
| **Overlay** (elegida) | Solo los archivos cambiados, encima de una instalación oficial de GTNH | - No redistribuye mods cerrados<br>- Actualizar es reaplicar los cambios | El jugador instala GTNH primero |
| Fork del pack | Pack propio con todos los jars, como GTNH con DreamAssemblerXXL | Instalación en un paso | - Hacen falta permisos de cada mod cerrado; los concedidos a GTNH no se transfieren<br>- Mantenimiento enorme |
| Fork de mods | Cambiar el código de GT5U o NHCoreMod | Control total | - Hay que rehacer los cambios en cada versión<br>- GPL/LGPL obliga a publicar el código |

Precedente directo: **Garden of Grind** funciona igual, como documento más un mod addon sobre GTNH sin modificar ✅ ([precedentes](precedentes.md)).

## Las 4 capas

### Capa 1: configs

- Archivos `.cfg` completos, o parches (diff unificado) sobre los de GTNH 2.9.0.
- Los parches son más fáciles de rebasar en cada versión. Así lo hace GTNH Tweaks ✅.
- Lista de cambios: [config/README.md](../config/README.md).

### Capa 2: mods comunitarios

- EZMiner (MIT), EZGT (MIT) y Torcherino-GTNH (GPL-3.0) ✅.
- Se enlazan desde sus releases de GitHub. No se suben jars al repo.

### Capa 3: scripts ZenScript

- CraftTweaker 3.4.8, Minetweaker-Gregtech-5-Addon 2.3.4 y ModTweaker 0.14.0 vienen en GTNH 2.9.0 ✅.
- Los `.zs` van en `<instancia>/scripts/`.
- Limitación: añaden o quitan recetas concretas, pero no cambian reglas globales.

### Capa 4: mod Java propio

- Se basa en la plantilla de GTNH para mods 1.7.10 (GTNHGradle) 🟡.
- Candidatos:
  - multiplicador global de duración de las recetas GT;
  - vuelo opcional para todos;
  - mutaciones de abejas al 100 %;
  - crecimiento de CropsNH;
  - voltajes mínimos.
- Debe instalarse en **cliente y servidor** para que NEI muestre los valores nuevos 🟡.

## Presets

Igual que Nomi-CEu y Monifactory ✅, una sola base de código con una carpeta de configuración por modo:

```
config-overrides/
  sin-tedio/   # base: todo lo de docs/viabilidad.md
  turbo/       # base + EZGT/Torcherino con valores moderados
```

Un script (`install.ps1` / `install.sh`) copia el modo elegido sobre la instancia.

## Instalación (objetivo de la fase 1)

1. Instala GTNH 2.9.0 oficial, con Prism Launcher o el zip de gtnewhorizons.com.
2. Descarga el zip del overlay desde *Releases*.
3. Ejecuta el script de instalación con el preset elegido, o copia a mano `config/`, `scripts/` y los mods.
4. Crea un **mundo nuevo**. Algunos cambios solo afectan a terreno nuevo.

## Versionado y actualizaciones

- Versiones `2.9.0-easy.N`: versión de GTNH más un número propio.
- Una rama por cada versión de GTNH soportada.
- Checklist al salir una versión nueva de GTNH:
  - reaplicar los parches de config;
  - revisar los IDs y las recetas de los scripts;
  - recompilar el mod Java;
  - probar en un mundo nuevo.

## CI (GitHub Actions)

1. Comprobar la estructura y la sintaxis de los archivos.
2. Empaquetar el zip del overlay en cada tag y publicarlo como *Release*.
3. Más adelante: arrancar un servidor GTNH sin interfaz con el overlay y comprobar que carga. Monifactory lo hace en cada PR con `pr-check-gametests.yml` ✅.

## Organización

- **Issues con plantilla** para bugs y para propuestas de balance. Toda propuesta responde "¿quita tedio o quita progresión?".
- **Cambios de balance:** etiqueta `balance` y 2 aprobaciones.
  - Inspirado en el proceso de GTNH ✅: etiqueta *Affects Balance* y 2 aprobaciones, una de ellas del equipo de balance.
- **Playtesting:** un mundo de prueba por fase (edad de piedra → LV → MV), con checklist.
- **Traducciones:** español e inglés desde el principio.
- **Soporte propio:** los issues van a este repo, nunca al de GTNH.
