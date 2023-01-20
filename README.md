# WriteProClass

some experiments to create wrapper on WritePro methods

```4d
$doc:=cs.Documen.new()

$doc.appendText("Title")


$doc.export($file /*a 4D.File*/; wk pdf)
```
