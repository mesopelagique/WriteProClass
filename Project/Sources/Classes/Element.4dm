Class constructor($element : 4D:C1709.WriteElement; $owner : cs:C1710.Document)
	This:C1470._wrapped:=$element
	This:C1470.owner:=$owner
	// XXX assert $body.owner is $owner._wrapped
	
	
	// MARK: insert
	
Function replaceBy($element : cs:C1710.Element)
	WP INSERT DOCUMENT:C1411(This:C1470.range; $element._wrapped; wk replace:K81:177)
	
Function append($element : cs:C1710.Element)
	WP INSERT DOCUMENT:C1411(This:C1470.range; $element._wrapped; wk append:K81:179)
	
Function preprend($element : cs:C1710.Element)
	WP INSERT DOCUMENT:C1411(This:C1470.range; $element._wrapped; wk prepend:K81:178)
	
	// MARK: text
	
Function appendText($text : Text) : cs:C1710.Element
	var $range : Object
	$range:=This:C1470.range
	WP SET TEXT:C1574($range; $text; wk append:K81:179)
	// TODO: find new range of new object, no change current one object
	return cs:C1710.Element.new(WP Text range:C1341($range.owner; This:C1470.range.end+1; $range.end); This:C1470.owner)
	
Function prependText($text : Text)
	WP SET TEXT:C1574(This:C1470.range; $text; wk prepend:K81:178)
	
Function replaceByText($text : Text)
	WP SET TEXT:C1574(This:C1470.range; $text; wk replace:K81:177)
	
	// MARK: breaks
Function getBreaks($breakType : Integer) : Collection
	var $owner : Object
	$owner:=This:C1470.owner
	return WP Get breaks:C1768(This:C1470.range; $breakType).map(Formula:C1597(cs:C1710.Break.new($1.value; $owner)))
	
Function appendBreak($breakType : Integer) : cs:C1710.Break
	var $range : Object
	$range:=This:C1470.range
	WP INSERT BREAK:C1413($range; $breakType; wk append:K81:179)
	return cs:C1710.Break.new(WP Text range:C1341($range.owner; This:C1470.range.end+1; $range.end); This:C1470.owner)  // ?? maybe do intersect instead
	
Function preprendBreak($breakType : Integer) : cs:C1710.Break
	var $range : Object
	$range:=This:C1470.range
	WP INSERT BREAK:C1413($range; $breakType; wk prepend:K81:178)
	return cs:C1710.Break.new(WP Text range:C1341($range.owner; This:C1470.range.start; This:C1470.range.start+1/*if not 1? use sub*/); This:C1470.owner)  // ?? maybe do intersect instead
	
Function replaceByBreak($breakType : Integer) : cs:C1710.Break
	var $range : Object
	$range:=This:C1470.range
	WP INSERT BREAK:C1413($range; $breakType; wk prepend:K81:178)
	return cs:C1710.Break.new($range; This:C1470.owner)
	
	// MARK: range
	
Function getRange($start : Integer; $end : Integer) : cs:C1710.Element
	return cs:C1710.Element.new(WP Text range:C1341(This:C1470.owner; $start; $end); This:C1470.owner)
	
Function get range()->$range : Object
	$range:=WP Text range:C1341(This:C1470._wrapped; wk start text:K81:165; wk end text:K81:164)
	
Function get startRange()->$range : Object
	$range:=WP Text range:C1341(This:C1470._wrapped; wk start text:K81:165; wk start text:K81:165)
	
Function get endRange()->$range : Object
	$range:=WP Text range:C1341(This:C1470._wrapped; wk end text:K81:164; wk end text:K81:164)
	
Function newDoc() : cs:C1710.Document
	return cs:C1710.Document.new(WP New:C1317(This:C1470.range))
	
	// MARK: links
	
Function get links : Collection
	return WP Get links:C1643(This:C1470.range)
	
Function get link : Object
	var $links : Collection
	$links:=This:C1470.links
	If ($links.length>0)
		return $links[0]
	End if 
	
Function set link($object : Object)
	WP SET LINK:C1642(This:C1470.range; $object)
	
	// MARK: attributes
	
Function getAttribute($name : Text)->$value : Variant
	WP GET ATTRIBUTES:C1345(This:C1470.range; $name; $value)
	
Function setAttribute($name : Text; $value : Variant)
	WP SET ATTRIBUTES:C1342(This:C1470.range; $name; $value)
	
Function setAttributes($any : Variant)
	Case of 
		: (Value type:C1509($any)=Is object:K8:27)
			
			For each ($name; $any)
				WP SET ATTRIBUTES:C1342(This:C1470.range; $name; $any[$type])
			End for each 
			
		: (Value type:C1509($any)=Is collection:K8:32)
			
			// TODO: if col of object key pair, or if key1, val1, key2, val2
			
		Else 
			
			// warn? or support "Copy parameters"
			
			
	End case 
	
	// MARK: bookmark
	
Function bookmark($name : Text)
	WP NEW BOOKMARK:C1415(This:C1470.range; $name)
	
	
	// MARK: sections
	
Function getSections() : Collection
	var $owner : Object
	$owner:=This:C1470.owner
	return WP Get sections:C1580(This:C1470.range).map(Formula:C1597(cs:C1710.Section.new($1.value; $owner)))