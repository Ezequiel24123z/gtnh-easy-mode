// GTNH Easy Mode: plantillas de magia
// ModTweaker 0.14.0 y CraftTweaker 3.4.8 (GTNH 2.9.0).
// Este archivo no modifica recetas por sí solo. Sustituye los TODO por entradas reales comprobadas con /mt hand y NEI.

/*
Botania:
  mods.botania.RuneAltar.addRecipe(IItemStack output, IIngredient[] inputs, int mana);
  mods.botania.RuneAltar.removeRecipe(IItemStack output);
  mods.botania.ManaInfusion.addInfusion(IItemStack output, IIngredient input, int mana);
  mods.botania.ManaInfusion.removeRecipe(IItemStack output);
  mods.botania.Alchemy.addRecipe(IItemStack output, IIngredient input, int mana);
  mods.botania.Conjuration.addRecipe(IItemStack output, IIngredient input, int mana);

Ejemplo orientativo:
  mods.botania.RuneAltar.removeRecipe(<botania:rune>);
  mods.botania.RuneAltar.addRecipe(<botania:rune>, [<ore:petal>, <ore:stone>], 100);

Blood Magic:
  mods.bloodmagic.Altar.removeRecipe(IItemStack output);
  mods.bloodmagic.Altar.addRecipe(IItemStack output, IItemStack input,
                                   int tier, int lp, int consumeRate, int drainRate);

Infusiones y investigación de Thaumcraft:
  usa los handlers de ModTweaker en 1.7.10 para Arcane Workbench, Crucible,
  Infusion y Research. Valida cada firma con el jar exacto de GTNH 2.9.0.

Witchery:
  no hay una API global verificada en esta fase. Abusar de recetas concretas
  requiere WitcheryExtras/RecipeManager o un mod propio y pruebas en juego.
*/
