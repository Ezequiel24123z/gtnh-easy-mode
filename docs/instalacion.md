# Instalación del overlay

## Requisitos

- GTNH 2.9.0 instalado.
- Instancia cerrada antes de aplicar cambios.
- PowerShell 5.1 o posterior en Windows.
- JDK 25 para GTNH 2.9+, recomendado.
- Una copia de seguridad del mundo y de la carpeta de la instancia.

## Instalación con el script

Desde la raíz de este repositorio:

```powershell
.\scripts\install.ps1 -InstancePath "C:\ruta\a\GTNH"
```

El script:

1. aplica `tecnologico-rapido`;
2. cambia las claves incluidas en `config/easy-mode.replacements.tsv`;
3. copia los overrides de Gendustry;
4. copia el script de AE2 LV disponible;
5. crea un backup del archivo original dentro de:
   `.gtnh-easy-mode-backups\<fecha-hora>\`;
6. no descarga ni redistribuye ningún jar.

En Linux:

```bash
chmod +x scripts/install.sh
./scripts/install.sh /ruta/a/GTNH
```

No se aplica ningún archivo si falta su clave. El script avisa de los archivos y claves omitidos.

## Mods externos

Instálalos manualmente desde sus releases oficiales:

- [EZMiner](https://github.com/czqwq/EZMiner);
- [EZGT](https://github.com/KingofKeet/EZGT);
- [Visual Prospecting](https://github.com/GTNewHorizons/VisualProspecting).

Gendustry, Forestry, CropsNH, MagicBees, Thaumcraft, Blood Magic y Botania vienen en GTNH 2.9.0. No hay que descargar copias extra.

## Después de instalar

1. abre el juego una vez y deja que Gendustry/CropsNH escriban sus configs;
2. revisa y guarda los valores del GUI de EZMiner/EZGT;
3. crea un mundo nuevo;
4. no reutilices mundo antiguo para cambios de vetas EZGT;
5. prueba Steam/LV/MV antes de seguir.

## Archivo nuevo o mundo nuevo

Los cambios de vetas de EZGT solo afectan a chunks nuevos. Los cambios de CropsNH, Gendustry y configs normales pueden afectar a objetos y mundos existentes. Haz siempre una copia.

## Deshacer

Los archivos originales se encuentran en:

```text
<instancia>\.gtnh-easy-mode-backups\<fecha-hora>\
```

Copia de vuelta los archivos que quieras restaurar.
