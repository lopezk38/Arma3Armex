votes = votes + 1;

if (mainFSM_State == "Sandbox") then {
	[Logic, ("A vote was cast to start the operation. " + str(votes) + " of " + str(ceil(((count allPlayers) + .1) / 2)) + " required.")] remoteExec ["globalChat"];
} else {
	[Logic, ("A vote was cast to end the operation. " + str(votes) + " of " + str(ceil(((count allPlayers) + .1) / 2)) + " required.")] remoteExec ["globalChat"];
};

if ((votes / (count allPlayers)) > .5) then {
	if (mainFSM_State == "Sandbox") then {
		opStarted = true;
	};
	if (mainFSM_State == "SubMission") then {
		opEnded = true;
	};
	votes = 0;
};