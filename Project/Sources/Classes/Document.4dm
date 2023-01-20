Class extends Element

Class constructor($doc : Object)
	var $_doc : 4D:C1709.WriteDocument
	
	Case of 
		: ($doc=Null:C1517)
			$_doc:=WP New:C1317
		: (OB Instance of:C1731($doc; 4D:C1709.WriteDocument))
			$_doc:=$doc
		: (OB Instance of:C1731($doc; 4D:C1709.File))
			$_doc:=WP Import document:C1318($doc.platformPath)  // option?
		Else 
			ASSERT:C1129(False:C215; "Wront type of doc")
	End case 
	
	Super:C1705($_doc; $_doc)
	
	// MARK: import export
Function import($file : 4D:C1709.File; $option : Variant)
	This:C1470._wrapped:=WP Import document:C1318($file.platformPath; $option)
	
	// TODO add($file: 4D.File; ... // an import from file to add at cursor
	
Function export($file : 4D:C1709.File; $format : Integer; $option : Variant)
	If ($option=Null:C1517)
		WP EXPORT DOCUMENT:C1337(This:C1470._wrapped; $file.platformPath; $format)
	Else 
		WP EXPORT DOCUMENT:C1337(This:C1470._wrapped; $file.platformPath; $format; $option)
	End if 
	// MARK: body
	
Function get body() : cs:C1710.Body
	return cs:C1710.Body.new(WP Get body:C1516(This:C1470._wrapped); This:C1470)
	
	
	// MARK: print
Function print($option : Integer)
	WP PRINT:C1343(This:C1470._wrapped; $option)
	
Function exportToText($format : Integer; $option : Variant) : Text
	var $destination : Text
	If ($option=Null:C1517)
		WP EXPORT VARIABLE:C1319(This:C1470._wrapped; $destination; $format)
	Else 
		WP EXPORT VARIABLE:C1319(This:C1470._wrapped; $destination; $format; $option)
	End if 
	return $destination
	
Function exportToBlob($format : Integer; $option : Variant) : Blob
	var $destination : Blob
	If ($option=Null:C1517)
		WP EXPORT VARIABLE:C1319(This:C1470._wrapped; $destination; $format)
	Else 
		WP EXPORT VARIABLE:C1319(This:C1470._wrapped; $destination; $format; $option)
	End if 
	return $destination