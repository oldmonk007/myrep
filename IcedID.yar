rule IcedID_init_loader
{
meta:
	description = "Identifies IcedID (stage 1 and 2, initial loaders)."
	author = "@bartblaze"
	date = "2021-01"
	tlp = "White"
	
strings:
	$s1 = "{%0.8X-%0.4X-%0.4X-%0.4X-%0.4X%0.8X}" ascii wide
	$s2 = "%0.2X%0.2X%0.2X%0.2X%0.2X%0.2X%0.8X" ascii wide
	$s3 = "/image/?id=%0.2X%0.8X%0.8X%s" ascii wide
	
	$x1 = "; _gat=" ascii wide
	$x2 = "; _ga=" ascii wide
	$x3 = "; _u=" ascii wide
	$x4 = "; __io=" ascii wide
	$x5 = "; _gid=" ascii wide
	$x6 = "Cookie: __gads=" ascii wide

condition:
	2 of ($s*) or 3 of ($x*)
}

rule IcedID_core_loader
{
meta:
	description = "Identifies IcedID core loader."
	author = "@bartblaze"
	date = "2021-07"
	tlp = "White"
	
strings:
	$code = { 4? 33 d2 4? 85 f6 0f 84 ?? ?? ?? ?? 4? 83 fe 04 0f 
	82 ?? ?? ?? ?? 4? 83 c6 fc 4? 89 74 ?? ?? 4? 85 db 75 ?? 4? 
	85 f6 0f 84 ?? ?? ?? ?? ff 15 ?? ?? ?? ?? 4? 8b c8 4? 8d 46 
	01 8d 53 08 ff 15 ?? ?? ?? ?? 4? 89 44 ?? ?? 4? 8b d8 4? 85 
	c0 0f 84 ?? ?? ?? ?? 4? 8b b? ?? ?? ?? ?? 4? ba 01 00 00 00 }

condition:
	$code
}
