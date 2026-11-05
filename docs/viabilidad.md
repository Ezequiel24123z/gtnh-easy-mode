# Viabilidad por área

- Referencia: GTNH 2.9.0. Las versiones de los mods salen del manifiesto oficial de DreamAssemblerXXL (`releases/manifests/2.9.0.json`) ✅.
- Las rutas son relativas a la carpeta de la instancia.

## 1. Abejas (Forestry 4.11.40, Gendustry 1.9.13-GTNH ✅)

**Hoy:**
- GTNH pone la apicultura en modo `HARD` ✅. El valor por defecto del mod es `NORMAL`.
- Criar una especie concreta exige cadenas de mutaciones con probabilidad baja.

**Easy:**
1. En `config/forestry/apiculture.cfg`, cambiar `S:mode=HARD` → `EASY` ✅.
   - Valores válidos: EASY, NORMAL, HARD, HARDCORE e INSANE.
   - Los multiplicadores exactos de cada modo están en el código de Forestry 🟡.
2. **Gendustry tuning override** en `config/gendustry/overrides/tuning.cfg`:
   - Mutatron: 2.000.000 MJ → 200.000; mutágeno 5.000 → 500 mb; labware 100 % → 0 %; degradación/muerte 30-80 % → 0 %; mutaciones secretas 10 % → 0 %.
   - MutatronAdv: 200.000 MJ → 20.000; mutágeno 2.500 → 250 mb; labware 100 % → 0 %.
   - Sampler/Imprinter/Extractor/Liquifier/Transposer/Replicator: menos MJ y labware.
   - Industrial Apiary: `BaseMjPerTick=15` → `5`.
   - Replicador: `MakePristineBees=True`.
   - Sink EU: `SinkTier=4` → `1` (LV) en el tuning; revisar si las recetas siguen exigiendo un tier mayor.
3. Las mutaciones marcadas por GTNH como `REQUIREMENTS` se cambian a `ENABLED` en el preset para especies tardías seleccionadas; no cambia el tier necesario para fabricar el objeto final.
4. **MagicBees:** `hibeescusManaCostMultiplier` y `hibeescusTicksMultiplier` 1.0 → 0.1; `hiveacynthManaMultiplier` 1.0 → 0.1; `beegoniaManaMultiplier` 1.0 → 0.1.
5. **Industrial Apiary** a LV con una receta alternativa por script 🟡.
6. Opción radical: recetas que den directamente la especie (abeja con el NBT del genoma) ⚠️. Es frágil; mejor Gendustry.

## 2. Cultivos (CropsNH 2.0.140 ✅)

**Hoy:**
- CropsNH sustituye a IC2 Crops.
- Los cruces ya son **recetas visibles en NEI**, no tiradas al azar ✅.
- El tedio que queda:
  - conseguir las semillas base;
  - subir las estadísticas;
  - esperar, porque los cultivos solo se actualizan cada 12,8 s ✅.

**Easy:**
1. **Industrial Farm** (hoy MV) a LV por script 🟡.
2. `config/cropsnh/Configuration.cfg`:
   - `S:"Growth rate multiplier"`: `1.0` → `2.0`. El código sumará `growthRate × 2.0`, más rápido que el stock.
   - `I:"Breeding Chance"`: `3` → `1`, el intento de cría ocurre con la frecuencia más alta.
   - `B:"Enable weeds"` y `B:"Weeds can overtake plants"`: `true` → `false`.
3. Recetas de semillas base con estadísticas altas (NBT) 🟡.
4. World Accelerator más barato. Ya acelera cultivos, apiarios, el altar de sangre y la infusión ✅.
5. Mod Java para garantizar semillas con estadísticas altas y limitar las variaciones negativas de breeding/spreading 🟡.

## 3. Crecimiento de plantas normales (HungerOverhaul ✅)

GTNH pone a **2** estos multiplicadores de `config/HungerOverhaul/HungerOverhaul.cfg`, así que las plantas tardan el doble que en Minecraft normal ✅. Ponerlos a `1`:
- `cropRegrowthMultiplier`
- `saplingRegrowthMultiplier`
- `treeCropRegrowthMultiplier`
- `cactusRegrowthMultiplier`
- `sugarcaneRegrowthMultiplier`
- `netherWartRegrowthMultiplier`
- `cocoaRegrowthMultiplier`

## 4. Minería manual

1. **EZMiner** (MIT ✅):
   - minado en bloque, con un modo **"GT Vein Ore"** que solo mina las menas de la veta ✅;
   - cosecha en área ✅.
   - compatible con Visual Prospecting: registra las vetas mientras las minas ✅.
   - puede subir el radio, el límite de bloques y quitar el coste de hambre.
2. **Ore Drilling Plant** T1 (MV): mina 96×96 bloques y carga sus propios chunks ✅.
   - Easy: controlador y Drilling Fluid más baratos por script 🟡.
   - Bajarla de verdad a LV depende del voltaje mínimo fijado en el código, así que haría falta el mod Java ⚠️.
3. **Void Miner** más barato por script 🟡.
4. **EZGT** (MIT ✅):
   - multiplica `veinRichness` antes de generar el mundo;
   - valor de partida del preset: `4.0`;
   - la riqueza solo afecta a mundos nuevos o chunks nuevos;
   - también mejora casings, circuitos, motores y subproductos.
5. Las vetas están fijadas en el código de GT (`OreMixes.java`) ✅; EZGT las hace más densas con un mixin en `OreMixBuilder.density`.

**Preset recomendado para minería masiva**

| Clave EZMiner | Base | Easy | Motivo |
|---|---:|---:|---|
| `bigRadius` | `8` | `32` | Cadenas mayores sin recorrer todo el servidor |
| `blockLimit` | `1024` | `16384` | Vetas completas |
| `breakPerTick` | `16` | `64` | Finalización rápida |
| `crazyMode` | `false` | `true` | Sin límite por tick; debe medirse el TPS |
| `cachedBreakPerTick` | `64` | `256` | Cadenas cacheadas rápidas |
| `enableChainChunkLoading` | `false` | `true` | Cruza chunks |
| `addExhaustion` | `0.025` | `0.0` | Sin penalización de hambre |
| `searchWorkerThreads` | `3` | `8` | Búsqueda paralela |
| `chainCooldownTicks` | `0` | `0` | Sin espera entre vetas |
| `enableUnlimitedOreFortune` | `false` | `true` | Quita el cap de Fortune III para menas GT/BW |

El archivo del servidor es `EZMiner/EZMiner_Server.cfg`. Los detalles y los riesgos están en [docs/mods.md](mods.md).

## 5. Vuelo creativo

| Opción | Cómo | Confianza |
|---|---|---|
| A. Comando `/fly` | En `serverutilities/serverutilities.cfg` (fuera de `config/`): `B:fly=false` → `true` | ✅ clave · 🟡 probablemente solo para OP; en individual, mundo con trucos |
| B. Angel Ring a LV | GTNH 2.9 bajó el Angel Ring a **IV** ✅. Añadir una receta LV alternativa por script. | 🟡 |
| C. Vuelo para todos | Mod Java que activa `allowFlying` en supervivencia, con opción en la config | 🟡 |

## 6. Mods de magia

**Prioridad del preset:**

| Mod | Cambio configurado | Resultado |
|---|---|---|
| Thaumcraft | `research_difficulty=-1`, `wuss_mode=true`, `hard_mode_nodes=false` | Investigación por puntos, sin Warp y nodos normales |
| Botania | `passiveDecay.time=-1`, `manaSpreaders.silent=true` | Flores pasivas permanentes y menos ruido |
| MagicBees | Multiplicadores de mana/ticks 1.0 → 0.1; drainer 200 → 20 ticks | Flores mágicas y esencia mucho más rápidas |
| Blood Magic | Sacrificios normales/propios/Well ×5; rituales y runas definidos por script/config | Más LP y menor coste repetitivo |
| Witchery | Sueño 25 % → 1 %, coven 2 → 10, eclipse inmediato, vampiro 12 → 1 minuto | Menos espera y eventos repetitivos |
| Thaumic Energistics | Exponente esencia 7 → 6 | 64 mB por essentia, no 128 mB |
| Forbidden Magic | Wrath Cage sin combustible, Terrasteel y cores más grandes | Progresión mágica más barata |

**Thaumcraft 4.2.3.5 ✅** (`config/Thaumcraft.cfg`):
- `I:research_difficulty=1` → `-1`: la investigación se **compra con puntos**, sin minijuego ✅.
- `B:wuss_mode=false` → `true`: desactiva el **Warp** y mecánicas similares ✅.
- `B:hard_mode_nodes=true` → `false`: evita el régimen de nodos duros cuando el modo esté disponible en esta versión ✅ clave.
- GTNH incluye `thaumcraft-research-tweaks` 1.4.1 ✅; hay que revisar su config.
- AspectRecipeIndex (2.9) ya da puntos de investigación desde NEI ✅.

**Botania 1.13.42-GTNH ✅** (`config/Botania.cfg`):
- `I:passiveDecay.time=72000` → `-1`: las flores pasivas no desaparecen.
- `B:manaSpreaders.silent=false` → `true`: elimina el sonido repetitivo de los spreaders.
- `B:recipes.enabled=false` sigue en false: no se activa el set opcional de recetas del mod, para conservar las recetas GTNH.
- El Runic Altar, el Petal Apothecary y el Mana Pool requieren recetas propias por ModTweaker 0.14.0; la API del Rune Altar está documentada como `mods.botania.RuneAltar.addRecipe(output, inputs[], mana)`.

**Blood Magic 1.9.16 ✅** (`config/AWWayofTime.cfg`):
- `I:"LP per sacrifice"`: 600 → 3000.
- `I:"LP per self-sacrifice"`: 125 → 625.
- `I:"LP per sacrifice with Well of Suffering ritual"`: 25 → 125.
- `I:"LP per self-sacrifice with Ritual of Feathered Knife"`: 125 → 625.
- Los costes de activación/refresco del Ritual of Speed, Green Grove y otros quedan en `"lp costs"` y se pueden editar, pero no se altera el altar por una clave global.

**Recetas de magia por script:**
- GTNH 2.9.0 trae **ModTweaker 0.14.0** ✅.
- Sirve para abaratar infusiones, recetas arcanas, el altar de sangre y recetas de Botania.
- Qué métodos soporta exactamente esta versión está por comprobar 🟡.

**Otros mods:**
- **Blood Magic** 1.9.16 ✅: runas, altares y orbes más baratos 🟡. El LP ya se puede automatizar con el ritual Well of Suffering ✅.
- **Botania** 1.13.42-GTNH ✅: menos maná por receta 🟡.
- **Witchery** 0.24.1 ✅: config disponible para Eclipse, Coven, vampiros y filtro de fume; los tiempos de hornos/destilerías necesitan WitcheryExtras o mod propio.
- **Thaumic Energistics** 1.7.68-GTNH ✅: `I:"Essentia Fluid Ratio Exponent"=7` → `6`.
- **Forbidden Magic** ✅: `Wrath Cage Fuel Cost=5` → `0`, `terrasteelDiscount=1.8` → `0.8`, cores de Blood/Dreamwood más grandes.
- **Extra Utilities** ✅: `AngelRingEnabled=true`; `EnderLilyEnabled=false` → `true` como recurso alternativo.
- **Quests:** recompensas de comando de BetterQuesting que den investigaciones de Thaumcraft ⚠️. Es una idea por probar.

## 7. AE2 entero a LV, incluida la Creative Energy Cell

**Dónde están las recetas:** GTNH reescribe las recetas de AE2 en Java, dentro de NewHorizonsCoreMod ✅:
- `ScriptAppliedEnergistics2.java` (2.489 líneas);
- `ScriptAE2FC.java`.

Esa es la lista que hay que replicar a LV.

**Orden de carga** ✅ (NHCoreMod 2.9.99, CraftTweaker 3.4.8):
- NHCoreMod añade estas recetas al terminar la carga (`MainRegistry.java` L403–409).
- Los scripts de CraftTweaker se ejecutan después, en `FMLServerAboutToStartEvent`.
- Por eso un script `.zs` puede quitar o sustituir las recetas de AE2 🟡 (falta probarlo en el juego).

**Inventario** (conteo automático sobre `ScriptAppliedEnergistics2.java`, rama `master`) ✅:

| Tipo | Cantidad |
|---|---|
| Recetas de máquina GT | 117: 58 de ensamblador, 21 de cables AE, 13 de circuit assembler, 12 de unpackager y unas pocas más |
| Recetas de mesa de crafteo | 152 |
| GT ya en LV o menos | 22 |
| GT por encima de LV | **94**: 50 MV, 23 HV, 5 EV, 5 IV, 3 LuV, 4 UV, 2 ZPM y 2 UHV |

**Cómo bajarlo:**
1. **Recetas alternativas** a ≤30 EU/t (LV admite 32) con materiales LV, como acero y circuitos `circuitBasic` 🟡.
   - No hace falta borrar las originales: las dos recetas conviven y NEI muestra ambas.
2. Usar la API del addon de GT, verificada ✅:
   - `mods.gregtech.Assembler.addRecipe(output, inputs[], fluidInput, durationTicks, euPerTick)`;
   - también existe `mods.gregtech.CircuitAssembler`.
3. Recetas de mesa: `recipes.remove(...)` y `recipes.addShaped(...)` de CraftTweaker.
4. **Creative Energy Cell:** GTNH mantiene su receta original de Extreme Crafting ✅. Se añade una receta LV. Ejemplo en [`scripts/easymode_ae2_lv.zs`](../scripts/easymode_ae2_lv.zs).
5. **Energía:** en `config/AppliedEnergistics2/AppliedEnergistics2.cfg`, cambiar `D:UsageMultiplier=10.0` → `1.0`.
   - GTNH multiplica por 10 el consumo.
   - Clave ✅; efecto 🟡.
6. **Canales (opcional):** `B:Channels=true` → `false` para quitar el límite de canales 🟡. Hay que probarlo en el juego.

**Esfuerzo** ⚠️ (estimación): unas 100 recetas, más las de los addons como AE2FC. Varios días de trabajo para una persona con NEI y `/mt hand`.

## 8. Esperas de máquinas

- GT **no tiene** un multiplicador global de duración ni opciones de overclock en sus configs ✅. La única opción parecida, `durationMultiplier` (`MachineStats.java`), solo afecta al Mass Fabricator.
- Ya existen dos mods ✅:
  - **EZGT** (MIT): multiplicadores.
  - **Torcherino-GTNH** (GPL-3.0): acelera máquinas GT, incluidos los multibloques.
- Para este proyecto, el valor inicial será `0.20×`: 20 % del tiempo original, cinco veces más rápido.
- Mecanismo propio: un mixin en `OverclockCalculator.calculate()` de GT5U que escala `durationModifier` al procesar.
  - Cubre también las recetas de scripts y de Assembly Line, y no cambia el tier de ninguna receta ✅ (análisis del código).
  - El tiempo base queda en `duration × 0.20`, y los overclock existentes siguen reduciendo el resultado.
  - El mínimo sigue siendo 1 tick.
  - No cambia `mEUt`, así que una máquina no baja ni sube de tier.
  - Falta probarlo en el juego 🟡. Ver [arquitectura.md](arquitectura.md#capa-4-mod-java-propio).

## 9. Lo que no se puede cambiar solo con configs ✅

- Tamaño y frecuencia de las vetas (`OreMixes.java`).
- Multiplicador global de tiempos de receta.
- Reglas de overclock, como el overclock perfecto.
- Cambios en masa de recetas: ZenScript no tiene ninguna API para recorrerlas.
- Voltaje mínimo de una máquina o multibloque.

Todo eso va al mod Java (capa 4).
