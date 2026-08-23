# ComputerPets Ecosystem

Thirty companion organs around the flagship overlay:

**[RicheyWorks/computerpets](https://github.com/RicheyWorks/computerpets)** — virtual pets that live on your computer. Two hundred ten living kinds. Rui walks first.

This repository is the map, the clone script for `C:\Users\730ri\projects`, and the naming source of truth.

## Clone everything (Windows)

Git and GitHub access required. In **PowerShell**:

```powershell
New-Item -ItemType Directory -Force -Path C:\Users\730ri\projects | Out-Null
Set-Location C:\Users\730ri\projects
git clone https://github.com/RicheyWorks/computerpets-ecosystem.git
Set-Location .\computerpets-ecosystem
.\clone-all.ps1
```

`clone-all.ps1` pulls the flagship plus every organ below into `C:\Users\730ri\projects\<repo>`. Re-run it to `git pull` updates.

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
