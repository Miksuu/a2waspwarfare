Private["_oldScore","_newScore","_playerChanged"];

_playerChanged = _this select 0;
_newScore = _this select 1;

diag_log "### CHANGE SCORE ###";
diag_log _playerChanged;

diag_log "NEW SCORE:";
diag_log _newScore;

_oldScore = score _playerChanged;

diag_log "OLD SCORE:";
diag_log _oldScore;

_playerChanged addScore -_oldScore;
_playerChanged addScore _newScore;

// WFBE_ChangeScore = [nil,'CLTFNCCHANGESCORE',[_playerChanged,_newScore]];
// publicVariable 'WFBE_ChangeScore';
// if (isHostedServer) then {[nil,'CLTFNCCHANGESCORE',[_playerChanged,_newScore]] Spawn HandlePVF};
[nil, "ChangeScore", [_playerChanged,_newScore]] Call WFBE_CO_FNC_SendToClients;