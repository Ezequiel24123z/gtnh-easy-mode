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
2. **Industrial Apiary** (hoy HV) a LV con una receta alternativa por script 🟡. Produce *combs* sin cuidar colmenas.
3. **Mutaciones al 100 %** con el mod Java: recorrer las mutaciones de la API de Forestry y subir su probabilidad 🟡.
4. Opción radical: recetas que den directamente la especie (abeja con el NBT del genoma) ⚠️. Es frágil; mejor la opción 3.

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
2. Recetas de semillas base con estadísticas altas (NBT) 🟡.
3. World Accelerator más barato. Ya acelera cultivos, apiarios, el altar de sangre y la infusión ✅.
4. Mod Java que reduzca el intervalo de crecimiento de CropsNH 🟡. Antes, revisar si `config/cropsnh/Configuration.cfg` ya tiene opciones ⚠️.

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
2. **Ore Drilling Plant** T1 (MV): mina 96×96 bloques y carga sus propios chunks ✅.
   - Easy: controlador y Drilling Fluid más baratos por script 🟡.
   - Bajarla de verdad a LV depende del voltaje mínimo fijado en el código, así que haría falta el mod Java ⚠️.
3. **Void Miner** más barato por script 🟡.
4. Las vetas están fijas en el código de GT (`OreMixes.java`) ✅. Su tamaño o frecuencia solo se cambia con el mod Java.

## 5. Vuelo creativo

| Opción | Cómo | Confianza |
|---|---|---|
| A. Comando `/fly` | En `serverutilities/serverutilities.cfg` (fuera de `config/`): `B:fly=false` → `true` | ✅ clave · 🟡 probablemente solo para OP; en individual, mundo con trucos |
| B. Angel Ring a LV | GTNH 2.9 bajó el Angel Ring a **IV** ✅. Añadir una receta LV alternativa por script. | 🟡 |
| C. Vuelo para todos | Mod Java que activa `allowFlying` en supervivencia, con opción en la config | 🟡 |

## 6. Mods de magia

**Thaumcraft 4.2.3.5 ✅** (`config/Thaumcraft.cfg`):
- `I:research_difficulty=1` → `-1`: la investigación se **compra con puntos**, sin minijuego ✅.
- `B:wuss_mode=false` → `true`: desactiva el **Warp** y mecánicas similares ✅.
- GTNH incluye `thaumcraft-research-tweaks` 1.4.1 ✅; hay que revisar su config.
- AspectRecipeIndex (2.9) ya da puntos de investigación desde NEI ✅.

**Recetas de magia por script:**
- GTNH 2.9.0 trae **ModTweaker 0.14.0** ✅.
- Sirve para abaratar infusiones, recetas arcanas, el altar de sangre y recetas de Botania.
- Qué métodos soporta exactamente esta versión está por comprobar 🟡.

**Otros mods:**
- **Blood Magic** 1.9.16 ✅: runas, altares y orbes más baratos 🟡. El LP ya se puede automatizar con el ritual Well of Suffering ✅.
- **Botania** 1.13.42-GTNH ✅: menos maná por receta 🟡.
- **Witchery** 0.24.1 ✅: sin revisar ⚠️.
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
- Conviene usarlos con valores moderados, porque pueden banalizar el juego.
- Alternativa propia: un mixin en `OverclockCalculator.calculate()` de GT5U que escala la duración al procesar.
  - Cubre también las recetas de scripts y de Assembly Line, y no cambia el tier de ninguna receta ✅ (análisis del código).
  - Falta probarlo en el juego 🟡. Ver [arquitectura.md](arquitectura.md#capa-4-mod-java-propio).

## 9. Lo que no se puede cambiar solo con configs ✅

- Tamaño y frecuencia de las vetas (`OreMixes.java`).
- Multiplicador global de tiempos de receta.
- Reglas de overclock, como el overclock perfecto.
- Cambios en masa de recetas: ZenScript no tiene ninguna API para recorrerlas.
- Voltaje mínimo de una máquina o multibloque.

Todo eso va al mod Java (capa 4).
