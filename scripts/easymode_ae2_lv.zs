// GTNH Easy Mode: AE2 a LV (PLANTILLA, sin probar en el juego)
// Requiere CraftTweaker 3.4.8 y Minetweaker-Gregtech-5-Addon 2.3.4 (vienen en GTNH 2.9.0).
// Copiar a <instancia>/scripts/. Antes de ampliarlo, confirma cada ID con /mt hand o con NEI.
//
// Firma verificada en el addon:
//   mods.gregtech.Assembler.addRecipe(IItemStack output, IIngredient[] inputs,
//                                     ILiquidStack fluidInput, int durationTicks, int euPerTick)
//
// Inventario a replicar: en NewHorizonsCoreMod, src/main/java/com/dreammaster/scripts/
// ScriptAppliedEnergistics2.java (94 recetas GT por encima de LV) y ScriptAE2FC.java.

import mods.gregtech.Assembler;

// LV admite hasta 32 EU/t; con 30 queda margen.
val LV = 30;

// 1) Creative Energy Cell con receta LV. La receta original de GTNH sigue existiendo.
recipes.addShaped(<appliedenergistics2:tile.BlockCreativeEnergyCell>, [
    [<appliedenergistics2:tile.BlockDenseEnergyCell>, <ore:circuitBasic>, <appliedenergistics2:tile.BlockDenseEnergyCell>],
    [<ore:circuitBasic>, <gregtech:gt.blockmachines:11>, <ore:circuitBasic>],
    [<appliedenergistics2:tile.BlockDenseEnergyCell>, <ore:circuitBasic>, <appliedenergistics2:tile.BlockDenseEnergyCell>]
]);
// <gregtech:gt.blockmachines:11> = casco de máquina LV (confirmar con /mt hand).

// 2) Ejemplo de receta alternativa de ensamblador LV: ME Controller.
// Las entradas son orientativas; el diseño final se decide en un issue de balance.
Assembler.addRecipe(<appliedenergistics2:tile.BlockController>,
    [<gregtech:gt.blockmachines:11>, <ore:circuitBasic> * 4, <ore:plateSteel> * 4, <appliedenergistics2:item.ItemMultiMaterial:24> * 2],
    <liquid:molten.solderingalloy> * 144, 400, LV);
// item.ItemMultiMaterial:24 = Engineering Processor (confirmar con /mt hand).

// 3) TODO: el resto de piezas, por tiers (MV 50, HV 23, EV 5, IV 5, LuV 3, UV 4, ZPM 2, UHV 2).
//    Orden sugerido: controller, drive, cables, interfaces, terminales, celdas 1k-64k,
//    molecular assembler, crafting CPU, procesadores, energy cells.
