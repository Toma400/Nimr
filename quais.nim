import std/strformat
import std/strutils
import std/logging
import std/tables
import std/times
import lapis
import nigui

var lnm = {1: "logs/", 2: format(now(), "yyyy MM dd HH mm").replace(" ", "_"), 3: ".log"}.toOrderedTable
var log = newFileLogger(conc(lnm),
                        fmtStr="[$time] - $levelname: ")
log.log(lvlInfo, """Providing log for Quais:
  Directory run: $appdir
""")
#--------------------------------------
# QUAIS STRUCTURE

#--- FIELDS -----
let NAME = "Quais"

type Entry = object
  img:  string
  text: string
proc EntryLapis(): Entry =
  return Entry(img: "", text: "")
proc EntryQuartz(): Entry =
  return Entry(img: "", text: "")

let ENTRIES = @[EntryLapis(),
                EntryQuartz()]

#----------------------------------------
# QUAIS RUN

app.init()

var window = newWindow(NAME)
window.width = 600
window.height = 450
var mainContainer = newLayoutContainer(Layout_Vertical)
mainContainer.padding = 6
window.add(mainContainer)
var inputContainer = newLayoutContainer(Layout_Horizontal)
mainContainer.add(inputContainer)
var inputLabel = newLabel("Input:")
inputContainer.add(inputLabel)
inputLabel.minWidth = 55
inputLabel.heightMode = HeightMode_Fill
var inputTextBox = newTextBox()
inputContainer.add(inputTextBox)
inputTextBox.fontSize = 22
inputTextBox.fontFamily = "Consolas"

window.show()
app.run()