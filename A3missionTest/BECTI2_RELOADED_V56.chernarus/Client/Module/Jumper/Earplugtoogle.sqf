if(player getvariable["_earplugs", true]) then {
			0.1 fadeSound 0.1;
			player setvariable["_earplugs", false];
			HINT parseText(localize 'STR_HINT_EARPLUGS_INSERTED');
		} else {
			0.1 fadeSound 1;
			player setvariable["_earplugs", true];
			HINT parseText(localize 'STR_HINT_EARPLUGS_REMOVED');
		};