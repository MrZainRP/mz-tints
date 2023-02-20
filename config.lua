Config = {}

------------
--MZ-TINTS--
------------

--Temporary tint trader default location:                           -206.25, -1341.65, 34.89

--Permanent finish trader default location:                         -1812.73, 3092.03, 32.84

Config.TintPED = "ig_kerrymcintosh"                                 -- Ped model to obtain tint tokens  

Config.TintPEDCoords = vector4(-1203.17, -1803.56, 2.91, 66.74)     -- Location of the TintPED where player gets the job. The Blip also uses these coords.

Config.NotifyType = 'okok'                                          -- Change to 'qb' for standard qb-core notifications or 'okok' for okokNotify notifications. 

Config.CansReturned = 20                                            -- Number of temporary weapon tint spray cans exchanged.

Config.MoneyReturn = true                                           -- Change to "false" to disable player receiving money upon trading in XP

Config.MoneyType = "dirtymoney"                                     -- Change to "markedbbills" or "cash" if you want player to receive different types of currency.

----------------
--MZ-SKILLS XP--
----------------

Config.Type1XP = "Hacking"
Config.Type1XPCost = 100
-- if "Config.MoneyReturn = true", then the following parameters apply:
Config.Type1XPReturnLow = 10000
Config.Type1XPReturnHigh = 20000

Config.Type2XP = "Searching"
Config.Type2XPCost = 100
-- if "Config.MoneyReturn = true", then the following parameters apply:
Config.Type2XPReturnLow = 10000
Config.Type2XPReturnHigh = 20000

Config.Type3XP = "Scraping"
Config.Type3XPCost = 100
-- if "Config.MoneyReturn = true", then the following parameters apply:
Config.Type3XPReturnLow = 10000
Config.Type3XPReturnHigh = 20000

Config.Type4XP = "Delivery Runner"
Config.Type4XPCost = 100
-- if "Config.MoneyReturn = true", then the following parameters apply:
Config.Type4XPReturnLow = 10000
Config.Type4XPReturnHigh = 20000

Config.Type5XP = "Electrical"
Config.Type5XPCost = 100
-- if "Config.MoneyReturn = true", then the following parameters apply:
Config.Type5XPReturnLow = 10000
Config.Type5XPReturnHigh = 20000

Config.Type6XP = "Heist Reputation"
Config.Type6XPCost = 100
-- if "Config.MoneyReturn = true", then the following parameters apply:
Config.Type6XPReturnLow = 10000
Config.Type6XPReturnHigh = 20000

-------------
--TINT COST--
-------------

-- Cost in tint tokens.

Config.GreenCost = 1
Config.GoldCost = 1
Config.PinkCost = 1
Config.ArmyCost = 1
Config.PoliceCost = 1
Config.OrangeCost = 1
Config.PlatinumCost = 1

---------------------
--PREMIUM TINT COST--
---------------------

-- Cost in tint tokens. These tints are a permanent addition to the weapon (saved to the database) so the cost should be higher than for coloured tints

Config.PistolFinishCost = 5
Config.APPistolFinishCost = 10
Config.Pistol50FinishCost = 10
Config.MicroSMGFinishCost = 15
Config.SMGFinishCost = 15
Config.AssaultRifleFinishCost = 20
Config.SpecialCarbineFinishCost = 20

