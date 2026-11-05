# Ideas de implementación y mejora

Este documento separa lo que ya puede aplicar el overlay, lo que necesita un script y lo que requiere un mod Java pequeño.

## P0: quitar tedio con cambios reversibles

| Idea | Implementación | Mantiene progresión |
|---|---|---|
| Todas las recetas GT a `0.20×` | Mixin en `OverclockCalculator` con config | Sí: tiers, EU/t y cadenas se mantienen |
| Vetas 4× más densas | EZGT `veinRichness=4.0` | Sí: genera las mismas vetas |
| Minado masivo | EZMiner, `blockLimit=16384`, modo `GT Vein Ore` | Sí: sigue requiriendo herramienta y veina |
| Aumento de casings/circuitos/motores | EZGT ×4 | Sí: el tier no cambia |
| Abejas sin labware/muerte | Gendustry override tuning | Sí: aún se procesa mutación y replicación |
| Replicar abejas prístinas | Gendustry `MakePristineBees=True` | Sí: aún hace falta genética |
| Crops más rápidos | CropsNH growth `2.0`, breeding `1` | Sí: conserva cultivos y mutaciones |
| Sin malezas | CropsNH desactiva malezas | Sí: conserva el cultivo |
| Thaumcraft accesible | Investigación por puntos, sin Warp, nodos normales | Sí: conserva objetos y cadenas |
| Botania pasiva sin decaimiento | `passiveDecay.time=-1` | Sí: conserva el recurso y las recetas |
| Menos Blood Magic grind | Multiplicar LP obtenido por sacrificio ×5 y reducir costes de rituales útiles | Sí: conserva altares y orbes |
| Vuelo temprano | `/fly`, `/rtp`, `/back`, `/tpa` | Sí: no cambia la producción |
| AE2 completo temprano | Scripts/overrides LV y `UsageMultiplier=1` | Sí: mantener canales opcionales y tecnologías |

## P1: automatizar y eliminar repeticiones específicas

### Abejas

1. **Mutatron con requisitos desactivados** para especies tardías seleccionadas; los requisitos normales se conservan para las especies marcadas por GTNH.
2. **Replicador prístino** para evitar volver a criar especies; una receta puede requerir una muestra y fluido.
3. **Industrial Apiary LV** con una receta explícita y `BaseMjPerTick=5`.
4. **Gendustry upgrades** con más producción, territorio y menor decaimiento genético.
5. **MagicBees Hibeescus**: 90 % menos coste de mana y tiempo.
6. **Apimancer Drainer**: 10× más rápido.
7. **Multiflower/BeeAnalyzer**: receta de análisis automática al principio.
8. **Direct seed/bee recipes** sólo como opciones extremo para experimentos; no como default.

### Crops

1. `Breeding Chance=1` para intentar cruzar cada tick.
2. `Growth rate multiplier=2.0`, que es más rápido que el valor actual y respeta la fórmula del código.
3. Desactivar malezas y el modo de re-render costoso.
4. Semillas deterministas para crear la especie base sin cruzas manuales.
5. Semillas con estadísticas altas sin llegar a superar el daño máximo de la tecnología.
6. Industrial Farm LV con más ranuras y unidades de crecimiento.
7. Crop Breeder y Seed Generator con recetas más rápidas y menos fluidos.
8. World Accelerator barato para cultivos que no permitan 2.0× en config.
9. Fertilizer y automatización tempranos por AE2.

### Magia

1. **Thaumcraft:** sin investigación manual, sin Warp, nodos normales y NEI muestra aspectos.
2. **Thaumic Energistics:** revisar el exponente de conversión esencia/fluidos; buscar lograr un 1:1/rápido sin romper red.
3. **Thaumic Bases:** acelerar infusiones y nodos.
4. **Botania:** flores pasivas que no desaparecen, runas de menor mana, pura margarita más rápida, Gaia más accesible.
5. **Blood Magic:** LP sacrificial ×5, rituales principales más baratos, orbes antes y runas de speed/efficiency más fáciles.
6. **Witchery:** solo recetas y esperas concretas; evitar cambios globales sin API conocida.
7. **MagicBees:** integraciones mágica/apícola con menos mana y tiempo.
8. **World Accelerator:** recetas LV/MV para acelerar altares, infusiones y apiarios sin tocar el tick global.

## P1: logística y almacenamiento

1. AE2 completo a LV con canales opcionales.
2. Creative Energy Cell con receta LV.
3. ME Import/Export, interfaces y buses LV.
4. Early hoppers, Storage Drawers, Ender Chest y AE2 para reducir transporte manual.
5. Ender Tank/Fluid conduit/long-distance logistics antes.
6. ODP y Void Miner con recetas LV/MV.
7. `/rtp`, `/tpa`, `/back`, `/sethome`, `/spawn`, `/fly`.
8. Chunk loading con límites claros y sin macros.

## P2: refinamiento

1. **Presets:**
   - `sin-tedio`: cambios pequeños.
   - `tecnologico-rapido`: 0.20×, EZGT 4× y EZMiner masivo.
   - `casual`: además AE2 LV, magia rápida y seeds fáciles.
2. **Quest patches:** recompensas más útiles, no requisitos eliminados.
3. **Recolectar energía:** los cambios no alteran EU/t por default.
4. **Difficulty profiles:** alternar sin regenerar el mundo.
5. **Playtester telemetry:** duración promedio por tier, TPS, número de ticks, energy cost.
6. **Update CI:** probar que configs cambian y scripts cargan.
7. **Servidor dedicado:** perfiles separados para cliente/servidor.
8. **Paquetes de traducción ES/EN** y una guía de primer arranque.

## Qué no debe hacer el proyecto

- Bajar el orden de los tiers sin una receta explícita LV.
- Multiplicar EU/t ni ocultar el coste energético.
- Eliminar cadenas de procesamiento.
- Alterar el tiempo de combustible/energía por defecto.
- Redistribuir jars cerrados.
- Cambiar chunks o vetas sin hacer mundo nuevo explícito.
- Quitar quests o requerimientos tecnológicos.
- Permitir items infinitos o UHV materials sin progresión.

## Reglas de balance

Las mejoras pueden cambiar:

- duración de procesamiento;
- densidad de vetas;
- cantidad de salida;
- crecimiento de cultivos y abejas;
- costes de recetas QOL;
- LP y resultados mágicos;
- disponibilidad de vuelo y almacenamiento;
- transporte y chunk loading;
- espera de rituales e infusiones.

Pero deben conservar:

- la existencia de cada tier;
- los multibloques y sus materiales;
- el árbol tecnológico;
- la lógica de quests;
- los recursos requeridos por cadenas principales;
- la compatibilidad entre cliente y servidor.

## Pruebas necesarias

1. Instancia limpia GTNH 2.9.0.
2. Mundo nuevo.
3. Steam/LV: confirmar horno, assembler y processing.
4. MV/HV: confirmar EBF, VAC, ODP y AE2.
5. Assembly Line: confirmar que `0.20×` se aplica una sola vez.
6. Gendustry: Mutatron, MutatronAdv, Sampler, Replicator e Industrial Apiary.
7. CropsNH: crecimiento, breeding y malezas.
8. MagicBees: mana/ticks de Hibeescus y Hiveacynth.
9. Botania: decaimiento de flores pasivas y recetas.
10. Blood Magic: LP por sacrificio y coste de rituales.
11. Thaumcraft: investigación, Warp y nodos.
12. EZMiner: cadena de 16384 bloques con TPS y memoria.
13. EZGT: vetas nuevas y casings/circuitos.
