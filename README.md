# ComputerPets Ecosystem

Thirty companion organs around the flagship overlay:

**[RicheyWorks/computerpets](https://github.com/RicheyWorks/computerpets)** — virtual pets that live on your computer. Two hundred ten living kinds. Rui walks first.

This repository is the map, the clone script for `C:\Users\730ri\projects`, and the naming source of truth.

## Clone everything (Windows)

You already have `C:\Users\730ri\projects`. The map folder is **not** there yet — clone it first, then run the script. Paste this whole block in PowerShell:

```powershell
Set-Location C:\Users\730ri\projects
git clone https://github.com/RicheyWorks/computerpets-ecosystem.git
Set-Location .\computerpets-ecosystem
.\clone-all.ps1
```

That fills `C:\Users\730ri\projects` with the flagship, 30 organs, and 30 games. Your existing `ComputerPets` folder is reused (Windows does not care about case). Re-run `.\clone-all.ps1` later to pull updates.


## Organs

### AI & GPU

| Product | Repo | Role |
| --- | --- | --- |
| Cortex | [computerpets-cortex](https://github.com/RicheyWorks/computerpets-cortex) | LLM pet brain |
| Gaze | [computerpets-gaze](https://github.com/RicheyWorks/computerpets-gaze) | Webcam gestures |
| Vox | [computerpets-vox](https://github.com/RicheyWorks/computerpets-vox) | Species TTS |
| Motion | [computerpets-motion](https://github.com/RicheyWorks/computerpets-motion) | Procedural animation |
| Atelier | [computerpets-atelier](https://github.com/RicheyWorks/computerpets-atelier) | NFT trait generation |

### Web & Client

| Product | Repo | Role |
| --- | --- | --- |
| Companion | [computerpets-companion](https://github.com/RicheyWorks/computerpets-companion) | Phone / web care dashboard |
| Bazaar | [computerpets-bazaar](https://github.com/RicheyWorks/computerpets-bazaar) | Marketplace |
| Studio | [computerpets-studio](https://github.com/RicheyWorks/computerpets-studio) | Skin creator |
| Console | [computerpets-console](https://github.com/RicheyWorks/computerpets-console) | Operator admin |
| Kennel | [computerpets-kennel](https://github.com/RicheyWorks/computerpets-kennel) | Breeding genetics |

### Microservices

| Product | Repo | Role |
| --- | --- | --- |
| Minter | [computerpets-minter](https://github.com/RicheyWorks/computerpets-minter) | Chain mint / pin / transfer |
| Steamgate | [computerpets-steamgate](https://github.com/RicheyWorks/computerpets-steamgate) | Steamworks gateway |
| Visitation | [computerpets-visitation](https://github.com/RicheyWorks/computerpets-visitation) | Pets visiting other screens |
| Telemetry | [computerpets-telemetry](https://github.com/RicheyWorks/computerpets-telemetry) | Lifespan + engagement |
| Quests | [computerpets-quests](https://github.com/RicheyWorks/computerpets-quests) | Daily care tasks |
| Ledger | [computerpets-ledger](https://github.com/RicheyWorks/computerpets-ledger) | Double-entry economy |

### Integrations

| Product | Repo | Role |
| --- | --- | --- |
| Twitch | [computerpets-twitch](https://github.com/RicheyWorks/computerpets-twitch) | Viewer feed / poke |
| Discord | [computerpets-discord](https://github.com/RicheyWorks/computerpets-discord) | Status + alerts |
| Wallpaper | [computerpets-wallpaper](https://github.com/RicheyWorks/computerpets-wallpaper) | Wallpaper Engine habitat |
| Nest | [computerpets-nest](https://github.com/RicheyWorks/computerpets-nest) | Smart home bridge |
| Overlay | [computerpets-overlay](https://github.com/RicheyWorks/computerpets-overlay) | OBS widget |

### Community

| Product | Repo | Role |
| --- | --- | --- |
| SDK | [computerpets-sdk](https://github.com/RicheyWorks/computerpets-sdk) | Modding toolkit |
| Lore | [computerpets-lore](https://github.com/RicheyWorks/computerpets-lore) | Canon wiki |
| Babel | [computerpets-babel](https://github.com/RicheyWorks/computerpets-babel) | Localization |
| Bounty | [computerpets-bounty](https://github.com/RicheyWorks/computerpets-bounty) | Public bug board |
| Ballot | [computerpets-ballot](https://github.com/RicheyWorks/computerpets-ballot) | Holder roadmap votes |

### Utility Tools

| Product | Repo | Role |
| --- | --- | --- |
| Patcher | [computerpets-patcher](https://github.com/RicheyWorks/computerpets-patcher) | Signed auto-update |
| Migrator | [computerpets-migrator](https://github.com/RicheyWorks/computerpets-migrator) | Offline save → cloud |
| Forensics | [computerpets-forensics](https://github.com/RicheyWorks/computerpets-forensics) | Crash log analyzer |
| Stampede | [computerpets-stampede](https://github.com/RicheyWorks/computerpets-stampede) | 10k-pet load test |


## Games

Thirty companion games. Same canon. None of them replace the desktop walk.

### Combat & action

| Product | Repo | Engine |
| --- | --- | --- |
| Arena | [computerpets-arena](https://github.com/RicheyWorks/computerpets-arena) | Unity / WebGL auto-battler |
| Siege | [computerpets-siege](https://github.com/RicheyWorks/computerpets-siege) | Desktop tower defense |
| Rogue | [computerpets-rogue](https://github.com/RicheyWorks/computerpets-rogue) | Godot action roguelike |
| Raid | [computerpets-raid](https://github.com/RicheyWorks/computerpets-raid) | Spring WebSocket co-op |
| Horde | [computerpets-horde](https://github.com/RicheyWorks/computerpets-horde) | Godot bullet-heaven |
| Shadow | [computerpets-shadow](https://github.com/RicheyWorks/computerpets-shadow) | Godot stealth heist |
| Dodge | [computerpets-dodge](https://github.com/RicheyWorks/computerpets-dodge) | Unity party dodgeball |

### Skills, races, arcade

| Product | Repo | Engine |
| --- | --- | --- |
| Agility | [computerpets-agility](https://github.com/RicheyWorks/computerpets-agility) | Godot physics runner |
| Derby | [computerpets-derby](https://github.com/RicheyWorks/computerpets-derby) | Unreal / WebGL racing |
| Cadence | [computerpets-cadence](https://github.com/RicheyWorks/computerpets-cadence) | Godot rhythm |
| Encore | [computerpets-encore](https://github.com/RicheyWorks/computerpets-encore) | React / Web Audio karaoke |
| Tilt | [computerpets-tilt](https://github.com/RicheyWorks/computerpets-tilt) | Phaser pinball |
| Soar | [computerpets-soar](https://github.com/RicheyWorks/computerpets-soar) | Three.js flight |
| Spire | [computerpets-spire](https://github.com/RicheyWorks/computerpets-spire) | Phaser tower climb |
| Cascade | [computerpets-cascade](https://github.com/RicheyWorks/computerpets-cascade) | Phaser match-3 RPG |
| Gambit | [computerpets-gambit](https://github.com/RicheyWorks/computerpets-gambit) | Next.js CCG |
| Thread | [computerpets-thread](https://github.com/RicheyWorks/computerpets-thread) | Godot maze puzzle |

### World, idle, cozy

| Product | Repo | Engine |
| --- | --- | --- |
| Delve | [computerpets-delve](https://github.com/RicheyWorks/computerpets-delve) | Spring idle expeditions |
| Hatchery | [computerpets-hatchery](https://github.com/RicheyWorks/computerpets-hatchery) | React/Canvas breeding |
| Lure | [computerpets-lure](https://github.com/RicheyWorks/computerpets-lure) | Phaser fishing |
| Kettle | [computerpets-kettle](https://github.com/RicheyWorks/computerpets-kettle) | Unity cooking dash |
| Cache | [computerpets-cache](https://github.com/RicheyWorks/computerpets-cache) | React Native AR hunt |
| Runway | [computerpets-runway](https://github.com/RicheyWorks/computerpets-runway) | Three.js fashion |
| Hearth | [computerpets-hearth](https://github.com/RicheyWorks/computerpets-hearth) | Phaser village |
| Acre | [computerpets-acre](https://github.com/RicheyWorks/computerpets-acre) | Unity farm |
| Orbit | [computerpets-orbit](https://github.com/RicheyWorks/computerpets-orbit) | Vue/Pixi idle space |
| Isle | [computerpets-isle](https://github.com/RicheyWorks/computerpets-isle) | Unreal survival |
| Inn | [computerpets-inn](https://github.com/RicheyWorks/computerpets-inn) | Unity tavern |
| Quarry | [computerpets-quarry](https://github.com/RicheyWorks/computerpets-quarry) | Godot digging |
| Dojo | [computerpets-dojo](https://github.com/RicheyWorks/computerpets-dojo) | Svelte idle gym |

## Doctrine

1. The desktop walk is the main quest. Companion organs fail soft.
2. Canon holds: 210 species, no illegal hybrids, no swapped voices.
3. Steam + Ethereum ownership already live in the flagship backend (`com.enterprisepet`, Java 21, Spring Boot 3.3, web3j). New Java services match that stack.
4. MIT license, same as the flagship.
5. Repos are **design scaffolds** until an implementation commit lands. The name and contract are frozen.

## License

MIT. See [LICENSE](LICENSE).

---

*Two hundred ten living kinds. Keep them so a line does not go quiet.*
