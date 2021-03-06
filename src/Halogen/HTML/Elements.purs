module Halogen.HTML.Elements
  ( Node
  , Leaf
  , NoninteractiveNode
  , NoninteractiveLeaf
  , element
  , a             , a_
  , abbr          , abbr_
  , address       , address_
  , area
  , article       , article_
  , aside         , aside_
  , audio         , audio_
  , b             , b_
  , base
  , bdi           , bdi_
  , bdo           , bdo_
  , blockquote    , blockquote_
  , body          , body_
  , br            , br_
  , button        , button_
  , canvas
  , caption       , caption_
  , cite          , cite_
  , code          , code_
  , col
  , colgroup      , colgroup_
  , command
  , datalist      , datalist_
  , dd            , dd_
  , del           , del_
  , details       , details_
  , dfn           , dfn_
  , dialog        , dialog_
  , div           , div_
  , dl            , dl_
  , dt            , dt_
  , em            , em_
  , embed         , embed_
  , fieldset      , fieldset_
  , figcaption    , figcaption_
  , figure        , figure_
  , footer        , footer_
  , form          , form_
  , h1            , h1_
  , h2            , h2_
  , h3            , h3_
  , h4            , h4_
  , h5            , h5_
  , h6            , h6_
  , head          , head_
  , header        , header_
  , hr            , hr_
  , html          , html_
  , i             , i_
  , iframe
  , img
  , input
  , ins           , ins_
  , kbd           , kbd_
  , keygen
  , label         , label_
  , legend        , legend_
  , li            , li_
  , link
  , main          , main_
  , map           , map_
  , mark          , mark_
  , menu          , menu_
  , menuitem      , menuitem_
  , meta
  , meter         , meter_
  , nav           , nav_
  , noscript      , noscript_
  , object        , object_
  , ol            , ol_
  , optgroup      , optgroup_
  , option        , option_
  , output        , output_
  , p             , p_
  , param
  , pre           , pre_
  , progress      , progress_
  , q             , q_
  , rp            , rp_
  , rt            , rt_
  , ruby          , ruby_
  , samp          , samp_
  , script        , script_
  , section       , section_
  , select        , select_
  , small         , small_
  , source
  , span          , span_
  , strong        , strong_
  , style         , style_
  , sub           , sub_
  , summary       , summary_
  , sup           , sup_
  , table         , table_
  , tbody         , tbody_
  , td            , td_
  , textarea
  , tfoot         , tfoot_
  , th            , th_
  , thead         , thead_
  , time          , time_
  , title         , title_
  , tr            , tr_
  , track
  , u             , u_
  , ul            , ul_
  , var           , var_
  , video         , video_
  , wbr
  ) where

import Halogen.HTML.Core (HTML, Prop, TagName(..))
import Halogen.HTML.Core as Core
import Halogen.HTML.Properties (I, IProp, GlobalProperties, InteractiveEvents)

import Unsafe.Coerce (unsafeCoerce)

-- | An HTML element that admits children.
type Node r p i
   = Array (IProp (InteractiveEvents (GlobalProperties r)) i)
  -> Array (HTML p i)
  -> HTML p i

-- | A `Node` that doesn't support mouse events.
type NoninteractiveNode r p i
   = Array (IProp (GlobalProperties r) i)
  -> Array (HTML p i)
  -> HTML p i

-- | An HTML element that does not admit children.
type Leaf r p i
   = Array (IProp (InteractiveEvents (GlobalProperties r)) i)
  -> HTML p i

-- | An `Leaf` that doesn't support mouse events.
type NoninteractiveLeaf r p i
   = Array (IProp (GlobalProperties r) i)
  -> HTML p i

-- | Creates an HTML element that expects indexed properties.
element :: forall r p i. TagName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i
element = (unsafeCoerce :: (TagName -> Array (Prop i) -> Array (HTML p i) -> HTML p i) -> TagName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i) Core.element

a :: forall p i. Node (download :: I, href :: I, hreflang :: I, mediate :: I, rel :: I, target :: I, mediaType :: I) p i
a = element (TagName "a")

a_ :: forall p i. Array (HTML p i) -> HTML p i
a_ = a []

abbr :: forall p i. Node () p i
abbr = element (TagName "abbr")

abbr_ :: forall p i. Array (HTML p i) -> HTML p i
abbr_ = abbr []

address :: forall p i. Node (onScroll :: I) p i
address = element (TagName "address")

address_ :: forall p i. Array (HTML p i) -> HTML p i
address_ = address []

area :: forall p i. Leaf (coords :: I, download :: I, href :: I, hreflang :: I, media :: I, rel :: I, shape :: I, target :: I, mediaType :: I) p i
area props = element (TagName "area") props []

article :: forall p i. Node () p i
article = element (TagName "article")

article_ :: forall p i. Array (HTML p i) -> HTML p i
article_ = article []

aside :: forall p i. Node () p i
aside = element (TagName "aside")

aside_ :: forall p i. Array (HTML p i) -> HTML p i
aside_ = aside []

audio :: forall p i. Node (autoplay :: I, controls :: I, loop :: I, muted :: I, preload :: I, src :: I) p i
audio = element (TagName "audio")

audio_ :: forall p i. Array (HTML p i) -> HTML p i
audio_ = audio []

b :: forall p i. Node () p i
b = element (TagName "b")

b_ :: forall p i. Array (HTML p i) -> HTML p i
b_ = b []

base :: forall p i. NoninteractiveLeaf (href :: I, target :: I) p i
base props = element (TagName "base") props []

bdi :: forall p i. Node () p i
bdi = element (TagName "bdi")

bdi_ :: forall p i. Array (HTML p i) -> HTML p i
bdi_ = bdi []

bdo :: forall p i. NoninteractiveNode (dir :: I) p i
bdo = element (TagName "bdo")

bdo_ :: forall p i. Array (HTML p i) -> HTML p i
bdo_ = bdo []

blockquote :: forall p i. Node (cite :: I, onScroll :: I) p i
blockquote = element (TagName "blockquote")

blockquote_ :: forall p i. Array (HTML p i) -> HTML p i
blockquote_ = blockquote []

body :: forall p i. Node (onBeforeUnload :: I, onHashChange :: I, onLoad :: I, onPageShow :: I, onPageHide :: I, onResize :: I, onScroll :: I, onUnload :: I) p i
body = element (TagName "body")

body_ :: forall p i. Array (HTML p i) -> HTML p i
body_ = body []

br :: forall p i. NoninteractiveLeaf () p i
br props = element (TagName "br") props []

br_ :: forall p i. HTML p i
br_ = br []

button :: forall p i. Node (autofocus :: I, disabled :: I, form :: I, formaction :: I, formenctyp :: I, formmethod :: I, formnovalidate :: I, formtaget :: I, buttonType :: I, value :: I) p i
button = element (TagName "button")

button_ :: forall p i. Array (HTML p i) -> HTML p i
button_ = button []

canvas :: forall p i. Leaf (width :: I, height :: I) p i
canvas props = element (TagName "canvas") props []

caption :: forall p i. Node (align :: I, onScroll :: I) p i
caption = element (TagName "caption")

caption_ :: forall p i. Array (HTML p i) -> HTML p i
caption_ = caption []

cite :: forall p i. Node () p i
cite = element (TagName "cite")

cite_ :: forall p i. Array (HTML p i) -> HTML p i
cite_ = cite []

code :: forall p i. Node () p i
code = element (TagName "code")

code_ :: forall p i. Array (HTML p i) -> HTML p i
code_ = code []

col :: forall p i. Leaf () p i
col props = element (TagName "col") props []

colgroup :: forall p i. Node (span :: I) p i
colgroup = element (TagName "colgroup")

colgroup_ :: forall p i. Array (HTML p i) -> HTML p i
colgroup_ = colgroup []

command :: forall p i. Leaf () p i
command props = element (TagName "command") props []

datalist :: forall p i. Node () p i
datalist = element (TagName "datalist")

datalist_ :: forall p i. Array (HTML p i) -> HTML p i
datalist_ = datalist []

dd :: forall p i. Node (onScroll :: I) p i
dd = element (TagName "dd")

dd_ :: forall p i. Array (HTML p i) -> HTML p i
dd_ = dd []

del :: forall p i. Node (cite :: I, datetime :: I) p i
del = element (TagName "del")

del_ :: forall p i. Array (HTML p i) -> HTML p i
del_ = del []

details :: forall p i. Node (open :: I) p i
details = element (TagName "details")

details_ :: forall p i. Array (HTML p i) -> HTML p i
details_ = details []

dfn :: forall p i. Node () p i
dfn = element (TagName "dfn")

dfn_ :: forall p i. Array (HTML p i) -> HTML p i
dfn_ = dfn []

dialog :: forall p i. Node (open :: I) p i
dialog = element (TagName "dialog")

dialog_ :: forall p i. Array (HTML p i) -> HTML p i
dialog_ = dialog []

div :: forall p i. Node (onScroll :: I) p i
div = element (TagName "div")

div_ :: forall p i. Array (HTML p i) -> HTML p i
div_ = div []

dl :: forall p i. Node (onScroll :: I) p i
dl = element (TagName "dl")

dl_ :: forall p i. Array (HTML p i) -> HTML p i
dl_ = dl []

dt :: forall p i. Node (onScroll :: I) p i
dt = element (TagName "dt")

dt_ :: forall p i. Array (HTML p i) -> HTML p i
dt_ = dt []

em :: forall p i. Node () p i
em = element (TagName "em")

em_ :: forall p i. Array (HTML p i) -> HTML p i
em_ = em []

embed :: forall p i. Node (height :: I, src :: I, mediaType :: I, width :: I) p i
embed = element (TagName "embed")

embed_ :: forall p i. Array (HTML p i) -> HTML p i
embed_ = embed []

fieldset :: forall p i. Node (disabled :: I, form :: I, onScroll :: I) p i
fieldset = element (TagName "fieldset")

fieldset_ :: forall p i. Array (HTML p i) -> HTML p i
fieldset_ = fieldset []

figcaption :: forall p i. Node () p i
figcaption = element (TagName "figcaption")

figcaption_ :: forall p i. Array (HTML p i) -> HTML p i
figcaption_ = figcaption []

figure :: forall p i. Node () p i
figure = element (TagName "figure")

figure_ :: forall p i. Array (HTML p i) -> HTML p i
figure_ = figure []

footer :: forall p i. Node () p i
footer = element (TagName "footer")

footer_ :: forall p i. Array (HTML p i) -> HTML p i
footer_ = footer []

form :: forall p i. Node (acceptCharset :: I, action :: I, autocomplete :: I, enctype :: I, method :: I, onReset :: I, novalidate :: I, onScroll :: I, onSubmit :: I, target :: I) p i
form = element (TagName "form")

form_ :: forall p i. Array (HTML p i) -> HTML p i
form_ = form []

h1 :: forall p i. Node (onScroll :: I) p i
h1 = element (TagName "h1")

h1_ :: forall p i. Array (HTML p i) -> HTML p i
h1_ = h1 []

h2 :: forall p i. Node (onScroll :: I) p i
h2 = element (TagName "h2")

h2_ :: forall p i. Array (HTML p i) -> HTML p i
h2_ = h1 []

h3 :: forall p i. Node (onScroll :: I) p i
h3 = element (TagName "h3")

h3_ :: forall p i. Array (HTML p i) -> HTML p i
h3_ = h1 []

h4 :: forall p i. Node (onScroll :: I) p i
h4 = element (TagName "h4")

h4_ :: forall p i. Array (HTML p i) -> HTML p i
h4_ = h1 []

h5 :: forall p i. Node (onScroll :: I) p i
h5 = element (TagName "h5")

h5_ :: forall p i. Array (HTML p i) -> HTML p i
h5_ = h1 []

h6 :: forall p i. Node (onScroll :: I) p i
h6 = element (TagName "h6")

h6_ :: forall p i. Array (HTML p i) -> HTML p i
h6_ = h1 []

head :: forall p i. NoninteractiveNode () p i
head = element (TagName "head")

head_ :: forall p i. Array (HTML p i) -> HTML p i
head_ = head []

header :: forall p i. Node () p i
header = element (TagName "header")

header_ :: forall p i. Array (HTML p i) -> HTML p i
header_ = header []

hr :: forall p i. Leaf () p i
hr props = element (TagName "hr") props []

hr_ :: forall p i. HTML p i
hr_ = hr []

html :: forall p i. NoninteractiveNode (manifest :: I, xmlns :: I, onScroll :: I) p i
html = element (TagName "html")

html_ :: forall p i. Array (HTML p i) -> HTML p i
html_ = html []

i :: forall p i. Node () p i
i = element (TagName "i")

i_ :: forall p i. Array (HTML p i) -> HTML p i
i_ = i []

iframe :: forall p i. NoninteractiveLeaf (onLoad :: I, sandbox :: I, scrolling :: I, src :: I, srcdoc :: I, width :: I, height :: I) p i
iframe props = element (TagName "iframe") props []

img :: forall p i. Leaf (alt :: I, crossorigin :: I, height :: I, ismap :: I, longdesc :: I, onAbort :: I, onError :: I, onLoad :: I, src :: I, usemap :: I, width :: I) p i
img props = element (TagName "img") props []

input :: forall p i. Leaf (accept :: I, autocomplete :: I, autofocus :: I, checked :: I, disabled :: I, form :: I, formaction :: I, formenctype :: I, formmethod :: I, formnovalidate :: I, formtarget :: I, height :: I, list :: I, max :: I, min :: I, multiple :: I, onAbort :: I, onChange :: I, onError :: I, onInput :: I, onInvalid :: I, onLoad :: I, onSearch :: I, onSelect :: I, pattern :: I, placeholder :: I, readonly :: I, required :: I, size :: I, src :: I, step :: I, inputType :: I, value :: I, width :: I) p i
input props = element (TagName "input") props []

ins :: forall p i. Node (cite :: I, datetime :: I) p i
ins = element (TagName "ins")

ins_ :: forall p i. Array (HTML p i) -> HTML p i
ins_ = ins []

kbd :: forall p i. Node () p i
kbd = element (TagName "kbd")

kbd_ :: forall p i. Array (HTML p i) -> HTML p i
kbd_ = kbd []

keygen :: forall p i. Leaf (autofocus :: I, challenge :: I, disabled :: I, form :: I, keytype :: I, onChange :: I, onReset :: I, onSelect :: I, onSubmit :: I) p i
keygen props = element (TagName "keygen") props []

label :: forall p i. Node (for :: I, form :: I) p i
label = element (TagName "label")

label_ :: forall p i. Array (HTML p i) -> HTML p i
label_ = label []

legend :: forall p i. Node () p i
legend = element (TagName "legend")

legend_ :: forall p i. Array (HTML p i) -> HTML p i
legend_ = legend []

li :: forall p i. Node (value :: I, onScroll :: I) p i
li = element (TagName "li")

li_ :: forall p i. Array (HTML p i) -> HTML p i
li_ = li []

link :: forall p i. Leaf (crossorigin :: I, href :: I, hreflang :: I, media :: I, onLoad :: I, rel :: I, sizes :: I, mediaType :: I) p i
link props = element (TagName "link") props []

main :: forall p i. Node () p i
main = element (TagName "main")

main_ :: forall p i. Array (HTML p i) -> HTML p i
main_ = main []

map :: forall p i. Node () p i
map = element (TagName "map")

map_ :: forall p i. Array (HTML p i) -> HTML p i
map_ = map []

mark :: forall p i. Node () p i
mark = element (TagName "mark")

mark_ :: forall p i. Array (HTML p i) -> HTML p i
mark_ = mark []

menu :: forall p i. Node (label :: I, onScroll :: I, menuType :: I) p i
menu = element (TagName "menu")

menu_ :: forall p i. Array (HTML p i) -> HTML p i
menu_ = menu []

menuitem :: forall p i. Node (checked :: I, command :: I, default :: I, disabled :: I, icon :: I, label :: I, radiogroup :: I, menuitemType :: I) p i
menuitem = element (TagName "menuitem")

menuitem_ :: forall p i. Array (HTML p i) -> HTML p i
menuitem_ = menuitem []

meta :: forall p i. NoninteractiveLeaf (charset :: I, content :: I, httpEquiv :: I) p i
meta props = element (TagName "meta") props []

meter :: forall p i. Node (form :: I, high :: I, low :: I, max :: I, min :: I, optimum :: I, value :: I) p i
meter = element (TagName "meter")

meter_ :: forall p i. Array (HTML p i) -> HTML p i
meter_ = meter []

nav :: forall p i. Node () p i
nav = element (TagName "nav")

nav_ :: forall p i. Array (HTML p i) -> HTML p i
nav_ = nav []

noscript :: forall p i. Node () p i
noscript = element (TagName "noscript")

noscript_ :: forall p i. Array (HTML p i) -> HTML p i
noscript_ = noscript []

object :: forall p i. Node (data :: I, form :: I, height :: I, onError :: I, onScroll :: I, mediaType :: I, usemap :: I, width :: I) p i
object = element (TagName "object")

object_ :: forall p i. Array (HTML p i) -> HTML p i
object_ = object []

ol :: forall p i. Node (onScroll :: I, reversed :: I, start :: I, olType :: I) p i
ol = element (TagName "ol")

ol_ :: forall p i. Array (HTML p i) -> HTML p i
ol_ = ol []

optgroup :: forall p i. Node (disabled :: I, label :: I) p i
optgroup = element (TagName "optgroup")

optgroup_ :: forall p i. Array (HTML p i) -> HTML p i
optgroup_ = optgroup []

option :: forall p i. Node (disabled :: I, label :: I, selected :: I, value :: I) p i
option = element (TagName "option")

option_ :: forall p i. Array (HTML p i) -> HTML p i
option_ = option []

output :: forall p i. Node (for :: I, form :: I) p i
output = element (TagName "output")

output_ :: forall p i. Array (HTML p i) -> HTML p i
output_ = output []

p :: forall p i. Node (onScroll :: I) p i
p = element (TagName "p")

p_ :: forall p i. Array (HTML p i) -> HTML p i
p_ = p []

param :: forall p i. NoninteractiveLeaf (value :: I) p i
param props = element (TagName "param") props []

pre :: forall p i. Node (onScroll :: I) p i
pre = element (TagName "pre")

pre_ :: forall p i. Array (HTML p i) -> HTML p i
pre_ = pre []

progress :: forall p i. Node (max :: I, value :: I) p i
progress = element (TagName "progress")

progress_ :: forall p i. Array (HTML p i) -> HTML p i
progress_ = progress []

q :: forall p i. Node (cite :: I) p i
q = element (TagName "q")

q_ :: forall p i. Array (HTML p i) -> HTML p i
q_ = q []

rp :: forall p i. Node () p i
rp = element (TagName "rp")

rp_ :: forall p i. Array (HTML p i) -> HTML p i
rp_ = rp []

rt :: forall p i. Node () p i
rt = element (TagName "rt")

rt_ :: forall p i. Array (HTML p i) -> HTML p i
rt_ = rt []

ruby :: forall p i. Node () p i
ruby = element (TagName "ruby")

ruby_ :: forall p i. Array (HTML p i) -> HTML p i
ruby_ = ruby []

samp :: forall p i. Node () p i
samp = element (TagName "samp")

samp_ :: forall p i. Array (HTML p i) -> HTML p i
samp_ = samp []

script :: forall p i. NoninteractiveNode (async :: I, charset :: I, defer :: I, onError :: I, onLoad :: I, src :: I, mediaType :: I) p i
script = element (TagName "script")

script_ :: forall p i. Array (HTML p i) -> HTML p i
script_ = script []

section :: forall p i. Node () p i
section = element (TagName "section")

section_ :: forall p i. Array (HTML p i) -> HTML p i
section_ = section []

select :: forall p i. Node (autofocus :: I, disabled :: I, form :: I, multiple :: I, onChange :: I, onScroll :: I, required :: I, size :: I, value :: I, selectedIndex :: I) p i
select = element (TagName "select")

select_ :: forall p i. Array (HTML p i) -> HTML p i
select_ = select []

small :: forall p i. Node () p i
small = element (TagName "small")

small_ :: forall p i. Array (HTML p i) -> HTML p i
small_ = small []

source :: forall p i. Leaf (media :: I, src :: I, mediaType :: I) p i
source props = element (TagName "source") props []

span :: forall p i. Node () p i
span = element (TagName "span")

span_ :: forall p i. Array (HTML p i) -> HTML p i
span_ = span []

strong :: forall p i. Node () p i
strong = element (TagName "strong")

strong_ :: forall p i. Array (HTML p i) -> HTML p i
strong_ = strong []

style :: forall p i. NoninteractiveNode (media :: I, onError :: I, onLoad :: I, scoped :: I, mediaType :: I) p i
style = element (TagName "style")

style_ :: forall p i. Array (HTML p i) -> HTML p i
style_ = style []

sub :: forall p i. Node () p i
sub = element (TagName "sub")

sub_ :: forall p i. Array (HTML p i) -> HTML p i
sub_ = sub []

summary :: forall p i. Node () p i
summary = element (TagName "summary")

summary_ :: forall p i. Array (HTML p i) -> HTML p i
summary_ = summary []

sup :: forall p i. Node () p i
sup = element (TagName "sup")

sup_ :: forall p i. Array (HTML p i) -> HTML p i
sup_ = sup []

table :: forall p i. Node (sortable :: I) p i
table = element (TagName "table")

table_ :: forall p i. Array (HTML p i) -> HTML p i
table_ = table []

tbody :: forall p i. Node (onScroll :: I) p i
tbody = element (TagName "tbody")

tbody_ :: forall p i. Array (HTML p i) -> HTML p i
tbody_ = tbody []

td :: forall p i. Node (colSpan :: I, headers :: I, rowSpan :: I) p i
td = element (TagName "td")

td_ :: forall p i. Array (HTML p i) -> HTML p i
td_ = td []

textarea :: forall p i. Leaf (autofocus :: I, cols :: I, disabled :: I, form :: I, maxlength :: I, onChange :: I, onInput :: I, onScroll :: I, onSelect :: I, placeholder :: I, readonly :: I, required :: I, rows :: I, value :: I, wrap :: I) p i
textarea es = element (TagName "textarea") es []

tfoot :: forall p i. Node (onScroll :: I) p i
tfoot = element (TagName "tfoot")

tfoot_ :: forall p i. Array (HTML p i) -> HTML p i
tfoot_ = tfoot []

th :: forall p i. Node (abbr :: I, colSpan :: I, headers :: I, rowSpan :: I, scope :: I, sorted :: I) p i
th = element (TagName "th")

th_ :: forall p i. Array (HTML p i) -> HTML p i
th_ = th []

thead :: forall p i. Node () p i
thead = element (TagName "thead")

thead_ :: forall p i. Array (HTML p i) -> HTML p i
thead_ = thead []

time :: forall p i. Node (datetime :: I) p i
time = element (TagName "time")

time_ :: forall p i. Array (HTML p i) -> HTML p i
time_ = time []

title :: forall p i. NoninteractiveNode () p i
title = element (TagName "title")

title_ :: forall p i. Array (HTML p i) -> HTML p i
title_ = title []

tr :: forall p i. Node () p i
tr = element (TagName "tr")

tr_ :: forall p i. Array (HTML p i) -> HTML p i
tr_ = tr []

track :: forall p i. Leaf (default :: I, kind :: I, label :: I, src :: I, srclang :: I) p i
track props = element (TagName "track") props []

u :: forall p i. Node () p i
u = element (TagName "u")

u_ :: forall p i. Array (HTML p i) -> HTML p i
u_ = u []

ul :: forall p i. Node (onScroll :: I) p i
ul = element (TagName "ul")

ul_ :: forall p i. Array (HTML p i) -> HTML p i
ul_ = ul []

var :: forall p i. Node () p i
var = element (TagName "var")

var_ :: forall p i. Array (HTML p i) -> HTML p i
var_ = var []

video :: forall p i. Node (autoplay :: I, controls :: I, height :: I, loop :: I, muted :: I, poster :: I, preload :: I, src :: I, width :: I) p i
video = element (TagName "video")

video_ :: forall p i. Array (HTML p i) -> HTML p i
video_ = video []

wbr :: forall p i. Leaf () p i
wbr props = element (TagName "wbr") props []
