/****************************************************************************************************************************************************************
*   Q: What is the identifier?                                                                                                                                  *
*   A: The identifier is a way of efficiently combining multiple boolean options into one number to identify what combination of options your mission is using. *
*   Basically, since a boolean value is either equal to 0 or 1 you can make a larger binary number by contancating them. You can then interpret the whole as a  *
*   normal unsigned binary integer, and convert to decimal. For example, if you have four boolean options you want to represent, you can write them out like so:*
*   	Option 1: false (aka 0)                                                                                                                                 *
*   	Option 2: true  (aka 1)                                                                                                                                 *
*   	Option 3: true  (aka 1)                                                                                                                                 *
*   	Option 4: false (aka 0)                                                                                                                                 *
*   	Combine them together from left to right: 0110                                                                                                          *
*   	Interpret 0110 as an unsigned binary number and convert to decimal: (0 * 2^3) + (1 * 2^2) + (1 * 2^1) + (0 * 2^0) = 0 + 4 + 2 + 0 = 6                   *
*   	Therefore 6 is a unique identifier for that sequence of booleans                                                                                        *
*                                                                                                                                                               *
*   If you want to add another option later on, simply add the new option to the most significant bit (left most). You won't have to change any of your previous*
*   values                                                                                                                                                      *
*                                                                                                                                                               *	
*   The Windows calculator has a built in programmer mode where you can easily type in binary and convert to decimal                                            *
*   If you are a modder looking to add another bit assignment to the identifier, you should do two things                                                       *
*   	1. Edit the switch code in missionFlow.fsm state initSubMission so that your bit assignment actually does something                                     *
*   	2. When adding new assignments, add them from the left (bit 16) to the right. If you only use a couple assignments, any updates that add assignments    *
*   	   of their own likely won't overwrite your assignments since we will be adding them from the right to the left.                                        *
*                                                                                                                                                               *	
*   Current bit assignments:                                                                                                                                    *
*   ┌────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┐  *
*   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  Bit   │  *
*   │  16    │  15    │  14    │  13    │  12    │  11    │  10    │   9    │   8    │   7    │   6    │   5    │   4    │   3    │   2    │   1    │   0    │  *
*   ├────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────┤  *
*   │        │        │        │        │        │        │        │        │        │        │        │        │        │        │Requires│Requires│Requires│  *
*   │        │        │        │        │        │        │        │        │        │        │        │        │        │        │Anti-Air│AntiTank│Vehicle │  *
*   └────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┘  *
*****************************************************************************************************************************************************************/

missionDirectory = "operation\missions\";

missionList = [ //list of mission arrays. Mission array format: ["missionFileName", identifier <integer, see above>]
	//["defendBase.sqf", 0],
	//["attackBase.sqf", 0],
	["deathmatch.sqf", 0]
];