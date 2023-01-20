//%attributes = {}


var $doc : cs:C1710.Document

$doc:=cs:C1710.Document.new()

var $body : cs:C1710.Body
$body:=$doc.body

// MARK: sections
var $sections : Collection
$sections:=$body.getSections()

// MARK: breaks
var $break : cs:C1710.Break
var $breaks : Collection
$break:=$body.appendBreak()
$breaks:=$body.getBreaks()
ASSERT:C1129($breaks.length=1)

$break:=$body.appendBreak()
$breaks:=$body.getBreaks()
ASSERT:C1129($breaks.length=2)

$newBreak:=$break.replaceByBreak()
$breaks:=$body.getBreaks()
ASSERT:C1129($breaks.length=2)

$text:=$doc.appendText("Test")
$text:=$text.appendText("TestBold").setAttribute(wk font bold:K81:68; wk true:K81:174)

$doc.export(Folder:C1567(fk desktop folder:K87:19).file("a.pdf"); wk pdf:K81:315)

