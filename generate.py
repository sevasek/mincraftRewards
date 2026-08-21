#!/usr/bin/env python3
"""Generates the Rewards datapack for vanilla Minecraft 26.2 (pack format 107)."""

import os, json

ROOT = os.environ.get("REWARDS_GENERATE_ROOT") or os.path.dirname(os.path.abspath(__file__))

def write(path, content):
    full = os.path.join(ROOT, path)
    os.makedirs(os.path.dirname(full), exist_ok=True)
    with open(full, "w") as f:
        f.write(content)

def milestones(n, lo=10, hi=500):
    return [round(lo + (hi - lo) / (n - 1) * i) for i in range(n)]

MILESTONES_20     = milestones(20, lo=10,  hi=1500)
MILESTONES_80     = milestones(80, lo=10,  hi=15000)
MILESTONES_DIRT   = milestones(20, lo=10,  hi=3015)
MILESTONES_EGG    = milestones(20, lo=100, hi=10000)
MILESTONES_BREAD  = milestones(20, lo=1,   hi=192)
MILESTONES_WEAPON = milestones(20, lo=1,   hi=100)
MILESTONES_SPEAR  = MILESTONES_WEAPON + [150]   # stage 21 at 150 kills

# ─── LEADERBOARD METRICS ───────────────────────────────────────────────────────
SMITE_PLAYERS = ["sevasek", "sevact", "catmodo"]

LB_METRICS = [
    ("kills",   "rwd_tot_kills",   "Mob Kills",       "red"),
    ("spear",   "rwd_spear_kills", "Spear Kills",      "gold"),
    ("mace",    "rwd_mace_kills",  "Mace Kills",       "yellow"),
    ("logs",    "rwd_logs",        "Logs Chopped",     "green"),
    ("ores",    "rwd_ores",        "Ores Mined",       "aqua"),
    ("damage",  "rwd_damage",      "Damage Dealt",     "light_purple"),
    ("dirt",    "rwd_dirt",        "Dirt Moved",       "dark_green"),
    ("enchant", "rwd_enchant",     "Enchants",         "light_purple"),
    ("milk",    "rwd_milk",        "Milk Collected",   "white"),
    ("eggs",    "rwd_egg",         "Eggs Collected",   "yellow"),
    ("bread",   "rwd_bread",       "Bread Baked",      "gold"),
]

def roman(n):
    r = {1:"I",2:"II",3:"III",4:"IV",5:"V",6:"VI",7:"VII",8:"VIII",9:"IX",10:"X"}
    return r.get(n, str(n))

def enchant_str(enchants):
    """enchants: list of (id, level) e.g. [('sharpness', 5), ('fire_aspect', 2)]"""
    if not enchants:
        return ""
    # Quote namespaced IDs that contain a colon (e.g. rewards:lightning)
    # to avoid ambiguity with the level separator in the give command parser.
    parts = ", ".join(f'"{e}":{l}' if ":" in e else f'{e}:{l}' for e, l in enchants)
    return f'[enchantments={{{parts}}}]'

def item_name(material, enchants, count=1):
    base = material.split("[")[0].replace("minecraft:", "").replace("_", " ").title()
    count_str = f" x{count}" if count > 1 else ""
    if not enchants:
        return f"{base}{count_str}"
    # Strip namespace from custom enchantments (e.g. rewards:lightning → Lightning)
    enc_parts = [f"{e.split(':')[-1].replace('_', ' ').title()} {roman(l)}" for e, l in enchants]
    return f"{base} ({', '.join(enc_parts)}){count_str}"

def give_cmd(material, enchants, count=1, extra_components=""):
    count_str = f" {count}" if count > 1 else ""
    enc = enchant_str(enchants)
    if extra_components:
        # Merge extra components into the same [...] block
        comp = enc[:-1] + "," + extra_components + "]" if enc else f"[{extra_components}]"
    else:
        comp = enc
    return f"give @s {material}{comp}{count_str}"

# Attack speed component for the endgame spear (adds 6 → total 10, base is 4)
SPEAR_SPEED = 'attribute_modifiers=[{type:"minecraft:attack_speed",amount:6.0,operation:"add_value",slot:"mainhand",id:"rewards:spear_speed"}]'


# ─── AXES (logs) ───────────────────────────────────────────────────────────────
AXE_REWARDS = [
    ("minecraft:wooden_axe",   []),
    ("minecraft:stone_axe",    []),
    ("minecraft:iron_axe",     []),
    ("minecraft:golden_axe",   []),
    ("minecraft:diamond_axe",  []),
    ("minecraft:netherite_axe",[]),
    ("minecraft:diamond_axe",  [("efficiency",1)]),
    ("minecraft:netherite_axe",[("efficiency",1)]),
    ("minecraft:diamond_axe",  [("efficiency",2)]),
    ("minecraft:netherite_axe",[("efficiency",2)]),
    ("minecraft:diamond_axe",  [("efficiency",3)]),
    ("minecraft:netherite_axe",[("efficiency",3)]),
    ("minecraft:diamond_axe",  [("efficiency",4)]),
    ("minecraft:netherite_axe",[("efficiency",4)]),
    ("minecraft:diamond_axe",  [("efficiency",5)]),
    ("minecraft:diamond_axe",  [("efficiency",5),("unbreaking",3)]),
    ("minecraft:netherite_axe",[("efficiency",5)]),
    ("minecraft:netherite_axe",[("efficiency",5),("unbreaking",1)]),
    ("minecraft:netherite_axe",[("efficiency",5),("unbreaking",2)]),
    ("minecraft:netherite_axe",[("efficiency",5),("unbreaking",3)]),
]

# ─── PICKAXES (ores) ────────────────────────────────────────────────────────────
PICK_REWARDS = [
    ("minecraft:wooden_pickaxe",   []),
    ("minecraft:stone_pickaxe",    []),
    ("minecraft:iron_pickaxe",     []),
    ("minecraft:golden_pickaxe",   []),
    ("minecraft:diamond_pickaxe",  []),
    ("minecraft:netherite_pickaxe",[]),
    ("minecraft:diamond_pickaxe",  [("fortune",1)]),
    ("minecraft:netherite_pickaxe",[("fortune",1)]),
    ("minecraft:diamond_pickaxe",  [("fortune",2)]),
    ("minecraft:netherite_pickaxe",[("fortune",2)]),
    ("minecraft:diamond_pickaxe",  [("fortune",3)]),
    ("minecraft:netherite_pickaxe",[("fortune",3)]),
    ("minecraft:diamond_pickaxe",  [("fortune",3),("efficiency",1)]),
    ("minecraft:netherite_pickaxe",[("fortune",3),("efficiency",1)]),
    ("minecraft:diamond_pickaxe",  [("fortune",3),("efficiency",5)]),
    ("minecraft:diamond_pickaxe",  [("fortune",3),("efficiency",5),("unbreaking",3)]),
    ("minecraft:netherite_pickaxe",[("fortune",3),("efficiency",5)]),
    ("minecraft:netherite_pickaxe",[("fortune",3),("efficiency",5),("unbreaking",1)]),
    ("minecraft:netherite_pickaxe",[("fortune",3),("efficiency",5),("unbreaking",2)]),
    ("minecraft:netherite_pickaxe",[("fortune",3),("efficiency",5),("unbreaking",3)]),
]

# ─── SWORDS (mob kills) ─────────────────────────────────────────────────────────
SWORD_REWARDS = [
    ("minecraft:wooden_sword",   []),
    ("minecraft:stone_sword",    []),
    ("minecraft:iron_sword",     []),
    ("minecraft:golden_sword",   []),
    ("minecraft:diamond_sword",  []),
    ("minecraft:netherite_sword",[]),
    ("minecraft:diamond_sword",  [("sharpness",1)]),
    ("minecraft:netherite_sword",[("sharpness",1)]),
    ("minecraft:diamond_sword",  [("sharpness",2)]),
    ("minecraft:netherite_sword",[("sharpness",2),("fire_aspect",1)]),
    ("minecraft:diamond_sword",  [("sharpness",3)]),
    ("minecraft:netherite_sword",[("sharpness",3),("fire_aspect",1)]),
    ("minecraft:diamond_sword",  [("sharpness",4),("knockback",1)]),
    ("minecraft:netherite_sword",[("sharpness",4),("fire_aspect",2),("knockback",1)]),
    ("minecraft:diamond_sword",  [("sharpness",5),("knockback",1),("looting",1)]),
    ("minecraft:netherite_sword",[("sharpness",5),("fire_aspect",2),("knockback",1),("looting",1)]),
    ("minecraft:netherite_sword",[("sharpness",5),("fire_aspect",2),("knockback",2),("looting",2),("unbreaking",2)]),
    ("minecraft:netherite_sword",[("sharpness",5),("fire_aspect",2),("knockback",2),("looting",3),("unbreaking",2)]),
    ("minecraft:netherite_sword",[("sharpness",5),("fire_aspect",2),("knockback",2),("looting",3),("unbreaking",3)]),
    ("minecraft:netherite_sword",[("sharpness",5),("fire_aspect",2),("knockback",2),("looting",3),("unbreaking",3),("sweeping_edge",3)]),
]

# ─── SPEARS (spear kills — melee window tracking) ───────────────────────────────
SPEAR_KILL_REWARDS = [
    ("minecraft:wooden_spear",    []),
    ("minecraft:stone_spear",     []),
    ("minecraft:iron_spear",      []),
    ("minecraft:golden_spear",    []),
    ("minecraft:diamond_spear",   []),
    ("minecraft:netherite_spear", []),
    ("minecraft:diamond_spear",   [("sharpness",1)]),
    ("minecraft:netherite_spear", [("sharpness",1)]),
    ("minecraft:diamond_spear",   [("sharpness",2)]),
    ("minecraft:netherite_spear", [("sharpness",2)]),
    ("minecraft:diamond_spear",   [("sharpness",3)]),
    ("minecraft:netherite_spear", [("sharpness",3)]),
    ("minecraft:diamond_spear",   [("sharpness",4)]),
    ("minecraft:netherite_spear", [("sharpness",4)]),
    ("minecraft:diamond_spear",   [("sharpness",5)]),
    ("minecraft:netherite_spear", [("sharpness",5)]),
    ("minecraft:netherite_spear", [("sharpness",5),("unbreaking",3)]),
    ("minecraft:netherite_spear", [("sharpness",5),("unbreaking",3),("looting",3)]),
    ("minecraft:netherite_spear", [("sharpness",5),("unbreaking",3),("looting",3),("mending",1)]),
    ("minecraft:netherite_spear", [("sharpness",5),("unbreaking",3),("looting",3),("mending",1),("rewards:lightning",1)], 1, None, SPEAR_SPEED),
    ("minecraft:netherite_spear", [("sharpness",5),("unbreaking",3),("looting",3),("mending",1),("rewards:lightning",1),("rewards:lunge",3)], 1, None, SPEAR_SPEED),
]

# ─── MACES (mace kills — melee window tracking) ──────────────────────────────────
MACE_KILL_REWARDS = [
    ("minecraft:mace", []),
    ("minecraft:mace", [("density",1)]),
    ("minecraft:mace", [("density",2)]),
    ("minecraft:mace", [("density",3)]),
    ("minecraft:mace", [("density",4)]),
    ("minecraft:mace", [("density",5)]),
    ("minecraft:mace", [("breach",1)]),
    ("minecraft:mace", [("breach",2)]),
    ("minecraft:mace", [("breach",3)]),
    ("minecraft:mace", [("breach",4)]),
    ("minecraft:mace", [("density",1),("breach",1)]),
    ("minecraft:mace", [("density",2),("breach",2)]),
    ("minecraft:mace", [("density",3),("breach",3)]),
    ("minecraft:mace", [("density",4),("breach",4)]),
    ("minecraft:mace", [("density",5),("breach",4)]),
    ("minecraft:mace", [("density",5),("breach",4),("wind_burst",1)]),
    ("minecraft:mace", [("density",5),("breach",4),("wind_burst",2)]),
    ("minecraft:mace", [("density",5),("breach",4),("wind_burst",3)]),
    ("minecraft:mace", [("density",5),("breach",4),("wind_burst",3),("unbreaking",3)]),
    ("minecraft:elytra", []),
]

_MB = "minecraft:enchanted_book[stored_enchantments={mending:1}]"

# ─── SHEARS (sheep shearing) ────────────────────────────────────────────────────
SHEAR_REWARDS = [
    ("minecraft:shears", []),
    ("minecraft:shears", [("unbreaking", 1)]),
    ("minecraft:shears", [("unbreaking", 2)]),
    ("minecraft:shears", [("unbreaking", 3)]),
    ("minecraft:shears", [("mending", 1)]),
    ("minecraft:shears", [("unbreaking", 1), ("mending", 1)]),
    ("minecraft:shears", [("unbreaking", 2), ("mending", 1)]),
    ("minecraft:shears", [("unbreaking", 3), ("mending", 1)]),
    ("minecraft:shears", [("efficiency", 1)]),
    ("minecraft:shears", [("efficiency", 2)]),
    ("minecraft:shears", [("efficiency", 3)]),
    ("minecraft:shears", [("efficiency", 4)]),
    ("minecraft:shears", [("efficiency", 5)]),
    ("minecraft:shears", [("efficiency", 1), ("unbreaking", 3)]),
    ("minecraft:shears", [("efficiency", 2), ("unbreaking", 3)]),
    ("minecraft:shears", [("efficiency", 3), ("unbreaking", 3)]),
    ("minecraft:shears", [("efficiency", 4), ("unbreaking", 3)]),
    ("minecraft:shears", [("efficiency", 5), ("unbreaking", 3)]),
    ("minecraft:shears", [("efficiency", 5), ("unbreaking", 3), ("mending", 1)]),
    ("minecraft:shears", [("efficiency", 5), ("unbreaking", 3), ("mending", 1)]),
]

# ─── FLOWERS (cow milking) ───────────────────────────────────────────────────────
MILK_REWARDS = [
    ("minecraft:dandelion",          []),
    ("minecraft:poppy",              []),
    ("minecraft:blue_orchid",        []),
    ("minecraft:allium",             []),
    ("minecraft:azure_bluet",        []),
    ("minecraft:red_tulip",          []),
    ("minecraft:orange_tulip",       []),
    ("minecraft:white_tulip",        []),
    ("minecraft:pink_tulip",         []),
    ("minecraft:oxeye_daisy",        []),
    ("minecraft:cornflower",         []),
    ("minecraft:lily_of_the_valley", []),
    ("minecraft:sunflower",          []),
    ("minecraft:lilac",              []),
    ("minecraft:rose_bush",          []),
    ("minecraft:peony",              []),
    ("minecraft:torchflower",        []),
    ("minecraft:pitcher_plant",      []),
    ("minecraft:spore_blossom",      []),
    ("minecraft:wither_rose",        []),
]

# ─── FOOD (bread crafting) ───────────────────────────────────────────────────────
BREAD_REWARDS = [
    ("minecraft:bread",                    [], 8),
    ("minecraft:bread",                    [], 16),
    ("minecraft:cooked_beef",              [], 8),
    ("minecraft:cooked_porkchop",          [], 8),
    ("minecraft:cooked_chicken",           [], 8),
    ("minecraft:cooked_mutton",            [], 8),
    ("minecraft:cooked_salmon",            [], 8),
    ("minecraft:cooked_cod",               [], 8),
    ("minecraft:baked_potato",             [], 8),
    ("minecraft:pumpkin_pie",              [], 4),
    ("minecraft:cake",                     [], 2),
    ("minecraft:cookie",                   [], 16),
    ("minecraft:mushroom_stew",            [], 4),
    ("minecraft:rabbit_stew",              [], 4),
    ("minecraft:beetroot_soup",            [], 4),
    ("minecraft:suspicious_stew",          [], 4),
    ("minecraft:golden_carrot",            [], 8),
    ("minecraft:golden_carrot",            [], 16),
    ("minecraft:golden_apple",             [], 4),
    ("minecraft:enchanted_golden_apple",   [], 1),
]

# ─── EGGS (egg throwing) ─────────────────────────────────────────────────────────
EGG_REWARDS = [
    ("minecraft:egg",                  [], 16),
    ("minecraft:egg",                  [], 32),
    ("minecraft:egg",                  [], 64),
    ("minecraft:turtle_egg",           [], 4),
    ("minecraft:sniffer_egg",          [], 1),
    ("minecraft:sniffer_egg",          [], 2),
    ("minecraft:chicken_spawn_egg",    [], 4),
    ("minecraft:rabbit_spawn_egg",     [], 4),
    ("minecraft:sheep_spawn_egg",      [], 4),
    ("minecraft:cow_spawn_egg",        [], 4),
    ("minecraft:pig_spawn_egg",        [], 4),
    ("minecraft:mooshroom_spawn_egg",  [], 2),
    ("minecraft:horse_spawn_egg",      [], 2),
    ("minecraft:wolf_spawn_egg",       [], 4),
    ("minecraft:fox_spawn_egg",        [], 4),
    ("minecraft:axolotl_spawn_egg",    [], 4),
    ("minecraft:bee_spawn_egg",        [], 4),
    ("minecraft:panda_spawn_egg",      [], 2),
    ("minecraft:parrot_spawn_egg",     [], 4),
    ("minecraft:allay_spawn_egg",      [], 4),
]

# ─── SHOVELS (dirt blocks) ──────────────────────────────────────────────────────
SHOVEL_REWARDS = [
    ("minecraft:wooden_shovel",   []),
    ("minecraft:stone_shovel",    []),
    ("minecraft:iron_shovel",     []),
    ("minecraft:golden_shovel",   []),
    ("minecraft:diamond_shovel",  []),
    ("minecraft:netherite_shovel",[]),
    ("minecraft:diamond_shovel",  [("efficiency",1)]),
    ("minecraft:netherite_shovel",[("efficiency",1)]),
    ("minecraft:diamond_shovel",  [("efficiency",2)]),
    ("minecraft:netherite_shovel",[("efficiency",2)]),
    ("minecraft:diamond_shovel",  [("efficiency",3)]),
    ("minecraft:netherite_shovel",[("efficiency",3)]),
    ("minecraft:diamond_shovel",  [("efficiency",4)]),
    ("minecraft:netherite_shovel",[("efficiency",4)]),
    ("minecraft:diamond_shovel",  [("efficiency",5)]),
    ("minecraft:diamond_shovel",  [("efficiency",5),("unbreaking",3)]),
    ("minecraft:netherite_shovel",[("efficiency",5)]),
    ("minecraft:netherite_shovel",[("efficiency",5),("unbreaking",1)]),
    ("minecraft:netherite_shovel",[("efficiency",5),("unbreaking",2)]),
    ("minecraft:netherite_shovel",[("efficiency",5),("unbreaking",3)]),
]

# ─── ARMOR (damage taken) ───────────────────────────────────────────────────────
P = "protection"
U = "unbreaking"
FF = "feather_falling"
RESP = "respiration"
SS = "swift_sneak"
THORNS = "thorns"
AA = "aqua_affinity"
SOUL = "soul_speed"
MEND = "mending"

def a(mat, slot, *enc): return (f"minecraft:{mat}_{slot}", list(enc))

ARMOR_REWARDS = [
    # 1-4: Leather
    a("leather","boots",[]),  a("leather","helmet",[]),  a("leather","leggings",[]),  a("leather","chestplate",[]),
    # 5-8: Chainmail
    a("chainmail","boots",[]), a("chainmail","helmet",[]), a("chainmail","leggings",[]), a("chainmail","chestplate",[]),
    # 9-12: Iron
    a("iron","boots",[]), a("iron","helmet",[]), a("iron","leggings",[]), a("iron","chestplate",[]),
    # 13-16: Golden
    a("golden","boots",[]), a("golden","helmet",[]), a("golden","leggings",[]), a("golden","chestplate",[]),
    # 17-20: Diamond
    a("diamond","boots",[]), a("diamond","helmet",[]), a("diamond","leggings",[]), a("diamond","chestplate",[]),
    # 21-24: Netherite
    a("netherite","boots",[]), a("netherite","helmet",[]), a("netherite","leggings",[]), a("netherite","chestplate",[]),
    # 25-28: Iron + Prot I
    a("iron","boots",[(P,1)]), a("iron","helmet",[(P,1)]), a("iron","leggings",[(P,1)]), a("iron","chestplate",[(P,1)]),
    # 29-32: Diamond + Prot I
    a("diamond","boots",[(P,1)]), a("diamond","helmet",[(P,1)]), a("diamond","leggings",[(P,1)]), a("diamond","chestplate",[(P,1)]),
    # 33-36: Netherite + Prot I
    a("netherite","boots",[(P,1)]), a("netherite","helmet",[(P,1)]), a("netherite","leggings",[(P,1)]), a("netherite","chestplate",[(P,1)]),
    # 37-40: Diamond + Prot II + Unb I
    a("diamond","boots",[(P,2),(U,1)]), a("diamond","helmet",[(P,2),(U,1)]), a("diamond","leggings",[(P,2),(U,1)]), a("diamond","chestplate",[(P,2),(U,1)]),
    # 41-44: Netherite + Prot II + Unb I
    a("netherite","boots",[(P,2),(U,1)]), a("netherite","helmet",[(P,2),(U,1)]), a("netherite","leggings",[(P,2),(U,1)]), a("netherite","chestplate",[(P,2),(U,1)]),
    # 45-48: Diamond + Prot III + Unb II
    a("diamond","boots",[(P,3),(U,2)]), a("diamond","helmet",[(P,3),(U,2)]), a("diamond","leggings",[(P,3),(U,2)]), a("diamond","chestplate",[(P,3),(U,2)]),
    # 49-52: Netherite + Prot III + Unb II
    a("netherite","boots",[(P,3),(U,2)]), a("netherite","helmet",[(P,3),(U,2)]), a("netherite","leggings",[(P,3),(U,2)]), a("netherite","chestplate",[(P,3),(U,2)]),
    # 53-56: Diamond + Prot IV + Unb III
    a("diamond","boots",[(P,4),(U,3)]), a("diamond","helmet",[(P,4),(U,3)]), a("diamond","leggings",[(P,4),(U,3)]), a("diamond","chestplate",[(P,4),(U,3)]),
    # 57-60: Netherite + Prot IV + Unb III
    a("netherite","boots",[(P,4),(U,3)]), a("netherite","helmet",[(P,4),(U,3)]), a("netherite","leggings",[(P,4),(U,3)]), a("netherite","chestplate",[(P,4),(U,3)]),
    # 61-64: Netherite + Prot IV + Unb III + bonus tier 1
    a("netherite","boots",[(P,4),(U,3),(FF,1)]),
    a("netherite","helmet",[(P,4),(U,3),(RESP,1)]),
    a("netherite","leggings",[(P,4),(U,3),(SS,1)]),
    a("netherite","chestplate",[(P,4),(U,3),(THORNS,1)]),
    # 65-68: bonus tier 2
    a("netherite","boots",[(P,4),(U,3),(FF,2)]),
    a("netherite","helmet",[(P,4),(U,3),(RESP,2)]),
    a("netherite","leggings",[(P,4),(U,3),(SS,2)]),
    a("netherite","chestplate",[(P,4),(U,3),(THORNS,2)]),
    # 69-72: bonus tier 3
    a("netherite","boots",[(P,4),(U,3),(FF,3)]),
    a("netherite","helmet",[(P,4),(U,3),(RESP,3)]),
    a("netherite","leggings",[(P,4),(U,3),(SS,3)]),
    a("netherite","chestplate",[(P,4),(U,3),(THORNS,3)]),
    # 73-76: bonus tier 4 (max bonus)
    a("netherite","boots",[(P,4),(U,3),(FF,4)]),
    a("netherite","helmet",[(P,4),(U,3),(RESP,3),(AA,1)]),
    a("netherite","leggings",[(P,4),(U,3),(SS,3)]),
    a("netherite","chestplate",[(P,4),(U,3),(THORNS,3)]),
    # 77-80: Full maxed set + Mending
    a("netherite","boots",[(P,4),(U,3),(FF,4),(SOUL,3),(MEND,1)]),
    a("netherite","helmet",[(P,4),(U,3),(RESP,3),(AA,1),(MEND,1)]),
    a("netherite","leggings",[(P,4),(U,3),(SS,3),(MEND,1)]),
    a("netherite","chestplate",[(P,4),(U,3),(THORNS,3),(MEND,1)]),
]

def fix_armor(entry):
    mat_slot, encs = entry
    fixed = []
    for e in encs:
        if isinstance(e, tuple):
            fixed.append(e)
        elif isinstance(e, list):
            fixed.extend(e)
        else:
            fixed.append(e)
    return (mat_slot, fixed)

ARMOR_REWARDS = [fix_armor(x) for x in ARMOR_REWARDS]

# ─── PACK.MCMETA ───────────────────────────────────────────────────────────────
write("pack.mcmeta", json.dumps({
    "pack": {
        "pack_format": 107,
        "description": "Rewards — Progressive tool & armour for logs, ores, kills, damage, dirt"
    }
}, indent=2))

# ─── CUSTOM ENCHANTMENT: LIGHTNING ────────────────────────────────────────────
# Item tag for all spear tiers (required by enchantment supported_items)
write("data/rewards/tags/item/spears.json", json.dumps({
    "values": [
        "minecraft:wooden_spear","minecraft:stone_spear","minecraft:iron_spear",
        "minecraft:golden_spear","minecraft:diamond_spear","minecraft:netherite_spear"
    ]
}, indent=2))

# Summons a lightning bolt at the struck entity on every hit.
# supported_items/primary_items must be tag references (not inline lists) in 26.2.
write("data/rewards/enchantment/lightning.json", json.dumps({
    "description": {"text": "Lightning"},
    "supported_items": "#minecraft:enchantable/weapon",
    "primary_items": "#minecraft:enchantable/weapon",
    "weight": 1,
    "max_level": 1,
    "min_cost": {"base": 30, "per_level_above_first": 0},
    "max_cost": {"base": 60, "per_level_above_first": 0},
    "anvil_cost": 6,
    "slots": ["mainhand"],
    "effects": {
        "minecraft:post_attack": [
            {
                "enchanted": "attacker",
                "affected": "victim",
                "effect": {
                    "type": "minecraft:summon_entity",
                    "entity": "minecraft:lightning_bolt"
                }
            }
        ]
    }
}, indent=2))

# ─── CUSTOM ENCHANTMENT: LUNGE (no hunger drain) ──────────────────────────────
# Identical to minecraft:lunge but removes apply_exhaustion and the food-level
# requirement, so players can lunge freely without burning hunger bars.
write("data/rewards/enchantment/lunge.json", json.dumps({
    "description": {"text": "Lunge"},
    "supported_items": "#rewards:spears",
    "primary_items": "#rewards:spears",
    "weight": 1,
    "max_level": 3,
    "min_cost": {"base": 5, "per_level_above_first": 8},
    "max_cost": {"base": 25, "per_level_above_first": 8},
    "anvil_cost": 4,
    "slots": ["hand"],
    "effects": {
        "minecraft:post_attack": [
            {
                "effect": {
                    "type": "minecraft:all_of",
                    "effects": [
                        {
                            "type": "minecraft:change_item_damage",
                            "amount": 1.0
                        },
                        {
                            "type": "minecraft:apply_impulse",
                            "coordinate_scale": [1.0, 0.0, 1.0],
                            "direction": [0.0, 0.0, 1.0],
                            "magnitude": {
                                "type": "minecraft:linear",
                                "base": 0.458,
                                "per_level_above_first": 0.458
                            }
                        },
                        {
                            "type": "minecraft:play_sound",
                            "pitch": 1.0,
                            "sound": [
                                "minecraft:item.spear.lunge_1",
                                "minecraft:item.spear.lunge_2",
                                "minecraft:item.spear.lunge_3"
                            ],
                            "volume": 1.0
                        }
                    ]
                },
                "requirements": {
                    "condition": "minecraft:all_of",
                    "terms": [
                        {
                            "condition": "minecraft:inverted",
                            "term": {
                                "condition": "minecraft:entity_properties",
                                "entity": "this",
                                "predicate": {"minecraft:vehicle": {}}
                            }
                        },
                        {
                            "condition": "minecraft:entity_properties",
                            "entity": "this",
                            "predicate": {"minecraft:flags": {"is_in_water": False}}
                        }
                    ]
                }
            }
        ]
    }
}, indent=2))

# ─── CUSTOM ENCHANTMENT: WINDBURST (sword, no fall required) ─────────────────
# Applies an upward impulse to the attacker on every sword hit — simulates
# Wind Burst III without needing to fall first. Max level 3; magnitude scales
# from 1.0 (I) to 3.0 (III), equivalent to a Wind Burst III smash launch.
write("data/rewards/enchantment/windburst.json", json.dumps({
    "description": {"text": "Windburst"},
    "supported_items": "#minecraft:enchantable/sword",
    "primary_items": "#minecraft:enchantable/sword",
    "weight": 1,
    "max_level": 3,
    "min_cost": {"base": 30, "per_level_above_first": 10},
    "max_cost": {"base": 60, "per_level_above_first": 10},
    "anvil_cost": 8,
    "slots": ["mainhand"],
    "effects": {
        "minecraft:post_attack": [
            {
                "enchanted": "attacker",
                "affected": "attacker",
                "effect": {
                    "type": "minecraft:all_of",
                    "effects": [
                        {
                            "type": "minecraft:apply_impulse",
                            "coordinate_scale": [0.0, 0.0, 0.0],
                            "direction": [0.0, 1.0, 0.0],
                            "magnitude": {
                                "type": "minecraft:linear",
                                "base": 1.0,
                                "per_level_above_first": 1.0
                            }
                        },
                        {
                            "type": "minecraft:play_sound",
                            "pitch": 1.0,
                            "sound": "minecraft:block.wind_charge.burst",
                            "volume": 1.0
                        }
                    ]
                }
            }
        ]
    }
}, indent=2))

# Give function: enchanted book with Windburst III (apply to any sword at anvil)
write("data/rewards/function/give/windburst_sword.mcfunction", "\n".join([
    'give @s minecraft:enchanted_book[stored_enchantments={"rewards:windburst":3}]',
    r'tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Windburst III (Book)","color":"aqua","bold":true}]',
]))

# ─── LOAD / TICK TAGS ──────────────────────────────────────────────────────────
write("data/minecraft/tags/function/load.json",
      json.dumps({"values": ["rewards:load"]}, indent=2))
write("data/minecraft/tags/function/tick.json",
      json.dumps({"values": ["rewards:tick"]}, indent=2))
write("data/minecraft/tags/function/player_join.json",
      json.dumps({"values": ["rewards:player_join"]}, indent=2))
write("data/rewards/function/player_join.mcfunction",
    "execute unless score @s rwd_init matches 1.. run function rewards:player_init"
)

# ─── LOAD FUNCTION ─────────────────────────────────────────────────────────────
LOG_TYPES = ["oak_log","birch_log","spruce_log","jungle_log","acacia_log",
             "dark_oak_log","mangrove_log","cherry_log",
             "oak_wood","birch_wood","spruce_wood","jungle_wood",
             "acacia_wood","dark_oak_wood","mangrove_wood","cherry_wood"]

ORE_TYPES = ["coal_ore","deepslate_coal_ore",
             "iron_ore","deepslate_iron_ore",
             "copper_ore","deepslate_copper_ore",
             "gold_ore","deepslate_gold_ore","nether_gold_ore",
             "lapis_ore","deepslate_lapis_ore",
             "redstone_ore","deepslate_redstone_ore",
             "emerald_ore","deepslate_emerald_ore",
             "diamond_ore","deepslate_diamond_ore",
             "nether_quartz_ore","ancient_debris"]

DIRT_TYPES = ["dirt","coarse_dirt","rooted_dirt","grass_block","mycelium","podzol",
              "farmland","gravel","sand","red_sand","soul_sand","soul_soil","mud",
              "muddy_mangrove_roots"]

# All six spear material tiers (key_fn: strip _spear, take 6 chars)
SPEAR_TYPES = ["wooden_spear","stone_spear","iron_spear","golden_spear","diamond_spear","netherite_spear"]

load_lines = [
    "# Remove any leftover debug objectives",
    "scoreboard objectives remove rwd_test",
    "",
    "# Per-block-type stat objectives",
]
for b in LOG_TYPES:
    load_lines.append(f'scoreboard objectives add st_{b[:12]} minecraft.mined:minecraft.{b}')
for b in ORE_TYPES:
    key = b.replace("deepslate_","ds_").replace("_ore","")[:12]
    load_lines.append(f'scoreboard objectives add st_{key} minecraft.mined:minecraft.{b}')
for b in DIRT_TYPES:
    load_lines.append(f'scoreboard objectives add st_d_{b[:9]} minecraft.mined:minecraft.{b}')
for b in SPEAR_TYPES:
    key = b.replace("_spear","")[:6] + "_sp"
    load_lines.append(f'scoreboard objectives add st_{key} minecraft.used:minecraft.{b}')

load_lines += [
    "",
    "# Running totals and stages",
    "scoreboard objectives add rwd_logs dummy",
    "scoreboard objectives add rwd_log_stage dummy",
    "scoreboard objectives add rwd_ores dummy",
    "scoreboard objectives add rwd_ore_stage dummy",
    "scoreboard objectives add rwd_kills minecraft.custom:minecraft.mob_kills",
    "scoreboard objectives add rwd_tot_kills dummy",
    "scoreboard objectives add rwd_v2 dummy",
    "scoreboard objectives add rwd_kill_stage dummy",
    "scoreboard objectives add rwd_damage minecraft.custom:minecraft.damage_taken",
    "scoreboard objectives add rwd_dmg_stage dummy",
    "scoreboard objectives add rwd_dirt dummy",
    "scoreboard objectives add rwd_dirt_stage dummy",
    "scoreboard objectives remove rwd_shear",
    "scoreboard objectives add rwd_enchanting minecraft.used:minecraft.shears",
    "scoreboard objectives add rwd_shear_stage dummy",
    "scoreboard objectives add rwd_milk minecraft.used:minecraft.bucket",
    "scoreboard objectives add rwd_milk_stage dummy",
    "scoreboard objectives add rwd_egg minecraft.used:minecraft.egg",
    "scoreboard objectives add rwd_egg_stage dummy",
    "scoreboard objectives add rwd_bread minecraft.crafted:minecraft.bread",
    "scoreboard objectives add rwd_bread_stage dummy",
    "scoreboard objectives add rwd_enchant minecraft.custom:minecraft.enchant_item",
    "",
    "# Enchanting counters (mod-based, unlimited)",
    "scoreboard objectives add rwd_enc_m10 dummy",
    "scoreboard objectives add rwd_enc_m50 dummy",
    "scoreboard objectives add rwd_enc_m100 dummy",
    "scoreboard objectives add rwd_enc_delta dummy",
    "",
    "# Weapon kill tracking (window-based detection)",
    "scoreboard objectives add rwd_pkills minecraft.custom:minecraft.player_kills",
    "scoreboard objectives add rwd_mace minecraft.used:minecraft.mace",
    "scoreboard objectives add rwd_spear_used dummy",
    "scoreboard objectives add rwd_spear_ul dummy",
    "scoreboard objectives add rwd_spear_win dummy",
    "scoreboard objectives add rwd_spear_kills dummy",
    "scoreboard objectives add rwd_spear_stage dummy",
    "scoreboard objectives add rwd_mace_ul dummy",
    "scoreboard objectives add rwd_mace_win dummy",
    "scoreboard objectives add rwd_mace_kills dummy",
    "scoreboard objectives add rwd_mace_stage dummy",
    "scoreboard objectives add rwd_all_kills dummy",
    "scoreboard objectives add rwd_kill_snap dummy",
    "scoreboard objectives add rwd_kills_delay dummy",
    "",
    "# Previous-tick snapshots for change detection",
    "scoreboard objectives add rwd_log_last dummy",
    "scoreboard objectives add rwd_ore_last dummy",
    "scoreboard objectives add rwd_kill_last dummy",
    "scoreboard objectives add rwd_dmg_last dummy",
    "scoreboard objectives add rwd_dirt_last dummy",
    "scoreboard objectives add rwd_shear_last dummy",
    "scoreboard objectives add rwd_milk_last dummy",
    "scoreboard objectives add rwd_egg_last dummy",
    "scoreboard objectives add rwd_bread_last dummy",
    "scoreboard objectives add rwd_enchant_last dummy",
    "scoreboard objectives add rwd_spear_kl dummy",

    "scoreboard objectives add rwd_mace_kl dummy",
    "scoreboard objectives add rwd_grapple minecraft.used:minecraft.carrot_on_a_stick",
    "scoreboard objectives add rwd_grapple_last dummy",
    "",
    "scoreboard objectives add anvil trigger",
] + [f"scoreboard objectives add smite_{p} trigger" for p in SMITE_PLAYERS] + [
    f"scoreboard objectives add immortal_{p} trigger" for p in SMITE_PLAYERS
] + [
    f"scoreboard objectives add mortal_{p} trigger" for p in SMITE_PLAYERS
] + [
    "",
    "# Leaderboard trigger objectives (players use /trigger <metric>)",
] + [f'scoreboard objectives add {key} trigger' for key, *_ in LB_METRICS] + [
    "scoreboard objectives add off trigger",
    "scoreboard objectives add metric trigger",
    "",
    "# Set sidebar display names",
] + [f'scoreboard objectives modify {obj} displayname {json.dumps([{"text": label, "color": color, "bold": True}])}'
     for _, obj, label, color in LB_METRICS] + [
    "",
    "# Initialisation flag",
    "scoreboard objectives add rwd_init dummy",
    "",
    "# Initialise any currently-online players",
    "execute as @a unless score @s rwd_init matches 1.. run function rewards:player_init",
    "",
    "# Tick counter on a fake player",
    "scoreboard objectives add rwd_tick dummy",
    "scoreboard players set .tick rwd_tick 0",
    "",
    'tellraw @a {"text":""}',
    r'tellraw @a [{"text":"        ✦ ","color":"dark_gray"},{"text":"R E W A R D S","color":"gold","bold":true},{"text":" ✦","color":"dark_gray"}]',
    r'tellraw @a [{"text":"  ","color":"dark_gray"},{"text":"Chop logs ","color":"green"},{"text":"› ","color":"dark_gray"},{"text":"Mine ores ","color":"aqua"},{"text":"› ","color":"dark_gray"},{"text":"Kill mobs ","color":"red"},{"text":"› ","color":"dark_gray"},{"text":"Take damage ","color":"light_purple"},{"text":"› ","color":"dark_gray"},{"text":"Dig dirt ","color":"yellow"},{"text":"› ","color":"dark_gray"},{"text":"Shear sheep ","color":"white"},{"text":"› ","color":"dark_gray"},{"text":"Milk cows ","color":"dark_green"},{"text":"› ","color":"dark_gray"},{"text":"Throw eggs ","color":"dark_red"},{"text":"› ","color":"dark_gray"},{"text":"Bake bread ","color":"gold"},{"text":"› ","color":"dark_gray"},{"text":"Spear kills ","color":"dark_aqua"},{"text":"› ","color":"dark_gray"},{"text":"Mace kills ","color":"dark_purple"},{"text":"› ","color":"dark_gray"},{"text":"Enchant","color":"light_purple"}]',
    r'tellraw @a [{"text":"  ","color":"dark_gray"},{"text":"Earn better tools & armour as you play.","color":"gray","italic":true}]',
    'tellraw @a {"text":""}',
]
write("data/rewards/function/load.mcfunction", "\n".join(load_lines))

# ─── TICK FUNCTION ─────────────────────────────────────────────────────────────
# player_init, weapon_kill_detect, enchant_check run every game tick (20/sec).
# All milestone checks run at 1 Hz (every 20 ticks).
write("data/rewards/function/tick.mcfunction", """\
execute as @a run function rewards:player_init
execute as @a run function rewards:weapon_kill_detect
execute as @a run function rewards:enchant_check
execute as @a unless score @s rwd_grapple = @s rwd_grapple_last if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{grapple_hook:1b}}}}] at @s anchored eyes run function rewards:grapple_launch
execute as @a run scoreboard players operation @s rwd_grapple_last = @s rwd_grapple
scoreboard players add .tick rwd_tick 1
execute if score .tick rwd_tick matches 20.. run scoreboard players set .tick rwd_tick 0
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_log_stage=..19}] at @s run function rewards:update/logs
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_ore_stage=..19}] at @s run function rewards:update/ores
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dirt_stage=..19}] at @s run function rewards:update/dirt
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_kill_stage=..19}] run function rewards:update/kills
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dmg_stage=..79}] run function rewards:update/damage
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_shear_stage=..19}] run function rewards:update/shear
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_milk_stage=..19}] run function rewards:update/milk
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_egg_stage=..19}] run function rewards:update/egg
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_bread_stage=..19}] run function rewards:update/bread
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_log_stage=..19}] run function rewards:check/logs
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_ore_stage=..19}] run function rewards:check/ores
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_kill_stage=..19}] run function rewards:check/kills
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dmg_stage=..79}] run function rewards:check/damage
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dirt_stage=..19}] run function rewards:check/dirt
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_shear_stage=..19}] run function rewards:check/shear
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_milk_stage=..19}] run function rewards:check/milk
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_egg_stage=..19}] run function rewards:check/egg
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_bread_stage=..19}] run function rewards:check/bread
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_spear_stage=..20}] run function rewards:check/spear
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_mace_stage=..19}] run function rewards:check/mace
execute if score .tick rwd_tick matches 0 run function rewards:lb/tick
""")

# ─── WEAPON KILL DETECTION (runs every tick) ───────────────────────────────────
# Spear: sum all tier uses each tick; if sum increased, open a 20-tick window.
# Mace: track rwd_mace (used:minecraft.mace); if increased, open a 20-tick window.
# If a kill (mob or player) happens while either window is open, credit that weapon.
spear_tier_keys = [b.replace("_spear","")[:6] + "_sp" for b in SPEAR_TYPES]
wkd_lines = ["# Sum all spear tier uses"]
wkd_lines.append("scoreboard players set @s rwd_spear_used 0")
for key in spear_tier_keys:
    wkd_lines.append(f"scoreboard players operation @s rwd_spear_used += @s st_{key}")
wkd_lines += [
    "",
    "# Open spear window if a new jab was detected",
    "execute unless score @s rwd_spear_used = @s rwd_spear_ul run scoreboard players set @s rwd_spear_win 20",
    "scoreboard players operation @s rwd_spear_ul = @s rwd_spear_used",
    "",
    "# Open mace window if mace was swung",
    "execute unless score @s rwd_mace = @s rwd_mace_ul run scoreboard players set @s rwd_mace_win 20",
    "scoreboard players operation @s rwd_mace_ul = @s rwd_mace",
    "",
    "# Compute total kills this tick (mob + player)",
    "scoreboard players set @s rwd_all_kills 0",
    "scoreboard players operation @s rwd_all_kills += @s rwd_kills",
    "scoreboard players operation @s rwd_all_kills += @s rwd_pkills",
    "",
    "# Credit weapon kill if kill happened while window is open",
    "execute if score @s rwd_spear_win matches 1.. if score @s rwd_all_kills > @s rwd_kill_snap if score @s rwd_spear_stage matches ..19 run function rewards:weapon_kill/spear",
    "execute if score @s rwd_mace_win matches 1.. if score @s rwd_all_kills > @s rwd_kill_snap if score @s rwd_mace_stage matches ..19 run function rewards:weapon_kill/mace",
    "",
    "# Decrement open windows",
    "execute if score @s rwd_spear_win matches 1.. run scoreboard players remove @s rwd_spear_win 1",
    "execute if score @s rwd_mace_win matches 1.. run scoreboard players remove @s rwd_mace_win 1",
    "",
    "# Decrement kills-message delay (queues mob-kills progress after weapon kill)",
    "execute if score @s rwd_kills_delay matches 1.. run scoreboard players remove @s rwd_kills_delay 1",
    "",
    "# Sync kill snapshot for next tick",
    "scoreboard players operation @s rwd_kill_snap = @s rwd_all_kills",
]
write("data/rewards/function/weapon_kill_detect.mcfunction", "\n".join(wkd_lines))

# ─── ENCHANTING (unlimited, mod-based) ────────────────────────────────────────
# Runs every tick. Detects new enchants via stat change, then:
#   every enchant → 1 XP bottle   every 10th → mending book   every 50th → anvil
write("data/rewards/function/enchant_check.mcfunction", "\n".join([
    "execute unless score @s rwd_enchant = @s rwd_enchant_last run function rewards:enchant/on_enchant",
    "scoreboard players operation @s rwd_enchant_last = @s rwd_enchant",
]))

write("data/rewards/function/enchant/on_enchant.mcfunction", "\n".join([
    "# Compute delta (how many enchants since last tick)",
    "scoreboard players set @s rwd_enc_delta 0",
    "scoreboard players operation @s rwd_enc_delta += @s rwd_enchant",
    "scoreboard players operation @s rwd_enc_delta -= @s rwd_enchant_last",
    "execute if score @s rwd_enc_delta matches 1.. run function rewards:enchant/give_bottle",
]))

write("data/rewards/function/enchant/give_bottle.mcfunction", "\n".join([
    "give @s minecraft:experience_bottle",
    r'title @s actionbar [{"text":"Enchanting ✦  ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"rwd_enchant"},"color":"white"},{"text":" enchants","color":"gray"}]',
    "scoreboard players remove @s rwd_enc_delta 1",
    "scoreboard players add @s rwd_enc_m10 1",
    "scoreboard players add @s rwd_enc_m50 1",
    "scoreboard players add @s rwd_enc_m100 1",
    "execute if score @s rwd_enc_m10 matches 10.. run function rewards:enchant/give_book",
    "execute if score @s rwd_enc_m50 matches 50.. run function rewards:enchant/give_anvil",
    "execute if score @s rwd_enc_m100 matches 100.. run function rewards:enchant/give_lightning_book",
    "execute if score @s rwd_enc_delta matches 1.. run function rewards:enchant/give_bottle",
]))

write("data/rewards/function/enchant/give_book.mcfunction", "\n".join([
    f"give @s {_MB}",
    r'tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mending Book","color":"aqua","bold":true}]',
    "scoreboard players remove @s rwd_enc_m10 10",
    "execute if score @s rwd_enc_m10 matches 10.. run function rewards:enchant/give_book",
]))

write("data/rewards/function/enchant/give_anvil.mcfunction", "\n".join([
    "give @s minecraft:anvil",
    r'tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Anvil","color":"aqua","bold":true}]',
    "scoreboard players remove @s rwd_enc_m50 50",
    "execute if score @s rwd_enc_m50 matches 50.. run function rewards:enchant/give_anvil",
]))

write("data/rewards/function/enchant/give_lightning_book.mcfunction", "\n".join([
    "give @s minecraft:enchanted_book[stored_enchantments={rewards:lightning:1}]",
    r'tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Lightning Book","color":"aqua","bold":true}]',
    "scoreboard players remove @s rwd_enc_m100 100",
    "execute if score @s rwd_enc_m100 matches 100.. run function rewards:enchant/give_lightning_book",
]))

# When a spear kill is detected: increment counter and show progress
write("data/rewards/function/weapon_kill/spear.mcfunction", "\n".join([
    "scoreboard players add @s rwd_spear_kills 1",
    "scoreboard players set @s rwd_kills_delay 40",
    "function rewards:progress/spear",
]))
write("data/rewards/function/weapon_kill/mace.mcfunction", "\n".join([
    "scoreboard players add @s rwd_mace_kills 1",
    "scoreboard players set @s rwd_kills_delay 40",
    "function rewards:progress/mace",
]))

# ─── UPDATE FUNCTIONS ──────────────────────────────────────────────────────────
def write_update(category, block_list, key_fn, total_obj, last_obj):
    lines = [f"scoreboard players set @s {total_obj} 0"]
    for b in block_list:
        key = key_fn(b)
        lines.append(f"scoreboard players operation @s {total_obj} += @s st_{key}")
    lines += [
        f"execute unless score @s {total_obj} = @s {last_obj} run function rewards:progress/{category}",
        f"scoreboard players operation @s {last_obj} = @s {total_obj}",
    ]
    write(f"data/rewards/function/update/{category}.mcfunction", "\n".join(lines))

def write_update_simple(category, total_obj, last_obj):
    lines = [
        f"execute unless score @s {total_obj} = @s {last_obj} run function rewards:progress/{category}",
        f"scoreboard players operation @s {last_obj} = @s {total_obj}",
    ]
    write(f"data/rewards/function/update/{category}.mcfunction", "\n".join(lines))

write_update("logs", LOG_TYPES, lambda b: b[:12], "rwd_logs", "rwd_log_last")
write_update("ores", ORE_TYPES, lambda b: b.replace("deepslate_","ds_").replace("_ore","")[:12], "rwd_ores", "rwd_ore_last")
write_update("dirt", DIRT_TYPES, lambda b: f"d_{b[:9]}", "rwd_dirt", "rwd_dirt_last")
# Kills: combine mob + player kills into rwd_tot_kills, then queue progress display
# Don't sync rwd_kill_last while delay > 0 so the change is still pending when delay expires
write("data/rewards/function/update/kills.mcfunction", "\n".join([
    "scoreboard players set @s rwd_tot_kills 0",
    "scoreboard players operation @s rwd_tot_kills += @s rwd_kills",
    "scoreboard players operation @s rwd_tot_kills += @s rwd_pkills",
    "execute unless score @s rwd_tot_kills = @s rwd_kill_last if score @s rwd_kills_delay matches 0 run function rewards:progress/kills",
    "execute unless score @s rwd_tot_kills = @s rwd_kill_last if score @s rwd_kills_delay matches 0 run scoreboard players operation @s rwd_kill_last = @s rwd_tot_kills",
]))
write_update_simple("damage",  "rwd_damage",  "rwd_dmg_last")
write_update_simple("shear",   "rwd_enchanting", "rwd_shear_last")
write_update_simple("milk",    "rwd_milk",    "rwd_milk_last")
write_update_simple("egg",     "rwd_egg",     "rwd_egg_last")
write_update_simple("bread",   "rwd_bread",   "rwd_bread_last")

# ─── PROGRESS FUNCTIONS ────────────────────────────────────────────────────────
PROGRESS_COLOR = {
    "logs":    "green",
    "ores":    "aqua",
    "kills":   "red",
    "damage":  "light_purple",
    "dirt":    "yellow",
    "shear":   "white",
    "milk":    "dark_green",
    "egg":     "dark_red",
    "bread":   "gold",
    "spear":   "dark_aqua",
    "mace":    "dark_purple",
}
PROGRESS_LABEL = {
    "logs":    "Chop Logs",
    "ores":    "Mine Ores",
    "kills":   "Mob Kills",
    "damage":  "Damage Taken",
    "dirt":    "Dig Dirt",
    "shear":   "Shear Sheep",
    "milk":    "Milk Cows",
    "egg":     "Throw Eggs",
    "bread":   "Bake Bread",
    "spear":   "Spear Kills",
    "mace":    "Mace Kills",
}

def write_progress(category, total_obj, stage_obj, n_stages, ms):
    color = PROGRESS_COLOR[category]
    label = PROGRESS_LABEL[category]
    lines = []
    for i in range(n_stages):
        next_ms = ms[i]
        lines.append(
            f'execute if score @s {stage_obj} matches {i} run title @s actionbar '
            f'[{{"text":"{label}: ","color":"{color}","bold":true}},'
            f'{{"score":{{"name":"@s","objective":"{total_obj}"}},"color":"white"}},'
            f'{{"text":" / {next_ms}","color":"gray"}}]'
        )
    write(f"data/rewards/function/progress/{category}.mcfunction", "\n".join(lines))

write_progress("logs",    "rwd_logs",       "rwd_log_stage",    20, MILESTONES_20)
write_progress("ores",    "rwd_ores",       "rwd_ore_stage",    20, MILESTONES_20)
write_progress("kills",   "rwd_tot_kills",  "rwd_kill_stage",   20, MILESTONES_20)
write_progress("damage",  "rwd_damage",     "rwd_dmg_stage",    80, MILESTONES_80)
write_progress("dirt",    "rwd_dirt",       "rwd_dirt_stage",   20, MILESTONES_DIRT)
write_progress("shear",   "rwd_enchanting", "rwd_shear_stage",  20, MILESTONES_20)
write_progress("milk",    "rwd_milk",       "rwd_milk_stage",   20, MILESTONES_20)
write_progress("egg",     "rwd_egg",        "rwd_egg_stage",    20, MILESTONES_EGG)
write_progress("bread",   "rwd_bread",      "rwd_bread_stage",  20, MILESTONES_BREAD)
write_progress("spear",   "rwd_spear_kills","rwd_spear_stage",  21, MILESTONES_SPEAR)
write_progress("mace",    "rwd_mace_kills", "rwd_mace_stage",   20, MILESTONES_WEAPON)

# ─── CHECK FUNCTIONS ───────────────────────────────────────────────────────────
def write_check(category, total_obj, stage_obj, rewards_list, n_stages, ms):
    lines = []
    for i, reward in enumerate(rewards_list):
        stage = i
        milestone = ms[i]
        lines.append(
            f"execute if score @s {stage_obj} matches {stage} "
            f"if score @s {total_obj} matches {milestone}.. "
            f"run function rewards:reward/{category}/{i+1}"
        )
    write(f"data/rewards/function/check/{category}.mcfunction", "\n".join(lines))

write_check("logs",    "rwd_logs",       "rwd_log_stage",    AXE_REWARDS,        20, MILESTONES_20)
write_check("ores",    "rwd_ores",       "rwd_ore_stage",    PICK_REWARDS,       20, MILESTONES_20)
write_check("kills",   "rwd_tot_kills",  "rwd_kill_stage",   SWORD_REWARDS,      20, MILESTONES_20)
write_check("damage",  "rwd_damage",     "rwd_dmg_stage",    ARMOR_REWARDS,      80, MILESTONES_80)
write_check("dirt",    "rwd_dirt",       "rwd_dirt_stage",   SHOVEL_REWARDS,     20, MILESTONES_DIRT)
write_check("shear",   "rwd_enchanting", "rwd_shear_stage",  SHEAR_REWARDS,      20, MILESTONES_20)
write_check("milk",    "rwd_milk",       "rwd_milk_stage",   MILK_REWARDS,       20, MILESTONES_20)
write_check("egg",     "rwd_egg",        "rwd_egg_stage",    EGG_REWARDS,        20, MILESTONES_EGG)
write_check("bread",   "rwd_bread",      "rwd_bread_stage",  BREAD_REWARDS,      20, MILESTONES_BREAD)
write_check("spear",   "rwd_spear_kills","rwd_spear_stage",  SPEAR_KILL_REWARDS, 21, MILESTONES_SPEAR)
write_check("mace",    "rwd_mace_kills", "rwd_mace_stage",   MACE_KILL_REWARDS,  20, MILESTONES_WEAPON)

# ─── SILENT INIT FUNCTIONS ─────────────────────────────────────────────────────
LAST_MAP = {
    "rwd_logs":       "rwd_log_last",
    "rwd_ores":       "rwd_ore_last",
    "rwd_tot_kills":  "rwd_kill_last",
    "rwd_damage":     "rwd_dmg_last",
    "rwd_dirt":       "rwd_dirt_last",
    "rwd_enchanting": "rwd_shear_last",
    "rwd_milk":       "rwd_milk_last",
    "rwd_egg":        "rwd_egg_last",
    "rwd_bread":      "rwd_bread_last",
    # weapon kill counters start at 0 — sync their "last" to 0 on init
    "rwd_spear_kills":"rwd_spear_kl",
    "rwd_mace_kills": "rwd_mace_kl",
}

def write_silent_init(category, total_obj, stage_obj, n_stages, ms,
                      block_list=None, key_fn=None):
    lines = []
    if block_list:
        lines.append(f"scoreboard players set @s {total_obj} 0")
        for b in block_list:
            key = key_fn(b)
            lines.append(f"scoreboard players operation @s {total_obj} += @s st_{key}")
    for i, milestone in enumerate(ms):
        lines.append(
            f"execute if score @s {total_obj} matches {milestone}.. "
            f"run scoreboard players set @s {stage_obj} {i+1}"
        )
    lines.append(f"scoreboard players operation @s {LAST_MAP[total_obj]} = @s {total_obj}")
    write(f"data/rewards/function/silent_init/{category}.mcfunction", "\n".join(lines))

write_silent_init("logs",    "rwd_logs",       "rwd_log_stage",    20, MILESTONES_20,
                  LOG_TYPES,  lambda b: b[:12])
write_silent_init("ores",    "rwd_ores",       "rwd_ore_stage",    20, MILESTONES_20,
                  ORE_TYPES,  lambda b: b.replace("deepslate_","ds_").replace("_ore","")[:12])
write_silent_init("kills",   "rwd_tot_kills",  "rwd_kill_stage",   20, MILESTONES_20)
write_silent_init("damage",  "rwd_damage",     "rwd_dmg_stage",    80, MILESTONES_80)
write_silent_init("dirt",    "rwd_dirt",       "rwd_dirt_stage",   20, MILESTONES_DIRT,
                  DIRT_TYPES, lambda b: f"d_{b[:9]}")
write_silent_init("shear",   "rwd_enchanting", "rwd_shear_stage",  20, MILESTONES_20)
write_silent_init("milk",    "rwd_milk",       "rwd_milk_stage",   20, MILESTONES_20)
write_silent_init("egg",     "rwd_egg",        "rwd_egg_stage",    20, MILESTONES_EGG)
write_silent_init("bread",   "rwd_bread",      "rwd_bread_stage",  20, MILESTONES_BREAD)
write_silent_init("spear",   "rwd_spear_kills","rwd_spear_stage",  21, MILESTONES_SPEAR)
write_silent_init("mace",    "rwd_mace_kills", "rwd_mace_stage",   20, MILESTONES_WEAPON)

# ─── PLAYER INIT ───────────────────────────────────────────────────────────────
write("data/rewards/function/player_init.mcfunction", "\n".join([
    "scoreboard players add @s rwd_init 0",
    "execute if score @s rwd_init matches 0 run function rewards:do_init",
    # Migration: runs once for players initialized before v2 objectives were added
    "scoreboard players add @s rwd_v2 0",
    "execute if score @s rwd_v2 matches 0 if score @s rwd_init matches 1.. run function rewards:migrate_v2",
]))

# Migration for players initialized before spear/mace/enchanting track was added.
# Uses "add 0" which is a no-op if the objective already has a value.
write("data/rewards/function/migrate_v2.mcfunction", "\n".join([
    "scoreboard players add @s rwd_spear_kills 0",
    "scoreboard players add @s rwd_spear_stage 0",
    "scoreboard players add @s rwd_spear_win 0",
    "scoreboard players add @s rwd_spear_ul 0",
    "scoreboard players add @s rwd_spear_used 0",
    "scoreboard players add @s rwd_mace_kills 0",
    "scoreboard players add @s rwd_mace_stage 0",
    "scoreboard players add @s rwd_mace_win 0",
    "scoreboard players add @s rwd_mace_ul 0",
    "scoreboard players add @s rwd_kill_snap 0",
    "scoreboard players add @s rwd_kills_delay 0",
    "scoreboard players add @s rwd_tot_kills 0",
    "scoreboard players add @s rwd_enc_m10 0",
    "scoreboard players add @s rwd_enc_m50 0",
    "scoreboard players add @s rwd_enc_m100 0",
    "scoreboard players add @s rwd_enc_delta 0",
    "scoreboard players set @s rwd_v2 1",
    "function rewards:lb/enable_triggers",
]))


write("data/rewards/function/do_init.mcfunction", "\n".join([
    # Stage objectives
    "scoreboard players add @s rwd_log_stage 0",
    "scoreboard players add @s rwd_ore_stage 0",
    "scoreboard players add @s rwd_kill_stage 0",
    "scoreboard players add @s rwd_dmg_stage 0",
    "scoreboard players add @s rwd_dirt_stage 0",
    "scoreboard players add @s rwd_shear_stage 0",
    "scoreboard players add @s rwd_milk_stage 0",
    "scoreboard players add @s rwd_egg_stage 0",
    "scoreboard players add @s rwd_bread_stage 0",
    "scoreboard players add @s rwd_spear_stage 0",
    "scoreboard players add @s rwd_mace_stage 0",
    # Weapon kill window objectives
    "scoreboard players add @s rwd_spear_kills 0",
    "scoreboard players add @s rwd_spear_win 0",
    "scoreboard players add @s rwd_spear_ul 0",
    "scoreboard players add @s rwd_spear_used 0",
    "scoreboard players add @s rwd_mace_kills 0",
    "scoreboard players add @s rwd_mace_win 0",
    "scoreboard players add @s rwd_mace_ul 0",
    "scoreboard players add @s rwd_kill_snap 0",
    "scoreboard players add @s rwd_kills_delay 0",
    "scoreboard players add @s rwd_tot_kills 0",
    # Enchanting mod counters (start fresh — no retroactive book/anvil spam)
    "scoreboard players add @s rwd_enc_m10 0",
    "scoreboard players add @s rwd_enc_m50 0",
    "scoreboard players add @s rwd_enc_m100 0",
    "scoreboard players add @s rwd_enc_delta 0",
    "scoreboard players add @s rwd_grapple 0",
    "scoreboard players operation @s rwd_grapple_last = @s rwd_grapple",
    # Silent init: set stage from existing lifetime stats, no items given
    "function rewards:silent_init/logs",
    "function rewards:silent_init/ores",
    "scoreboard players set @s rwd_tot_kills 0",
    "scoreboard players operation @s rwd_tot_kills += @s rwd_kills",
    "scoreboard players operation @s rwd_tot_kills += @s rwd_pkills",
    "function rewards:silent_init/kills",
    "function rewards:silent_init/damage",
    "function rewards:silent_init/dirt",
    "function rewards:silent_init/shear",
    "function rewards:silent_init/milk",
    "function rewards:silent_init/egg",
    "function rewards:silent_init/bread",
    "function rewards:silent_init/spear",
    "function rewards:silent_init/mace",
    "scoreboard players set @s rwd_init 1",
    "function rewards:lb/enable_triggers",
]))

# ─── ANVIL UTILITY ────────────────────────────────────────────────────────────
# Place an anvil 1 block in front of the player (local ^ coords), mark it with
# an invisible marker armor stand for cleanup, then schedule removal.
write("data/rewards/function/anvil_open.mcfunction", "\n".join([
    "setblock ~ ~5 ~ minecraft:anvil",
    "summon minecraft:armor_stand ~ ~5 ~ {Tags:[\"anvil_mrkr\"],Invisible:1b,Marker:1b,NoGravity:1b,Small:1b}",
    r'title @s actionbar {"text":"Right-click the anvil to use it!","color":"yellow","bold":true}',
    "schedule function rewards:anvil_cleanup 5s append",
]))

write("data/rewards/function/anvil_cleanup.mcfunction", "\n".join([
    "execute as @e[type=minecraft:armor_stand,tag=anvil_mrkr] at @s run setblock ~ ~ ~ minecraft:air",
    "kill @e[type=minecraft:armor_stand,tag=anvil_mrkr]",
]))

# ─── IMMORTAL: MAKE /kill BYPASS INVULNERABILITY TAG ─────────────────────────
# By default minecraft:generic_kill (used by /kill) bypasses Invulnerable:1b.
# Overriding this tag to exclude generic_kill makes truly invulnerable players
# immune to /kill. Non-invulnerable players are unaffected — the tag only
# applies when Invulnerable:1b is set.
write("data/minecraft/tags/damage_type/bypasses_invulnerability.json", json.dumps({
    "replace": True,
    "values": ["minecraft:out_of_world"]
}, indent=2))

# ─── GRAPPLING HOOK ──────────────────────────────────────────────────────────
# Creative-only item: carrot_on_a_stick with custom_data={grapple_hook:1b}.
# On right-click: teleports player 20 blocks in their looking direction.
# No survival crafting recipe — only distributed via /function rewards:give/grappling_hook.
write("data/rewards/function/grapple_launch.mcfunction", "\n".join([
    "tp @s ^ ^ ^20",
    "playsound minecraft:entity.ender_pearl.throw player @s ~ ~ ~ 1.0 1.2",
    r'title @s actionbar {"text":"⬟ Grapple!","color":"aqua","bold":true}',
]))
write("data/rewards/function/give/grappling_hook.mcfunction", "\n".join([
    "give @s minecraft:carrot_on_a_stick"
    "[minecraft:custom_data={grapple_hook:1b},"
    r"""minecraft:item_name='{"text":"Grappling Hook","color":"aqua","italic":false}',"""
    r"""minecraft:lore=['{"text":"Right-click to grapple forward","color":"gray","italic":true}','{"text":"Creative-only","color":"dark_red","italic":true}'],"""
    "minecraft:enchantment_glint_override=true]",
    r'tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Grappling Hook","color":"aqua","bold":true}]',
]))

# ─── SMITE FUNCTIONS ─────────────────────────────────────────────────────────
for _p in SMITE_PLAYERS:
    write(f"data/rewards/function/smite/{_p}.mcfunction", "\n".join([
        f"execute as {_p} at @s run summon minecraft:lightning_bolt",
        f'tellraw @a [{{"text":"⚡ ","color":"yellow"}},{{"text":"{_p}","color":"white","bold":true}},{{"text":" was struck by lightning!","color":"yellow"}}]',
    ]))
    write(f"data/rewards/function/immortal/{_p}.mcfunction", "\n".join([
        f"execute as {_p} run data merge entity @s {{Invulnerable:1b}}",
        f'tellraw @a [{{"text":"🛡 ","color":"aqua"}},{{"text":"{_p}","color":"white","bold":true}},{{"text":" is now immortal!","color":"aqua"}}]',
    ]))
    write(f"data/rewards/function/mortal/{_p}.mcfunction", "\n".join([
        f"execute as {_p} run data merge entity @s {{Invulnerable:0b}}",
        f'tellraw @a [{{"text":"💀 ","color":"red"}},{{"text":"{_p}","color":"white","bold":true}},{{"text":" is now mortal!","color":"red"}}]',
    ]))

# ─── LEADERBOARD FUNCTIONS ────────────────────────────────────────────────────

# Enable all lb_ triggers for the current player (called on init and after use)
write("data/rewards/function/lb/enable_triggers.mcfunction", "\n".join(
    [f"scoreboard players enable @s {key}" for key, *_ in LB_METRICS]
    + ["scoreboard players enable @s off", "scoreboard players enable @s metric",
       "scoreboard players enable @s anvil"]
    + [f"scoreboard players enable @s smite_{p}" for p in SMITE_PLAYERS]
    + [f"scoreboard players enable @s immortal_{p}" for p in SMITE_PLAYERS]
    + [f"scoreboard players enable @s mortal_{p}" for p in SMITE_PLAYERS]
))

# Per-metric switch functions
for key, obj, label, color in LB_METRICS:
    write(f"data/rewards/function/lb/show_{key}.mcfunction", "\n".join([
        f'scoreboard objectives setdisplay sidebar {obj}',
        f'tellraw @a [{{"text":"[Leaderboard] ","color":"gold","bold":true}},{{"text":"Now showing: ","color":"gray"}},{{"text":"{label}","color":"{color}","bold":true}}]',
        "execute as @a run function rewards:lb/enable_triggers",
    ]))

# Turn sidebar off
write("data/rewards/function/lb/show_off.mcfunction", "\n".join([
    "scoreboard objectives setdisplay sidebar",
    r'tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Sidebar hidden.","color":"gray"}]',
    "execute as @a run function rewards:lb/enable_triggers",
]))

# Help menu — clickable list of all metrics
def lb_cmd_entry(key, label, color):
    cmd = f"/trigger {key}"
    return (
        f'{{"text":"  [{label}]","color":"{color}","clickEvent":{{"action":"run_command","value":"{cmd}"}},'
        f'"hoverEvent":{{"action":"show_text","contents":{{"text":"{cmd}","color":"gray"}}}}}}'
    )

help_lines = [
    r'tellraw @a {"text":""}',
    r'tellraw @a [{"text":"  ✦ ","color":"dark_gray"},{"text":"Leaderboard","color":"gold","bold":true},{"text":" — click a metric or type /trigger <name>","color":"gray"}]',
] + [f'tellraw @a [{lb_cmd_entry(key, label, color)}]' for key, _, label, color in LB_METRICS] + [
    f'tellraw @a [{{\"text\":\"  [Hide Sidebar]\",\"color\":\"dark_gray\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/trigger off\"}}}}]',
    r'tellraw @a {"text":""}',
    "execute as @a run function rewards:lb/enable_triggers",
]
write("data/rewards/function/lb/help.mcfunction", "\n".join(help_lines))

# 1hz tick: re-enable triggers and dispatch any activations
lb_tick_lines = ["# Re-enable triggers for all players each second"]
lb_tick_lines += [f"execute as @a run scoreboard players enable @s {key}" for key, *_ in LB_METRICS]
lb_tick_lines += ["execute as @a run scoreboard players enable @s off",
                  "execute as @a run scoreboard players enable @s metric",
                  "execute as @a run scoreboard players enable @s anvil"]
lb_tick_lines += [f"execute as @a run scoreboard players enable @s smite_{p}" for p in SMITE_PLAYERS]
lb_tick_lines += [f"execute as @a run scoreboard players enable @s immortal_{p}" for p in SMITE_PLAYERS]
lb_tick_lines += [f"execute as @a run scoreboard players enable @s mortal_{p}" for p in SMITE_PLAYERS]
lb_tick_lines += ["# Dispatch activations"]
for key, *_ in LB_METRICS:
    lb_tick_lines.append(f"execute as @a[scores={{{key}=1..}}] run function rewards:lb/show_{key}")
lb_tick_lines += [
    "execute as @a[scores={off=1..}] run function rewards:lb/show_off",
    "execute as @a[scores={metric=1..}] run function rewards:lb/help",
    "execute as @a[scores={anvil=1..}] at @s run function rewards:anvil_open",
] + [f"execute as @a[scores={{smite_{p}=1..}}] run function rewards:smite/{p}" for p in SMITE_PLAYERS] + [
    f"execute as @a[scores={{immortal_{p}=1..}}] run function rewards:immortal/{p}" for p in SMITE_PLAYERS
] + [
    f"execute as @a[scores={{mortal_{p}=1..}}] run function rewards:mortal/{p}" for p in SMITE_PLAYERS
] + [
    "# Reset all trigger scores to 0 to prevent re-firing next tick",
] + [f"execute as @a run scoreboard players set @s {key} 0" for key, *_ in LB_METRICS] + [
    "execute as @a run scoreboard players set @s off 0",
    "execute as @a run scoreboard players set @s metric 0",
    "execute as @a run scoreboard players set @s anvil 0",
] + [f"execute as @a run scoreboard players set @s smite_{p} 0" for p in SMITE_PLAYERS] + [
    f"execute as @a run scoreboard players set @s immortal_{p} 0" for p in SMITE_PLAYERS
] + [
    f"execute as @a run scoreboard players set @s mortal_{p} 0" for p in SMITE_PLAYERS
]
write("data/rewards/function/lb/tick.mcfunction", "\n".join(lb_tick_lines))

# Show kills leaderboard by default on load (append to load_lines handled below)
# Written inline in load.mcfunction via an extra line
with open(os.path.join(ROOT, "data/rewards/function/load.mcfunction"), "a") as f:
    f.write("\nscoreboard objectives setdisplay sidebar rwd_tot_kills\n")

# ─── REWARD FUNCTIONS ──────────────────────────────────────────────────────────
STAGE_LABELS = {
    "logs":    "Chop Logs",
    "ores":    "Mine Ores",
    "kills":   "Mob Kills",
    "damage":  "Damage Taken",
    "dirt":    "Dig Dirt",
    "shear":   "Shear Sheep",
    "milk":    "Milk Cows",
    "egg":     "Throw Eggs",
    "bread":   "Bake Bread",
    "spear":   "Spear Kills",
    "mace":    "Mace Kills",
}

def write_rewards(category, rewards_list, n_stages, ms):
    stage_obj = {
        "logs":    "rwd_log_stage",
        "ores":    "rwd_ore_stage",
        "kills":   "rwd_kill_stage",
        "damage":  "rwd_dmg_stage",
        "dirt":    "rwd_dirt_stage",
        "shear":   "rwd_shear_stage",
        "milk":    "rwd_milk_stage",
        "egg":     "rwd_egg_stage",
        "bread":   "rwd_bread_stage",
        "spear":   "rwd_spear_stage",
        "mace":    "rwd_mace_stage",
    }[category]
    cat_label = STAGE_LABELS[category]
    for i, reward in enumerate(rewards_list):
        mat, encs = reward[0], reward[1]
        count = reward[2] if len(reward) > 2 else 1
        display = reward[3] if len(reward) > 3 else None
        extra = reward[4] if len(reward) > 4 else ""
        stage_num = i + 1
        name = display if display else item_name(mat, encs, count)
        content = "\n".join([
            give_cmd(mat, encs, count, extra),
            f"scoreboard players set @s {stage_obj} {stage_num}",
            f'title @s subtitle {{"text":"⭐ {cat_label} — Level {stage_num}  |  {name}","color":"gold"}}',
            f'tellraw @s [{{"text":"[Rewards] ","color":"gold","bold":true}},{{"text":"You received: ","color":"gray"}},{{"text":"{name}","color":"aqua","bold":true}}]',
        ])
        write(f"data/rewards/function/reward/{category}/{stage_num}.mcfunction", content)

write_rewards("logs",    AXE_REWARDS,        20, MILESTONES_20)
write_rewards("ores",    PICK_REWARDS,       20, MILESTONES_20)
write_rewards("kills",   SWORD_REWARDS,      20, MILESTONES_20)
write_rewards("damage",  ARMOR_REWARDS,      80, MILESTONES_80)
write_rewards("dirt",    SHOVEL_REWARDS,     20, MILESTONES_DIRT)
write_rewards("shear",   SHEAR_REWARDS,      20, MILESTONES_20)
write_rewards("milk",    MILK_REWARDS,       20, MILESTONES_20)
write_rewards("egg",     EGG_REWARDS,        20, MILESTONES_EGG)
write_rewards("bread",   BREAD_REWARDS,      20, MILESTONES_BREAD)
write_rewards("spear",   SPEAR_KILL_REWARDS, 21, MILESTONES_SPEAR)
write_rewards("mace",    MACE_KILL_REWARDS,  20, MILESTONES_WEAPON)

# ─── COUNT FILES ───────────────────────────────────────────────────────────────
total = 0
for dirpath, dirnames, filenames in os.walk(ROOT):
    for f in filenames:
        if f != "generate.py":
            total += 1
print(f"Generated {total} datapack files.")
