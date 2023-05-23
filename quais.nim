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
  return Entry(img: "", text: "Here is something about lapis!")
proc EntryQuartz(): Entry =
  return Entry(img: "", text: "Here is something about Quartz!")
proc EntryRuby(): Entry =
  return Entry(img: "", text: "Here is something about Ruby!")

# Elements that will be shown in the program (should be of Entry type)
let ENTRIES = @[EntryLapis(),
                EntryQuartz(),
                EntryRuby()]

#----------------------------------------
# QUAIS RUN

app.init()

var window = newWindow(NAME)
window.width = 600
window.height = 450

var menuScreen = newLayoutContainer(Layout_Vertical)
block mS: # menuScreen
  menuScreen.padding = 6
  window.add(menuScreen)

var inputSection = newLayoutContainer(Layout_Horizontal)
var entrySection = newLayoutContainer(Layout_Horizontal)
block sC: # subContainers
  menuScreen.add(inputSection)
  menuScreen.add(entrySection)

var inputLabel = newLabel("Input:")
block iL: # inputLabel
  inputSection.add(inputLabel)
  inputLabel.minWidth = 55
  inputLabel.heightMode = HeightMode_Fill

var inputTextBox = newTextBox()
block iTB: #inputTextBox
  inputSection.add(inputTextBox)
  inputTextBox.fontSize = 22
  inputTextBox.fontFamily = "Consolas"


for entry in ENTRIES:
  var entryPage = newTextArea()
  entrySection.add(entryPage)
  entryPage.fontSize   = 22
  entryPage.fontFamily = "Consolas"
  entryPage.text       = entry.text

#----------

window.show()
app.run()