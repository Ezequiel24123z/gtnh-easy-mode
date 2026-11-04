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

Resultado de analizar el código de GT5U y del addon de CraftTweaker ✅. Nada está probado todavía en el juego.

| Cambio | Mecanismo | Detalles |
|---|---|---|
| Duración global de las recetas GT (y EU) | Mixin en `OverclockCalculator.calculate()` | - Cubre también las recetas añadidas tarde, por ZenScript y de Assembly Line.<br>- No toca el `mEUt` de las recetas: ninguna baja de tier y NEI sigue coherente.<br>- Las máquinas que no usan este calculador no cambian. |
| Reglas de overclock | El mismo mixin | - Overclock perfecto: `durationDecreasePerOC = eutIncreasePerOC`.<br>- No existe opción en la config.<br>- El overclock por calor ya divide entre 4; falta probar el de láser. |
| Cantidades de salida | Recorrer todas las recetas al terminar la carga y llamar a `GTMod.proxy.reloadNEICache()` | - Clonar stacks y arrays antes de modificarlos, y limitar el tamaño de los stacks.<br>- Saltar los mapas de reciclaje, replicador, mass fabricator y combustibles, para no crear duplicaciones.<br>- Riesgo: cadenas de subproductos desequilibradas. |
| Riqueza y tamaño de las vetas | Mixin tardío en `OreMixBuilder` (`density`, `size`, `weight`), el mismo punto que usa EZGT | - Solo en el servidor y solo en chunks nuevos.<br>- Forkear `OreMixes.java` solo para reescribir vetas concretas. |
| Recetas concretas (como AE2 a LV) | ZenScript (capa 3) para listas cortas; Java si se eligen por salida o en masa | El mixin de duración también escala estas recetas. |

**Por qué no basta con ZenScript** ✅ (addon 2.3.4):

- No tiene ninguna API para recorrer recetas, así que "multiplicar todas las duraciones" no se puede escribir en ZenScript.
- `mods.gregtech.RecipeRemover.remove(mapa, entradas, fluidos)` quita **una** receta buscándola por sus **entradas exactas**. No se puede quitar por salida.
- Las clases por máquina (`mods.gregtech.Assembler`, etc.) aplican los *recipe transformers* de GT; el builder `RA2` se los salta.
- Los nombres de mapa son los de `RecipeMaps.java` en GT5U, como `gt.recipe.assembler` o `gt.recipe.circuitassembler`. La wiki del addon está desactualizada en parte.

**Proyecto y compilación** ✅ (GTNHGradle):

- `enableModernJavaSyntax` en `gradle.properties` elige el JDK:
  - `false` → Java 8;
  - `jabel` (por defecto) → JDK 17 con `--release 8`;
  - `jvmDowngrader` o `modern` → JDK 25. GT5U usa `jvmDowngrader`.
- El mod tiene que generar bytecode de Java 8.
- Comandos: `.\gradlew.bat build`, `runClient` y `runServer` (Java 8), y `runClient25` y `runServer25` (también hay variantes 17 y 21).
- Declarar `required-after:gregtech` e instalar el mod en **cliente y servidor**.

**Riesgo:** revisar los mixins en cada versión de GT, porque las clases y los métodos pueden cambiar.

**Sin verificar** ⚠️:

- Si GT sincroniza las recetas del servidor a los clientes.
- Cómo llegan los scripts ZenScript a los clientes en un servidor dedicado.
- Si las vetas de BartWorks y de otras dimensiones pasan por `OreMixBuilder`.

**Otros candidatos, sin analizar todavía** 🟡: vuelo opcional para todos, mutaciones de abejas al 100 %, crecimiento de CropsNH y voltajes mínimos de máquinas.

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
