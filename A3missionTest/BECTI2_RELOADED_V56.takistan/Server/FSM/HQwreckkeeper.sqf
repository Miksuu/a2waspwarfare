//removes HQ wrecks from a3 garbage collector if in
sleep 30;

_hq1=cti_L_BLU getVariable "cti_hq";
_hq2=cti_L_OPF getVariable "cti_hq";

while {!cti_GameOver} do {

if (isInRemainsCollector _hq1) then {
removeFromRemainsCollector [_hq1];};

if (isInRemainsCollector _hq2) then {
removeFromRemainsCollector [_hq2];};


sleep 20;
};