# GTNH sin grind: qué puedes cambiar tú mismo y qué ofrece la comunidad

> **Versión de referencia:** GregTech: New Horizons **2.9.0** (estable, publicada alrededor del 31 de octubre de 2026).
> **Fecha de la investigación:** noviembre de 2026.
> **Nivel de confianza:**
> - ✅ Alta: fuente primaria (wiki oficial, GitHub de GTNH o changelog oficial).
> - 🟡 Media: fuente secundaria o comunitaria.
> - ⚠️ Baja: deducción, sin verificar directamente.

---

## Resumen rápido

- **No existe un "GTNH Lite" mantenido.** ✅ El único fork comunitario relevante, *Garden of Grind*, es un reto skyblock **más difícil**, no más fácil.
  - Lo que hace la gente es combinar cuatro cosas: GTNH normal, ajustes de configuración, unos pocos mods comunitarios y una forma de jugar que deje las máquinas trabajando solas.
- **La versión 2.9.0 ya quitó bastante tedio de serie**:
  - Cultivos deterministas (CropsNH).
  - Oscuridad desactivable.
  - Control de spawns de mobs por zona reclamada.
  - Filtro en el Void Miner y diagnóstico de errores en multibloques.
  - Mejoras grandes en AE2.
  - Anillo de vuelo en IV.
  - Recetas de la era de vapor más rápidas.

  Antes de modificar nada, conviene saber qué trae ya (sección 1).
- **Los tres cambios con más impacto:**
  1. **Minería manual:** usa **EZMiner**, minado en cadena hecho para GTNH que entiende las vetas de GregTech.
     - Desde MV, el **Ore Drilling Plant** mina 96×96 bloques solo y carga sus propios chunks.
     - El mapa marca cada veta que encuentras.
  2. **Tiempos de espera:**
     - El pack **duplica** lo que tardan en crecer cultivos y árboles y en criarse los animales. Se arregla cambiando unos multiplicadores de 2 a 1 (sección 2.2).
     - Juega en un **servidor dedicado local**, aunque sea en tu mismo PC, con chunks cargados, para que las máquinas trabajen mientras no juegas.
       - Las anclas de carga de chunks del pack gastan combustible.
       - Puedes quitárselo o activar la carga gratuita de ServerUtilities, que viene apagada (sección 2.3).
     - Si aceptas un atajo grande, **Torcherino-GTNH** acelera las máquinas de GregTech. El World Accelerator de serie *no puede* acelerarlas.
  3. **Grind de recetas y cantidades:**
     - **EZGT** duplica casings, circuitos, motores y subproductos de procesado de menas, y hace las vetas más ricas. Todo es configurable.
     - A eso se suman los ajustes de configuración de la sección 2.
- **Atajo para configurar:** la web comunitaria **GTNH Tweaks** genera los archivos de configuración con los ajustes que elijas (sección 2.0).
- **Límite realista:** como resume un hilo de r/GTNH, *"ninguno de esos cambios quita el grind del árbol tecnológico, solo lo hacen menos molesto"*. Para acortar el árbol en sí hacen falta multiplicadores de recetas (EZGT o scripts) o directamente otro modpack (sección 5).

### Orden recomendado

1. **Antes de crear el mundo**, decide la generación del terreno: quita las bolsas de tierra y grava (sección 2.4) e instala EZGT si quieres vetas más ricas. Estos cambios **solo afectan a chunks nuevos**.
2. Aplica los ajustes que no alteran el progreso (secciones 2.1 a 2.3): oscuridad, contaminación, tiempos de granja y carga de chunks. La web GTNH Tweaks aplica muchos de ellos por ti.
3. Instala **EZMiner**. Si quieres más velocidad, añade **EZGT** con multiplicadores moderados y, como último recurso, **Torcherino-GTNH**.
4. Juega en un **servidor local** con carga de chunks (sección 2.3) y planifica con **PlanNH** o **gtnh-flow**.
5. Fija tus propias reglas sobre el modo trampa de NEI (sección 4) y haz **copias de seguridad** antes de cada cambio.

---

## 0. Qué se puede quitar y qué no

Los propios desarrolladores de GTNH distinguen dos cosas en su documento de visión del modpack ([GTNH-Dev-Doc](https://github.com/GTNewHorizons/GTNH-Dev-Doc/blob/master/vision%20of%20the%20modpack/breakdown/general.md)) ✅:

- **Tedio**: *"un proceso obligatorio que no es divertido"*. Lo que ellos mismos consideran tedio:
  - Tareas manuales repetitivas sin opción de automatizarlas.
  - Procesos largos y llenos de azar; ponen los cultivos como ejemplo.
  - Procesos que solo sirven para evitar algo malo. Admiten que **la limpieza de contaminación "no está en buen estado"**.
  - Cosas que fomentan estar AFK mucho tiempo.
  - Apuntar menas a mano.
  - Combates contra jefes largos y de poca habilidad.
- **Calidad de vida (QoL)**: *"usar el código del pack para automatizar el tedio"*. Distinguen dos tipos:
  - **QoL inmediata**: libro de misiones, NEI, mapa, buenas interfaces.
  - **QoL como recompensa**: escáneres avanzados, minería automática, vuelo, integración AE2-GT. Se **desbloquea con el progreso a propósito**.

**Conclusión:** los desarrolladores no están en contra de quitar grind, pero **dosifican** la calidad de vida. Los mods y ajustes de este documento sirven para adelantar esa calidad de vida o quitar el tedio que todavía queda.

---

## 1. Lo que GTNH 2.9.0 ya trae

### 1.1 Novedades de 2.9.0 que quitan tedio ✅

Fuente: [changelog oficial 2.8.4 → 2.9.0](https://changelog.gtnh.ogricanx.ch/2.8.4_to_2.9.0/brief.html).

| Área | Cambio |
|---|---|
| Cultivos | **CropsNH** reemplaza a IC2 Crops:<br>- El cruce es una **receta que se consulta en NEI**, no una tirada al azar.<br>- Ya no existe la calidad del aire.<br>- Hay 5 máquinas propias, hasta la **Industrial Farm (MV)**.<br>- Según la wiki, los cultivos permiten **multiplicar ×4 la mayoría de las menas** y generar de forma pasiva casi todos los recursos importantes hasta LuV. |
| Oscuridad | **Darkerer** (noches totalmente oscuras) ahora es solo del lado del cliente y se puede desactivar en su configuración. |
| Mobs | **ServerUtilities**: control de spawns por equipo y por zona reclamada. Puedes bloquear monstruos en tus chunks. Los equipos se crean solos al entrar por primera vez.<br>**Ojo:** el reclamo de chunks viene desactivado en el pack; actívalo primero (sección 2.3). |
| Minería | - **Void Miner**: filtro de menas (lista blanca o negra) por dimensión.<br>- **Infinite Fluid Drilling Rig**: ya no necesita *mining pipes*.<br>- **Ore Drilling Plant** y **Fluid Drilling Rig**: botón para ver el área de trabajo.<br>- **Ore Finder Wand** con listas configurables.<br>- **Electric Prospector's Scanner**: barra de búsqueda y flecha de dirección.<br>- NEI muestra la probabilidad de cada veta por mundo.<br>- Los fluidos subterráneos se pintan en el mapa.<br>- Hay soporte para JourneyMap 6 y Xaero's. |
| Herramientas y movilidad | - Modificadores **Expander** de Tinkers' Construct: más área para martillo, excavadora y hacha.<br>- **Angel Ring** (vuelo) baja a **IV** (antes era ZPM).<br>- **Mechanical Armor** modular de HV a UHV: jetpack, *step assist*, visión nocturna, etc.<br>- *Step assist* activado por defecto en las botas de la familia Thaumcraft. |
| Multibloques | - Comprobación de receta **instantánea** al cambiar las entradas.<br>- **Diagnóstico de errores de estructura** con coordenadas y bloque esperado.<br>- Hologramas numerados.<br>- Buses de EV+ con más ranuras.<br>- La protección contra pérdida de salidas ya no destruye nada en silencio.<br>- Mantenimiento automático (*Vis-Regulated Maintenance Hatch*). |
| Velocidad | - *Crafting Station* y *Crafting Slab* pasan de **4 min a 5 s**.<br>- SMD bajan a HV con la mitad de tiempo.<br>- Mejoras al Industrial Centrifuge, Electrolyzer, Maceration Stack, Extruder, Forming Press y Bending Machine.<br>- Large Boilers con **+20% de vapor**.<br>- Integrated Ore Factory **sin tope de 1024 paralelos**. |
| Era de vapor | **GT Coke Oven** (sin energía) y **Steam Hearth** (horno de vapor que procesa 8 ítems a la vez). |
| AE2 | - **Terminal universal** (ítems, fluidos y esencia).<br>- Las CPU dicen **qué están esperando**.<br>- **Level Maintainer** con fluidos.<br>- *Pattern Repeater*.<br>- **Not Enough Energistics** (convierte recetas de NEI en patrones).<br>- Patrones en blanco sacados de la red. |
| Thaumcraft | **AspectRecipeIndex** (mod nuevo):<br>- Busca recetas por aspecto en NEI.<br>- Con clic derecho sobre los aspectos en NEI **ganas puntos de investigación**.<br>- Algunos materiales de GT++ ahora tienen aspectos, así que hace falta cultivar menos *wisps*. |
| Menos clics | - **GregoryTweaksForCrafting**: rotar, balancear, comprimir o descomprimir la cuadrícula de crafteo.<br>- **MouseTweaks**.<br>- **NoHotbarNeeded**: usar objetos sin pasarlos a la barra rápida.<br>- **Extreme Sound Muffler**: silenciar máquinas.<br>- Ranuras de inventario fijables. |
| Guías y misiones | - **GuideNH**: guía dentro del juego.<br>- **Vending Machine**: canjea monedas de misiones.<br>- **Lootbags**: 3 bolsas = 1 del tier siguiente, sin espera. |
| Construcción | **Matter Manipulator**: copiar y pegar construcciones y configuraciones de AE2. |
| Otros | - **Freecam**.<br>- Las tumbas te reequipan solas.<br>- Encantamientos automatizables.<br>- Recetas de ensamblador para espadas y pinchos (granjas de mobs). |

> **Ojo**, también hay cambios que **añaden** trabajo:
> - El acero desde polvo de hierro en el EBF ahora pide polvo de carbono.
> - Las recetas del arc furnace ahora piden circuito programado.
>
> Revisa también tus construcciones de la *Circuit Assembly Line*.

### 1.2 Minería sin picar a mano (por tier)

| Etapa | Herramienta | Qué te ahorra | Detalles | Confianza |
|---|---|---|---|---|
| Edad de piedra y vapor | Martillo o excavadora de **Tinkers' Construct** con modificadores *Expander* (2.9) | Cavar túneles y bases por áreas de 3×3 o más | Hay una guía comunitaria para un martillo irrompible desde LV ([gtbp.gg](https://gtbp.gg/gtnh/guides/player-gear/unbreakable-hammer-lv)), aunque puede estar desactualizada. | ✅ / 🟡 |
| LV–HV | **Miner** de un bloque (Basic, Good y Advanced): de 17×17 a 49×49 bloques | Extraer una veta conocida sin picar | Necesita **carga de chunks externa** (sección 2.3) y gasta *mining pipes*. | ✅ |
| **MV → IV** | **Ore Drilling Plant (ODP) T1–T4**:<br>- T1 (MV): 96×96 bloques, 12 s por mena.<br>- T4 (IV): 288×288 bloques, 0,75 s por mena. | Minería por zonas a unas **3× más mena** que el Miner | - **Carga de chunks propia** (su chunk y el que está minando), sin anclas ni ServerUtilities.<br>- Gasta **2.000 L de Drilling Fluid por mena** (mezclador LV: agua, polvo de piedra y lubricante).<br>- Admite overclock. Varias ODP pueden compartir paredes.<br>- Pon una tapa *Metrics Transmitter* para ver su progreso a distancia. | ✅ ([wiki](https://wiki.gtnewhorizons.com/wiki/Ore_Drilling_Plant)) |
| MV+ | **Fluid Drilling Rig** (petróleo y gases), T1–T4 e **Infinite** | Recoger petróleo a mano | El Infinite no agota el yacimiento y en 2.9 ya no usa *pipes*. Solo admite 1 *energy hatch* normal. | ✅ |
| Edad de piedra → MV | **CropsNH** + **Industrial Farm** (MV) | Multiplicar menas y producir recursos de forma pasiva | Los cultivos se actualizan cada 12,8 s. Se pueden acelerar con el *World Accelerator*. | ✅ ([wiki](https://wiki.gtnewhorizons.com/wiki/CropsNH)) |
| HV → UV | Abejas: *Industrial Apiary* (HV) y **Mega Apiary** (UV, acelera ×64 con entorno perfecto) | Producir *combs* sin cuidar colmenas | Los atajos con abejas a veces se nerfean (por ejemplo, la abeja de metales del platino). No te fíes de ellos a largo plazo. | 🟡 / ✅ |
| **ZPM** | **Void Miner** T1–T3 | Mena **infinita** sin agujeros ni *pipes* | - Con filtro por dimensión (2.9).<br>- No admite overclock.<br>- Los gases nobles multiplican la producción. | ✅ |
| UV+ | **Space Elevator** con módulos de minería | Viajar a minar a otros planetas | Endgame | ✅ |
| MV | **Concrete Backfiller** | Rellenar huecos tras excavar para que no aparezcan mobs | — | ✅ |

> GTNH **no trae minado en cadena (vein mining) de serie** ✅. Para eso está EZMiner (sección 3).

### 1.3 Encontrar menas sin buscar a ciegas

| Herramienta | Tier | Qué hace | Confianza |
|---|---|---|---|
| **Overlay de chunks y vetas** (F9 tres veces) | Siempre | Muestra la cuadrícula de vetas en el mundo. Las vetas siguen una cuadrícula de 3×3 chunks. | ✅ |
| **Ore Finder Wand** | Edad de piedra | Detecta un material concreto cerca y lo anota en el mapa. | ✅ |
| **Prospector's Scanner** | LV–UHV | Escanea los chunks de alrededor: piedra para menas y *bedrock* para fluidos. Marca el mapa. | ✅ |
| **Electric Prospector's Scanner** | LuV+ | Interfaz por chunk con buscador (2.9). | ✅ |
| **VisualProspecting** + JourneyMap o Xaero's | Siempre | - Cada veta que tocas o escaneas queda **marcada para siempre** en el mapa.<br>- Puedes buscar ("cobre") y marcar vetas agotadas.<br>- También muestra fluidos subterráneos y nodos de Thaumcraft. | ✅ |
| Seismic Prospector avanzado | LV–EV | Informe exacto por chunk en un radio de 5×5 a 11×11 chunks. | 🟡 (dato de 2018) |

> Los mods de **rayos X no funcionan** con las menas de GT, porque son *TileEntities* ✅. Tampoco hacen falta con lo anterior.

### 1.4 Menos tiempo de espera

- **Paralelos y overclock** ✅:
  - Los multibloques ejecutan recetas en paralelo según el tier de sus *energy hatches*.
  - Cuando el overclock bajaría una receta por debajo de 1 tick, lo sobrante se convierte en **más paralelos** (1tOC).
  - **El *batch mode* NO acelera nada**: solo reduce el lag ([wiki](https://wiki.gtnewhorizons.com/wiki/Multiblock_Machines)).
- **World Accelerator** (LV–UV) ✅:
  - **No acelera máquinas de GregTech ni de OpenComputers**.
  - Sí sirve para cultivos, apiarios, el altar de sangre y la infusión de Thaumcraft ([wiki](https://wiki.gtnewhorizons.com/wiki/World_Accelerator)).
- **Multibloques que sustituyen esperas** ✅:
  - **EEC** (*Extreme Entity Crusher*, EV): loot de mobs **sin mobs reales**.
  - **EIG** (IV): semillas hasta ×32.
  - **Tree Growth Simulator** (IV): madera y savia.
  - **Multibloques GT++** (desde EV o IV): bonificaciones de velocidad y paralelos. Los porcentajes de la wiki son de 2.7.1 🟡.
  - **Exothermic Hearth**: sustituye al Mega EBF en 2.9.
- **QFT** (*Quantum Force Transformer*, UEV) ✅: une cadenas químicas enteras en un solo paso. Solo ayuda muy al final del juego.
- **Láseres** (EV+) 🟡: transporte de energía casi sin pérdidas para alimentar paralelos grandes.

### 1.5 Menos tedio de logística

- **AE2** (desde EV) ✅:
  - Terminales de patrones, fluidos y niveles.
  - **Level Maintainer**: fabrica solo cuando baja el stock.
  - **Buses y hatches ME de GT**: conectan multibloques a AE2 sin tuberías.
  - Lee la guía oficial **[Good Practices With AE](https://wiki.gtnewhorizons.com/wiki/Good_Practices_With_AE)** para que la automatización no te hunda el TPS.
- **Circuitos programados virtuales** ✅: la mayoría de las ranuras aceptan un circuito "fantasma" sin fabricarlo. Configuras la receta una vez y te olvidas.
- **NEI** ✅:
  - Marcadores de recetas y **cadenas de crafteo** desde la receta favorita.
  - Búsqueda resaltada de vetas en el mapa.
- **OpenComputers** ✅:
  - Automatización con Lua.
  - Los robots de cruce de cultivos ya son **innecesarios** gracias a CropsNH.
- **Misiones y lootbags** ✅: más de 3.800 misiones con recompensas, que son un "atajo legal". Las bolsas filtran la basura.

### 1.6 Muros de grind típicos y cómo pasarlos

| Muro | Por qué cansa | Salida dentro del juego | Salida "hazlo tú" |
|---|---|---|---|
| **Era de vapor** | Todo es manual y lento | Steam Hearth y GT Coke Oven (2.9). Pasa a LV cuanto antes. | Considera el modo trampa de NEI para materiales básicos que ya fabricaste (sección 4). |
| **EBF y bobinas** | La wiki dice que los tiempos son **"largos a propósito"** para obligarte a ampliar la infraestructura. | Paralelos, Volcanus (EBF avanzado), Exothermic Hearth | Torcherino-GTNH, EZGT |
| **Línea del platino** (EV–IV) | Una de las cadenas químicas más complejas del pack | - Planifícala con gtnh-flow o PlanNH y móntala **una vez** con AE2.<br>- El QFT (UEV) la simplifica mucho más adelante.<br>- La [página de la wiki](https://wiki.gtnewhorizons.com/wiki/Platinum_Line) la divide en ramas. | — |
| **Investigación de Thaumcraft** | Minijuego de aspectos | - Misión *"Just Tell Me What to Scan Already!"*.<br>- **AspectRecipeIndex** (2.9).<br>- [Research Cheatsheet](https://wiki.gtnewhorizons.com/wiki/Thaumcraft_Research_Cheatsheet) en la wiki. | - [thaumcraft-gtnh-solver](https://github.com/axcou/thaumcraft-gtnh-solver) (resuelve el tablero).<br>- Investigación comprada con puntos, sin minijuego (sección 2.5). |
| **LP de Blood Magic** | Sacrificarte con el cuchillo | Ritual **Well of Suffering** junto con un EEC | — |
| **Esquemas de cohetes** (Galacticraft) | Buscar mazmorras | No se encontró ninguna solución dentro del juego. | Modo trampa de NEI en partida individual, si lo aceptas |
| **Cultivos y abejas** | Azar | CropsNH determinista y Mega Apiary | EZMiner (cosecha en área) |
| **Circuitos** | Cantidades enormes | Circuit Assembly Line | EZGT (×2, o ×4 en SoC) |

---

## 2. Cambios de configuración que puedes hacer tú

Salvo que se indique otra cosa, **todos los valores están comprobados en los archivos de la versión 2.9.0 del pack** ✅ ([repositorio del modpack, etiqueta `2.9.0`](https://github.com/GTNewHorizons/GT-New-Horizons-Modpack/tree/2.9.0/config)). "Por defecto" es el valor con el que viene GTNH, que a veces no coincide con el del mod original.

### 2.0 Antes de tocar nada

1. **Cierra el juego** (y el servidor) y **haz una copia** de `config/`, `serverutilities/` y del mundo.
2. Las rutas son relativas a la carpeta de la instancia (`.minecraft`). Son archivos de texto con formato Forge: `B:` es sí/no, `I:` un entero, `D:` un decimal y `S:` un texto.
3. **En servidor**, los cambios de juego se hacen en los archivos **del servidor** y hay que reiniciarlo. La excepción es Darkerer, que es del cliente.
4. Apunta cada cambio en un `.txt`: **al actualizar el pack se sustituye `config/`** y tendrás que volver a aplicarlos.
5. Los nombres de las claves cambian a veces entre versiones; GregTech ya renombró varias en 2.8. Si una guía antigua no coincide, busca una clave parecida en el archivo.

> **Atajo: [GTNH Tweaks](https://gtnh-tweaks.ctry.dev/)** ✅
> - Web comunitaria enlazada desde la [wiki oficial](https://wiki.gtnewhorizons.com/wiki/Commands_and_Configurations) ([código](https://github.com/creativitRy/gtnh-tweaks)).
> - Eliges ajustes de una lista, indicas tu versión (2.8.x–2.9.0) y descargas los archivos ya modificados.
> - Incluye muchos ajustes de esta sección: contaminación, explosiones, bolsas de tierra y grava, reclamo de chunks, teletransporte, Warp, LootGames y el proyector de hologramas.
> - Indica qué ajustes respetan las reglas *Stargate*.
> - **Revisa `serverutilities/server/ranks.txt` después de descargar** ✅ (según su código):
>   - Los ajustes que suben límites (chunks y *homes*) escriben en ese archivo, pero no activan los rangos (sección 2.3).
>   - El de teletransporte escribe claves `serverutilities.home.*`, pero el mod lee `serverutilities.homes.*`. El número de *homes* no cambiará hasta que corrijas el nombre.

> **Reglas *Stargate*** ✅
>
> Solo importan si quieres el rol oficial del Discord por terminar el pack. Si juegas para divertirte, ignóralas. Según la [wiki](https://wiki.gtnewhorizons.com/wiki/Stargate#Discord_Role_Requirements), permiten:
> - Desactivar la contaminación.
> - Desactivar los mobs a partir de EV (por lag), el *mob griefing* y la propagación del fuego.
> - Usar `/home` y `/tp` a otros jugadores.
> - Usar mods que no cambien sustancialmente el juego.
>
> No permiten sacar objetos con trampas, salvo los que no se puedan conseguir por un bug.

### 2.1 Molestias que puedes quitar sin cambiar el progreso

| Qué quitas | Archivo | Cambio (por defecto → sugerido) | Notas | Confianza |
|---|---|---|---|---|
| Noches totalmente negras | `config/darkerer.cfg` (cliente) | `S:mode=EVERYWHERE` → `ONLY_INSIDE` o `MOON_PHASE`.<br>O añade `0` (el mundo normal) a la lista `I:dimBlocklist`, que por defecto solo contiene `7`. | `ONLY_INSIDE` deja algo de luz en la superficie. `MOON_PHASE` hace lo mismo, pero según la fase lunar. | ✅ |
| Mobs que se enfadan | `config/angermod.cfg` | `B:enabled=true` → `false` en cada sección:<br>- `block-break-anger`: endermans y *zombie pigmen* te atacan si picas menas de GT en el End o el Nether.<br>- `friendly-animal-revenge`: los animales cercanos se enfadan o huyen si comes su carne.<br>- `kamikaze`: los animales que matas tienen un 10% de probabilidad de explotar, salvo que uses un cuchillo de GT (normal o de carnicero) o una daga de sacrificio. | La wiki indica una ruta y unas claves **antiguas**. Deja activada `spawn-protection`, que evita que te ataquen nada más reaparecer o cambiar de dimensión. | ✅ |
| Máquinas que explotan | `config/GregTech/GregTech.cfg` | `true` → `false` en:<br>- `B:machineRainExplosions` (lluvia)<br>- `B:machineThunderExplosions` (tormenta)<br>- `B:machineNonWrenchExplosions` (romperlas sin llave)<br>- `B:machineFireExplosions` y `B:machineWireFire` (fuego)<br>O todo a la vez con `B:machineExplosions=false`. | Las explosiones por sobretensión enseñan a no conectar mal, así que puedes dejarlas. Las reglas *Stargate* solo aceptan este cambio **como alternativa a cargar un backup**. | ✅ |
| Contaminación | `config/GregTech/Pollution.cfg` | `B:"Activate Pollution"=true` → `false`.<br>Alternativa suave: subir los límites `I:pollutionSmogLimit=550000`, `pollutionPoisonLimit=750000`, `pollutionVegetationLimit=1000000` y `pollutionSourRainLimit=2000000`. | Desactivarla **no borra** la contaminación que ya hay y también apaga su disipación natural. Hazlo antes de contaminar, o límpiala antes con `/gt pollution <cantidad>` (con número negativo; requiere trampas u OP). | ✅ |
| Lunas de sangre | `config/RandomThings.cfg` | `D:BloodMoonChance=0.01` → `0`<br>`B:BloodMoonNoSleep=true` → `false`<br>`B:BloodMoonRedLight=true` → `false` (solo quita el tinte rojo) | Por defecto salen en el 1% de las noches. | ✅ |
| Mobs infernales (con modificadores) | `config/InfernalMobs.cfg` | No hay un interruptor general. Tienes tres opciones:<br>- Poner a `false` las entradas de `permittedentities {}`, una por tipo de mob (método de la wiki).<br>- Quitar solo los modificadores más pesados con `B:"MM_<nombre> enabled"=false`, en `general {}`.<br>- Añadir dimensiones a `S:dimensionIDBlackList=50`. | No comprobé el formato de la lista de dimensiones; prueba a separarlas con comas (`50,0`). | ✅ / 🟡 |
| Penalizaciones con poca vida o hambre | `config/HungerOverhaul/HungerOverhaul.cfg` | `B:addLowStatEffects=true` → `false` | Quita la lentitud, las náuseas, la debilidad y la minería lenta. | ✅ |
| Comer siempre lo mismo rinde menos | `config/SpiceOfLife.cfg` | `B:food.modifier.enabled=true` → `false` | Si lo dejas, `B:hearts.milestones.enable` te da corazones extra por variar la dieta. | ✅ |
| Viajar a pie | `serverutilities/serverutilities.cfg`, sección `commands` | `B:home`, `B:back`, `B:spawn`, `B:warp` y `B:tpa`: `false` → `true` | Para tener más de 1 *home*, activa `ranks { B:enabled=true }` en el mismo archivo y sube `serverutilities.homes.max: 1` en `serverutilities/server/ranks.txt`. Con `serverutilities.homes.cross_dim: true` puedes volver a casa desde otra dimensión. | ✅ |
| Talar árbol a árbol | `config/GregTech/GregTech.cfg` | `B:timber=false` → `true` | Las hachas de GregTech talan el árbol entero de un golpe. | ✅ |
| Spawners casi irrompibles | `config/GregTech/GregTech.cfg` | `B:harderMobSpawner=true` → `false` | Por defecto tienen dureza 500. | ✅ |
| Minijuego *Game of Light* (LootGames) | `config/lootgames/games/game_of_light.cfg` (se crea al arrancar) | `I:weight=1` → `0` | Ese minijuego deja de salir; los demás siguen. | 🟡 |
| Autoconstrucción lenta de multibloques | `config/structurelib.cfg` (se crea al arrancar) | `I:autoPlaceBudget=25` → hasta `200` | Más bloques por ronda al construir con el *Multiblock Structure Hologram Projector*. | 🟡 |
| Buscar objetos en cofres (tecla T) | `config/findit.cfg` | `S:SearchRadius=16` → un valor mayor | Radio de búsqueda en bloques. | ✅ |

### 2.2 Esperas: el pack duplica los tiempos de granja ✅

Es el hallazgo más útil de la configuración. GTNH pone a **2** estos multiplicadores de `config/HungerOverhaul/HungerOverhaul.cfg`, así que todo tarda **el doble** que en Minecraft normal. Ponlos a `1`:

| Clave | Qué tarda el doble |
|---|---|
| `cropRegrowthMultiplier` | Cultivos normales (trigo, zanahorias, etc.) |
| `saplingRegrowthMultiplier` | Brotes que se convierten en árboles |
| `treeCropRegrowthMultiplier` | Frutas de árboles de HarvestCraft |
| `cactusRegrowthMultiplier`, `sugarcaneRegrowthMultiplier`, `netherWartRegrowthMultiplier`, `cocoaRegrowthMultiplier` | Cactus, caña de azúcar, verruga del Nether y cacao |
| `breedingTimeoutMultiplier` | Espera entre crías de animales |
| `childDurationMultiplier` | Tiempo que tardan las crías en hacerse adultas |
| `eggTimeoutMultiplier` | Huevos de gallina |
| `dryingRackTimeMultiplier` | Secadero (*drying rack*) de Tinkers' Construct |

- `I:hoeToolDamageMultiplier=5` → `1` evita que las azadas se gasten 5 veces más rápido.
- ⚠️ No está claro que estos multiplicadores afecten a **CropsNH**, que tiene su propio ciclo de 12,8 s. Sí afectan a los cultivos normales, los árboles y los animales.

**Abejas de Forestry:** en `config/forestry/apiculture.cfg`, sección `beekeeping`, cambia `S:mode=HARD` → `NORMAL` (el valor por defecto del mod) o `EASY` ✅.
- Valores posibles: EASY, NORMAL, HARD, HARDCORE e INSANE.
- El modo ajusta la vida de las reinas, las mutaciones, la producción y la degradación de las princesas 🟡.

### 2.3 Carga de chunks sin gastar combustible ✅

Sin carga de chunks, **las máquinas se paran cuando te alejas**. Las ODP son una excepción, porque cargan su propia zona.

**Lo que trae el pack son las anclas de Railcraft**, cada una con su misión. Cada ancla mantiene cargada una zona de 3×3 chunks, pero **gasta combustible**: perlas de ender o las monedas de carga de chunks (*chunkloader coins*) que dan las misiones.

| Ancla | Misión | Cuándo mantiene la zona cargada | Combustible por defecto (horas por unidad) |
|---|---|---|---|
| Personal (*Personal Anchor*) | LV | Desde que su dueño la visita y mientras siga conectado | - Fragmento de ender: 1 h<br>- Perla de ender: 4 h<br>- Monedas: de 48 a 768 h |
| Pasiva (*Passive Anchor*) | MV | Desde que su dueño la visita hasta que se reinicia el servidor | - Perla de ender: 1 h<br>- Monedas: de 24 a 384 h |
| Mundial (*World Anchor*) | HV | Siempre, incluso después de reiniciar | Solo monedas: de 12 a 192 h |

Hay dos formas de olvidarte del combustible.

**Opción A: anclas sin combustible.** En `config/railcraft/railcraft.cfg`, sección `anchors`, deja vacías las listas `S:personal.fuel=`, `S:passive.fuel=` y `S:world.fuel=`. El comentario del propio archivo indica que, con la lista vacía, esa ancla no necesita combustible. Las tienes que seguir fabricando.

**Opción B: carga de chunks de ServerUtilities**, gratis y sin fabricar nada. GTNH trae el reclamo de chunks **apagado a propósito**, "para mantener el balance" ([wiki](https://wiki.gtnewhorizons.com/wiki/ServerUtilities)). Para activarlo:

1. En `serverutilities/serverutilities.cfg`, categoría `world`:
   - `B:chunk_claiming=false` → `true`. El mod lo trae activado; GTNH lo desactiva.
   - `B:chunk_loading=true` ya está activo, pero no hace nada si no se pueden reclamar chunks.
2. Los límites por rango están en `serverutilities/server/ranks.txt`:

   | Rango | Chunks reclamados | Chunks cargados |
   |---|---|---|
   | `player` | 100 | 50 |
   | `vip` | 500 | 100 |
   | `admin` (OP) | 1000, y además `claims.bypass_limits: true` | 1000 |

   El pack trae los rangos **desactivados** (`ranks { B:enabled=false }` en `serverutilities.cfg`), y así el mod **ignora `ranks.txt`** ✅. Para que cuenten tus cambios, pon `B:enabled=true`. Sin rangos se aplican los límites del código, que según el código actual coinciden con los de `player`: 100 chunks reclamados y 50 cargados 🟡.
3. Para usarlo, abre el mapa de reclamos con el icono de mapa del inventario o desde JourneyMap, marca tus chunks y usa Shift + clic para cargarlos 🟡.
4. Según el código actual del mod, los chunks **siguen cargados aunque te desconectes**. Se descargan si tu equipo pasa **2 semanas** sin entrar y vuelven a cargarse cuando regresas 🟡.

**Con GTNH Tweaks** ✅ (revisado en su código): su ajuste *Claim Chunks* hace el paso 1 y escribe 1000 chunks reclamados y 1000 cargados en `ranks.txt`. Por defecto también deja que cada equipo decida sobre las explosiones y el PvP. Lo marca como compatible con las reglas *Stargate*. **No activa los rangos**, así que esos 1000 no cuentan hasta que pongas tú `B:enabled=true`.

**Extras de los reclamos** (necesitan la opción B):
- **Spawns:** con `S:blockMobSpawningInClaims=DEFAULT`, cada equipo decide si bloquea los mobs en sus chunks; con `TRUE` se bloquean en todos los reclamos. Es la novedad de 2.9 de la sección 1.1, que **no funciona sin reclamos**.
  - Con `TRUE`, la lista `S:mobTypesToBlock` bloquea por defecto también animales, murciélagos y criaturas acuáticas. Deja solo `MOB` si quieres que sigan apareciendo.
- **Explosiones:** cambiar `S:enable_explosions=TRUE` → `DEFAULT` permite que cada equipo las desactive en sus chunks. Es lo que hace GTNH Tweaks.

### 2.4 Generación del mundo: decídelo antes de explorar

Todo esto **solo afecta a chunks nuevos**.

- **Bolsas de tierra y grava bajo tierra** ✅: en `config/GregTech/WorldGeneration.cfg`, cambia `B:generateUndergroundDirtGen=true` → `false` y `B:generateUndergroundGravelGen=true` → `false`. Así dejan de cortar túneles y minas.
- **Las vetas no se pueden agrandar por configuración** ✅:
  - El tamaño, la densidad y la frecuencia de cada veta están fijados en el código de GregTech (`OreMixes.java`).
  - `I:oreveinPercentage=100` (en `GregTech.cfg`) ya es el máximo; bajarlo solo pone menos vetas.
  - `B:oreveinPlacerOres` e `I:oreveinPlacerOresMultiplier=2` solo controlan las **menas pequeñas** sueltas alrededor de las vetas, no lo que rinde cada veta.
  - Para vetas más ricas, usa **EZGT** (sección 3).
- **Las formaciones de piedra (basalto, granito y mármol) no se pueden quitar** ✅. Las opciones `generateBasaltOres`, `generateBlackGraniteOres`, `generateMarbleOres` y `generateRedGraniteOres` solo deciden si hay menas **dentro** de esas piedras.

### 2.5 Cambios que sí tocan el balance

- **Thaumcraft** ✅:
  - En `config/Thaumcraft.cfg`, cambia `I:research_difficulty=1` → `-1`. Con 1 ("difícil", el valor del pack) todo se resuelve en la mesa de investigación; con -1 se **compra con puntos de investigación**.
  - Cámbialo a la vez que `I:research.concept.mode=0` → `1` en `config/ThaumicMachina.cfg`, como recomienda la wiki.
  - `B:wuss_mode=false` → `true` quita el **Warp** (efectos negativos permanentes). No respeta las reglas *Stargate*.
  - Según la wiki, poner `I:biome_taint_spread=200` a 0 no parece funcionar.
  - Comandos con trampas:
    - `/thaumcraft research <jugador> all`
    - `/thaumcraft aspect <jugador> all <cantidad>`
    - `/tc warp <jugador> set 0 PERM`
- **Galacticraft** (`config/Galacticraft/core.conf`):
  - `I:"Rocket fuel factor"=5` → `1`. El comentario del archivo dice que lo normal es 1 y que se sube en packs con mucho petróleo. El valor está comprobado ✅, pero su efecto exacto en GTNH no ⚠️.
  - `B:"Harder Difficulty"=true` y `B:"Quick Game Mode"=false`: GTNH reescribe las recetas de Galacticraft, así que su efecto es incierto ⚠️.
- **Tinkers' Construct** ✅: el comando `/leveluptool` (con trampas) sube de nivel la herramienta que llevas en la mano y te salta el grind de experiencia (wiki).
- **Velocidad de todo el juego** ⚠️: el mod *TickrateChanger* (`/tickrate 40` pone el juego al doble de velocidad) acelera **todo**: máquinas, cultivos, mobs, el día y la noche.
  - Lo ofrece GTNH Tweaks, pero marcado como **no** válido para *Stargate*.
  - Necesita un PC que aguante el doble de ticks y no hay pruebas publicadas en 2.9.

### 2.6 Cambiar recetas tú mismo con scripts

GTNH incluye **CraftTweaker** (MineTweaker 3) y el addon de GregTech de GTNH ✅, así que puedes cambiar recetas sin programar un mod:

1. Crea un archivo `.zs` en la carpeta `scripts/` de la instancia. En servidor, el archivo va en el servidor y se sincroniza con los jugadores.
2. Con un objeto en la mano, `/mt hand` te da el nombre que debes usar en el script ✅.
3. Reinicia el juego y comprueba las recetas en NEI. Prueba primero en una **copia** del mundo.

Ejemplo con la API actual del addon (`mods.gregtech.RA2` y `RecipeRemover`) ✅:

```zenscript
// Quita una receta del ensamblador y la vuelve a añadir, más rápida
mods.gregtech.RecipeRemover.remove("gt.recipe.assembler", [<mod:entrada_a>, <mod:entrada_b>], []);

mods.gregtech.RA2.builder()
    .itemInputs([<mod:entrada_a>, <mod:entrada_b>])
    .itemOutputs([<mod:salida>])
    .noFluidInputs()
    .noFluidOutputs()
    .duration(100)   // ticks: 20 = 1 segundo
    .eut(30)         // EU/t
    .addTo("gt.recipe.assembler");
```

- Sustituye `<mod:...>` por los nombres que te da `/mt hand`.
- Los nombres de las máquinas (`gt.recipe.*`) están en la [wiki del addon](https://github.com/GTNewHorizons/Minetweaker-Gregtech-5-Addon/wiki) 🟡.
- **No uses** la documentación de CraftTweaker para GTCE o GTCEu: es otra API.

### 2.7 Lo que no se puede cambiar por configuración

- **Tamaño y riqueza de las vetas, y formaciones de piedra**: están en el código. Para vetas más ricas, usa EZGT.
- **Duración de las recetas en general**: no encontré ningún multiplicador en la configuración de GregTech. Tus opciones son:
  - EZGT, que multiplica cantidades.
  - Torcherino-GTNH, que acelera máquinas.
  - Scripts (sección 2.6).
  - El mod experimental GTNH-Balance-Tweaks (sección 3.1).
- **Explosión de calderas sin agua**: sus tiempos están en el código. No está verificado si `machineExplosions=false` la evita ⚠️.
- **Petróleo en el mundo normal**: `config/GTNewHorizons/dreamcraft.cfg` tiene opciones (`GenerateOil` y tamaño de los yacimientos), pero no comprobé qué hacen ⚠️.

---

## 3. Mods y herramientas de la comunidad

### 3.1 Mods para añadir (verificados en sus repositorios)

| Mod | Qué quita | Estado (nov 2026) | Instalación | Cuidado | Confianza |
|---|---|---|---|---|---|
| **[EZMiner](https://github.com/czqwq/EZMiner)** | **Minería manual.** Mantén pulsada `` ` `` para minar en bloque.<br>- Modo explosión, con 7 submodos (túnel, solo menas, tala, **"GT Vein Ore"**, que solo mina menas de vetas grandes, etc.).<br>- Modo cadena.<br>- Modo especial: **cosecha de cultivos en área** (incluye CropsNH) y ayuda en los minijuegos de LootGames.<br>- Junta los drops en un solo montón. | Activo. Corrigió un fallo con la *preview* de 2.9.0. | Cliente y servidor. Las opciones de servidor (radio, límites, coste) solo las cambia un OP desde la interfaz del inventario. | Tiene coste de hambre y se detiene antes de que se rompa la herramienta. Issues en chino. | ✅ |
| **[EZGT](https://github.com/KingofKeet/EZGT)** | **Grind de cantidades.** Valores por defecto:<br>- Casings ×2.<br>- Probabilidades de subproductos de procesado de menas ×2.<br>- Circuitos ×2 (SoC ×4).<br>- Circuit Assembly Line ×2.<br>- Motores ×2.<br>- Vetas ×2 más ricas.<br>**Casi todo es configurable.** | Activo. Usa GTNHGradle, el mismo sistema de compilación que GTNH. | Cliente y servidor | La riqueza de vetas **solo afecta a mundos o chunks nuevos**. | ✅ |
| **[Torcherino-GTNH](https://github.com/czqwq/Torcherino-GTNH)** | **Tiempos de espera.**<br>- Antorchas que aceleran máquinas de GT (de un bloque y **multibloques**) sin anomalías de energía: hasta 400%, 900% u 8.100%.<br>- **Time Vial** portátil: acumula tiempo de juego y acelera un bloque de ×4 a ×128. | Activo | Cliente y servidor. Ajustes en `config/Torcherino.cfg`:<br>- `enableAccelerateGregTechMachine`<br>- `accelerateGregTechMachineDiscount`, por defecto 0.8 | Es el atajo **más fuerte**: puede banalizar el juego. Tiene un tope de 1 ms por aceleración para no generar lag. Úsalo con velocidades moderadas. | ✅ |
| [ChainMiner](https://www.curseforge.com/minecraft/mc-mods/chainminer) | Minado por área o veta con HUD y vista previa | v0.2.1 (agosto de 2026), pensado para **2.8.4** | — | Licencia cerrada, poca adopción. Mejor EZMiner. | 🟡 |
| [TeXTech](https://github.com/ImgoodWK/TeXTech-GTNH) | Panel web de AE2, monitores y un asistente que hace pedidos de crafteo a AE2 | v2.0.0. Requiere 2.9.0-beta-2 o superior. | — | Proyecto muy ambicioso con documentación sobre todo en chino. Es opcional. | 🟡 |
| [GTNH-Balance-Tweaks](https://github.com/ogdae/GTNH-Balance-Tweaks) | **Duración de las recetas.** Por defecto:<br>- La mayoría de las máquinas de GT y GT++ hacen sus recetas en **la mitad de tiempo** y con la mitad de EU/t.<br>- La *Primitive Blast Furnace* va 4 veces más rápido.<br>Se ajusta por máquina en `config/gtnhbalancetweaks.cfg`. | v3.1.0 (octubre de 2025), hecha para una versión de prueba de 2.8.0. Experimental, con 4 estrellas en GitHub. | — | El autor avisa de que **puede romper mundos a largo plazo** y de que lo programó con ayuda de ChatGPT. También abarata algunos *hatches* ME. No encontré pruebas en 2.9.0. | ⚠️ |

**Cómo instalarlos:**
1. Copia el `.jar` (la versión **sin** sufijo `-dev` o `-sources`) en la carpeta `mods/` de la instancia.
2. Si jugáis en servidor, copia el mismo `.jar` también en el `mods/` del servidor.
3. Prueba primero en una **copia** del mundo.

### 3.2 Qué NO usar

- **VeinMiner clásico (Portablejim, 1.7.10)** ⚠️: es un mod genérico. Las menas de GT son *TileEntities*, así que lo más probable es que no las encadene bien. Además tiene problemas reportados en multijugador. Es una deducción no confirmada; usa EZMiner.
- **VeinMiner moderno (Miraculixx)**: es para otras versiones de Minecraft y no aplica.
- **TickrateChanger** ⚠️: acelera **todo el juego**, no solo las máquinas (detalles en la sección 2.5). Su última versión para 1.7.10 es de **2015**. Si lo que quieres es acelerar máquinas, Torcherino-GTNH es mejor opción.
- **Mods de rayos X**: no funcionan con las menas de GT ✅.

### 3.3 Herramientas fuera del juego (planificar en vez de probar a ciegas)

| Herramienta | Para qué | Confianza |
|---|---|---|
| **[GTNH Tweaks](https://gtnh-tweaks.ctry.dev/)** | Genera los archivos de configuración ya modificados con los ajustes que elijas (sección 2.0). Enlazada desde la wiki oficial. | ✅ |
| **[PlanNH](https://github.com/GTNewHorizons/PlanNH)** y la web **[gtnhplanner.com](https://gtnhplanner.com/)** | - Planificador **oficial de la organización GTNH**, integrado con NEI (tecla **F8**).<br>- Calcula ratios, energía y balanceo con datos de 2.9.<br>- **No viene en la lista de mods de 2.9.0**: instálalo aparte o usa la web. | ✅ |
| **[gtnh-flow](https://github.com/OrderedSet86/gtnh-flow)** | Calcula el balanceo de líneas de procesado (overclocks y ratios) y genera diagramas. Ideal para la línea del platino. | ✅ |
| [NEIRecipeExporter](https://github.com/Nydixia233/NEIRecipeExporter) + [gtnh-recipes-db](https://github.com/BawkYin/gtnh-recipes-db) | Exporta todas las recetas de NEI a JSON o SQLite para hacer tus propias consultas y hojas de cálculo. | 🟡 |
| [thaumcraft-gtnh-solver](https://github.com/axcou/thaumcraft-gtnh-solver) | Resuelve el tablero de investigación de Thaumcraft adaptado a GTNH. | 🟡 |
| Scripts de OpenComputers ([documentación de la API de OC para GTNH](https://github.com/Navatusein/GTNH-OC-Lua-Documentation), [control de línea de agua](https://github.com/Navatusein/GTNH-OC-Water-Line-Control)) | Ejemplos de automatización con Lua | 🟡 |
| ~~RecEx / NotEnoughProduction~~ | Abandonados desde 2021. No los uses. | ✅ |

### 3.4 ¿Hay un "GTNH fácil"?

**No** ✅.
- Solo hay forks abandonados.
- *Garden of Grind* es un reglamento skyblock "empieza sin nada", **más difícil**.

El camino real es GTNH 2.9.0 con los ajustes y mods de este documento, o cambiar de pack (sección 5).

---

## 4. Forma de jugar: trucos sin mods

1. **Servidor dedicado local** ✅
   - La propia wiki recomienda separar el servidor, aunque sea en el mismo PC: mejora el rendimiento porque cliente y servidor no comparten memoria.
   - Las máquinas siguen trabajando mientras no juegas, siempre que sus chunks estén cargados (sección 2.3). Las anclas personales dejan de cargar cuando te desconectas.
   - Se recomienda **Java 25** para 2.8+, por ejemplo con Prism Launcher ([wiki: Low End PCs](https://wiki.gtnewhorizons.com/wiki/Low_End_PCs)).
2. **Partida individual sin pausa** ✅
   - Si **abres el mundo a LAN**, Minecraft 1.7.10 deja de pausarse al pulsar Esc.
   - **F3 + P** desactiva la pausa al cambiar de ventana.
   - Así puedes dejar las máquinas trabajando con el juego minimizado. Solo funcionan los chunks cargados: los que tienes cerca, las ODP y los que cargues con anclas o con ServerUtilities (sección 2.3).
3. **Modo trampa de NEI con reglas propias** 🟡
   - En partida individual, haz Ctrl+clic en el icono de modo de NEI; necesitas trampas activadas.
   - Así te saltas materiales **aburridos que ya sabes fabricar**.
   - Reglas que usa la gente:
     - Solo saco lo que ya produje o automaticé una vez.
     - Nunca saco objetos que marcan un hito de progreso.
     - Saco objetos solo para esquivar bugs, como permiten las reglas oficiales *Stargate* (sección 2.0).
4. **Mundo creativo de pruebas** ⚠️
   - Crea un segundo mundo en la misma instancia para diseñar multibloques y líneas antes de construirlos en serio.
   - Es un truco evidente, pero no lo encontré documentado como consejo comunitario.
5. **Saltar tiers** 🟡: en r/GTNH se acepta adelantar máquinas de tiers superiores para procesar mejor, en vez de completar cada tier al 100%.
6. **Spawns por zonas reclamadas en vez de modo pacífico** ✅ (2.9): bloquea monstruos en los chunks reclamados de tu base. Antes hay que activar el reclamo de chunks (sección 2.3). El modo pacífico puede dejarte sin drops que piden algunas misiones; esto es una deducción ⚠️.
7. **Exprime las misiones, las monedas y las lootbags** ✅: son atajos legítimos del propio pack.

---

## 5. Si aún así es demasiado grind: otros packs de GregTech

| Pack | Por qué tiene menos grind | Estado (2026) | Confianza |
|---|---|---|---|
| **[Nomifactory](https://github.com/Nomi-CEu/Nomi-CEu)** (GTCEu, 1.12.2) | - AE2 desde el **inicio de MV**.<br>- **Sin era de vapor**.<br>- Cálculos más simples y sin mods de magia.<br>- La comunidad lo llama *"una versión más ligera de GTNH"*. | Activo: versión 1.7.7 (enero de 2026) | ✅ |
| **Monifactory** (GTCEu, 1.20.1) | Pensado para *"hacer GregTech accesible y divertido"*. El modo difícil es opcional. | Activo: beta 0.13.8 (agosto de 2026) | 🟡 |
| **GregTech Community Pack** / **Modern** | Packs introductorios oficiales de GregTechCEu | Activos | 🟡 |
| **Star Technology** (GTCEu, skyblock) | Void miners y torres de petróleo más adelante. No es para principiantes. | Muy activo | 🟡 |
| Omnifactory | Similar a Nomifactory | Estancado desde mayo de 2025 | 🟡 |
| ❌ TerraFirmaGreg, GregTech Odyssey, Garden of Grind | **Más** difíciles o con otro enfoque. No sirven para lo que buscas. | — | ✅ |

---

## 6. Riesgos y precauciones

- **Copias de seguridad** antes de tocar nada.
  - ServerUtilities hace backups automáticos; sustituyó a AromaBackup después de 2.7.0.
  - En 2.9.0 se corrigió un fallo por el que un backup podía dejar el guardado del mundo desactivado ✅.
- **Generación de terreno:** cualquier cambio de generación (EZGT o la sección 2.4) **solo se aplica a chunks nuevos**. Decide antes de crear el mundo, o explora zonas nuevas.
- **Actualizaciones del pack:** el procedimiento de actualización de GTNH reemplaza la carpeta `config/`.
  - **Guarda una lista de tus cambios** en un archivo de texto para volver a aplicarlos.
  - Los mods externos pueden romperse con cada versión: espera a que se actualicen.
- **Servidores oficiales:** las reglas prohíben *"mods externos que den ventaja"*, incluidos los de rayos X. EZMiner, EZGT y Torcherino son para **partida individual o servidores privados** (deducción ⚠️: no hay una lista oficial de mods prohibidos).
- **Balance:** EZGT y sobre todo Torcherino pueden banalizar el juego. Empieza con multiplicadores bajos (por ejemplo ×1,5–2 y aceleración del 200–400%) y sube si hace falta.

---

## 7. Fuentes principales

- Changelog 2.8.4 → 2.9.0: <https://changelog.gtnh.ogricanx.ch/2.8.4_to_2.9.0/brief.html> y [mods nuevos](https://changelog.gtnh.ogricanx.ch/2.8.4_to_2.9.0/new-mods.html)
- Versiones publicadas de GTNH: <https://github.com/GTNewHorizons/GT-New-Horizons-Modpack/releases>
- Archivos de configuración de 2.9.0 (de donde salen los valores de la sección 2): <https://github.com/GTNewHorizons/GT-New-Horizons-Modpack/tree/2.9.0/config> y [`serverutilities/`](https://github.com/GTNewHorizons/GT-New-Horizons-Modpack/tree/2.9.0/serverutilities)
- Wiki oficial:
  - [Commands and Configurations](https://wiki.gtnewhorizons.com/wiki/Commands_and_Configurations)
  - [ServerUtilities](https://wiki.gtnewhorizons.com/wiki/ServerUtilities)
  - [Stargate (reglas para el rol de Discord)](https://wiki.gtnewhorizons.com/wiki/Stargate#Discord_Role_Requirements)
  - [Ore Drilling Plant](https://wiki.gtnewhorizons.com/wiki/Ore_Drilling_Plant)
  - [CropsNH](https://wiki.gtnewhorizons.com/wiki/CropsNH)
  - [Void Miner](https://wiki.gtnewhorizons.com/wiki/Void_Miner)
  - [World Accelerator](https://wiki.gtnewhorizons.com/wiki/World_Accelerator)
  - [Multiblock Machines](https://wiki.gtnewhorizons.com/wiki/Multiblock_Machines)
  - [JourneyMap / VisualProspecting](https://wiki.gtnewhorizons.com/wiki/JourneyMap)
  - [Ore Generation](https://wiki.gtnewhorizons.com/wiki/Ore_Generation)
  - [Low End PCs](https://wiki.gtnewhorizons.com/wiki/Low_End_PCs)
  - [Official Servers](https://wiki.gtnewhorizons.com/wiki/Official_Servers)
- Visión de los desarrolladores sobre tedio y QoL: [GTNH-Dev-Doc](https://github.com/GTNewHorizons/GTNH-Dev-Doc/blob/master/vision%20of%20the%20modpack/breakdown/general.md)
- Mods: [EZMiner](https://github.com/czqwq/EZMiner), [EZGT](https://github.com/KingofKeet/EZGT), [Torcherino-GTNH](https://github.com/czqwq/Torcherino-GTNH), [GTNH-Balance-Tweaks](https://github.com/ogdae/GTNH-Balance-Tweaks)
- Configuración y scripts:
  - [GTNH Tweaks](https://gtnh-tweaks.ctry.dev/) ([código](https://github.com/creativitRy/gtnh-tweaks))
  - [Código de ServerUtilities](https://github.com/GTNewHorizons/ServerUtilities) (permisos de carga de chunks)
  - [CraftTweaker de GTNH](https://github.com/GTNewHorizons/CraftTweaker) y [addon de GregTech](https://github.com/GTNewHorizons/Minetweaker-Gregtech-5-Addon) ([wiki](https://github.com/GTNewHorizons/Minetweaker-Gregtech-5-Addon/wiki))
- Hilos de r/GTNH:
  - [*"Casually" playing GT:NH*](https://www.reddit.com/r/GTNH/comments/1c09qmw/casually_playing_gtnh/)
  - [*Skipping tiers*](https://www.reddit.com/r/GTNH/comments/13km61v/skipping_tiers/)
