/**
*  editMe
*
*  Defines all global config for the mission
*
*  Domain: Client, Server
**/

/* Loot Blacklist */
LOOT_BLACKLIST = [
    "Weapon_hcl_pistol_DL44",
    "HCL_wp_M134Painless"
];

/* Loot Spawn */
LOOT_WEAPON_POOL    = List_AllWeapons - LOOT_BLACKLIST;    // Classnames of Loot items as an array
LOOT_GRENADE_POOL   = List_Grenades - LOOT_BLACKLIST;
LOOT_ITEM_POOL      = List_Optics - LOOT_BLACKLIST;
/**
*	 Unused Loot.
	LOOT_APPAREL_POOL   = List_AllClothes + List_Vests - LOOT_BLACKLIST;
	LOOT_EXPLOSIVE_POOL = List_Mines - LOOT_BLACKLIST;
	LOOT_STORAGE_POOL   = List_Backpacks - LOOT_BLACKLIST;
**/

/* Random Loot */
LOOT_HOUSE_DISTRIBUTION = 2;  // Every *th house will spwan loot.
LOOT_ROOM_DISTRIBUTION = 4;   // Every *th position, within that house will spawn loot.
LOOT_DISTRIBUTION_OFFSET = 0; // Offset the position by this number.

