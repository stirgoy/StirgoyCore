                ///////////////////////////////////////
                //ArmA Extension: real_date.dll v3.0//
                ///////////////////////////////////////
--------------------------------------------------------------------------------
Extension: real_date http://killzonekid.com/arma-extension-real_date-dll-v3-0/
Author: KillZoneKid http://killzonekid.com/

--------------------------------------------------------------------------------

"real_date" callExtension "ABOUT";
//some useless about info with version number

"real_date" callExtension "0";
//current unix time stamp minus 0; example: 12344455

"real_date" callExtension "12344453";
//current unix time stamp minus 12344453; example: 2

"real_date" callExtension "";
//local date in Arma format; example: [2014,9,24,21,9]

"real_date" callExtension "GMT";
//same as above only in GMT; example: [2014,9,24,20,9]

"real_date" callExtension "+";
//ext date with sec, wday, yday, dst; example: [2014,9,24,21,9,57,3,266,0]

"real_date" callExtension "GMT+";
//same as above only in GMT; example [2014,9,24,20,9,57,3,266,1]
--------------------------------------------------------------------------------
