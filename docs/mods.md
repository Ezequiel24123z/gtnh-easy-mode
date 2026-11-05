# Mods externos del overlay

Este repo no contiene jars ni redistribuye mods cerrados. Se enlazan releases o repositorios oficiales y se verifican sus licencias antes de incluirlos.

| Mod | Licencia | Uso | Configuración Easy | Estado |
|---|---|---|---|---|
| [EZMiner](https://github.com/czqwq/EZMiner) | MIT | Minado masivo, modo *GT Vein Ore*, cadena por bloques y cosecha en área | `bigRadius=32`, `blockLimit=16384`, `crazyMode=true`, `enableChainChunkLoading=true`, `addExhaustion=0` | ✅ compatible 1.7.10/GTNH · 🟡 probar TPS |
| [EZGT](https://github.com/KingofKeet/EZGT) | MIT | Vetas 4×, más salida de casings/circuitos/motores y más subproductos | `veinRichness=4.0`, `gtCasingAssemblerOutputs=4.0`, `oreProcessingBonusOutputChances=4.0` | ✅ probado post-2.8.4 · 🟡 adaptar a 2.9.0 |
| [Torcherino-GTNH](https://github.com/czqwq/Torcherino-GTNH) | GPL-3.0 | Alternativa a tiempos rápidos | No se usa por defecto: el mod propio `0.20×` reemplaza este acercamiento global | ✅ conocida · decidir por compatibilidad |
| [Visual Prospecting](https://github.com/GTNewHorizons/VisualProspecting) | Revisar licencia | Marcar vetas en el mapa y registrarlas al minarlas | Mantener activa; EZMiner puede alimentar sus datos | ✅ integración reportada |
| Gendustry | 1.9.13-GTNH en GTNH 2.9.0 | Mutatron, Replicator, Industrial Apiary y bees prístinas | `tuning.cfg` override, sin labware, MJ bajo y no muertes | ✅ config verificada · 🟡 juego |
| CropsNH | 2.0.140 en GTNH 2.9.0 | Cultivos más rápidos, breeding frecuente y sin malezas | `Growth rate multiplier=2.0`, `Breeding Chance=1` | ✅ config verificada · posible TPS |
| MagicBees | 2.10.13-GTNH | Hibeescus, Hiveacynth, Beegonia y Drainer | Multiplicadores 0.1 y drainer 20 ticks | ✅ config verificada · 🟡 efecto |
| Thaumcraft | 4.2.3.5 | Investigación sin Warp y nodos normales | `research_difficulty=-1`, `wuss_mode=true`, `hard_mode_nodes=false` | ✅ config verificada |
| Thaumic Energistics | 1.7.68-GTNH | Transporte esencia/fluido más directo | Exponente 7 → 6 | ✅ config verificada |
| Botania | 1.13.42-GTNH | Flores pasivas permanentes y runas más baratas | `passiveDecay.time=-1` + ModTweaker | ✅ config · 🟡 recetas |
| Blood Magic | 1.9.16 | Más LP y altares/rituales más rápidos | Sacrificio ×5, runas/recetas por script | ✅ config/source · 🟡 balance |
| Witchery | 0.24.1 | Sueño, coven, vampiros y fume filter menos tediosos | Config y WitcheryExtras/World Accelerator | ✅ config/source · 🟡 recetas |

## EZGT

EZGT multiplica:

- densidad de las vetas;
- salidas de casings;
- probabilidades de subproductos;
- producciones de circuitos y SoC;
- motores;
- Circuit Assembly Line.

Su mixin modifica `OreMixBuilder.density`, por lo que los cambios necesitan mundo nuevo o chunks nuevos. Es MIT y no redistribuye GTNH.

**Preset rápido**

```text
veinRichness=4.0
gtCasingAssemblerOutputs=4.0
oreProcessingBonusOutputChances=4.0
easyCircuits=true
easyCoils=true
easyMotors=4.0
```

## EZMiner

EZMiner tiene configuración cliente y servidor:

- cliente: `config/EZMiner/EZMiner.cfg`;
- servidor: `EZMiner/EZMiner_Server.cfg`;
- modo *GT Vein Ore*: solo bloques pertenecientes a vetas de GregTech;
- cadena masiva: busca bloques conectados y los mina por lotes;
- carga de chunks opcional;
- drops batidos y un watchdog contra operaciones trabadas.

**Preset rápido**

```text
bigRadius=32
blockLimit=16384
breakPerTick=64
cachedBreakPerTick=256
crazyMode=true
enableChainChunkLoading=true
addExhaustion=0.0
searchWorkerThreads=8
chainCooldownTicks=0
enableUnlimitedOreFortune=true
```

`crazyMode=true` elimina el límite por tick y puede afectar al TPS. `enableChainChunkLoading=true` puede cargar chunks por demanda. Ambos deben probarse primero en un mundo local y luego en servidor.

## Comparativa

| Necesidad | EZGT | EZMiner | Nuestro mod |
|---|---|---|---|
| Vetas más densas | Sí | No | Opcional, mixin propio |
| Mínimo minado manual | No | Sí | No |
| Recetas con duración 0.20× | No | No | Sí |
| Cambios en EU/t | No | No | No, por diseño |
| Cría de abejas/cultivos | No | No | Planificado |
| AE2 y Angel Ring a LV | No | No | Scripts |
