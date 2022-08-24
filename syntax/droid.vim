" Vim syntax file
" Language: DROID patches
" Maintainer: Der Man mit der Maschine
" Latest Revision: Green 5

if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "droid"

syntax case ignore

" Define colors for the various parts of the patch
hi ioregister ctermfg=green guifg=green
hi inputParameter ctermfg=cyan
hi outputParameter ctermfg=red term=bold
hi circuitHeader ctermfg=magenta term=bold
hi def link wordError Error
hi cable ctermfg=yellow guifg=yellow
hi number ctermfg=blue term=bold
hi comment ctermfg=grey guifg=grey

syn match error "." contained

" syn match number "0" contained
" syn match number /[^a-z]-\?[1-9][0-9]*/me=s+1 contained
" syn match number /-\?\(0\|[1-9][0-9]*\|0![0-9]\+\|[1-9][0-9]\+![0-9]\+\)[V%]\?/ contained
syn match number /\(on\|off\|-\?\([0-9]\|[1-9][0-9]*\)\(\.[0-9]\+\)\?[V%]\?\)/ contained
"syn match number "-\?0\.[0-9]\+V?" contained
"syn match number "-\?[1-9][0-9]*\.[0-9]\+V?" contained

syn match ioregister "[ion][1-8]" contained
syn match ioregister "r[1-9]" contained
syn match ioregister "r[12][0-9]" contained
syn match ioregister "r3[0-2]" contained
syn match ioregister "g[1-9]" contained
syn match ioregister "g1[012]" contained
syn match ioregister "x1" contained
syn match ioregister "[lb]\(1[1-6]\|[1-9]\)\.\([1-2][0-9]\|3[0-2]\|[1-9]\)" contained
syn match ioregister  "[ps]\(1[1-6]\|[1-9]\)\.\(10\|[1-9]\)" contained

syn match cable "_[a-z][a-z0-9_]*" contained

syn match punct "=" contained
syn match punct "\*" contained
syn match punct "+" contained
syn match punct "-" contained
syn match punct " " contained

syn match comment "#.*$" contained
syn match comment "#.*$"


" Controllers
syn match p2b8Header /\[p2b8\]/
hi def link p2b8Header circuitHeader
syn match p4b2Header /\[p4b2\]/
hi def link p4b2Header circuitHeader
syn match b32Header /\[b32\]/
hi def link b32Header circuitHeader
syn match p10Header /\[p10\]/
hi def link p10Header circuitHeader
syn match s10Header /\[s10\]/
hi def link s10Header circuitHeader
syn match m4Header /\[m4\]/
hi def link m4Header circuitHeader
syn match x7Header /\[x7\]/
hi def link x7Header circuitHeader

syn sync minlines=1000


" compare
syn match compareInputParameter "^\s*compare" contained
syn match compareInputParameter "^\s*else" contained
syn match compareInputParameter "^\s*ifequal" contained
syn match compareInputParameter "^\s*ifgreater" contained
syn match compareInputParameter "^\s*ifless" contained
syn match compareInputParameter "^\s*input" contained
syn match compareOutputParameter "^\s*output" contained
syn match compareInputParameter "^\s*precision" contained
syn match compareHeader /\[compare\]/ contained
syn region compareCircuit start=/\[compare\]/ end=/\[/me=s-1 transparent contains=compareHeader,compareInputParameter,compareOutputParameter,ioregister,number,cable,comment
hi def link compareHeader circuitHeader
hi def link compareInputParameter inputParameter
hi def link compareOutputParameter outputParameter


" chord
syn match chordInputParameter "^\s*degree" contained
syn match chordInputParameter "^\s*inversion" contained
syn match chordOutputParameter "^\s*output" contained
syn match chordOutputParameter "^\s*output1" contained
syn match chordOutputParameter "^\s*output2" contained
syn match chordOutputParameter "^\s*output3" contained
syn match chordOutputParameter "^\s*output4" contained
syn match chordInputParameter "^\s*pitch" contained
syn match chordInputParameter "^\s*root" contained
syn match chordInputParameter "^\s*select1" contained
syn match chordInputParameter "^\s*select11" contained
syn match chordInputParameter "^\s*select13" contained
syn match chordInputParameter "^\s*select3" contained
syn match chordInputParameter "^\s*select5" contained
syn match chordInputParameter "^\s*select7" contained
syn match chordInputParameter "^\s*select9" contained
syn match chordInputParameter "^\s*selectfill1" contained
syn match chordInputParameter "^\s*selectfill2" contained
syn match chordInputParameter "^\s*selectfill3" contained
syn match chordInputParameter "^\s*selectfill4" contained
syn match chordInputParameter "^\s*selectfill5" contained
syn match chordInputParameter "^\s*spread" contained
syn match chordInputParameter "^\s*transpose" contained
syn match chordInputParameter "^\s*trigger" contained
syn match chordInputParameter "^\s*tuningmode" contained
syn match chordInputParameter "^\s*tuningpitch" contained
syn match chordHeader /\[chord\]/ contained
syn region chordCircuit start=/\[chord\]/ end=/\[/me=s-1 transparent contains=chordHeader,chordInputParameter,chordOutputParameter,ioregister,number,cable,comment
hi def link chordHeader circuitHeader
hi def link chordInputParameter inputParameter
hi def link chordOutputParameter outputParameter


" buttongroup
syn match buttongroupInputParameter "^\s*button" contained
syn match buttongroupInputParameter "^\s*button1" contained
syn match buttongroupInputParameter "^\s*button10" contained
syn match buttongroupInputParameter "^\s*button11" contained
syn match buttongroupInputParameter "^\s*button12" contained
syn match buttongroupInputParameter "^\s*button13" contained
syn match buttongroupInputParameter "^\s*button14" contained
syn match buttongroupInputParameter "^\s*button15" contained
syn match buttongroupInputParameter "^\s*button16" contained
syn match buttongroupInputParameter "^\s*button2" contained
syn match buttongroupInputParameter "^\s*button3" contained
syn match buttongroupInputParameter "^\s*button4" contained
syn match buttongroupInputParameter "^\s*button5" contained
syn match buttongroupInputParameter "^\s*button6" contained
syn match buttongroupInputParameter "^\s*button7" contained
syn match buttongroupInputParameter "^\s*button8" contained
syn match buttongroupInputParameter "^\s*button9" contained
syn match buttongroupOutputParameter "^\s*buttonpress" contained
syn match buttongroupOutputParameter "^\s*led" contained
syn match buttongroupOutputParameter "^\s*led1" contained
syn match buttongroupOutputParameter "^\s*led10" contained
syn match buttongroupOutputParameter "^\s*led11" contained
syn match buttongroupOutputParameter "^\s*led12" contained
syn match buttongroupOutputParameter "^\s*led13" contained
syn match buttongroupOutputParameter "^\s*led14" contained
syn match buttongroupOutputParameter "^\s*led15" contained
syn match buttongroupOutputParameter "^\s*led16" contained
syn match buttongroupOutputParameter "^\s*led2" contained
syn match buttongroupOutputParameter "^\s*led3" contained
syn match buttongroupOutputParameter "^\s*led4" contained
syn match buttongroupOutputParameter "^\s*led5" contained
syn match buttongroupOutputParameter "^\s*led6" contained
syn match buttongroupOutputParameter "^\s*led7" contained
syn match buttongroupOutputParameter "^\s*led8" contained
syn match buttongroupOutputParameter "^\s*led9" contained
syn match buttongroupOutputParameter "^\s*longpress" contained
syn match buttongroupInputParameter "^\s*maxactive" contained
syn match buttongroupInputParameter "^\s*minactive" contained
syn match buttongroupOutputParameter "^\s*output" contained
syn match buttongroupInputParameter "^\s*select" contained
syn match buttongroupInputParameter "^\s*selectat" contained
syn match buttongroupInputParameter "^\s*value" contained
syn match buttongroupInputParameter "^\s*value1" contained
syn match buttongroupInputParameter "^\s*value10" contained
syn match buttongroupInputParameter "^\s*value11" contained
syn match buttongroupInputParameter "^\s*value12" contained
syn match buttongroupInputParameter "^\s*value13" contained
syn match buttongroupInputParameter "^\s*value14" contained
syn match buttongroupInputParameter "^\s*value15" contained
syn match buttongroupInputParameter "^\s*value16" contained
syn match buttongroupInputParameter "^\s*value2" contained
syn match buttongroupInputParameter "^\s*value3" contained
syn match buttongroupInputParameter "^\s*value4" contained
syn match buttongroupInputParameter "^\s*value5" contained
syn match buttongroupInputParameter "^\s*value6" contained
syn match buttongroupInputParameter "^\s*value7" contained
syn match buttongroupInputParameter "^\s*value8" contained
syn match buttongroupInputParameter "^\s*value9" contained
syn match buttongroupHeader /\[buttongroup\]/ contained
syn region buttongroupCircuit start=/\[buttongroup\]/ end=/\[/me=s-1 transparent contains=buttongroupHeader,buttongroupInputParameter,buttongroupOutputParameter,ioregister,number,cable,comment
hi def link buttongroupHeader circuitHeader
hi def link buttongroupInputParameter inputParameter
hi def link buttongroupOutputParameter outputParameter


" midiout
syn match midioutInputParameter "^\s*activesensing" contained
syn match midioutInputParameter "^\s*allnotesoff" contained
syn match midioutInputParameter "^\s*allsoundoff" contained
syn match midioutInputParameter "^\s*bank" contained
syn match midioutInputParameter "^\s*cc" contained
syn match midioutInputParameter "^\s*cc1" contained
syn match midioutInputParameter "^\s*cc2" contained
syn match midioutInputParameter "^\s*cc3" contained
syn match midioutInputParameter "^\s*cc4" contained
syn match midioutInputParameter "^\s*cc5" contained
syn match midioutInputParameter "^\s*cc6" contained
syn match midioutInputParameter "^\s*cc7" contained
syn match midioutInputParameter "^\s*cc8" contained
syn match midioutInputParameter "^\s*ccnumber" contained
syn match midioutInputParameter "^\s*ccnumber1" contained
syn match midioutInputParameter "^\s*ccnumber2" contained
syn match midioutInputParameter "^\s*ccnumber3" contained
syn match midioutInputParameter "^\s*ccnumber4" contained
syn match midioutInputParameter "^\s*ccnumber5" contained
syn match midioutInputParameter "^\s*ccnumber6" contained
syn match midioutInputParameter "^\s*ccnumber7" contained
syn match midioutInputParameter "^\s*ccnumber8" contained
syn match midioutInputParameter "^\s*cctrigger" contained
syn match midioutInputParameter "^\s*cctrigger1" contained
syn match midioutInputParameter "^\s*cctrigger2" contained
syn match midioutInputParameter "^\s*cctrigger3" contained
syn match midioutInputParameter "^\s*cctrigger4" contained
syn match midioutInputParameter "^\s*cctrigger5" contained
syn match midioutInputParameter "^\s*cctrigger6" contained
syn match midioutInputParameter "^\s*cctrigger7" contained
syn match midioutInputParameter "^\s*cctrigger8" contained
syn match midioutInputParameter "^\s*channel" contained
syn match midioutInputParameter "^\s*channelpressure" contained
syn match midioutInputParameter "^\s*clock" contained
syn match midioutInputParameter "^\s*damper" contained
syn match midioutInputParameter "^\s*gate" contained
syn match midioutInputParameter "^\s*gate1" contained
syn match midioutInputParameter "^\s*gate2" contained
syn match midioutInputParameter "^\s*gate3" contained
syn match midioutInputParameter "^\s*gate4" contained
syn match midioutInputParameter "^\s*gate5" contained
syn match midioutInputParameter "^\s*gate6" contained
syn match midioutInputParameter "^\s*gate7" contained
syn match midioutInputParameter "^\s*gate8" contained
syn match midioutInputParameter "^\s*highestnote" contained
syn match midioutInputParameter "^\s*legato" contained
syn match midioutInputParameter "^\s*lowestnote" contained
syn match midioutInputParameter "^\s*midiclock" contained
syn match midioutInputParameter "^\s*modwheel" contained
syn match midioutInputParameter "^\s*note" contained
syn match midioutInputParameter "^\s*note1" contained
syn match midioutInputParameter "^\s*note10" contained
syn match midioutInputParameter "^\s*note11" contained
syn match midioutInputParameter "^\s*note12" contained
syn match midioutInputParameter "^\s*note13" contained
syn match midioutInputParameter "^\s*note14" contained
syn match midioutInputParameter "^\s*note15" contained
syn match midioutInputParameter "^\s*note16" contained
syn match midioutInputParameter "^\s*note2" contained
syn match midioutInputParameter "^\s*note3" contained
syn match midioutInputParameter "^\s*note4" contained
syn match midioutInputParameter "^\s*note5" contained
syn match midioutInputParameter "^\s*note6" contained
syn match midioutInputParameter "^\s*note7" contained
syn match midioutInputParameter "^\s*note8" contained
syn match midioutInputParameter "^\s*note9" contained
syn match midioutInputParameter "^\s*notegate" contained
syn match midioutInputParameter "^\s*notegate1" contained
syn match midioutInputParameter "^\s*notegate10" contained
syn match midioutInputParameter "^\s*notegate11" contained
syn match midioutInputParameter "^\s*notegate12" contained
syn match midioutInputParameter "^\s*notegate13" contained
syn match midioutInputParameter "^\s*notegate14" contained
syn match midioutInputParameter "^\s*notegate15" contained
syn match midioutInputParameter "^\s*notegate16" contained
syn match midioutInputParameter "^\s*notegate2" contained
syn match midioutInputParameter "^\s*notegate3" contained
syn match midioutInputParameter "^\s*notegate4" contained
syn match midioutInputParameter "^\s*notegate5" contained
syn match midioutInputParameter "^\s*notegate6" contained
syn match midioutInputParameter "^\s*notegate7" contained
syn match midioutInputParameter "^\s*notegate8" contained
syn match midioutInputParameter "^\s*notegate9" contained
syn match midioutInputParameter "^\s*notegatevelocity" contained
syn match midioutInputParameter "^\s*notegatevelocity1" contained
syn match midioutInputParameter "^\s*notegatevelocity10" contained
syn match midioutInputParameter "^\s*notegatevelocity11" contained
syn match midioutInputParameter "^\s*notegatevelocity12" contained
syn match midioutInputParameter "^\s*notegatevelocity13" contained
syn match midioutInputParameter "^\s*notegatevelocity14" contained
syn match midioutInputParameter "^\s*notegatevelocity15" contained
syn match midioutInputParameter "^\s*notegatevelocity16" contained
syn match midioutInputParameter "^\s*notegatevelocity2" contained
syn match midioutInputParameter "^\s*notegatevelocity3" contained
syn match midioutInputParameter "^\s*notegatevelocity4" contained
syn match midioutInputParameter "^\s*notegatevelocity5" contained
syn match midioutInputParameter "^\s*notegatevelocity6" contained
syn match midioutInputParameter "^\s*notegatevelocity7" contained
syn match midioutInputParameter "^\s*notegatevelocity8" contained
syn match midioutInputParameter "^\s*notegatevelocity9" contained
syn match midioutInputParameter "^\s*noteoffvelocity" contained
syn match midioutInputParameter "^\s*noteoffvelocity1" contained
syn match midioutInputParameter "^\s*noteoffvelocity2" contained
syn match midioutInputParameter "^\s*noteoffvelocity3" contained
syn match midioutInputParameter "^\s*noteoffvelocity4" contained
syn match midioutInputParameter "^\s*noteoffvelocity5" contained
syn match midioutInputParameter "^\s*noteoffvelocity6" contained
syn match midioutInputParameter "^\s*noteoffvelocity7" contained
syn match midioutInputParameter "^\s*noteoffvelocity8" contained
syn match midioutInputParameter "^\s*pitch" contained
syn match midioutInputParameter "^\s*pitch1" contained
syn match midioutInputParameter "^\s*pitch2" contained
syn match midioutInputParameter "^\s*pitch3" contained
syn match midioutInputParameter "^\s*pitch4" contained
syn match midioutInputParameter "^\s*pitch5" contained
syn match midioutInputParameter "^\s*pitch6" contained
syn match midioutInputParameter "^\s*pitch7" contained
syn match midioutInputParameter "^\s*pitch8" contained
syn match midioutInputParameter "^\s*pitchbend" contained
syn match midioutInputParameter "^\s*pitchbendrange" contained
syn match midioutInputParameter "^\s*pitchstabilization" contained
syn match midioutInputParameter "^\s*pitchtracking" contained
syn match midioutInputParameter "^\s*portamento" contained
syn match midioutInputParameter "^\s*pressure" contained
syn match midioutInputParameter "^\s*pressure1" contained
syn match midioutInputParameter "^\s*pressure2" contained
syn match midioutInputParameter "^\s*pressure3" contained
syn match midioutInputParameter "^\s*pressure4" contained
syn match midioutInputParameter "^\s*pressure5" contained
syn match midioutInputParameter "^\s*pressure6" contained
syn match midioutInputParameter "^\s*pressure7" contained
syn match midioutInputParameter "^\s*pressure8" contained
syn match midioutInputParameter "^\s*program" contained
syn match midioutInputParameter "^\s*programchange" contained
syn match midioutInputParameter "^\s*running" contained
syn match midioutInputParameter "^\s*select" contained
syn match midioutInputParameter "^\s*selectat" contained
syn match midioutInputParameter "^\s*soft" contained
syn match midioutInputParameter "^\s*sostenuto" contained
syn match midioutInputParameter "^\s*start" contained
syn match midioutInputParameter "^\s*stop" contained
syn match midioutInputParameter "^\s*systemreset" contained
syn match midioutInputParameter "^\s*triggerdelay" contained
syn match midioutInputParameter "^\s*updaterate" contained
syn match midioutInputParameter "^\s*usb" contained
syn match midioutInputParameter "^\s*velocity" contained
syn match midioutInputParameter "^\s*velocity1" contained
syn match midioutInputParameter "^\s*velocity2" contained
syn match midioutInputParameter "^\s*velocity3" contained
syn match midioutInputParameter "^\s*velocity4" contained
syn match midioutInputParameter "^\s*velocity5" contained
syn match midioutInputParameter "^\s*velocity6" contained
syn match midioutInputParameter "^\s*velocity7" contained
syn match midioutInputParameter "^\s*velocity8" contained
syn match midioutInputParameter "^\s*volume" contained
syn match midioutHeader /\[midiout\]/ contained
syn region midioutCircuit start=/\[midiout\]/ end=/\[/me=s-1 transparent contains=midioutHeader,midioutInputParameter,midioutOutputParameter,ioregister,number,cable,comment
hi def link midioutHeader circuitHeader
hi def link midioutInputParameter inputParameter
hi def link midioutOutputParameter outputParameter


" burst
syn match burstInputParameter "^\s*count" contained
syn match burstInputParameter "^\s*hz" contained
syn match burstOutputParameter "^\s*output" contained
syn match burstInputParameter "^\s*rate" contained
syn match burstInputParameter "^\s*reset" contained
syn match burstInputParameter "^\s*skip" contained
syn match burstInputParameter "^\s*taptempo" contained
syn match burstInputParameter "^\s*trigger" contained
syn match burstHeader /\[burst\]/ contained
syn region burstCircuit start=/\[burst\]/ end=/\[/me=s-1 transparent contains=burstHeader,burstInputParameter,burstOutputParameter,ioregister,number,cable,comment
hi def link burstHeader circuitHeader
hi def link burstInputParameter inputParameter
hi def link burstOutputParameter outputParameter


" clocktool
syn match clocktoolInputParameter "^\s*clock" contained
syn match clocktoolInputParameter "^\s*delay" contained
syn match clocktoolInputParameter "^\s*divide" contained
syn match clocktoolInputParameter "^\s*dutycycle" contained
syn match clocktoolInputParameter "^\s*gatelength" contained
syn match clocktoolOutputParameter "^\s*inputpitch" contained
syn match clocktoolInputParameter "^\s*multiply" contained
syn match clocktoolOutputParameter "^\s*output" contained
syn match clocktoolOutputParameter "^\s*outputpitch" contained
syn match clocktoolInputParameter "^\s*reset" contained
syn match clocktoolHeader /\[clocktool\]/ contained
syn region clocktoolCircuit start=/\[clocktool\]/ end=/\[/me=s-1 transparent contains=clocktoolHeader,clocktoolInputParameter,clocktoolOutputParameter,ioregister,number,cable,comment
hi def link clocktoolHeader circuitHeader
hi def link clocktoolInputParameter inputParameter
hi def link clocktoolOutputParameter outputParameter


" lfo
syn match lfoInputParameter "^\s*bipolar" contained
syn match lfoOutputParameter "^\s*cosine" contained
syn match lfoInputParameter "^\s*hz" contained
syn match lfoInputParameter "^\s*level" contained
syn match lfoInputParameter "^\s*offset" contained
syn match lfoOutputParameter "^\s*output" contained
syn match lfoOutputParameter "^\s*paraboloid" contained
syn match lfoInputParameter "^\s*phase" contained
syn match lfoInputParameter "^\s*pulsewidth" contained
syn match lfoOutputParameter "^\s*ramp" contained
syn match lfoInputParameter "^\s*randomize" contained
syn match lfoInputParameter "^\s*rate" contained
syn match lfoOutputParameter "^\s*sawtooth" contained
syn match lfoOutputParameter "^\s*sine" contained
syn match lfoInputParameter "^\s*skew" contained
syn match lfoOutputParameter "^\s*square" contained
syn match lfoInputParameter "^\s*sync" contained
syn match lfoInputParameter "^\s*syncphase" contained
syn match lfoInputParameter "^\s*taptempo" contained
syn match lfoOutputParameter "^\s*triangle" contained
syn match lfoInputParameter "^\s*waveform" contained
syn match lfoHeader /\[lfo\]/ contained
syn region lfoCircuit start=/\[lfo\]/ end=/\[/me=s-1 transparent contains=lfoHeader,lfoInputParameter,lfoOutputParameter,ioregister,number,cable,comment
hi def link lfoHeader circuitHeader
hi def link lfoInputParameter inputParameter
hi def link lfoOutputParameter outputParameter


" random
syn match randomInputParameter "^\s*clock" contained
syn match randomInputParameter "^\s*maximum" contained
syn match randomInputParameter "^\s*minimum" contained
syn match randomOutputParameter "^\s*output" contained
syn match randomInputParameter "^\s*steps" contained
syn match randomHeader /\[random\]/ contained
syn region randomCircuit start=/\[random\]/ end=/\[/me=s-1 transparent contains=randomHeader,randomInputParameter,randomOutputParameter,ioregister,number,cable,comment
hi def link randomHeader circuitHeader
hi def link randomInputParameter inputParameter
hi def link randomOutputParameter outputParameter


" arpeggio
syn match arpeggioInputParameter "^\s*butterfly" contained
syn match arpeggioInputParameter "^\s*clock" contained
syn match arpeggioInputParameter "^\s*degree" contained
syn match arpeggioInputParameter "^\s*direction" contained
syn match arpeggioInputParameter "^\s*drop" contained
syn match arpeggioInputParameter "^\s*octaves" contained
syn match arpeggioOutputParameter "^\s*output" contained
syn match arpeggioInputParameter "^\s*pattern" contained
syn match arpeggioInputParameter "^\s*pingpong" contained
syn match arpeggioInputParameter "^\s*pitch" contained
syn match arpeggioInputParameter "^\s*range" contained
syn match arpeggioInputParameter "^\s*reset" contained
syn match arpeggioInputParameter "^\s*root" contained
syn match arpeggioInputParameter "^\s*select1" contained
syn match arpeggioInputParameter "^\s*select11" contained
syn match arpeggioInputParameter "^\s*select13" contained
syn match arpeggioInputParameter "^\s*select3" contained
syn match arpeggioInputParameter "^\s*select5" contained
syn match arpeggioInputParameter "^\s*select7" contained
syn match arpeggioInputParameter "^\s*select9" contained
syn match arpeggioInputParameter "^\s*selectfill1" contained
syn match arpeggioInputParameter "^\s*selectfill2" contained
syn match arpeggioInputParameter "^\s*selectfill3" contained
syn match arpeggioInputParameter "^\s*selectfill4" contained
syn match arpeggioInputParameter "^\s*selectfill5" contained
syn match arpeggioInputParameter "^\s*startnote" contained
syn match arpeggioInputParameter "^\s*transpose" contained
syn match arpeggioInputParameter "^\s*tuningmode" contained
syn match arpeggioInputParameter "^\s*tuningpitch" contained
syn match arpeggioHeader /\[arpeggio\]/ contained
syn region arpeggioCircuit start=/\[arpeggio\]/ end=/\[/me=s-1 transparent contains=arpeggioHeader,arpeggioInputParameter,arpeggioOutputParameter,ioregister,number,cable,comment
hi def link arpeggioHeader circuitHeader
hi def link arpeggioInputParameter inputParameter
hi def link arpeggioOutputParameter outputParameter


" sample
syn match sampleInputParameter "^\s*bypass" contained
syn match sampleInputParameter "^\s*gate" contained
syn match sampleInputParameter "^\s*input" contained
syn match sampleOutputParameter "^\s*output" contained
syn match sampleInputParameter "^\s*sample" contained
syn match sampleInputParameter "^\s*timewindow" contained
syn match sampleHeader /\[sample\]/ contained
syn region sampleCircuit start=/\[sample\]/ end=/\[/me=s-1 transparent contains=sampleHeader,sampleInputParameter,sampleOutputParameter,ioregister,number,cable,comment
hi def link sampleHeader circuitHeader
hi def link sampleInputParameter inputParameter
hi def link sampleOutputParameter outputParameter


" fold
syn match foldInputParameter "^\s*foldby" contained
syn match foldInputParameter "^\s*input" contained
syn match foldInputParameter "^\s*maximum" contained
syn match foldInputParameter "^\s*minimum" contained
syn match foldOutputParameter "^\s*output" contained
syn match foldHeader /\[fold\]/ contained
syn region foldCircuit start=/\[fold\]/ end=/\[/me=s-1 transparent contains=foldHeader,foldInputParameter,foldOutputParameter,ioregister,number,cable,comment
hi def link foldHeader circuitHeader
hi def link foldInputParameter inputParameter
hi def link foldOutputParameter outputParameter


" droid
syn match droidInputParameter "^\s*ledbrightness" contained
syn match droidInputParameter "^\s*lpfilter" contained
syn match droidInputParameter "^\s*lpfilter1" contained
syn match droidInputParameter "^\s*lpfilter2" contained
syn match droidInputParameter "^\s*lpfilter3" contained
syn match droidInputParameter "^\s*lpfilter4" contained
syn match droidInputParameter "^\s*lpfilter5" contained
syn match droidInputParameter "^\s*lpfilter6" contained
syn match droidInputParameter "^\s*lpfilter7" contained
syn match droidInputParameter "^\s*lpfilter8" contained
syn match droidInputParameter "^\s*maxslope" contained
syn match droidInputParameter "^\s*maxslope1" contained
syn match droidInputParameter "^\s*maxslope2" contained
syn match droidInputParameter "^\s*maxslope3" contained
syn match droidInputParameter "^\s*maxslope4" contained
syn match droidInputParameter "^\s*maxslope5" contained
syn match droidInputParameter "^\s*maxslope6" contained
syn match droidInputParameter "^\s*maxslope7" contained
syn match droidInputParameter "^\s*maxslope8" contained
syn match droidHeader /\[droid\]/ contained
syn region droidCircuit start=/\[droid\]/ end=/\[/me=s-1 transparent contains=droidHeader,droidInputParameter,droidOutputParameter,ioregister,number,cable,comment
hi def link droidHeader circuitHeader
hi def link droidInputParameter inputParameter
hi def link droidOutputParameter outputParameter


" superjust
syn match superjustInputParameter "^\s*bypass" contained
syn match superjustInputParameter "^\s*input" contained
syn match superjustInputParameter "^\s*input1" contained
syn match superjustInputParameter "^\s*input2" contained
syn match superjustInputParameter "^\s*input3" contained
syn match superjustInputParameter "^\s*input4" contained
syn match superjustInputParameter "^\s*input5" contained
syn match superjustInputParameter "^\s*input6" contained
syn match superjustInputParameter "^\s*input7" contained
syn match superjustInputParameter "^\s*input8" contained
syn match superjustOutputParameter "^\s*output" contained
syn match superjustOutputParameter "^\s*output1" contained
syn match superjustOutputParameter "^\s*output2" contained
syn match superjustOutputParameter "^\s*output3" contained
syn match superjustOutputParameter "^\s*output4" contained
syn match superjustOutputParameter "^\s*output5" contained
syn match superjustOutputParameter "^\s*output6" contained
syn match superjustOutputParameter "^\s*output7" contained
syn match superjustOutputParameter "^\s*output8" contained
syn match superjustInputParameter "^\s*transpose" contained
syn match superjustInputParameter "^\s*tuningmode" contained
syn match superjustInputParameter "^\s*tuningpitch" contained
syn match superjustHeader /\[superjust\]/ contained
syn region superjustCircuit start=/\[superjust\]/ end=/\[/me=s-1 transparent contains=superjustHeader,superjustInputParameter,superjustOutputParameter,ioregister,number,cable,comment
hi def link superjustHeader circuitHeader
hi def link superjustInputParameter inputParameter
hi def link superjustOutputParameter outputParameter


" sequencer
syn match sequencerInputParameter "^\s*chaintonext" contained
syn match sequencerInputParameter "^\s*clock" contained
syn match sequencerInputParameter "^\s*cv" contained
syn match sequencerInputParameter "^\s*cv1" contained
syn match sequencerInputParameter "^\s*cv2" contained
syn match sequencerInputParameter "^\s*cv3" contained
syn match sequencerInputParameter "^\s*cv4" contained
syn match sequencerInputParameter "^\s*cv5" contained
syn match sequencerInputParameter "^\s*cv6" contained
syn match sequencerInputParameter "^\s*cv7" contained
syn match sequencerInputParameter "^\s*cv8" contained
syn match sequencerOutputParameter "^\s*cvoutput" contained
syn match sequencerInputParameter "^\s*gate" contained
syn match sequencerInputParameter "^\s*gate1" contained
syn match sequencerInputParameter "^\s*gate2" contained
syn match sequencerInputParameter "^\s*gate3" contained
syn match sequencerInputParameter "^\s*gate4" contained
syn match sequencerInputParameter "^\s*gate5" contained
syn match sequencerInputParameter "^\s*gate6" contained
syn match sequencerInputParameter "^\s*gate7" contained
syn match sequencerInputParameter "^\s*gate8" contained
syn match sequencerInputParameter "^\s*gatelength" contained
syn match sequencerOutputParameter "^\s*gateoutput" contained
syn match sequencerInputParameter "^\s*outputscaling" contained
syn match sequencerInputParameter "^\s*pitch" contained
syn match sequencerInputParameter "^\s*pitch1" contained
syn match sequencerInputParameter "^\s*pitch2" contained
syn match sequencerInputParameter "^\s*pitch3" contained
syn match sequencerInputParameter "^\s*pitch4" contained
syn match sequencerInputParameter "^\s*pitch5" contained
syn match sequencerInputParameter "^\s*pitch6" contained
syn match sequencerInputParameter "^\s*pitch7" contained
syn match sequencerInputParameter "^\s*pitch8" contained
syn match sequencerOutputParameter "^\s*pitchoutput" contained
syn match sequencerInputParameter "^\s*repeat" contained
syn match sequencerInputParameter "^\s*repeat1" contained
syn match sequencerInputParameter "^\s*repeat2" contained
syn match sequencerInputParameter "^\s*repeat3" contained
syn match sequencerInputParameter "^\s*repeat4" contained
syn match sequencerInputParameter "^\s*repeat5" contained
syn match sequencerInputParameter "^\s*repeat6" contained
syn match sequencerInputParameter "^\s*repeat7" contained
syn match sequencerInputParameter "^\s*repeat8" contained
syn match sequencerInputParameter "^\s*reset" contained
syn match sequencerInputParameter "^\s*slew" contained
syn match sequencerInputParameter "^\s*slew1" contained
syn match sequencerInputParameter "^\s*slew2" contained
syn match sequencerInputParameter "^\s*slew3" contained
syn match sequencerInputParameter "^\s*slew4" contained
syn match sequencerInputParameter "^\s*slew5" contained
syn match sequencerInputParameter "^\s*slew6" contained
syn match sequencerInputParameter "^\s*slew7" contained
syn match sequencerInputParameter "^\s*slew8" contained
syn match sequencerInputParameter "^\s*stages" contained
syn match sequencerInputParameter "^\s*steps" contained
syn match sequencerInputParameter "^\s*transpose" contained
syn match sequencerHeader /\[sequencer\]/ contained
syn region sequencerCircuit start=/\[sequencer\]/ end=/\[/me=s-1 transparent contains=sequencerHeader,sequencerInputParameter,sequencerOutputParameter,ioregister,number,cable,comment
hi def link sequencerHeader circuitHeader
hi def link sequencerInputParameter inputParameter
hi def link sequencerOutputParameter outputParameter


" switchedpot
syn match switchedpotInputParameter "^\s*bipolar" contained
syn match switchedpotOutputParameter "^\s*output" contained
syn match switchedpotOutputParameter "^\s*output1" contained
syn match switchedpotOutputParameter "^\s*output2" contained
syn match switchedpotOutputParameter "^\s*output3" contained
syn match switchedpotOutputParameter "^\s*output4" contained
syn match switchedpotOutputParameter "^\s*output5" contained
syn match switchedpotOutputParameter "^\s*output6" contained
syn match switchedpotOutputParameter "^\s*output7" contained
syn match switchedpotOutputParameter "^\s*output8" contained
syn match switchedpotInputParameter "^\s*pot" contained
syn match switchedpotInputParameter "^\s*switch" contained
syn match switchedpotInputParameter "^\s*switch1" contained
syn match switchedpotInputParameter "^\s*switch2" contained
syn match switchedpotInputParameter "^\s*switch3" contained
syn match switchedpotInputParameter "^\s*switch4" contained
syn match switchedpotInputParameter "^\s*switch5" contained
syn match switchedpotInputParameter "^\s*switch6" contained
syn match switchedpotInputParameter "^\s*switch7" contained
syn match switchedpotInputParameter "^\s*switch8" contained
syn match switchedpotHeader /\[switchedpot\]/ contained
syn region switchedpotCircuit start=/\[switchedpot\]/ end=/\[/me=s-1 transparent contains=switchedpotHeader,switchedpotInputParameter,switchedpotOutputParameter,ioregister,number,cable,comment
hi def link switchedpotHeader circuitHeader
hi def link switchedpotInputParameter inputParameter
hi def link switchedpotOutputParameter outputParameter


" matrixmixer
syn match matrixmixerInputParameter "^\s*auxin" contained
syn match matrixmixerInputParameter "^\s*auxin1" contained
syn match matrixmixerInputParameter "^\s*auxin2" contained
syn match matrixmixerInputParameter "^\s*auxin3" contained
syn match matrixmixerInputParameter "^\s*auxin4" contained
syn match matrixmixerInputParameter "^\s*button1" contained
syn match matrixmixerInputParameter "^\s*button11" contained
syn match matrixmixerInputParameter "^\s*button12" contained
syn match matrixmixerInputParameter "^\s*button13" contained
syn match matrixmixerInputParameter "^\s*button14" contained
syn match matrixmixerInputParameter "^\s*button2" contained
syn match matrixmixerInputParameter "^\s*button21" contained
syn match matrixmixerInputParameter "^\s*button22" contained
syn match matrixmixerInputParameter "^\s*button23" contained
syn match matrixmixerInputParameter "^\s*button24" contained
syn match matrixmixerInputParameter "^\s*button3" contained
syn match matrixmixerInputParameter "^\s*button31" contained
syn match matrixmixerInputParameter "^\s*button32" contained
syn match matrixmixerInputParameter "^\s*button33" contained
syn match matrixmixerInputParameter "^\s*button34" contained
syn match matrixmixerInputParameter "^\s*button4" contained
syn match matrixmixerInputParameter "^\s*button41" contained
syn match matrixmixerInputParameter "^\s*button42" contained
syn match matrixmixerInputParameter "^\s*button43" contained
syn match matrixmixerInputParameter "^\s*button44" contained
syn match matrixmixerInputParameter "^\s*input" contained
syn match matrixmixerInputParameter "^\s*input1" contained
syn match matrixmixerInputParameter "^\s*input2" contained
syn match matrixmixerInputParameter "^\s*input3" contained
syn match matrixmixerInputParameter "^\s*input4" contained
syn match matrixmixerOutputParameter "^\s*led1" contained
syn match matrixmixerOutputParameter "^\s*led11" contained
syn match matrixmixerOutputParameter "^\s*led12" contained
syn match matrixmixerOutputParameter "^\s*led13" contained
syn match matrixmixerOutputParameter "^\s*led14" contained
syn match matrixmixerOutputParameter "^\s*led2" contained
syn match matrixmixerOutputParameter "^\s*led21" contained
syn match matrixmixerOutputParameter "^\s*led22" contained
syn match matrixmixerOutputParameter "^\s*led23" contained
syn match matrixmixerOutputParameter "^\s*led24" contained
syn match matrixmixerOutputParameter "^\s*led3" contained
syn match matrixmixerOutputParameter "^\s*led31" contained
syn match matrixmixerOutputParameter "^\s*led32" contained
syn match matrixmixerOutputParameter "^\s*led33" contained
syn match matrixmixerOutputParameter "^\s*led34" contained
syn match matrixmixerOutputParameter "^\s*led4" contained
syn match matrixmixerOutputParameter "^\s*led41" contained
syn match matrixmixerOutputParameter "^\s*led42" contained
syn match matrixmixerOutputParameter "^\s*led43" contained
syn match matrixmixerOutputParameter "^\s*led44" contained
syn match matrixmixerInputParameter "^\s*mixmax" contained
syn match matrixmixerOutputParameter "^\s*output" contained
syn match matrixmixerOutputParameter "^\s*output1" contained
syn match matrixmixerOutputParameter "^\s*output2" contained
syn match matrixmixerOutputParameter "^\s*output3" contained
syn match matrixmixerOutputParameter "^\s*output4" contained
syn match matrixmixerInputParameter "^\s*select" contained
syn match matrixmixerInputParameter "^\s*selectat" contained
syn match matrixmixerHeader /\[matrixmixer\]/ contained
syn region matrixmixerCircuit start=/\[matrixmixer\]/ end=/\[/me=s-1 transparent contains=matrixmixerHeader,matrixmixerInputParameter,matrixmixerOutputParameter,ioregister,number,cable,comment
hi def link matrixmixerHeader circuitHeader
hi def link matrixmixerInputParameter inputParameter
hi def link matrixmixerOutputParameter outputParameter


" slew
syn match slewOutputParameter "^\s*exponential" contained
syn match slewInputParameter "^\s*gate" contained
syn match slewInputParameter "^\s*input" contained
syn match slewOutputParameter "^\s*linear" contained
syn match slewOutputParameter "^\s*scurve" contained
syn match slewInputParameter "^\s*slew" contained
syn match slewInputParameter "^\s*slewdown" contained
syn match slewInputParameter "^\s*slewup" contained
syn match slewHeader /\[slew\]/ contained
syn region slewCircuit start=/\[slew\]/ end=/\[/me=s-1 transparent contains=slewHeader,slewInputParameter,slewOutputParameter,ioregister,number,cable,comment
hi def link slewHeader circuitHeader
hi def link slewInputParameter inputParameter
hi def link slewOutputParameter outputParameter


" quantizer
syn match quantizerInputParameter "^\s*bypass" contained
syn match quantizerInputParameter "^\s*input" contained
syn match quantizerOutputParameter "^\s*output" contained
syn match quantizerInputParameter "^\s*steps" contained
syn match quantizerInputParameter "^\s*trigger" contained
syn match quantizerHeader /\[quantizer\]/ contained
syn region quantizerCircuit start=/\[quantizer\]/ end=/\[/me=s-1 transparent contains=quantizerHeader,quantizerInputParameter,quantizerOutputParameter,ioregister,number,cable,comment
hi def link quantizerHeader circuitHeader
hi def link quantizerInputParameter inputParameter
hi def link quantizerOutputParameter outputParameter


" nudge
syn match nudgeInputParameter "^\s*amount" contained
syn match nudgeInputParameter "^\s*buttondown" contained
syn match nudgeInputParameter "^\s*buttonup" contained
syn match nudgeOutputParameter "^\s*leddown" contained
syn match nudgeOutputParameter "^\s*ledup" contained
syn match nudgeInputParameter "^\s*maximum" contained
syn match nudgeInputParameter "^\s*minimum" contained
syn match nudgeInputParameter "^\s*offset" contained
syn match nudgeOutputParameter "^\s*output" contained
syn match nudgeInputParameter "^\s*persist" contained
syn match nudgeInputParameter "^\s*reset" contained
syn match nudgeInputParameter "^\s*select" contained
syn match nudgeInputParameter "^\s*selectat" contained
syn match nudgeInputParameter "^\s*startvalue" contained
syn match nudgeInputParameter "^\s*wrap" contained
syn match nudgeHeader /\[nudge\]/ contained
syn region nudgeCircuit start=/\[nudge\]/ end=/\[/me=s-1 transparent contains=nudgeHeader,nudgeInputParameter,nudgeOutputParameter,ioregister,number,cable,comment
hi def link nudgeHeader circuitHeader
hi def link nudgeInputParameter inputParameter
hi def link nudgeOutputParameter outputParameter


" calibrator
syn match calibratorInputParameter "^\s*input" contained
syn match calibratorOutputParameter "^\s*leddown" contained
syn match calibratorOutputParameter "^\s*ledup" contained
syn match calibratorInputParameter "^\s*nudgeamount" contained
syn match calibratorInputParameter "^\s*nudgedown" contained
syn match calibratorInputParameter "^\s*nudgeup" contained
syn match calibratorOutputParameter "^\s*output" contained
syn match calibratorInputParameter "^\s*reset" contained
syn match calibratorInputParameter "^\s*select" contained
syn match calibratorInputParameter "^\s*selectat" contained
syn match calibratorInputParameter "^\s*tune" contained
syn match calibratorInputParameter "^\s*tune0" contained
syn match calibratorInputParameter "^\s*tune1" contained
syn match calibratorInputParameter "^\s*tune2" contained
syn match calibratorInputParameter "^\s*tune3" contained
syn match calibratorInputParameter "^\s*tune4" contained
syn match calibratorInputParameter "^\s*tune5" contained
syn match calibratorInputParameter "^\s*tune6" contained
syn match calibratorInputParameter "^\s*tune7" contained
syn match calibratorInputParameter "^\s*tune8" contained
syn match calibratorInputParameter "^\s*tune9" contained
syn match calibratorInputParameter "^\s*tunehightail" contained
syn match calibratorInputParameter "^\s*tunelowtail" contained
syn match calibratorHeader /\[calibrator\]/ contained
syn region calibratorCircuit start=/\[calibrator\]/ end=/\[/me=s-1 transparent contains=calibratorHeader,calibratorInputParameter,calibratorOutputParameter,ioregister,number,cable,comment
hi def link calibratorHeader circuitHeader
hi def link calibratorInputParameter inputParameter
hi def link calibratorOutputParameter outputParameter


" minifonion
syn match minifonionInputParameter "^\s*bypass" contained
syn match minifonionInputParameter "^\s*degree" contained
syn match minifonionInputParameter "^\s*input" contained
syn match minifonionOutputParameter "^\s*notechange" contained
syn match minifonionInputParameter "^\s*noteshift" contained
syn match minifonionOutputParameter "^\s*output" contained
syn match minifonionInputParameter "^\s*root" contained
syn match minifonionInputParameter "^\s*select1" contained
syn match minifonionInputParameter "^\s*select11" contained
syn match minifonionInputParameter "^\s*select13" contained
syn match minifonionInputParameter "^\s*select3" contained
syn match minifonionInputParameter "^\s*select5" contained
syn match minifonionInputParameter "^\s*select7" contained
syn match minifonionInputParameter "^\s*select9" contained
syn match minifonionInputParameter "^\s*selectfill1" contained
syn match minifonionInputParameter "^\s*selectfill2" contained
syn match minifonionInputParameter "^\s*selectfill3" contained
syn match minifonionInputParameter "^\s*selectfill4" contained
syn match minifonionInputParameter "^\s*selectfill5" contained
syn match minifonionInputParameter "^\s*selectnoteshift" contained
syn match minifonionInputParameter "^\s*transpose" contained
syn match minifonionInputParameter "^\s*trigger" contained
syn match minifonionInputParameter "^\s*tuningmode" contained
syn match minifonionInputParameter "^\s*tuningpitch" contained
syn match minifonionHeader /\[minifonion\]/ contained
syn region minifonionCircuit start=/\[minifonion\]/ end=/\[/me=s-1 transparent contains=minifonionHeader,minifonionInputParameter,minifonionOutputParameter,ioregister,number,cable,comment
hi def link minifonionHeader circuitHeader
hi def link minifonionInputParameter inputParameter
hi def link minifonionOutputParameter outputParameter


" contour
syn match contourInputParameter "^\s*abortattack" contained
syn match contourInputParameter "^\s*attack" contained
syn match contourInputParameter "^\s*attackshape" contained
syn match contourInputParameter "^\s*decay" contained
syn match contourInputParameter "^\s*decayshape" contained
syn match contourOutputParameter "^\s*endofattack" contained
syn match contourOutputParameter "^\s*endofdecay" contained
syn match contourOutputParameter "^\s*endofhold" contained
syn match contourOutputParameter "^\s*endofpredelay" contained
syn match contourOutputParameter "^\s*endofrelease" contained
syn match contourInputParameter "^\s*gate" contained
syn match contourInputParameter "^\s*hold" contained
syn match contourOutputParameter "^\s*inverted" contained
syn match contourInputParameter "^\s*level" contained
syn match contourInputParameter "^\s*loop" contained
syn match contourOutputParameter "^\s*negated" contained
syn match contourOutputParameter "^\s*output" contained
syn match contourInputParameter "^\s*pitch" contained
syn match contourInputParameter "^\s*predelay" contained
syn match contourInputParameter "^\s*release" contained
syn match contourInputParameter "^\s*releaseshape" contained
syn match contourInputParameter "^\s*retrigger" contained
syn match contourInputParameter "^\s*shape" contained
syn match contourInputParameter "^\s*startfromzero" contained
syn match contourInputParameter "^\s*sustain" contained
syn match contourInputParameter "^\s*swell" contained
syn match contourInputParameter "^\s*swelllevel" contained
syn match contourInputParameter "^\s*swellshape" contained
syn match contourInputParameter "^\s*swelltime" contained
syn match contourInputParameter "^\s*taptempo" contained
syn match contourInputParameter "^\s*trigger" contained
syn match contourInputParameter "^\s*velocity" contained
syn match contourInputParameter "^\s*zerocrossing" contained
syn match contourHeader /\[contour\]/ contained
syn region contourCircuit start=/\[contour\]/ end=/\[/me=s-1 transparent contains=contourHeader,contourInputParameter,contourOutputParameter,ioregister,number,cable,comment
hi def link contourHeader circuitHeader
hi def link contourInputParameter inputParameter
hi def link contourOutputParameter outputParameter


" notebuttons
syn match notebuttonsInputParameter "^\s*button" contained
syn match notebuttonsInputParameter "^\s*button1" contained
syn match notebuttonsInputParameter "^\s*button10" contained
syn match notebuttonsInputParameter "^\s*button11" contained
syn match notebuttonsInputParameter "^\s*button12" contained
syn match notebuttonsInputParameter "^\s*button2" contained
syn match notebuttonsInputParameter "^\s*button3" contained
syn match notebuttonsInputParameter "^\s*button4" contained
syn match notebuttonsInputParameter "^\s*button5" contained
syn match notebuttonsInputParameter "^\s*button6" contained
syn match notebuttonsInputParameter "^\s*button7" contained
syn match notebuttonsInputParameter "^\s*button8" contained
syn match notebuttonsInputParameter "^\s*button9" contained
syn match notebuttonsInputParameter "^\s*clock" contained
syn match notebuttonsOutputParameter "^\s*led" contained
syn match notebuttonsOutputParameter "^\s*led1" contained
syn match notebuttonsOutputParameter "^\s*led10" contained
syn match notebuttonsOutputParameter "^\s*led11" contained
syn match notebuttonsOutputParameter "^\s*led12" contained
syn match notebuttonsOutputParameter "^\s*led2" contained
syn match notebuttonsOutputParameter "^\s*led3" contained
syn match notebuttonsOutputParameter "^\s*led4" contained
syn match notebuttonsOutputParameter "^\s*led5" contained
syn match notebuttonsOutputParameter "^\s*led6" contained
syn match notebuttonsOutputParameter "^\s*led7" contained
syn match notebuttonsOutputParameter "^\s*led8" contained
syn match notebuttonsOutputParameter "^\s*led9" contained
syn match notebuttonsOutputParameter "^\s*output" contained
syn match notebuttonsInputParameter "^\s*select" contained
syn match notebuttonsInputParameter "^\s*selectat" contained
syn match notebuttonsOutputParameter "^\s*semitone" contained
syn match notebuttonsHeader /\[notebuttons\]/ contained
syn region notebuttonsCircuit start=/\[notebuttons\]/ end=/\[/me=s-1 transparent contains=notebuttonsHeader,notebuttonsInputParameter,notebuttonsOutputParameter,ioregister,number,cable,comment
hi def link notebuttonsHeader circuitHeader
hi def link notebuttonsInputParameter inputParameter
hi def link notebuttonsOutputParameter outputParameter


" adc
syn match adcOutputParameter "^\s*bit" contained
syn match adcOutputParameter "^\s*bit1" contained
syn match adcOutputParameter "^\s*bit10" contained
syn match adcOutputParameter "^\s*bit11" contained
syn match adcOutputParameter "^\s*bit12" contained
syn match adcOutputParameter "^\s*bit2" contained
syn match adcOutputParameter "^\s*bit3" contained
syn match adcOutputParameter "^\s*bit4" contained
syn match adcOutputParameter "^\s*bit5" contained
syn match adcOutputParameter "^\s*bit6" contained
syn match adcOutputParameter "^\s*bit7" contained
syn match adcOutputParameter "^\s*bit8" contained
syn match adcOutputParameter "^\s*bit9" contained
syn match adcInputParameter "^\s*input" contained
syn match adcInputParameter "^\s*maximum" contained
syn match adcInputParameter "^\s*minimum" contained
syn match adcHeader /\[adc\]/ contained
syn region adcCircuit start=/\[adc\]/ end=/\[/me=s-1 transparent contains=adcHeader,adcInputParameter,adcOutputParameter,ioregister,number,cable,comment
hi def link adcHeader circuitHeader
hi def link adcInputParameter inputParameter
hi def link adcOutputParameter outputParameter


" crossfader
syn match crossfaderInputParameter "^\s*fade" contained
syn match crossfaderInputParameter "^\s*input" contained
syn match crossfaderInputParameter "^\s*input1" contained
syn match crossfaderInputParameter "^\s*input2" contained
syn match crossfaderInputParameter "^\s*input3" contained
syn match crossfaderInputParameter "^\s*input4" contained
syn match crossfaderInputParameter "^\s*input5" contained
syn match crossfaderInputParameter "^\s*input6" contained
syn match crossfaderInputParameter "^\s*input7" contained
syn match crossfaderInputParameter "^\s*input8" contained
syn match crossfaderOutputParameter "^\s*output" contained
syn match crossfaderHeader /\[crossfader\]/ contained
syn region crossfaderCircuit start=/\[crossfader\]/ end=/\[/me=s-1 transparent contains=crossfaderHeader,crossfaderInputParameter,crossfaderOutputParameter,ioregister,number,cable,comment
hi def link crossfaderHeader circuitHeader
hi def link crossfaderInputParameter inputParameter
hi def link crossfaderOutputParameter outputParameter


" spring
syn match springInputParameter "^\s*flowresistance" contained
syn match springInputParameter "^\s*friction" contained
syn match springInputParameter "^\s*gravity" contained
syn match springInputParameter "^\s*mass" contained
syn match springOutputParameter "^\s*position" contained
syn match springInputParameter "^\s*reset" contained
syn match springInputParameter "^\s*shove" contained
syn match springInputParameter "^\s*shoveforce" contained
syn match springInputParameter "^\s*speed" contained
syn match springInputParameter "^\s*springforce" contained
syn match springInputParameter "^\s*startposition" contained
syn match springInputParameter "^\s*startvelocity" contained
syn match springOutputParameter "^\s*velocity" contained
syn match springHeader /\[spring\]/ contained
syn region springCircuit start=/\[spring\]/ end=/\[/me=s-1 transparent contains=springHeader,springInputParameter,springOutputParameter,ioregister,number,cable,comment
hi def link springHeader circuitHeader
hi def link springInputParameter inputParameter
hi def link springOutputParameter outputParameter


" explin
syn match explinInputParameter "^\s*endvalue" contained
syn match explinInputParameter "^\s*input" contained
syn match explinInputParameter "^\s*mix" contained
syn match explinOutputParameter "^\s*output" contained
syn match explinInputParameter "^\s*startvalue" contained
syn match explinHeader /\[explin\]/ contained
syn region explinCircuit start=/\[explin\]/ end=/\[/me=s-1 transparent contains=explinHeader,explinInputParameter,explinOutputParameter,ioregister,number,cable,comment
hi def link explinHeader circuitHeader
hi def link explinInputParameter inputParameter
hi def link explinOutputParameter outputParameter


" pot
syn match potOutputParameter "^\s*absbipolar" contained
syn match potOutputParameter "^\s*bipolar" contained
syn match potInputParameter "^\s*ledgauge" contained
syn match potOutputParameter "^\s*lefthalf" contained
syn match potOutputParameter "^\s*lefthalfinv" contained
syn match potInputParameter "^\s*notch" contained
syn match potOutputParameter "^\s*onchange" contained
syn match potOutputParameter "^\s*output" contained
syn match potInputParameter "^\s*outputscale" contained
syn match potInputParameter "^\s*pot" contained
syn match potInputParameter "^\s*reset" contained
syn match potOutputParameter "^\s*righthalf" contained
syn match potOutputParameter "^\s*righthalfinv" contained
syn match potInputParameter "^\s*select" contained
syn match potInputParameter "^\s*selectat" contained
syn match potInputParameter "^\s*slope" contained
syn match potInputParameter "^\s*startvalue" contained
syn match potHeader /\[pot\]/ contained
syn region potCircuit start=/\[pot\]/ end=/\[/me=s-1 transparent contains=potHeader,potInputParameter,potOutputParameter,ioregister,number,cable,comment
hi def link potHeader circuitHeader
hi def link potInputParameter inputParameter
hi def link potOutputParameter outputParameter


" math
syn match mathOutputParameter "^\s*amount" contained
syn match mathOutputParameter "^\s*average" contained
syn match mathOutputParameter "^\s*ceil" contained
syn match mathOutputParameter "^\s*cosine" contained
syn match mathOutputParameter "^\s*difference" contained
syn match mathOutputParameter "^\s*floor" contained
syn match mathInputParameter "^\s*input" contained
syn match mathInputParameter "^\s*input1" contained
syn match mathInputParameter "^\s*input2" contained
syn match mathOutputParameter "^\s*logarithm" contained
syn match mathOutputParameter "^\s*maximum" contained
syn match mathOutputParameter "^\s*minimum" contained
syn match mathOutputParameter "^\s*modulo" contained
syn match mathOutputParameter "^\s*negation" contained
syn match mathOutputParameter "^\s*power" contained
syn match mathOutputParameter "^\s*product" contained
syn match mathOutputParameter "^\s*quotient" contained
syn match mathOutputParameter "^\s*reciprocal" contained
syn match mathOutputParameter "^\s*root" contained
syn match mathOutputParameter "^\s*round" contained
syn match mathOutputParameter "^\s*sine" contained
syn match mathOutputParameter "^\s*square" contained
syn match mathOutputParameter "^\s*sum" contained
syn match mathHeader /\[math\]/ contained
syn region mathCircuit start=/\[math\]/ end=/\[/me=s-1 transparent contains=mathHeader,mathInputParameter,mathOutputParameter,ioregister,number,cable,comment
hi def link mathHeader circuitHeader
hi def link mathInputParameter inputParameter
hi def link mathOutputParameter outputParameter


" firefacecontrol
syn match firefacecontrolInputParameter "^\s*mainoutput" contained
syn match firefacecontrolInputParameter "^\s*outputlevel" contained
syn match firefacecontrolInputParameter "^\s*outputlevel1" contained
syn match firefacecontrolInputParameter "^\s*outputlevel10" contained
syn match firefacecontrolInputParameter "^\s*outputlevel11" contained
syn match firefacecontrolInputParameter "^\s*outputlevel12" contained
syn match firefacecontrolInputParameter "^\s*outputlevel13" contained
syn match firefacecontrolInputParameter "^\s*outputlevel14" contained
syn match firefacecontrolInputParameter "^\s*outputlevel15" contained
syn match firefacecontrolInputParameter "^\s*outputlevel16" contained
syn match firefacecontrolInputParameter "^\s*outputlevel2" contained
syn match firefacecontrolInputParameter "^\s*outputlevel3" contained
syn match firefacecontrolInputParameter "^\s*outputlevel4" contained
syn match firefacecontrolInputParameter "^\s*outputlevel5" contained
syn match firefacecontrolInputParameter "^\s*outputlevel6" contained
syn match firefacecontrolInputParameter "^\s*outputlevel7" contained
syn match firefacecontrolInputParameter "^\s*outputlevel8" contained
syn match firefacecontrolInputParameter "^\s*outputlevel9" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix10in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix11in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix12in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix13in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix14in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix15in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix16in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix1in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix2in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix3in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix4in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix5in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix7in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix8in9" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in1" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in10" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in11" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in12" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in13" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in14" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in15" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in16" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in2" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in3" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in4" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in5" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in6" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in7" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in8" contained
syn match firefacecontrolInputParameter "^\s*outputmix9in9" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin1" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin10" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin11" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin12" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin13" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin14" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin15" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin16" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin2" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin3" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin4" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin5" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin6" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin7" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin8" contained
syn match firefacecontrolInputParameter "^\s*outputmixjin9" contained
syn match firefacecontrolInputParameter "^\s*pan" contained
syn match firefacecontrolInputParameter "^\s*pan1" contained
syn match firefacecontrolInputParameter "^\s*pan10" contained
syn match firefacecontrolInputParameter "^\s*pan11" contained
syn match firefacecontrolInputParameter "^\s*pan12" contained
syn match firefacecontrolInputParameter "^\s*pan13" contained
syn match firefacecontrolInputParameter "^\s*pan14" contained
syn match firefacecontrolInputParameter "^\s*pan15" contained
syn match firefacecontrolInputParameter "^\s*pan16" contained
syn match firefacecontrolInputParameter "^\s*pan2" contained
syn match firefacecontrolInputParameter "^\s*pan3" contained
syn match firefacecontrolInputParameter "^\s*pan4" contained
syn match firefacecontrolInputParameter "^\s*pan5" contained
syn match firefacecontrolInputParameter "^\s*pan6" contained
syn match firefacecontrolInputParameter "^\s*pan7" contained
syn match firefacecontrolInputParameter "^\s*pan8" contained
syn match firefacecontrolInputParameter "^\s*pan9" contained
syn match firefacecontrolInputParameter "^\s*phonesoutput" contained
syn match firefacecontrolInputParameter "^\s*phonesoutput1" contained
syn match firefacecontrolInputParameter "^\s*phonesoutput2" contained
syn match firefacecontrolInputParameter "^\s*postfader" contained
syn match firefacecontrolInputParameter "^\s*postfader1" contained
syn match firefacecontrolInputParameter "^\s*postfader10" contained
syn match firefacecontrolInputParameter "^\s*postfader11" contained
syn match firefacecontrolInputParameter "^\s*postfader12" contained
syn match firefacecontrolInputParameter "^\s*postfader13" contained
syn match firefacecontrolInputParameter "^\s*postfader14" contained
syn match firefacecontrolInputParameter "^\s*postfader15" contained
syn match firefacecontrolInputParameter "^\s*postfader16" contained
syn match firefacecontrolInputParameter "^\s*postfader2" contained
syn match firefacecontrolInputParameter "^\s*postfader3" contained
syn match firefacecontrolInputParameter "^\s*postfader4" contained
syn match firefacecontrolInputParameter "^\s*postfader5" contained
syn match firefacecontrolInputParameter "^\s*postfader6" contained
syn match firefacecontrolInputParameter "^\s*postfader7" contained
syn match firefacecontrolInputParameter "^\s*postfader8" contained
syn match firefacecontrolInputParameter "^\s*postfader9" contained
syn match firefacecontrolInputParameter "^\s*select" contained
syn match firefacecontrolInputParameter "^\s*selectat" contained
syn match firefacecontrolInputParameter "^\s*unmute" contained
syn match firefacecontrolInputParameter "^\s*unmute1" contained
syn match firefacecontrolInputParameter "^\s*unmute10" contained
syn match firefacecontrolInputParameter "^\s*unmute11" contained
syn match firefacecontrolInputParameter "^\s*unmute12" contained
syn match firefacecontrolInputParameter "^\s*unmute13" contained
syn match firefacecontrolInputParameter "^\s*unmute14" contained
syn match firefacecontrolInputParameter "^\s*unmute15" contained
syn match firefacecontrolInputParameter "^\s*unmute16" contained
syn match firefacecontrolInputParameter "^\s*unmute2" contained
syn match firefacecontrolInputParameter "^\s*unmute3" contained
syn match firefacecontrolInputParameter "^\s*unmute4" contained
syn match firefacecontrolInputParameter "^\s*unmute5" contained
syn match firefacecontrolInputParameter "^\s*unmute6" contained
syn match firefacecontrolInputParameter "^\s*unmute7" contained
syn match firefacecontrolInputParameter "^\s*unmute8" contained
syn match firefacecontrolInputParameter "^\s*unmute9" contained
syn match firefacecontrolInputParameter "^\s*update" contained
syn match firefacecontrolHeader /\[firefacecontrol\]/ contained
syn region firefacecontrolCircuit start=/\[firefacecontrol\]/ end=/\[/me=s-1 transparent contains=firefacecontrolHeader,firefacecontrolInputParameter,firefacecontrolOutputParameter,ioregister,number,cable,comment
hi def link firefacecontrolHeader circuitHeader
hi def link firefacecontrolInputParameter inputParameter
hi def link firefacecontrolOutputParameter outputParameter


" euklid
syn match euklidInputParameter "^\s*beats" contained
syn match euklidInputParameter "^\s*clock" contained
syn match euklidInputParameter "^\s*length" contained
syn match euklidOutputParameter "^\s*offbeats" contained
syn match euklidInputParameter "^\s*offset" contained
syn match euklidOutputParameter "^\s*output" contained
syn match euklidInputParameter "^\s*outputsignal" contained
syn match euklidInputParameter "^\s*reset" contained
syn match euklidHeader /\[euklid\]/ contained
syn region euklidCircuit start=/\[euklid\]/ end=/\[/me=s-1 transparent contains=euklidHeader,euklidInputParameter,euklidOutputParameter,ioregister,number,cable,comment
hi def link euklidHeader circuitHeader
hi def link euklidInputParameter inputParameter
hi def link euklidOutputParameter outputParameter


" notchedpot
syn match notchedpotOutputParameter "^\s*absbipolar" contained
syn match notchedpotOutputParameter "^\s*bipolar" contained
syn match notchedpotOutputParameter "^\s*lefthalf" contained
syn match notchedpotOutputParameter "^\s*lefthalfinv" contained
syn match notchedpotInputParameter "^\s*notch" contained
syn match notchedpotOutputParameter "^\s*output" contained
syn match notchedpotInputParameter "^\s*pot" contained
syn match notchedpotOutputParameter "^\s*righthalf" contained
syn match notchedpotOutputParameter "^\s*righthalfinv" contained
syn match notchedpotHeader /\[notchedpot\]/ contained
syn region notchedpotCircuit start=/\[notchedpot\]/ end=/\[/me=s-1 transparent contains=notchedpotHeader,notchedpotInputParameter,notchedpotOutputParameter,ioregister,number,cable,comment
hi def link notchedpotHeader circuitHeader
hi def link notchedpotInputParameter inputParameter
hi def link notchedpotOutputParameter outputParameter


" dac
syn match dacInputParameter "^\s*bit" contained
syn match dacInputParameter "^\s*bit1" contained
syn match dacInputParameter "^\s*bit10" contained
syn match dacInputParameter "^\s*bit11" contained
syn match dacInputParameter "^\s*bit12" contained
syn match dacInputParameter "^\s*bit2" contained
syn match dacInputParameter "^\s*bit3" contained
syn match dacInputParameter "^\s*bit4" contained
syn match dacInputParameter "^\s*bit5" contained
syn match dacInputParameter "^\s*bit6" contained
syn match dacInputParameter "^\s*bit7" contained
syn match dacInputParameter "^\s*bit8" contained
syn match dacInputParameter "^\s*bit9" contained
syn match dacInputParameter "^\s*maximum" contained
syn match dacInputParameter "^\s*minimum" contained
syn match dacOutputParameter "^\s*output" contained
syn match dacHeader /\[dac\]/ contained
syn region dacCircuit start=/\[dac\]/ end=/\[/me=s-1 transparent contains=dacHeader,dacInputParameter,dacOutputParameter,ioregister,number,cable,comment
hi def link dacHeader circuitHeader
hi def link dacInputParameter inputParameter
hi def link dacOutputParameter outputParameter


" fourstatebutton
syn match fourstatebuttonInputParameter "^\s*button" contained
syn match fourstatebuttonOutputParameter "^\s*led" contained
syn match fourstatebuttonOutputParameter "^\s*output" contained
syn match fourstatebuttonInputParameter "^\s*reset" contained
syn match fourstatebuttonInputParameter "^\s*startvalue" contained
syn match fourstatebuttonInputParameter "^\s*value" contained
syn match fourstatebuttonInputParameter "^\s*value1" contained
syn match fourstatebuttonInputParameter "^\s*value2" contained
syn match fourstatebuttonInputParameter "^\s*value3" contained
syn match fourstatebuttonInputParameter "^\s*value4" contained
syn match fourstatebuttonHeader /\[fourstatebutton\]/ contained
syn region fourstatebuttonCircuit start=/\[fourstatebutton\]/ end=/\[/me=s-1 transparent contains=fourstatebuttonHeader,fourstatebuttonInputParameter,fourstatebuttonOutputParameter,ioregister,number,cable,comment
hi def link fourstatebuttonHeader circuitHeader
hi def link fourstatebuttonInputParameter inputParameter
hi def link fourstatebuttonOutputParameter outputParameter


" bernoulli
syn match bernoulliInputParameter "^\s*distribution" contained
syn match bernoulliInputParameter "^\s*input" contained
syn match bernoulliOutputParameter "^\s*output1" contained
syn match bernoulliOutputParameter "^\s*output2" contained
syn match bernoulliHeader /\[bernoulli\]/ contained
syn region bernoulliCircuit start=/\[bernoulli\]/ end=/\[/me=s-1 transparent contains=bernoulliHeader,bernoulliInputParameter,bernoulliOutputParameter,ioregister,number,cable,comment
hi def link bernoulliHeader circuitHeader
hi def link bernoulliInputParameter inputParameter
hi def link bernoulliOutputParameter outputParameter


" transient
syn match transientInputParameter "^\s*clock" contained
syn match transientInputParameter "^\s*duration" contained
syn match transientInputParameter "^\s*end" contained
syn match transientOutputParameter "^\s*endoftransient" contained
syn match transientInputParameter "^\s*freeze" contained
syn match transientInputParameter "^\s*loop" contained
syn match transientOutputParameter "^\s*output" contained
syn match transientOutputParameter "^\s*phase" contained
syn match transientInputParameter "^\s*pingpong" contained
syn match transientInputParameter "^\s*reset" contained
syn match transientInputParameter "^\s*start" contained
syn match transientHeader /\[transient\]/ contained
syn region transientCircuit start=/\[transient\]/ end=/\[/me=s-1 transparent contains=transientHeader,transientInputParameter,transientOutputParameter,ioregister,number,cable,comment
hi def link transientHeader circuitHeader
hi def link transientInputParameter inputParameter
hi def link transientOutputParameter outputParameter


" octave
syn match octaveInputParameter "^\s*detune" contained
syn match octaveInputParameter "^\s*fifths" contained
syn match octaveInputParameter "^\s*input" contained
syn match octaveOutputParameter "^\s*output" contained
syn match octaveOutputParameter "^\s*output1" contained
syn match octaveOutputParameter "^\s*output2" contained
syn match octaveOutputParameter "^\s*output3" contained
syn match octaveInputParameter "^\s*spread" contained
syn match octaveHeader /\[octave\]/ contained
syn region octaveCircuit start=/\[octave\]/ end=/\[/me=s-1 transparent contains=octaveHeader,octaveInputParameter,octaveOutputParameter,ioregister,number,cable,comment
hi def link octaveHeader circuitHeader
hi def link octaveInputParameter inputParameter
hi def link octaveOutputParameter outputParameter


" timing
syn match timingInputParameter "^\s*clock" contained
syn match timingOutputParameter "^\s*output" contained
syn match timingInputParameter "^\s*reset" contained
syn match timingInputParameter "^\s*timing" contained
syn match timingInputParameter "^\s*timing1" contained
syn match timingInputParameter "^\s*timing2" contained
syn match timingInputParameter "^\s*timing3" contained
syn match timingInputParameter "^\s*timing4" contained
syn match timingInputParameter "^\s*timing5" contained
syn match timingInputParameter "^\s*timing6" contained
syn match timingInputParameter "^\s*timing7" contained
syn match timingInputParameter "^\s*timing8" contained
syn match timingHeader /\[timing\]/ contained
syn region timingCircuit start=/\[timing\]/ end=/\[/me=s-1 transparent contains=timingHeader,timingInputParameter,timingOutputParameter,ioregister,number,cable,comment
hi def link timingHeader circuitHeader
hi def link timingInputParameter inputParameter
hi def link timingOutputParameter outputParameter


" midithrough
syn match midithroughInputParameter "^\s*fromusb" contained
syn match midithroughInputParameter "^\s*tousb" contained
syn match midithroughHeader /\[midithrough\]/ contained
syn region midithroughCircuit start=/\[midithrough\]/ end=/\[/me=s-1 transparent contains=midithroughHeader,midithroughInputParameter,midithroughOutputParameter,ioregister,number,cable,comment
hi def link midithroughHeader circuitHeader
hi def link midithroughInputParameter inputParameter
hi def link midithroughOutputParameter outputParameter


" copy
syn match copyInputParameter "^\s*input" contained
syn match copyOutputParameter "^\s*inverted" contained
syn match copyInputParameter "^\s*maximum" contained
syn match copyInputParameter "^\s*minimum" contained
syn match copyOutputParameter "^\s*output" contained
syn match copyHeader /\[copy\]/ contained
syn region copyCircuit start=/\[copy\]/ end=/\[/me=s-1 transparent contains=copyHeader,copyInputParameter,copyOutputParameter,ioregister,number,cable,comment
hi def link copyHeader circuitHeader
hi def link copyInputParameter inputParameter
hi def link copyOutputParameter outputParameter


" midifileplayer
syn match midifileplayerOutputParameter "^\s*bank" contained
syn match midifileplayerInputParameter "^\s*bendpitch" contained
syn match midifileplayerOutputParameter "^\s*cc" contained
syn match midifileplayerOutputParameter "^\s*cc1" contained
syn match midifileplayerOutputParameter "^\s*cc2" contained
syn match midifileplayerOutputParameter "^\s*cc3" contained
syn match midifileplayerOutputParameter "^\s*cc4" contained
syn match midifileplayerInputParameter "^\s*ccnumber" contained
syn match midifileplayerInputParameter "^\s*ccnumber1" contained
syn match midifileplayerInputParameter "^\s*ccnumber2" contained
syn match midifileplayerInputParameter "^\s*ccnumber3" contained
syn match midifileplayerInputParameter "^\s*ccnumber4" contained
syn match midifileplayerInputParameter "^\s*channel" contained
syn match midifileplayerInputParameter "^\s*clock" contained
syn match midifileplayerOutputParameter "^\s*clockout" contained
syn match midifileplayerInputParameter "^\s*end" contained
syn match midifileplayerOutputParameter "^\s*endoftrack" contained
syn match midifileplayerOutputParameter "^\s*error" contained
syn match midifileplayerInputParameter "^\s*file" contained
syn match midifileplayerOutputParameter "^\s*gate" contained
syn match midifileplayerOutputParameter "^\s*gate1" contained
syn match midifileplayerOutputParameter "^\s*gate2" contained
syn match midifileplayerOutputParameter "^\s*gate3" contained
syn match midifileplayerOutputParameter "^\s*gate4" contained
syn match midifileplayerOutputParameter "^\s*gate5" contained
syn match midifileplayerOutputParameter "^\s*gate6" contained
syn match midifileplayerOutputParameter "^\s*gate7" contained
syn match midifileplayerOutputParameter "^\s*gate8" contained
syn match midifileplayerInputParameter "^\s*highestnote" contained
syn match midifileplayerInputParameter "^\s*holdvelocity" contained
syn match midifileplayerInputParameter "^\s*loop" contained
syn match midifileplayerInputParameter "^\s*lowestnote" contained
syn match midifileplayerOutputParameter "^\s*midiclock" contained
syn match midifileplayerOutputParameter "^\s*modwheel" contained
syn match midifileplayerInputParameter "^\s*note" contained
syn match midifileplayerInputParameter "^\s*note1" contained
syn match midifileplayerInputParameter "^\s*note10" contained
syn match midifileplayerInputParameter "^\s*note11" contained
syn match midifileplayerInputParameter "^\s*note12" contained
syn match midifileplayerInputParameter "^\s*note13" contained
syn match midifileplayerInputParameter "^\s*note14" contained
syn match midifileplayerInputParameter "^\s*note15" contained
syn match midifileplayerInputParameter "^\s*note16" contained
syn match midifileplayerInputParameter "^\s*note2" contained
syn match midifileplayerInputParameter "^\s*note3" contained
syn match midifileplayerInputParameter "^\s*note4" contained
syn match midifileplayerInputParameter "^\s*note5" contained
syn match midifileplayerInputParameter "^\s*note6" contained
syn match midifileplayerInputParameter "^\s*note7" contained
syn match midifileplayerInputParameter "^\s*note8" contained
syn match midifileplayerInputParameter "^\s*note9" contained
syn match midifileplayerInputParameter "^\s*notegap" contained
syn match midifileplayerOutputParameter "^\s*notegate" contained
syn match midifileplayerOutputParameter "^\s*notegate1" contained
syn match midifileplayerOutputParameter "^\s*notegate10" contained
syn match midifileplayerOutputParameter "^\s*notegate11" contained
syn match midifileplayerOutputParameter "^\s*notegate12" contained
syn match midifileplayerOutputParameter "^\s*notegate13" contained
syn match midifileplayerOutputParameter "^\s*notegate14" contained
syn match midifileplayerOutputParameter "^\s*notegate15" contained
syn match midifileplayerOutputParameter "^\s*notegate16" contained
syn match midifileplayerOutputParameter "^\s*notegate2" contained
syn match midifileplayerOutputParameter "^\s*notegate3" contained
syn match midifileplayerOutputParameter "^\s*notegate4" contained
syn match midifileplayerOutputParameter "^\s*notegate5" contained
syn match midifileplayerOutputParameter "^\s*notegate6" contained
syn match midifileplayerOutputParameter "^\s*notegate7" contained
syn match midifileplayerOutputParameter "^\s*notegate8" contained
syn match midifileplayerOutputParameter "^\s*notegate9" contained
syn match midifileplayerOutputParameter "^\s*pitch" contained
syn match midifileplayerOutputParameter "^\s*pitch1" contained
syn match midifileplayerOutputParameter "^\s*pitch2" contained
syn match midifileplayerOutputParameter "^\s*pitch3" contained
syn match midifileplayerOutputParameter "^\s*pitch4" contained
syn match midifileplayerOutputParameter "^\s*pitch5" contained
syn match midifileplayerOutputParameter "^\s*pitch6" contained
syn match midifileplayerOutputParameter "^\s*pitch7" contained
syn match midifileplayerOutputParameter "^\s*pitch8" contained
syn match midifileplayerOutputParameter "^\s*pitchbend" contained
syn match midifileplayerInputParameter "^\s*pitchbendrange" contained
syn match midifileplayerOutputParameter "^\s*portamento" contained
syn match midifileplayerOutputParameter "^\s*pressure" contained
syn match midifileplayerOutputParameter "^\s*pressure1" contained
syn match midifileplayerOutputParameter "^\s*pressure2" contained
syn match midifileplayerOutputParameter "^\s*pressure3" contained
syn match midifileplayerOutputParameter "^\s*pressure4" contained
syn match midifileplayerOutputParameter "^\s*pressure5" contained
syn match midifileplayerOutputParameter "^\s*pressure6" contained
syn match midifileplayerOutputParameter "^\s*pressure7" contained
syn match midifileplayerOutputParameter "^\s*pressure8" contained
syn match midifileplayerOutputParameter "^\s*program" contained
syn match midifileplayerOutputParameter "^\s*programchange" contained
syn match midifileplayerInputParameter "^\s*reset" contained
syn match midifileplayerInputParameter "^\s*roundrobin" contained
syn match midifileplayerOutputParameter "^\s*soft" contained
syn match midifileplayerInputParameter "^\s*speed" contained
syn match midifileplayerInputParameter "^\s*track" contained
syn match midifileplayerInputParameter "^\s*transpose" contained
syn match midifileplayerOutputParameter "^\s*trigger" contained
syn match midifileplayerOutputParameter "^\s*trigger1" contained
syn match midifileplayerOutputParameter "^\s*trigger2" contained
syn match midifileplayerOutputParameter "^\s*trigger3" contained
syn match midifileplayerOutputParameter "^\s*trigger4" contained
syn match midifileplayerOutputParameter "^\s*trigger5" contained
syn match midifileplayerOutputParameter "^\s*trigger6" contained
syn match midifileplayerOutputParameter "^\s*trigger7" contained
syn match midifileplayerOutputParameter "^\s*trigger8" contained
syn match midifileplayerInputParameter "^\s*tuningmode" contained
syn match midifileplayerInputParameter "^\s*tuningpitch" contained
syn match midifileplayerOutputParameter "^\s*velocity" contained
syn match midifileplayerOutputParameter "^\s*velocity1" contained
syn match midifileplayerOutputParameter "^\s*velocity2" contained
syn match midifileplayerOutputParameter "^\s*velocity3" contained
syn match midifileplayerOutputParameter "^\s*velocity4" contained
syn match midifileplayerOutputParameter "^\s*velocity5" contained
syn match midifileplayerOutputParameter "^\s*velocity6" contained
syn match midifileplayerOutputParameter "^\s*velocity7" contained
syn match midifileplayerOutputParameter "^\s*velocity8" contained
syn match midifileplayerInputParameter "^\s*voiceallocation" contained
syn match midifileplayerOutputParameter "^\s*volume" contained
syn match midifileplayerHeader /\[midifileplayer\]/ contained
syn region midifileplayerCircuit start=/\[midifileplayer\]/ end=/\[/me=s-1 transparent contains=midifileplayerHeader,midifileplayerInputParameter,midifileplayerOutputParameter,ioregister,number,cable,comment
hi def link midifileplayerHeader circuitHeader
hi def link midifileplayerInputParameter inputParameter
hi def link midifileplayerOutputParameter outputParameter


" cvlooper
syn match cvlooperInputParameter "^\s*bypass" contained
syn match cvlooperInputParameter "^\s*clock" contained
syn match cvlooperInputParameter "^\s*cvin" contained
syn match cvlooperOutputParameter "^\s*cvout" contained
syn match cvlooperInputParameter "^\s*gatein" contained
syn match cvlooperOutputParameter "^\s*gateout" contained
syn match cvlooperInputParameter "^\s*length" contained
syn match cvlooperInputParameter "^\s*loopswitch" contained
syn match cvlooperInputParameter "^\s*overdub" contained
syn match cvlooperInputParameter "^\s*overlay" contained
syn match cvlooperInputParameter "^\s*pause" contained
syn match cvlooperInputParameter "^\s*reset" contained
syn match cvlooperInputParameter "^\s*tapespeed" contained
syn match cvlooperHeader /\[cvlooper\]/ contained
syn region cvlooperCircuit start=/\[cvlooper\]/ end=/\[/me=s-1 transparent contains=cvlooperHeader,cvlooperInputParameter,cvlooperOutputParameter,ioregister,number,cable,comment
hi def link cvlooperHeader circuitHeader
hi def link cvlooperInputParameter inputParameter
hi def link cvlooperOutputParameter outputParameter


" button
syn match buttonInputParameter "^\s*button" contained
syn match buttonInputParameter "^\s*doubleclickmode" contained
syn match buttonOutputParameter "^\s*inverted" contained
syn match buttonOutputParameter "^\s*led" contained
syn match buttonOutputParameter "^\s*longpress" contained
syn match buttonOutputParameter "^\s*negated" contained
syn match buttonInputParameter "^\s*offvalue" contained
syn match buttonInputParameter "^\s*onvalue" contained
syn match buttonOutputParameter "^\s*output" contained
syn match buttonInputParameter "^\s*reset" contained
syn match buttonInputParameter "^\s*select" contained
syn match buttonInputParameter "^\s*selectat" contained
syn match buttonInputParameter "^\s*startvalue" contained
syn match buttonInputParameter "^\s*states" contained
syn match buttonInputParameter "^\s*value" contained
syn match buttonInputParameter "^\s*value1" contained
syn match buttonInputParameter "^\s*value2" contained
syn match buttonInputParameter "^\s*value3" contained
syn match buttonInputParameter "^\s*value4" contained
syn match buttonHeader /\[button\]/ contained
syn region buttonCircuit start=/\[button\]/ end=/\[/me=s-1 transparent contains=buttonHeader,buttonInputParameter,buttonOutputParameter,ioregister,number,cable,comment
hi def link buttonHeader circuitHeader
hi def link buttonInputParameter inputParameter
hi def link buttonOutputParameter outputParameter


" mixer
syn match mixerOutputParameter "^\s*average" contained
syn match mixerInputParameter "^\s*input" contained
syn match mixerInputParameter "^\s*input1" contained
syn match mixerInputParameter "^\s*input2" contained
syn match mixerInputParameter "^\s*input3" contained
syn match mixerInputParameter "^\s*input4" contained
syn match mixerInputParameter "^\s*input5" contained
syn match mixerInputParameter "^\s*input6" contained
syn match mixerInputParameter "^\s*input7" contained
syn match mixerInputParameter "^\s*input8" contained
syn match mixerOutputParameter "^\s*maximum" contained
syn match mixerOutputParameter "^\s*minimum" contained
syn match mixerOutputParameter "^\s*output" contained
syn match mixerHeader /\[mixer\]/ contained
syn region mixerCircuit start=/\[mixer\]/ end=/\[/me=s-1 transparent contains=mixerHeader,mixerInputParameter,mixerOutputParameter,ioregister,number,cable,comment
hi def link mixerHeader circuitHeader
hi def link mixerInputParameter inputParameter
hi def link mixerOutputParameter outputParameter


" queue
syn match queueInputParameter "^\s*clock" contained
syn match queueInputParameter "^\s*input" contained
syn match queueOutputParameter "^\s*output" contained
syn match queueOutputParameter "^\s*output1" contained
syn match queueOutputParameter "^\s*output2" contained
syn match queueOutputParameter "^\s*output3" contained
syn match queueOutputParameter "^\s*output4" contained
syn match queueOutputParameter "^\s*output5" contained
syn match queueOutputParameter "^\s*output6" contained
syn match queueOutputParameter "^\s*output7" contained
syn match queueOutputParameter "^\s*output8" contained
syn match queueInputParameter "^\s*outputpos" contained
syn match queueInputParameter "^\s*outputpos1" contained
syn match queueInputParameter "^\s*outputpos2" contained
syn match queueInputParameter "^\s*outputpos3" contained
syn match queueInputParameter "^\s*outputpos4" contained
syn match queueInputParameter "^\s*outputpos5" contained
syn match queueInputParameter "^\s*outputpos6" contained
syn match queueInputParameter "^\s*outputpos7" contained
syn match queueInputParameter "^\s*outputpos8" contained
syn match queueHeader /\[queue\]/ contained
syn region queueCircuit start=/\[queue\]/ end=/\[/me=s-1 transparent contains=queueHeader,queueInputParameter,queueOutputParameter,ioregister,number,cable,comment
hi def link queueHeader circuitHeader
hi def link queueInputParameter inputParameter
hi def link queueOutputParameter outputParameter


" midiin
syn match midiinOutputParameter "^\s*active" contained
syn match midiinOutputParameter "^\s*bank" contained
syn match midiinInputParameter "^\s*bendpitch" contained
syn match midiinOutputParameter "^\s*cc" contained
syn match midiinOutputParameter "^\s*cc1" contained
syn match midiinOutputParameter "^\s*cc2" contained
syn match midiinOutputParameter "^\s*cc3" contained
syn match midiinOutputParameter "^\s*cc4" contained
syn match midiinInputParameter "^\s*ccnumber" contained
syn match midiinInputParameter "^\s*ccnumber1" contained
syn match midiinInputParameter "^\s*ccnumber2" contained
syn match midiinInputParameter "^\s*ccnumber3" contained
syn match midiinInputParameter "^\s*ccnumber4" contained
syn match midiinInputParameter "^\s*channel" contained
syn match midiinInputParameter "^\s*channel" contained
syn match midiinOutputParameter "^\s*clock" contained
syn match midiinOutputParameter "^\s*clock16" contained
syn match midiinOutputParameter "^\s*clock4" contained
syn match midiinOutputParameter "^\s*clock8" contained
syn match midiinOutputParameter "^\s*clock8t" contained
syn match midiinOutputParameter "^\s*continue" contained
syn match midiinOutputParameter "^\s*gate" contained
syn match midiinOutputParameter "^\s*gate1" contained
syn match midiinOutputParameter "^\s*gate2" contained
syn match midiinOutputParameter "^\s*gate3" contained
syn match midiinOutputParameter "^\s*gate4" contained
syn match midiinOutputParameter "^\s*gate5" contained
syn match midiinOutputParameter "^\s*gate6" contained
syn match midiinOutputParameter "^\s*gate7" contained
syn match midiinOutputParameter "^\s*gate8" contained
syn match midiinInputParameter "^\s*highestnote" contained
syn match midiinInputParameter "^\s*holdvelocity" contained
syn match midiinInputParameter "^\s*lowestnote" contained
syn match midiinOutputParameter "^\s*midiclock" contained
syn match midiinOutputParameter "^\s*modwheel" contained
syn match midiinInputParameter "^\s*note" contained
syn match midiinInputParameter "^\s*note1" contained
syn match midiinInputParameter "^\s*note10" contained
syn match midiinInputParameter "^\s*note11" contained
syn match midiinInputParameter "^\s*note12" contained
syn match midiinInputParameter "^\s*note13" contained
syn match midiinInputParameter "^\s*note14" contained
syn match midiinInputParameter "^\s*note15" contained
syn match midiinInputParameter "^\s*note16" contained
syn match midiinInputParameter "^\s*note2" contained
syn match midiinInputParameter "^\s*note3" contained
syn match midiinInputParameter "^\s*note4" contained
syn match midiinInputParameter "^\s*note5" contained
syn match midiinInputParameter "^\s*note6" contained
syn match midiinInputParameter "^\s*note7" contained
syn match midiinInputParameter "^\s*note8" contained
syn match midiinInputParameter "^\s*note9" contained
syn match midiinInputParameter "^\s*notegap" contained
syn match midiinOutputParameter "^\s*notegate" contained
syn match midiinOutputParameter "^\s*notegate1" contained
syn match midiinOutputParameter "^\s*notegate10" contained
syn match midiinOutputParameter "^\s*notegate11" contained
syn match midiinOutputParameter "^\s*notegate12" contained
syn match midiinOutputParameter "^\s*notegate13" contained
syn match midiinOutputParameter "^\s*notegate14" contained
syn match midiinOutputParameter "^\s*notegate15" contained
syn match midiinOutputParameter "^\s*notegate16" contained
syn match midiinOutputParameter "^\s*notegate2" contained
syn match midiinOutputParameter "^\s*notegate3" contained
syn match midiinOutputParameter "^\s*notegate4" contained
syn match midiinOutputParameter "^\s*notegate5" contained
syn match midiinOutputParameter "^\s*notegate6" contained
syn match midiinOutputParameter "^\s*notegate7" contained
syn match midiinOutputParameter "^\s*notegate8" contained
syn match midiinOutputParameter "^\s*notegate9" contained
syn match midiinOutputParameter "^\s*pitch" contained
syn match midiinOutputParameter "^\s*pitch1" contained
syn match midiinOutputParameter "^\s*pitch2" contained
syn match midiinOutputParameter "^\s*pitch3" contained
syn match midiinOutputParameter "^\s*pitch4" contained
syn match midiinOutputParameter "^\s*pitch5" contained
syn match midiinOutputParameter "^\s*pitch6" contained
syn match midiinOutputParameter "^\s*pitch7" contained
syn match midiinOutputParameter "^\s*pitch8" contained
syn match midiinOutputParameter "^\s*pitchbend" contained
syn match midiinInputParameter "^\s*pitchbendrange" contained
syn match midiinOutputParameter "^\s*portamento" contained
syn match midiinOutputParameter "^\s*pressure" contained
syn match midiinOutputParameter "^\s*pressure1" contained
syn match midiinOutputParameter "^\s*pressure2" contained
syn match midiinOutputParameter "^\s*pressure3" contained
syn match midiinOutputParameter "^\s*pressure4" contained
syn match midiinOutputParameter "^\s*pressure5" contained
syn match midiinOutputParameter "^\s*pressure6" contained
syn match midiinOutputParameter "^\s*pressure7" contained
syn match midiinOutputParameter "^\s*pressure8" contained
syn match midiinOutputParameter "^\s*program" contained
syn match midiinOutputParameter "^\s*programchange" contained
syn match midiinInputParameter "^\s*roundrobin" contained
syn match midiinOutputParameter "^\s*running" contained
syn match midiinOutputParameter "^\s*soft" contained
syn match midiinOutputParameter "^\s*start" contained
syn match midiinOutputParameter "^\s*stop" contained
syn match midiinInputParameter "^\s*systemreset" contained
syn match midiinInputParameter "^\s*transpose" contained
syn match midiinOutputParameter "^\s*trigger" contained
syn match midiinOutputParameter "^\s*trigger1" contained
syn match midiinOutputParameter "^\s*trigger2" contained
syn match midiinOutputParameter "^\s*trigger3" contained
syn match midiinOutputParameter "^\s*trigger4" contained
syn match midiinOutputParameter "^\s*trigger5" contained
syn match midiinOutputParameter "^\s*trigger6" contained
syn match midiinOutputParameter "^\s*trigger7" contained
syn match midiinOutputParameter "^\s*trigger8" contained
syn match midiinInputParameter "^\s*tuningmode" contained
syn match midiinInputParameter "^\s*tuningpitch" contained
syn match midiinInputParameter "^\s*usb" contained
syn match midiinOutputParameter "^\s*velocity" contained
syn match midiinOutputParameter "^\s*velocity1" contained
syn match midiinOutputParameter "^\s*velocity2" contained
syn match midiinOutputParameter "^\s*velocity3" contained
syn match midiinOutputParameter "^\s*velocity4" contained
syn match midiinOutputParameter "^\s*velocity5" contained
syn match midiinOutputParameter "^\s*velocity6" contained
syn match midiinOutputParameter "^\s*velocity7" contained
syn match midiinOutputParameter "^\s*velocity8" contained
syn match midiinInputParameter "^\s*voiceallocation" contained
syn match midiinOutputParameter "^\s*volume" contained
syn match midiinHeader /\[midiin\]/ contained
syn region midiinCircuit start=/\[midiin\]/ end=/\[/me=s-1 transparent contains=midiinHeader,midiinInputParameter,midiinOutputParameter,ioregister,number,cable,comment
hi def link midiinHeader circuitHeader
hi def link midiinInputParameter inputParameter
hi def link midiinOutputParameter outputParameter


" switch
syn match switchInputParameter "^\s*backward" contained
syn match switchInputParameter "^\s*forward" contained
syn match switchInputParameter "^\s*input" contained
syn match switchInputParameter "^\s*input1" contained
syn match switchInputParameter "^\s*input2" contained
syn match switchInputParameter "^\s*input3" contained
syn match switchInputParameter "^\s*input4" contained
syn match switchInputParameter "^\s*input5" contained
syn match switchInputParameter "^\s*input6" contained
syn match switchInputParameter "^\s*input7" contained
syn match switchInputParameter "^\s*input8" contained
syn match switchInputParameter "^\s*offset" contained
syn match switchOutputParameter "^\s*output" contained
syn match switchOutputParameter "^\s*output1" contained
syn match switchOutputParameter "^\s*output2" contained
syn match switchOutputParameter "^\s*output3" contained
syn match switchOutputParameter "^\s*output4" contained
syn match switchOutputParameter "^\s*output5" contained
syn match switchOutputParameter "^\s*output6" contained
syn match switchOutputParameter "^\s*output7" contained
syn match switchOutputParameter "^\s*output8" contained
syn match switchInputParameter "^\s*reset" contained
syn match switchHeader /\[switch\]/ contained
syn region switchCircuit start=/\[switch\]/ end=/\[/me=s-1 transparent contains=switchHeader,switchInputParameter,switchOutputParameter,ioregister,number,cable,comment
hi def link switchHeader circuitHeader
hi def link switchInputParameter inputParameter
hi def link switchOutputParameter outputParameter


" togglebutton
syn match togglebuttonInputParameter "^\s*button" contained
syn match togglebuttonInputParameter "^\s*doubleclickmode" contained
syn match togglebuttonOutputParameter "^\s*inverted" contained
syn match togglebuttonOutputParameter "^\s*led" contained
syn match togglebuttonOutputParameter "^\s*negated" contained
syn match togglebuttonInputParameter "^\s*offvalue" contained
syn match togglebuttonInputParameter "^\s*onvalue" contained
syn match togglebuttonOutputParameter "^\s*output" contained
syn match togglebuttonOutputParameter "^\s*output1" contained
syn match togglebuttonOutputParameter "^\s*output2" contained
syn match togglebuttonOutputParameter "^\s*output3" contained
syn match togglebuttonOutputParameter "^\s*output4" contained
syn match togglebuttonInputParameter "^\s*reset" contained
syn match togglebuttonInputParameter "^\s*reset1" contained
syn match togglebuttonInputParameter "^\s*reset2" contained
syn match togglebuttonInputParameter "^\s*reset3" contained
syn match togglebuttonInputParameter "^\s*reset4" contained
syn match togglebuttonInputParameter "^\s*startvalue" contained
syn match togglebuttonInputParameter "^\s*switch" contained
syn match togglebuttonHeader /\[togglebutton\]/ contained
syn region togglebuttonCircuit start=/\[togglebutton\]/ end=/\[/me=s-1 transparent contains=togglebuttonHeader,togglebuttonInputParameter,togglebuttonOutputParameter,ioregister,number,cable,comment
hi def link togglebuttonHeader circuitHeader
hi def link togglebuttonInputParameter inputParameter
hi def link togglebuttonOutputParameter outputParameter


" triggerdelay
syn match triggerdelayInputParameter "^\s*clock" contained
syn match triggerdelayInputParameter "^\s*delay" contained
syn match triggerdelayInputParameter "^\s*gatelength" contained
syn match triggerdelayInputParameter "^\s*input" contained
syn match triggerdelayInputParameter "^\s*mute" contained
syn match triggerdelayOutputParameter "^\s*output" contained
syn match triggerdelayOutputParameter "^\s*overflow" contained
syn match triggerdelayInputParameter "^\s*repeats" contained
syn match triggerdelayHeader /\[triggerdelay\]/ contained
syn region triggerdelayCircuit start=/\[triggerdelay\]/ end=/\[/me=s-1 transparent contains=triggerdelayHeader,triggerdelayInputParameter,triggerdelayOutputParameter,ioregister,number,cable,comment
hi def link triggerdelayHeader circuitHeader
hi def link triggerdelayInputParameter inputParameter
hi def link triggerdelayOutputParameter outputParameter


" motorfader
syn match motorfaderInputParameter "^\s*block" contained
syn match motorfaderInputParameter "^\s*brightness" contained
syn match motorfaderInputParameter "^\s*color" contained
syn match motorfaderInputParameter "^\s*fader" contained
syn match motorfaderInputParameter "^\s*loadpreset" contained
syn match motorfaderInputParameter "^\s*notches" contained
syn match motorfaderOutputParameter "^\s*output" contained
syn match motorfaderInputParameter "^\s*preset" contained
syn match motorfaderInputParameter "^\s*savepreset" contained
syn match motorfaderInputParameter "^\s*select" contained
syn match motorfaderInputParameter "^\s*selectat" contained
syn match motorfaderInputParameter "^\s*sharewithnext" contained
syn match motorfaderInputParameter "^\s*startvalue" contained
syn match motorfaderHeader /\[motorfader\]/ contained
syn region motorfaderCircuit start=/\[motorfader\]/ end=/\[/me=s-1 transparent contains=motorfaderHeader,motorfaderInputParameter,motorfaderOutputParameter,ioregister,number,cable,comment
hi def link motorfaderHeader circuitHeader
hi def link motorfaderInputParameter inputParameter
hi def link motorfaderOutputParameter outputParameter


" logic
syn match logicOutputParameter "^\s*and" contained
syn match logicOutputParameter "^\s*count" contained
syn match logicOutputParameter "^\s*countlow" contained
syn match logicInputParameter "^\s*countvalue" contained
syn match logicInputParameter "^\s*highvalue" contained
syn match logicInputParameter "^\s*input" contained
syn match logicInputParameter "^\s*input1" contained
syn match logicInputParameter "^\s*input2" contained
syn match logicInputParameter "^\s*input3" contained
syn match logicInputParameter "^\s*input4" contained
syn match logicInputParameter "^\s*input5" contained
syn match logicInputParameter "^\s*input6" contained
syn match logicInputParameter "^\s*input7" contained
syn match logicInputParameter "^\s*input8" contained
syn match logicInputParameter "^\s*lowvalue" contained
syn match logicOutputParameter "^\s*nand" contained
syn match logicOutputParameter "^\s*negated" contained
syn match logicOutputParameter "^\s*nor" contained
syn match logicOutputParameter "^\s*or" contained
syn match logicInputParameter "^\s*threshold" contained
syn match logicOutputParameter "^\s*xor" contained
syn match logicHeader /\[logic\]/ contained
syn region logicCircuit start=/\[logic\]/ end=/\[/me=s-1 transparent contains=logicHeader,logicInputParameter,logicOutputParameter,ioregister,number,cable,comment
hi def link logicHeader circuitHeader
hi def link logicInputParameter inputParameter
hi def link logicOutputParameter outputParameter


" algoquencer
syn match algoquencerOutputParameter "^\s*accent" contained
syn match algoquencerInputParameter "^\s*accentbutton" contained
syn match algoquencerInputParameter "^\s*accenthigh" contained
syn match algoquencerInputParameter "^\s*accentlow" contained
syn match algoquencerInputParameter "^\s*activity" contained
syn match algoquencerInputParameter "^\s*alternatebars" contained
syn match algoquencerInputParameter "^\s*alternatebutton" contained
syn match algoquencerInputParameter "^\s*alternaterepeats" contained
syn match algoquencerOutputParameter "^\s*barled" contained
syn match algoquencerOutputParameter "^\s*barled1" contained
syn match algoquencerOutputParameter "^\s*barled2" contained
syn match algoquencerOutputParameter "^\s*barled3" contained
syn match algoquencerOutputParameter "^\s*barled4" contained
syn match algoquencerOutputParameter "^\s*branch" contained
syn match algoquencerInputParameter "^\s*branches" contained
syn match algoquencerInputParameter "^\s*button" contained
syn match algoquencerInputParameter "^\s*button1" contained
syn match algoquencerInputParameter "^\s*button10" contained
syn match algoquencerInputParameter "^\s*button11" contained
syn match algoquencerInputParameter "^\s*button12" contained
syn match algoquencerInputParameter "^\s*button13" contained
syn match algoquencerInputParameter "^\s*button14" contained
syn match algoquencerInputParameter "^\s*button15" contained
syn match algoquencerInputParameter "^\s*button16" contained
syn match algoquencerInputParameter "^\s*button2" contained
syn match algoquencerInputParameter "^\s*button3" contained
syn match algoquencerInputParameter "^\s*button4" contained
syn match algoquencerInputParameter "^\s*button5" contained
syn match algoquencerInputParameter "^\s*button6" contained
syn match algoquencerInputParameter "^\s*button7" contained
syn match algoquencerInputParameter "^\s*button8" contained
syn match algoquencerInputParameter "^\s*button9" contained
syn match algoquencerInputParameter "^\s*clock" contained
syn match algoquencerInputParameter "^\s*dejavu" contained
syn match algoquencerInputParameter "^\s*distribution" contained
syn match algoquencerInputParameter "^\s*fillorder" contained
syn match algoquencerInputParameter "^\s*fills" contained
syn match algoquencerOutputParameter "^\s*fillsled" contained
syn match algoquencerOutputParameter "^\s*gate" contained
syn match algoquencerInputParameter "^\s*gatelength" contained
syn match algoquencerOutputParameter "^\s*led" contained
syn match algoquencerOutputParameter "^\s*led1" contained
syn match algoquencerOutputParameter "^\s*led10" contained
syn match algoquencerOutputParameter "^\s*led11" contained
syn match algoquencerOutputParameter "^\s*led12" contained
syn match algoquencerOutputParameter "^\s*led13" contained
syn match algoquencerOutputParameter "^\s*led14" contained
syn match algoquencerOutputParameter "^\s*led15" contained
syn match algoquencerOutputParameter "^\s*led16" contained
syn match algoquencerOutputParameter "^\s*led2" contained
syn match algoquencerOutputParameter "^\s*led3" contained
syn match algoquencerOutputParameter "^\s*led4" contained
syn match algoquencerOutputParameter "^\s*led5" contained
syn match algoquencerOutputParameter "^\s*led6" contained
syn match algoquencerOutputParameter "^\s*led7" contained
syn match algoquencerOutputParameter "^\s*led8" contained
syn match algoquencerOutputParameter "^\s*led9" contained
syn match algoquencerInputParameter "^\s*length" contained
syn match algoquencerInputParameter "^\s*lengthbutton" contained
syn match algoquencerInputParameter "^\s*loadpreset" contained
syn match algoquencerOutputParameter "^\s*morphled" contained
syn match algoquencerInputParameter "^\s*morphs" contained
syn match algoquencerInputParameter "^\s*mutebutton" contained
syn match algoquencerOutputParameter "^\s*muteled" contained
syn match algoquencerInputParameter "^\s*nextpattern" contained
syn match algoquencerInputParameter "^\s*offbeats" contained
syn match algoquencerInputParameter "^\s*pattern" contained
syn match algoquencerInputParameter "^\s*pitch" contained
syn match algoquencerOutputParameter "^\s*pitch" contained
syn match algoquencerInputParameter "^\s*pitch1" contained
syn match algoquencerInputParameter "^\s*pitch10" contained
syn match algoquencerInputParameter "^\s*pitch11" contained
syn match algoquencerInputParameter "^\s*pitch12" contained
syn match algoquencerInputParameter "^\s*pitch13" contained
syn match algoquencerInputParameter "^\s*pitch14" contained
syn match algoquencerInputParameter "^\s*pitch15" contained
syn match algoquencerInputParameter "^\s*pitch16" contained
syn match algoquencerInputParameter "^\s*pitch2" contained
syn match algoquencerInputParameter "^\s*pitch3" contained
syn match algoquencerInputParameter "^\s*pitch4" contained
syn match algoquencerInputParameter "^\s*pitch5" contained
syn match algoquencerInputParameter "^\s*pitch6" contained
syn match algoquencerInputParameter "^\s*pitch7" contained
syn match algoquencerInputParameter "^\s*pitch8" contained
syn match algoquencerInputParameter "^\s*pitch9" contained
syn match algoquencerInputParameter "^\s*pitchhigh" contained
syn match algoquencerInputParameter "^\s*pitchlow" contained
syn match algoquencerInputParameter "^\s*pitchresolution" contained
syn match algoquencerInputParameter "^\s*preset" contained
syn match algoquencerInputParameter "^\s*prevpattern" contained
syn match algoquencerInputParameter "^\s*repeats" contained
syn match algoquencerInputParameter "^\s*reroll" contained
syn match algoquencerInputParameter "^\s*reset" contained
syn match algoquencerInputParameter "^\s*rollcount" contained
syn match algoquencerInputParameter "^\s*rolls" contained
syn match algoquencerInputParameter "^\s*rollstartvelo" contained
syn match algoquencerInputParameter "^\s*rollsteps" contained
syn match algoquencerOutputParameter "^\s*rollvelocity" contained
syn match algoquencerInputParameter "^\s*savepreset" contained
syn match algoquencerInputParameter "^\s*select" contained
syn match algoquencerInputParameter "^\s*selectat" contained
syn match algoquencerOutputParameter "^\s*startofbar" contained
syn match algoquencerOutputParameter "^\s*trigger" contained
syn match algoquencerInputParameter "^\s*unmutebutton" contained
syn match algoquencerOutputParameter "^\s*unmuteled" contained
syn match algoquencerInputParameter "^\s*variation" contained
syn match algoquencerHeader /\[algoquencer\]/ contained
syn region algoquencerCircuit start=/\[algoquencer\]/ end=/\[/me=s-1 transparent contains=algoquencerHeader,algoquencerInputParameter,algoquencerOutputParameter,ioregister,number,cable,comment
hi def link algoquencerHeader circuitHeader
hi def link algoquencerInputParameter inputParameter
hi def link algoquencerOutputParameter outputParameter
