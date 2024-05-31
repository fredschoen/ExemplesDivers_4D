//%attributes = {}
//%attributes = {"invisible":true,"executedOnServer":true,"preemptive":"capable"}
$dataFolder:=Folder:C1567(Get 4D folder:C485(Data folder:K5:33; *); fk platform path:K87:2)
$settingsFolder:=$dataFolder.folder("Settings")
$settingsFolder.create()

$settingsFile:=$settingsFolder.file("settings.4DSettings")

var $stamp : Integer

$stamp:=1

If ($settingsFile.exists)
	
	$path:=$settingsFile.platformPath
	
	$dom:=DOM Parse XML source:C719($path)
	
	$preferences:=DOM Find XML element:C864($dom; "/preferences")
	
	DOM GET XML ATTRIBUTE BY NAME:C728($preferences; "stamp"; $stamp)
	
	DOM SET XML ATTRIBUTE:C866($preferences; "stamp"; $stamp)
	
	DOM EXPORT TO FILE:C862($dom; $path)
	
End if 

$settings:=cs:C1710.Settings.new()

$XML:=$settings.createDefaultSettings($stamp)

$settingsFile.setText($XML; "utf-8")