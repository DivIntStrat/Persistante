/*
    _center     center pos                posx, posy, posz
    _switch     on or off                 bool
    _max_range  max range of interaction (m)
    _speed      speed of interaction     (m/s)
*/


_center = param[0];
_switch = param[1];
_max_range = param[2];
_speed = param[3];

for "_r" from 0 to _max_range do
{
    uiSleep (1/_speed);
    private _l1 = nearestObjects [_center, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], _r];
    private _l2 = nearestObjects [_center, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], _r + 1];
    private _lamps = _l2 - _l1;
    {
        [_x, _switch] call BIS_fnc_switchLamp;
    } forEach _lamps;
};
