# WriteProClass

some experiments to create wrapper on WritePro methods

:warning: do not use in production, it doesn't work

```4d
$doc:=cs.Documen.new()

$doc.appendText("Title")


$doc.export($file /*a 4D.File*/; wk pdf)
```
