

_marker1 = createMarker ["Mission Area", bulwarkCity];
"Mission Area" setMarkerShape "ELLIPSE";
"Mission Area" setMarkerSize [BULWARK_RADIUS, BULWARK_RADIUS];
"Mission Area" setMarkerColor "ColorWhite";

lootHouses = bulwarkCity nearObjects ["House", BULWARK_RADIUS];