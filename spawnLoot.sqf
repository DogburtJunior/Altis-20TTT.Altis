/**
*  spawnLoot
*
*  Spawns loot randomly around the play area
*
*  Domain: Server
**/

params ["_lootHouses"];

/* Master loot spawner */
_houseCount = floor random 3; // Mix up the loot houses a bit
_houseLoot = 0;
_roomCount = 0;
{
	_houseCount = _houseCount + 1;
	if (_houseCount mod LOOT_HOUSE_DISTRIBUTION == 0) then {
		_houseLoot = _houseLoot + 1;

		_lootBulding = _x;
		_lootRooms = _lootBulding buildingPos -1;

		_roomCount = -1;
		{
			_roomCount = _roomCount + 1;
			if (_roomCount mod LOOT_ROOM_DISTRIBUTION == 0) then {

				_lootRoomPos = _x;
				_lootHolder = "WeaponHolderSimulated_Scripted" createVehicle _lootRoomPos;

				switch (floor random 5) do {
					case 0: {
						_weapon = selectRandom LOOT_WEAPON_POOL;
						_ammoArray = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
						_lootHolder addMagazineCargoGlobal [selectRandom _ammoArray, 1];
						_lootHolder addWeaponCargoGlobal [_weapon, 1];
					};
					case 1: {
						_weapon = selectRandom LOOT_WEAPON_POOL;
						_ammoArray = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
						_lootHolder addMagazineCargoGlobal [selectRandom _ammoArray, 1 + (floor random 3)];
					};
					case 2: {
						_items = selectRandom LOOT_ITEM_POOL;
						_lootHolder addItemCargoGlobal [_items, 1];
					};
					case 3: {
						_items = selectRandom LOOT_ITEM_POOL;
						_lootHolder addItemCargoGlobal [_items, 1];
					};
					case 4: {
						_grenade = selectRandom LOOT_GRENADE_POOL;
						_lootHolder addMagazineCargoGlobal [_grenade, 1 + (floor random 3)];
					};
				};
				_lootHolder setPos [_lootRoomPos select 0, _lootRoomPos select 1, (_lootRoomPos select 2) + 0.1];

				//activeLoot pushback _lootHolder; // Add object to array for later cleanup

				[_lootHolder, ['ContainerClosed', { // Add event to delete container if empty
						params ['_container','_player'];
						[_container] call loot_fnc_deleteIfEmpty;
				}]] remoteExec ['addEventHandler', 0];

			};
		} forEach _lootRooms;
		
	};

} forEach _lootHouses;