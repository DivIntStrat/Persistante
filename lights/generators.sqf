_rad = 1500;
private _gen = nearestObjects [[15000, 15000, 15000], ["Land_spp_Transformer_F", "Land_dp_transformer_F"], 21213];
for "_i" from 0 to ((count _gen)-1) do
{
    private _gen_here = nearestObjects [(_gen select _i), ["Land_spp_Transformer_F", "Land_dp_transformer_F"], _rad];
    private _rad2 = (-5000 + 9000*(count _gen_here))/((count _gen_here)^(2)) max 1000;
    (_gen select _i) addAction ["Light ON", {[player, true, 1000, 500] execVM "lights\lamps.sqf";},[],1.5,true,true,"player distance2D (_gen select _i) < 10","true",5]; 
    (_gen select _i) addAction ["Light OFF", {[player, false, 1000, 500] execVM "lights\lamps.sqf";},[],1.5,true,true,"player distance2D (_gen select _i) < 10","true",5];
};
