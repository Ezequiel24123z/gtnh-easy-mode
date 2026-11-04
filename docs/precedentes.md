# Precedentes y lecciones

| Proyecto | Qué es | Lección |
|---|---|---|
| [Garden of Grind](https://github.com/LazyFlesh/Garden-Of-Grind) | - Addon (mod) más reglas, sobre GTNH sin modificar<br>- Modo **"Garden of Grindless"**: aligera grinds y adelanta desbloqueos<br>- Se cambia con `/gog mode` | Se puede hacer como capa sobre GTNH, sin fork ✅ |
| [Nomi-CEu](https://github.com/Nomi-CEu/Nomi-CEu) | Pack de 1.12 con modos Normal y Expert en `config-overrides/` y un script para cambiar de modo | Una base y una carpeta por modo ✅ |
| [Monifactory](https://github.com/Omicron-Industries/Monifactory) | - Modos Normal, Hard y Expert<br>- Un coremod cambia de modo desde el menú<br>- Tests automáticos que arrancan el juego en cada PR | Automatizar el arranque en CI evita roturas ✅ |
| [GTNH Tweaks](https://gtnh-tweaks.ctry.dev) | Web que genera cambios de config para GTNH en forma de parches. La enlaza la wiki oficial. | Parches por versión, fáciles de mantener ✅ |
| [GTNH-Balance-Tweaks](https://github.com/ogdae/GTNH-Balance-Tweaks) | Mod MIT con cambios de balance para 2.8 | Hay demanda, pero ojo con romper mundos 🟡 |

## Lecciones

1. **Las quests son lo caro.**
   - GTNH tiene más de 3.000 quests, según la wiki. Duplicarlas por modo es lo que llevó a GTNH a rechazar modos oficiales ✅.
   - Aquí no se reescriben: solo se añaden notas "Easy" y un capítulo propio.
2. **Una base con varios presets**, como en Nomi-CEu y Monifactory, evita que el contenido diverja.
3. **Un CI que arranque el juego** detecta pronto los scripts rotos.
4. **Hay demanda real** 🟡. En Reddit se repiten los hilos que piden un GTNH más llevadero, pero todos acabaron en ajustes personales, nunca en un proyecto compartido.
