# Rewards

A vanilla Minecraft datapack for **Minecraft 26.1.2** (data pack format 101) that rewards players with progressively better tools and armour as they play naturally — chop logs, mine ores, kill mobs, take damage, and dig dirt.

No mods. No plugins. Server-side only — clients need nothing installed.

---

## Systems

| Activity | Tracked Stat | Stages | Final Reward |
|---|---|---|---|
| Chopping logs & wood | Blocks broken | 20 | Netherite Axe — Efficiency V, Unbreaking III |
| Mining ores | Ore blocks broken | 20 | Netherite Pickaxe — Fortune III, Efficiency V, Unbreaking III |
| Killing mobs | Mob kills | 20 | Netherite Sword — Sharpness V, Fire Aspect II, Knockback II, Looting III, Unbreaking III, Sweeping Edge III |
| Taking damage | Damage taken | 80 | Full Netherite armour set — Protection IV, Unbreaking III, Mending + slot bonuses |
| Digging dirt & sand | Dirt-type blocks broken | 20 | Netherite Shovel — Efficiency V, Unbreaking III |

Rewards are given automatically when a milestone is crossed. A title and chat message announce each stage.

---

## Milestones

All systems use 20 or 80 evenly spaced milestones between a score of **10** and **500**.

**20-stage milestones (logs, ores, kills, dirt):**
10, 36, 62, 87, 113, 139, 165, 190, 216, 242, 268, 294, 319, 345, 371, 397, 423, 448, 474, 500

**80-stage milestones (damage):**
10, 16, 22, 29, 35, 41, 47, 53 ... evenly spaced to 500

> Damage is tracked via `minecraft.custom:minecraft.damage_taken`, which counts in units of ½ a heart. 500 score ≈ 250 hearts of total damage received over a session.

---

## Reward Progressions

### Axes (Logs)

| Stage | Logs | Reward |
|---|---|---|
| 1 | 10 | Wooden Axe |
| 2 | 36 | Stone Axe |
| 3 | 62 | Iron Axe |
| 4 | 87 | Golden Axe |
| 5 | 113 | Diamond Axe |
| 6 | 139 | Netherite Axe |
| 7 | 165 | Diamond Axe — Efficiency I |
| 8 | 190 | Netherite Axe — Efficiency I |
| 9 | 216 | Diamond Axe — Efficiency II |
| 10 | 242 | Netherite Axe — Efficiency II |
| 11 | 268 | Diamond Axe — Efficiency III |
| 12 | 294 | Netherite Axe — Efficiency III |
| 13 | 319 | Diamond Axe — Efficiency IV |
| 14 | 345 | Netherite Axe — Efficiency IV |
| 15 | 371 | Diamond Axe — Efficiency V |
| 16 | 397 | Diamond Axe — Efficiency V, Unbreaking III |
| 17 | 423 | Netherite Axe — Efficiency V |
| 18 | 448 | Netherite Axe — Efficiency V, Unbreaking I |
| 19 | 474 | Netherite Axe — Efficiency V, Unbreaking II |
| 20 | 500 | **Netherite Axe — Efficiency V, Unbreaking III** |

### Pickaxes (Ores)

Tracks: coal, iron, copper, gold, lapis, redstone, emerald, diamond (overworld + deepslate variants), nether gold, nether quartz, ancient debris.

| Stage | Ores | Reward |
|---|---|---|
| 1 | 10 | Wooden Pickaxe |
| 2 | 36 | Stone Pickaxe |
| 3 | 62 | Iron Pickaxe |
| 4 | 87 | Golden Pickaxe |
| 5 | 113 | Diamond Pickaxe |
| 6 | 139 | Netherite Pickaxe |
| 7 | 165 | Diamond Pickaxe — Fortune I |
| 8 | 190 | Netherite Pickaxe — Fortune I |
| 9 | 216 | Diamond Pickaxe — Fortune II |
| 10 | 242 | Netherite Pickaxe — Fortune II |
| 11 | 268 | Diamond Pickaxe — Fortune III |
| 12 | 294 | Netherite Pickaxe — Fortune III |
| 13 | 319 | Diamond Pickaxe — Fortune III, Efficiency I |
| 14 | 345 | Netherite Pickaxe — Fortune III, Efficiency I |
| 15 | 371 | Diamond Pickaxe — Fortune III, Efficiency V |
| 16 | 397 | Diamond Pickaxe — Fortune III, Efficiency V, Unbreaking III |
| 17 | 423 | Netherite Pickaxe — Fortune III, Efficiency V |
| 18 | 448 | Netherite Pickaxe — Fortune III, Efficiency V, Unbreaking I |
| 19 | 474 | Netherite Pickaxe — Fortune III, Efficiency V, Unbreaking II |
| 20 | 500 | **Netherite Pickaxe — Fortune III, Efficiency V, Unbreaking III** |

### Swords (Mob Kills)

| Stage | Kills | Reward |
|---|---|---|
| 1 | 10 | Wooden Sword |
| 2 | 36 | Stone Sword |
| 3 | 62 | Iron Sword |
| 4 | 87 | Golden Sword |
| 5 | 113 | Diamond Sword |
| 6 | 139 | Netherite Sword |
| 7 | 165 | Diamond Sword — Sharpness I |
| 8 | 190 | Netherite Sword — Sharpness I |
| 9 | 216 | Diamond Sword — Sharpness II |
| 10 | 242 | Netherite Sword — Sharpness II, Fire Aspect I |
| 11 | 268 | Diamond Sword — Sharpness III |
| 12 | 294 | Netherite Sword — Sharpness III, Fire Aspect I |
| 13 | 319 | Diamond Sword — Sharpness IV, Knockback I |
| 14 | 345 | Netherite Sword — Sharpness IV, Fire Aspect II, Knockback I |
| 15 | 371 | Diamond Sword — Sharpness V, Knockback I, Looting I |
| 16 | 397 | Netherite Sword — Sharpness V, Fire Aspect II, Knockback I, Looting I |
| 17 | 423 | Netherite Sword — Sharpness V, Fire Aspect II, Knockback II, Looting II, Unbreaking II |
| 18 | 448 | Netherite Sword — Sharpness V, Fire Aspect II, Knockback II, Looting III, Unbreaking II |
| 19 | 474 | Netherite Sword — Sharpness V, Fire Aspect II, Knockback II, Looting III, Unbreaking III |
| 20 | 500 | **Netherite Sword — Sharpness V, Fire Aspect II, Knockback II, Looting III, Unbreaking III, Sweeping Edge III** |

### Shovels (Dirt Blocks)

Tracks: dirt, coarse dirt, rooted dirt, grass block, mycelium, podzol, farmland, gravel, sand, red sand, soul sand, soul soil, mud, muddy mangrove roots.

Progression mirrors the axe system — Efficiency scales from I to V, then Unbreaking I → III on Netherite.

**Final (stage 20, 500 blocks):** Netherite Shovel — Efficiency V, Unbreaking III

### Armour (Damage Taken) — 80 Stages

| Stages | Reward |
|---|---|
| 1–4 | Leather set (boots → chestplate) |
| 5–8 | Chainmail set |
| 9–12 | Iron set |
| 13–16 | Golden set |
| 17–20 | Diamond set |
| 21–24 | Netherite set |
| 25–28 | Iron set — Protection I |
| 29–32 | Diamond set — Protection I |
| 33–36 | Netherite set — Protection I |
| 37–40 | Diamond set — Protection II, Unbreaking I |
| 41–44 | Netherite set — Protection II, Unbreaking I |
| 45–48 | Diamond set — Protection III, Unbreaking II |
| 49–52 | Netherite set — Protection III, Unbreaking II |
| 53–56 | Diamond set — Protection IV, Unbreaking III |
| 57–60 | Netherite set — Protection IV, Unbreaking III |
| 61–64 | Netherite set — Prot IV, Unb III + Feather Falling I / Respiration I / Swift Sneak I / Thorns I |
| 65–68 | Netherite set — tier 2 bonus enchants (level II) |
| 69–72 | Netherite set — tier 3 bonus enchants (level III) |
| 73–76 | Netherite set — Feather Falling IV, Respiration III + Aqua Affinity, Swift Sneak III, Thorns III |
| 77–80 | **Full maxed Netherite set — Prot IV, Unb III, Mending + Soul Speed III / Aqua Affinity / Swift Sneak III / Thorns III** |

Each group of 4 stages gives one piece: boots, helmet, leggings, chestplate — in that order.

---

## Installation

1. Copy the `Rewards` folder into your world's `datapacks` directory:
   ```
   world/datapacks/Rewards/
   ```
2. In-game, run:
   ```
   /datapack enable "file/Rewards"
   ```
   Or simply `/reload` if the server was started with the datapack already in place.

3. You should see a confirmation message in chat from `[Rewards]`.

---

## Technical Notes

- Checks run every **20 ticks** (1 second) for all players who haven't yet hit their final stage in each category. Players at max stage are excluded from checks for that system.
- Scoreboard objectives are created on load. If objectives already exist (e.g. after a `/reload`), Minecraft will silently skip duplicates — no data is lost.
- If a player's inventory is full when a reward triggers, the item is **dropped at their feet**.
- Progress persists through restarts because it is stored in the vanilla scoreboard, which is saved with the world.
- The `generate.py` script in the root of this datapack regenerates all 173 function files from the reward tables defined at the top of the script. Edit the reward tables there and re-run to customise.

---

## Compatibility

- **Minecraft:** 26.1.2 (data pack format 101)
- **Server type:** Vanilla (no mods or plugins required)
- **Client:** Any — clients do not need to install anything
