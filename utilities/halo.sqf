/*
	halo jump script
*/

private _coord2D = [0,0,0];
private _coordZ = [0,0,0];
private _min_height = 1500; // (m) minimal height


{
	private _markerHalo = (markerText _x splitString " ");
	if ("DZ" in _markerHalo)
	then
	{
		_coord2D = getMarkerPos _x;
		_coordZ = [0,0,parseNumber (_markerHalo select 1)];
	};
} forEach allMapMarkers;


private _posHalo = _coord2D vectorAdd _coordZ;


if (_posHalo isEqualTo [0,0,0])
then
{
	hint "Pas de zone de saut, \n définissez une zone de saut.";
	sleep 10;
	hintSilent "";
}
else
{
	if (_posHalo select 2 < _min_height)
	then
	{
		hint "Zone de saut trop basse :/";
	}
	else
	{
		player setPosASL _posHalo; sleep 3; hintSilent "";
	};
};
