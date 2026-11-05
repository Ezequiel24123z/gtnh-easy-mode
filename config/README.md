# Cambios de configuración (capa 1)

- Las rutas son relativas a la carpeta de la instancia.
- Los valores de GTNH 2.9.0 están comprobados en el repo oficial ✅.

| Archivo | Clave | GTNH 2.9.0 | Easy | Efecto | Conf. |
|---|---|---|---|---|---|
| `config/forestry/apiculture.cfg` | `S:mode` | `HARD` | `EASY` | Apicultura más permisiva | ✅ |
| `config/HungerOverhaul/HungerOverhaul.cfg` | - `cropRegrowthMultiplier`<br>- `saplingRegrowthMultiplier`<br>- `treeCropRegrowthMultiplier`<br>- `cactusRegrowthMultiplier`<br>- `sugarcaneRegrowthMultiplier`<br>- `netherWartRegrowthMultiplier`<br>- `cocoaRegrowthMultiplier` | `2` | `1` | Las plantas crecen a velocidad normal | ✅ |
| `config/HungerOverhaul/HungerOverhaul.cfg` | `B:addLowStatEffects` | `true` | `false` | Sin lentitud ni debilidad por poca vida o hambre | ✅ |
| `config/Thaumcraft.cfg` | `I:research_difficulty` | `1` | `-1` | Investigación con puntos, sin minijuego | ✅ |
| `config/Thaumcraft.cfg` | `B:wuss_mode` | `false` | `true` | Sin Warp | ✅ |
| `config/AppliedEnergistics2/AppliedEnergistics2.cfg` | `D:UsageMultiplier` | `10.0` | `1.0` | AE2 consume 10 veces menos | ✅ clave · 🟡 efecto |
| `config/AppliedEnergistics2/AppliedEnergistics2.cfg` | `B:Channels` | `true` | `false` (opcional) | Sin límite de canales | 🟡 |
| `serverutilities/serverutilities.cfg` | `B:fly` | `false` | `true` | Activa el comando `/fly` | ✅ clave · 🟡 permisos |
| `config/RandomThings.cfg` | `D:BloodMoonChance` | `0.01` | `0` | Sin lunas de sangre | ✅ |
| Mod propio futuro | `recipeDurationMultiplier` | `1.0` | `0.20` | Todas las recetas GT usan 20 % del tiempo base | 🟡 |
| EZGT (configuración GTNHLib) | `veinRichness` | `2.0` | `4.0` | Vetas 4× más densas en chunks nuevos | ✅ clave · 🟡 probado |
| EZGT (configuración GTNHLib) | `gtCasingAssemblerOutputs` | `2.0` | `4.0` | Cuatro casings por crafting/ensamblador | ✅ clave · 🟡 probado |
| EZGT (configuración GTNHLib) | `oreProcessingBonusOutputChances` | `2.0` | `4.0` | Más subproductos de procesado | ✅ clave · 🟡 probado |
| EZGT (configuración GTNHLib) | `easyCircuits`, `easyCoils`, `easyMotors` | mixto | `true`, `true`, `4.0` | Circuitos, SoC, bobinas y motores más fáciles | ✅ clave · 🟡 probado |
| `EZMiner/EZMiner_Server.cfg` | `bigRadius`, `blockLimit` | `8`, `1024` | `32`, `16384` | Cadena completa de vetas grandes | ✅ |
| `EZMiner/EZMiner_Server.cfg` | `crazyMode`, `breakPerTick`, `cachedBreakPerTick` | `false`, `16`, `64` | `true`, `64`, `256` | Minado masivo inmediato | ✅ · probar TPS |
| `EZMiner/EZMiner_Server.cfg` | `enableChainChunkLoading` | `false` | `true` | Vetas que cruzan chunks | ✅ · probar carga |
| `EZMiner/EZMiner_Server.cfg` | `addExhaustion`, `chainCooldownTicks` | `0.025`, `0` | `0.0`, `0` | Sin hambre ni espera entre vetas | ✅ |
| `EZMiner/EZMiner_Server.cfg` | `searchWorkerThreads`, `enableUnlimitedOreFortune` | `3`, `false` | `8`, `true` | Búsqueda paralela y Fortune sin cap GT/BW | ✅ |

Hay más ajustes, como la carga de chunks o los comandos de teletransporte, en el [informe "GTNH sin grind"](../docs/investigacion-gtnh-sin-grind.md).

Siguiente paso (fase 1): subir aquí los `.cfg` ya modificados, o parches contra los de GTNH 2.9.0.
