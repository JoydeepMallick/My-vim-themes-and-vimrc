"
" Full Colour and 256 Colour
" larsand@gmail.com
"
" Hex colour conversion functions borrowed from the theme "Desert256""

let s:contrast="high"


" Console 256 Colours
"if !has("gui_running")
	"let s:background = "303030"
	"let s:window = "5e5e5e"
    "let s:line = "3a3a3a"
	"let s:selection = "585858"
"end

"grey2 = low contrast grey

if &background == "light"

    " Blueberry light

    let s:background = "d0c8c4"
    let s:background2 = "c7c0bc"
    "let s:blue = "3040a0"
    let s:blue = "322ca8"
    let s:brown = "683020"
    "let s:comment = "737163"
    let s:comment = "506070"
    let s:cyan = "006058"
    let s:foreground = "2c2a2c"
    "let s:foreground = "363436"
    let s:foreground2 = "161416"
    let s:green = "006018"
    "let s:green = "486000"
    let s:grey1 = "505050"        
    let s:grey2 = "707070"
    let s:line = "282a2e"
    let s:orange = "904000"
    let s:purple = "78288e"
    let s:red = "981010"
    let s:selection = "959eaa"
    let s:steel = "184464"
    let s:violet = "802850"
    let s:window = "a0a0a0"
    let s:yellow = "905000"
else
    " TODO: 

    " Blueberry dark

    if s:contrast == "high"
        let s:background = "1a1e22"
        let s:background2 = "24282c"
        "let s:background = "202020"
        "let s:background2 = "282828"
        "let s:background = "282828"
        "let s:background2 = "303030"
    elseif s:contrast == "low"

    else
        let s:background = "2c2c2c"
        let s:background2 = "383838"
    endif

    let s:blue = "6890d8"
    let s:brown = "986858"
    let s:comment = "707070"
    let s:cyan = "65a0b0"
    let s:foreground = "a0a0a0"
    let s:foreground2 = "b8b8b8"
    let s:green = "689878"
    let s:grey1 = "909090"
    let s:grey2 = "788890"
    let s:line = "a12d00"
    let s:orange = "ee835f"
    let s:purple = "a088d0"
    let s:red = "bf5848"
    let s:selection = "405060"
    let s:steel = "8898b8"
    let s:violet = "b87898"
    let s:window = "404040"
    let s:yellow = "d0a654"
endif

hi clear
syntax reset
let g:colors_name = "blueberry"

" Colors for builtin terminal
" Black,  Red,    Green,  Yellow,
" Blue,   Purple, Cyan,   White
let g:terminal_ansi_colors = [
            \ "#".s:background, "#".s:red, "#".s:green, "#".s:yellow,
            \ "#".s:blue, "#".s:purple, "#".s:cyan, "#".s:foreground,   
            \ "#".s:foreground2, "#".s:red, "#".s:green, "#".s:yellow,
            \ "#".s:blue, "#".s:purple, "#".s:cyan, "#".s:foreground ]   
            "\ "#000000", "#000000", "#000000", "#000000",
            "\ "#000000", "#000000", "#000000", "#000000" ]

            "\ "#009090", "#b84050", "#309040", "#c09010",
            "\ "#5080f0", "#c070d0", "#30c0c0", "#00c0c0" ]

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun <SID>grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			lseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun <SID>grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun <SID>grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun <SID>rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun <SID>rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun <SID>rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun <SID>colour(r, g, b)
		" Get the closest grey
		let l:gx = <SID>grey_number(a:r)
		let l:gy = <SID>grey_number(a:g)
		let l:gz = <SID>grey_number(a:b)

		" Get the closest colour
		let l:x = <SID>rgb_number(a:r)
		let l:y = <SID>rgb_number(a:g)
		let l:z = <SID>rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = <SID>grey_level(l:gx) - a:r
			let l:dgg = <SID>grey_level(l:gy) - a:g
			let l:dgb = <SID>grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = <SID>rgb_level(l:gx) - a:r
			let l:dg = <SID>rgb_level(l:gy) - a:g
			let l:db = <SID>rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return <SID>grey_colour(l:gx)
			else
				" Use the colour
				return <SID>rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return <SID>rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

	" Vim Syntax Highlighting
	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Conditional", s:blue, "", "none")
	call <SID>X("Constant", s:purple, "", "")
	call <SID>X("Define", s:brown, "", "none")
	call <SID>X("Directory", s:blue, "", "")
	call <SID>X("FoldColumn", "", s:background, "")
	call <SID>X("Folded", s:comment, s:background, "")
	call <SID>X("Identifier", s:steel, "", "none")
	call <SID>X("Include", s:steel, "", "")
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("PreProc", s:red, "", "")
	call <SID>X("Special", s:purple, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Statement", s:blue, "", "none")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Structure", s:blue, "", "")
	call <SID>X("Terminal", s:foreground, "", "")
	call <SID>X("Type", s:cyan, "", "none")
	call <SID>X("VertSplit", s:window, s:window, "none")
	call <SID>X("Visual", "", s:selection, "")
    call <SID>X("ColorColumn", "", s:line, "none")
    call <SID>X("CursorColumn", "", s:line, "none")
    call <SID>X("Function", s:foreground , "", "")
    call <SID>X("Number", s:violet, "", "")
    call <SID>X("Noise", s:grey2, "", "")
    call <SID>X("PMenu", s:foreground, s:selection, "none")        " completion menu entries
    call <SID>X("PMenuSel", s:foreground, s:selection, "reverse") 
    call <SID>X("Repeat", s:blue, "", "")
    call <SID>X("SignColumn", s:red, s:background, "none")

    call <SID>X("Cursor", s:red, s:background, "reverse")
    call <SID>X("CursorLine", "e0e0e0", "505050", "none")          " ctrl-p selection etc
    call <SID>X("WildMenu", s:background, s:orange, "bold")
    call <SID>X("MoreMsg", s:grey1, "", "")
    call <SID>X("Question", s:grey1, "", "")
    call <SID>X("Error", s:red, s:background, "bold")
    call <SID>X("ErrorMsg", s:red, s:background, "bold")
    call <SID>X("ModeMsg", s:violet, "", "")
    call <SID>X("Underlined", s:blue, "", "")


    if &background == "light"
        call <SID>X("CtrlPMatch", s:red, "", "")
        call <SID>X("DiffAdd", "00ffff", s:grey2, "")
        call <SID>X("FoldColumn", "", s:background, "")
        call <SID>X("LineNr", s:grey2, s:background2, "")
        call <SID>X("MatchParen", "ff5010", "202020", "")
        "call <SID>X("Search", s:foreground, s:window, "")
        call <SID>X("Search", "000000", "b7b0bc", "")
        call <SID>X("StatusLine", "3c6848", "efe8e0", "reverse")
        call <SID>X("StatusLineNC", s:grey1, s:background, "")
        call <SID>X("StatusLineTerm", s:background, "3f683f", "")
        call <SID>X("StatusLineTermNC", "d0d0d0", "484848", "")
        "call <SID>X("Title", "2f7fa7", "", "")
        call <SID>X("Title", s:steel, "", "")
        call <SID>X("Todo", s:orange, s:background, "")
        call <SID>X("WarningMsg", s:orange, "", "")
        call <SID>X("qfError", s:violet, "d0d0d0", "reverse")
        call <SID>X("qfLineNr", s:cyan, s:background, "")
        call <SID>X("TabLine", s:grey1, s:background2, "reverse")
        call <SID>X("TabLineSel", s:steel, s:background, "reverse")
        call <SID>X("TabLineFill", s:grey2, s:foreground, "reverse")

        if !has("gui_running")
            call <SID>X("SpellBad", "ffffff", "bf0000", "")
        end
    else
        call <SID>X("CtrlPMatch", "ffffff", "", "")
        call <SID>X("Cursor", "df0000", s:background, "reverse")
        call <SID>X("CursorLine", "e0e0e0", "505050", "none")          " ctrl-p selection etc
        call <SID>X("CursorLineNr", "df5060", "505050", "none")
        call <SID>X("FoldColumn", s:cyan, s:background, "")
        "call <SID>X("LineNr", "606060", "323232", "")
        call <SID>X("LineNr", "606060", s:background2, "")
        call <SID>X("MatchParen", "ff5010", "202020", "")
        call <SID>X("Search", "b8b8b8", "404060", "")
        call <SID>X("StatusLine", "2f5840", "e0d8c8", "reverse")
        call <SID>X("StatusLineNC", "484848", "c0c0c0", "")
        "call <SID>X("StatusLine", "285040", "d0d0d0", "reverse")
        "call <SID>X("StatusLineNC", "383838", "b0b0b0", "")
        call <SID>X("StatusLineTerm", "000000", "4f7858", "")
        call <SID>X("StatusLineTermNC", "c0c0c0", "484848", "")
        call <SID>X("Title", s:cyan, "", "")
        call <SID>X("Todo", "d7d75f", s:background, "")
        call <SID>X("WarningMsg", "f08040", "", "")
        call <SID>X("qfError", "8f0000", "c0c0c0", "reverse")
        call <SID>X("qfLineNr", "c0c0c0", "", "")
        call <SID>X("TabLine", "303030", "707070", "reverse")
        call <SID>X("TabLineSel", "283870", "888888", "reverse")
        call <SID>X("TabLineFill", s:background2, s:background, "reverse")


        if !has("gui_running")
            call <SID>X("SpellBad", "000000", "bf0000", "")
        end
    endif

	call <SID>X("EasyMotionTarget", "f00000", "", "bold")
	call <SID>X("EasyMotionTarget2First", "009000", "", "bold")
	call <SID>X("EasyMotionTarget2Second", "009000", "", "bold")
	"call <SID>X("EasyMotionTarget", "f00000", "", "reverse")
	"call <SID>X("EasyMotionTarget2First", "608000", "", "reverse")
	"call <SID>X("EasyMotionTarget2Second", "008046", "", "reverse")

    " VimScript Highlighting 
    "call <SID>X("VimParenSep", s:foreground2, "", "")
    call <SID>X("VimVar", s:foreground, "", "")
    call <SID>X("VimFuncVar", s:purple, "", "")
    call <SID>X("VimOption", s:grey1, "", "")
	call <SID>X("vimCommand", s:steel, "", "none")


	" C/C++ Highlighting

    hi link cConditional Conditional
    hi link cCustomFunc Function
    hi link cDefine Define
    hi link cFormat String
    hi link cInclude Include
    hi link cNumber Number
    hi link cOperator Operator
    hi link cPreCondit Define
    hi link cPreProc PreProc
    hi link cRepeat Repeat
    hi link cStatement Statement
    hi link cStucture Structure
    hi link cType Type
    hi link cppNumber Number
    hi link cppStatement Statement
    hi link cppStructure Structure
    hi link cppType Type

	call <SID>X("cppSTLNamespace", s:steel, "", "none")
	call <SID>X("AngleBracketContents", s:purple, "", "none")
	call <SID>X("cCustomAngleBrackets", s:steel, "", "none")
    

	""call <SID>X("cCppOutElse", "ffc8c8", "", "")
    "call <SID>X("cFormat", "90bf90", "", "")
    "call <SID>X("cLabel", s:foreground2, "", "")
    "call <SID>X("cSpecial", "90bf90", "", "")
    call <SID>X("cBlock", "ffff00", "", "")
    call <SID>X("cBracket", "ffff00", "", "")
    call <SID>X("cCustomFunc", s:steel, "", "")
if &background == "light"
    call <SID>X("cCustomClass", s:violet, "", "")
else
    call <SID>X("cCustomClass", s:grey2, "", "")
endif
    "call <SID>X("cCustomScope", s:grey2, "", "")

    call <SID>X("cCustomScope", s:grey2, "", "")
    call <SID>X("cPreCondit", s:red, "", "")
    call <SID>X("cStorageClass", s:purple, "", "")
    call <SID>X("cppCast", s:red, "", "")
    call <SID>X("cppExceptions", s:violet, "", "")
    call <SID>X("cppModifier", s:steel, "", "")
    call <SID>X("cppModifier", s:foreground, "", "")


	" Python Highlighting
    call <SID>X("pythonOperator", s:blue, "", "")
    call <SID>X("pythonSpaceError", s:background, "", "")
	"call <SID>X("pythonAttribute", s:steel, "", "")
	"call <SID>X("PythonStatement", "8090ff", "", "")
	"call <SID>X("pythonConditional", "8090ff", "", "")
    call <SID>X("pythonExceptions", s:violet, "", "")
	"call <SID>X("pythonExceptions", "f07080", "", "")
	"call <SID>X("pythonInclude", "7080ff", "", "")
	"call <SID>X("pythonOperator", "8090ff", "", "")
	"call <SID>X("pythonRepeat", "8090ff", "", "")
	"call <SID>X("pythonStatement", s:purple, "", "")
    "call <SID>X("pythonDecorator", "e06080", "", "")
    "call <SID>X("pythonNumber", "e06080", "", "")

    "hi link pythonFunction Function
    
    hi link PythonNumber Number
    hi link Repeat Statement
    hi link pythonConditional Conditional
    hi link pythonRepeat Repeat
    hi link pythonStatement Statement
 
	call <SID>X("pythonBuiltin", s:purple, "", "")
	call <SID>X("pythonInclude", s:cyan, "", "")
    call <SID>X("pythonDecoratorName", s:red, "", "")
    call <SID>X("pythonFunction", s:foreground, "", "bold")
    call <SID>X("pythonSelf", s:steel, "", "")


	" JavaScript Highlighting
    "
	call <SID>X("javaScriptBraces", s:foreground, "", "")
	call <SID>X("javaScriptFunction", s:purple, "", "")
	call <SID>X("javaScriptConditional", s:purple, "", "")
	call <SID>X("javaScriptRepeat", s:purple, "", "")
	call <SID>X("javaScriptNumber", s:orange, "", "")
	call <SID>X("javaScriptMember", s:orange, "", "")
    call <SID>X("jsThis", s:grey1, "", "")
    hi link jsNumber Number
    hi link jsOperator Operator

	" Go Highlighting
	"call <SID>X("goStatement", s:purple, "", "")
	"call <SID>X("goConditional", s:purple, "", "")
	"call <SID>X("goRepeat", s:purple, "", "")
	"call <SID>X("goException", s:purple, "", "")
	"call <SID>X("goDeclaration", s:blue, "", "")
	"call <SID>X("goConstants", s:yellow, "", "")
	"call <SID>X("goBuiltins", s:orange, "", "")

	" CoffeeScript Highlighting
	call <SID>X("coffeeKeyword", s:purple, "", "")
	call <SID>X("coffeeConditional", s:purple, "", "")

	" Shellscript Highlighting
	call <SID>X("shStatement", s:steel, "", "")
	call <SID>X("shDerefVar", s:foreground, "", "")
	call <SID>X("shDerefSimple", s:cyan, "", "")

    "hi link rustMacro Normal
    hi link rustDecNumber Number
    hi link rustFuncCall Normal
    hi link rustFuncName Function
    hi link rustKeyword Statement
    hi link rustModPath Normal
    hi link rustModPathSep Normal
    hi link rustOperator Normal
    hi link rustString String
    hi link rustCommentLineDoc Comment

    call <SID>X("rustEnumVariant", s:purple, "", "")
    call <SID>X("rustSigil", s:red, "", "")
    call <SID>X("rustFuncName", s:foreground, "", "bold")
    call <SID>X("rustModPathSep",   s:steel, "", "")
    call <SID>X("rustMacro", s:red, "", "")

	" Diff Highlighting
	call <SID>X("diffAdded", s:green, "", "")
	call <SID>X("diffRemoved", s:red, "", "")
    call <SID>X("DiffAdd", s:green, s:background2, "")
    call <SID>X("DiffDelete", s:red, s:background2, "none")
    call <SID>X("DiffChange", s:orange, s:background2, "")
    "call <SID>X("DiffText", s:orange, "000000", "reverse")
    "call <SID>X("DiffText", "d0d0d0", "ae431f", "none")
    call <SID>X("DiffText", "d0d0d0", s:brown, "none")

    " ShowMarks Highlighting
    call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
    call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
    call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
    "call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

    hi link markdownError Normal
    hi link dtsReference Type

    call <SID>X("xmlTagName", s:steel, "", "none")
    call <SID>X("xmlEndTag", s:steel, "", "none")
    call <SID>X("xmlEntity", s:purple, "", "none")
    call <SID>X("xmlDocTypeKeyword", s:violet, "", "none")

    " Cucumber Highlighting
	call <SID>X("cucumberScenario", s:green, "", "")
	call <SID>X("cucumberGiven", s:blue, "", "")
	call <SID>X("cucumberWhen", s:blue, "", "")
	call <SID>X("cucumberWhenAnd", s:blue, "", "")

    hi link ALEError SpellBad
    hi link ALEWarning SpellBad
    hi link ALEErrorSign Error
    hi link ALEWarningSign WarningMsg
    hi link ALEVirtualTextError Error

	" Delete Functions
	delf <SID>X
	delf <SID>rgb
	delf <SID>colour
	delf <SID>rgb_colour
	delf <SID>rgb_level
	delf <SID>rgb_number
	delf <SID>grey_colour
	delf <SID>grey_level
	delf <SID>grey_number
endif