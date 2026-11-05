# Implementación del modo fácil

## Decisión base

El primer preset se define como **"Tecnológico rápido"**:

- duración de recetas GT: `0.20×` — 20 % del tiempo original, cinco veces más rápido;
- EU/t: sin cambios;
- tiers y orden tecnológico: sin cambios;
- vetas EZGT: `4×`;
- EZMiner: cadenas masivas, sin coste de hambre y carga de chunks opcional.

Esto quita tiempo de espera y trabajo manual sin convertir el pack en creativo. Las cadenas, los tiers, los multibloques y las quests siguen marcando el progreso.

## Qué hace más fácil

| Área | Implementación | Prioridad | Riesgo |
|---|---|---|---|
| Tiempo de máquinas | Mixin en `OverclockCalculator.calculate()` y config `0.20×` | P0 | Alto, necesita test de overclock y sub-tick |
| Vetas grandes | EZGT `veinRichness=4.0` | P0 | Medio, solo chunks nuevos |
| Minado masivo | EZMiner con cadenas, `crazyMode`, radio y límite mayores | P0 | Medio-alto, TPS |
| Abejas sin mutación tediosa | Gendustry sin labware/muerte, mutágeno bajo y mutaciones habilitadas | P0 | Medio |
| Crops sin malezas ni stat grind | CropsNH growth `2.0`, breeding `1`, variaciones cero | P0 | Medio, puede afectar TPS |
| Thaumcraft y magia | Config sin Warp/Wuss, Botania, Blood Magic, Witchery | P1 | Medio |
| ODP/Void Miner | Recetas más baratas y disponibilidad LV/MV temprana | P1 | Medio |
| AE2 completo | Scripts para 94 recetas por encima de LV y Creative Energy Cell | P1 | Alto, IDs y recetas |
| Angel Ring | Receta LV alternativa | P1 | Bajo-medio |
| Vuelo | `/fly`, Angel Ring LV o mod propio | P1 | Medio |
| Abejas | Modo Forestry EASY y mutaciones al 100 % | P1 | Medio |
| Cultivos | Industrial Farm LV, semillas buenas y crecimiento rápido | P1 | Medio |
| Crecimiento normal | HungerOverhaul `1×` | P1 | Bajo |
| Thaumcraft | Investigación por puntos y `wuss_mode=true` | P1 | Bajo-medio |
| Blood Magic/Botania | Runas, altares e infusión más fáciles | P2 | Medio-alto |
| Quests | Etiquetar atajos Easy y recompensas que los reflejen | P2 | Alto contenido |
| Teletransporte y chunks | ServerUtilities, `/rtp`, `/back`, `/tpa` y chunkloading limitado | P2 | Medio, servidor |

## Mod propio

Se recomienda una plantilla basada en **ExampleMod1.7.10** y GTNHGradle:

1. `recipeDurationMultiplier=0.20`;
2. hook tardío de UniMixins/GTNHMixins;
3. mixin en `OverclockCalculator.calculate()`;
4. mantener `mEUt` y los voltajes sin cambios;
5. mínimo de 1 tick;
6. hooks separados para:
   - Bricked Blast Furnace;
   - Assembly Line;
   - máquinas que no usen `OverclockCalculator`;
   - recetas de mods que tengan tiempos internos propios.

El mod debe ejecutarse en cliente y servidor. No se implementará como Torcherino: no manipulará entidades, ticks globales ni velocidad del mundo.

## EZGT y EZMiner

- EZGT cambia densidad de vetas y salida de recetas. La riqueza se aplica al generar terreno nuevo.
- EZMiner no cambia el terreno ni la densidad de vetas; hace que una veta encontrada se recoja de una vez.
- Juntos cubren ambos lados del problema: más mineral disponible y menos tiempo para extraerlo.

**Nota importante:** EZGT puede combinarse con EZMiner sin edición de código si su jar y su config son compatibles con GTNH 2.9.0.

## Gendustry, CropsNH y magia

- Gendustry:
  - sin labware ni muertes artificiales;
  - Mutatron con menos mutágeno y sin degradación;
  - Replicator con prístinas;
  - Industrial Apiary con `5 MJ/t`;
  - sink LV como opción, validando las recetas de los objetos.
- CropsNH:
  - growth `2.0`;
  - breeding `1`;
  - malezas desactivadas;
  - estadística y rendering revisados por TPS.
- MagicBees:
  - Hibeescus, Hiveacynth y Beegonia con multiplicadores 0.1;
  - Drainer diez veces más rápido.
- Thaumcraft, Botania y Blood Magic:
  - primeras mejoras por config;
  - runas, altares e infusiones por ModTweaker;
  - instancias de teletick solo para áreas concretas.

## Otras mejoras inmediatas

1. World Accelerator barato o con receta LV cuando no rompa el diseño.
2. ODP T1 más barato y con mejores paralelos.
3. Void Miner con menos unidades de progresión.
4. Recetas LV para Angel Ring, Industrial Apiary e Industrial Farm.
5. AE2 sin canales, consumo 10× menor y Creative Energy Cell LV.
6. Investigación de Thaumcraft sin minijuego y sin Warp.
7. Rutas rápidas de comida y crecimiento normal sin penalizaciones de hambre.
8. Gendustry y CropsNH con semillas deterministas y buenas estadísticas.
9. Horno, EBF y EBF de vacío con el mismo multiplicador `0.20×`; no con Torcherino.
10. AE2 y logística tempranas para evitar cuellos de botella de recolección.

## Guardas de balance

El proyecto no debe:

- bajar tiers sin una receta LV explícita;
- quitar cadenas de procesamiento;
- multiplicar EU/t;
- quitar requisitos de logística, multibloques o quests;
- redistribuir jars de mods cerrados;
- aplicar cambios a energía, fluidos o combustibles por defecto.

Puede cambiar:

- tiempo de procesamiento;
- densidad de vetas;
- cantidades de salida de crafteo y bonus;
- crecimiento de plantas y abejas;
- costes de recetas QOL;
- duración de infusiones y rituales;
- disponibilidad de vuelo y almacenamiento.

## Pruebas

Antes de publicar el preset:

1. Mundo nuevo con GTNH limpio.
2. Cargar vapor, LV y MV.
3. Medir 10 recetas representativas antes y después.
4. Confirmar 1 tick mínimo y sin cambio de tier.
5. Crear vetas grandes con EZGT y recorrerlas con EZMiner.
6. Probar `crazyMode` con un servidor de 1–4 jugadores.
7. Medir TPS y memoria durante una cadena de 16384 bloques.
8. Guardar resultados de NEI, consola y fotogramas.
9. Repetir en multibloques, EBF, VAC, Assembly Line y recetas tardías de CraftTweaker.
