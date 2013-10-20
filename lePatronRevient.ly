\version "2.17.1"
\include "defs-devel.ly"
#(ly:set-option 'point-and-click #f)

#(set-global-staff-size 15.87)

\header {
  title = "Le patron revient"
  composer = "DJMIKESoL"
}
\paper {
  ragged-last-bottom = ##f
  footnote-separator-markup = \markup { \column { " "\override #`(span-factor . 1/5) { \draw-hline } }}
  footnote-padding = 5\mm
  top-system-spacing = #'((basic-distance . 1) (minimum-distance . 0) (padding . 1) (stretchability . 40))
  bottom-system-spacing = #'((basic-distance . 1) (minimum-distance . 0) (padding . 1) (stretchability . 50))
  ragged-right = ##f
  left-margin = 0.75\in
  right-margin = 0.75\in
  top-margin = 0.5\in
  bottom-margin = 0.6\in

}

qFour = \once \override Score . TimeSignature #'stencil =
#(lambda (grob)
  (grob-interpret-markup grob (markup #:override '(baseline-skip . 0) (#:column (#:huge #:bold "?" #:number "4")))))

noTS = \override Score . TimeSignature . stencil = ##f

padMM = \override Score.MetronomeMark.padding = #2

myBar = { | \bar "|" }

%first = \tempo "Gemässigt"
%atempo = \tempo "Gemässigt"
%fast =   \tempo "Lustig"
%faster =   \tempo "Schnell"
first = \tempo "batshit happy"
atempo = {}
faster = {}
fast = {}

mikeOne = \relative c' {
  \padMM
  \first
  \qFour
  \time 2/4
  c2^\f^\markup \italic \column { "curious outrage" } \myBar
  \noTS
  \time 4/4
  R1 \myBar
  \time 5/8
  c8^\markup \italic \column { "heaved" "hyperventilating" } c c c c \myBar
}

marieTwo = \relative c ' {
  \time 1/4
  \times 2/3 { c8^\mf^\markup \italic \column { "surexcité, bête" } c c } \myBar
  \time 1/6
  \times 2/3 { c8 c } \myBar
}

ryanThree = \relative c' {
  \time 1/4
  \times 2/3 { c8^\mf^\markup \italic \column { "all smiles, dumb" } c c } \myBar
  \time 1/6
  \times 2/3 { c8 c } \myBar
}

mikeFour = \relative c' {
  \faster
  \time 1/4
  f,4^\mf^\markup \italic "inquisitive" \myBar
  R4 \myBar
  g'^\f^\markup \italic "shocked" \myBar
  \time 5/8
  g8 g g g r \myBar
}

marieFive = \relative c' {
  \time 1/4
  R4 \myBar
  g'4:32^\markup \italic "en riant" \myBar
  R4 \myBar
  \time 5/8
  R1*5/8 \myBar
}

ryanSix = \relative c' {
  \time 1/4
  R4 \myBar
  g'4:32^\markup \italic "laughing" \myBar
  R4 \myBar
  \time 5/8
  R1*5/8 \myBar
}

marieSeven = \relative c' {
  \time 1/4
  \times 2/3 { f,8^\mf^\markup \italic "vous voyez, ce qui s'est passé, c'est que..." c' g' } \myBar
  \time 1/3
  \times 2/3 { c,4-. c-\bendAfter #2 } \myBar
  \time 1/4
  c16^\p^\< c c c \myBar
  c8-.^\f c16^\p^\< c \myBar
  c8-.^\f c16^\p^\< c \myBar
  c8-.^\f \times 2/3 { c16 c c } \myBar
}

ryanEight = \relative c' {
  \time 1/4
  \times 2/3 { f,8^\mf^\markup \italic "but I can explain..." c' g' } \myBar
  \time 1/3
  \times 2/3 { c,4-. c-\bendAfter #2 } \myBar
  \time 1/4
  c16^\p^\< c c c \myBar
  c8-.^\f c16^\p^\< c \myBar
  c8-.^\f c16^\p^\< c \myBar
  c8-.^\f \times 2/3 { c16 c c } \myBar
}

mikeNine = \relative c' {
  \time 3/4
  c4.^\espressivo^\markup \italic "what's taht?" r4. \myBar
  c4^\espressivo^\markup \italic "that..." r4 r4 \myBar
  \time 1/4
  c^-^\markup \italic "THAT!" \myBar
}

marieTen = \relative c' {
  \time 3/4
  r4. c4.^-^\markup \italic "quoi ?"-\bendAfter #3 \myBar
  r4 c4^-^\markup \italic "quoi ? où ?"-\bendAfter #3 c4^--\bendAfter #3 \myBar
  \time 1/4
  R4 \myBar
}

ryanEleven = \relative c' {
  \time 3/4
  r4. c4.^-^\markup \italic "what?"-\bendAfter #3
  \time 3/4
  r4 c4^-^\markup \italic "what? where?"-\bendAfter #3 c4^--\bendAfter #3 \myBar
  \atempo
  \time 1/4
  R4 \myBar
}

marieTwelve = \relative c' {
  \time 1/4
  \times 2/3 { c8 c c } \myBar
  c16 c c c \myBar
  c8 c \myBar
  \time 2/4
  \times 2/3 { c4-. c-. c-. } \myBar
  \time 1/4
  c4-. \myBar
}

ryanThirteen = \relative c' {
  \time 1/4
  \times 2/3 { c8 c c } \myBar
  c16 c c c \myBar
  c8 c \myBar
  \time 2/4
  \times 2/3 { c4-. c-. c-. } \myBar
  \time 1/4
  c4-. \myBar
}

nobodyFourteen = {
  \time 4/4
  R1^\markup \italic \center-column { "il découvre le" "stagiaire sous le drap" } \myBar
}

eudesFifteen = \relative c' {
  \time 2/4
  c2:32^\mp^\markup \italic "effrayé, en bêlant" \myBar
}

nobodySixteen = \relative c' {
  \time 3/4
  R2.^\markup \italic "shock" \myBar
}

ryanSeventeen = \relative c' {
  \time 1/3
  \times 2/3 { e4^\mf a, } \myBar
}

marieEighteen = \relative c' {
  \time 1/3
  \times 2/3 { e^\mf a, } \myBar
}

nobodyNineteen = \relative c' {
  \time 2/4
  R2 \myBar
}

mikeTwenty = \relative c' {
  \fast
  \time 2/4
  c2^\f-\bendAfter #2 ^\markup \italic "rage" \myBar
  a8 a a a \myBar
  a8. a8 a8. \myBar
  \time 3/4
  e'4 e e \myBar
  \time 4/4
  f,4 \glissando ( g'2. ) \myBar
  f,1 \myBar
  \time 5/6
  \times 2/3 { c'4 c c c r4 } \myBar
}

ryanTwentyOne = \relative c' {
  \time 1/4
  a16^\mp^\markup \italic "en essayant de raisonner" c e c \myBar
  r a c8 \myBar
  r16 c8 r16 \myBar
  r16 a^\< e' c \myBar
  \time 3/8
  a16 r8 e'8^\f-\bendAfter #-2 r16 \myBar
}

mikeTwentyTwo = \relative c' {
  \time 1/4
  \atempo
  a4^\f^\espressivo \myBar
}

marieTwentyThree = \relative c'' {
  \time 1/4
  g16-.^\mp^\markup \italic "en suppliant" g-. g-. g-. \myBar
  g-. g-. g-. g-. \myBar
  \time 3/16
  g-. g-. g-. \myBar
}

mikeTwentyFour = \relative c' {
  \time 1/4
  c8-.^\markup \italic "stern admonishment" c-. \myBar
  c-. c-. \myBar
}

ryanTwentyFive = \relative c' {
  \time 11/16
  c8.^\mf^\markup \italic "getting his word in" a16 a a c8. r8 \myBar
}

mikeTwentySix = \relative c' {
  \time 3/8
  c4.^-^\markup \italic "hell no!" \myBar
}

ryanTwentySeven = \relative c' {
  \time 5/16
  c16^\markup \italic "spoken normally" c8 c16 c \myBar \noBreak
  \time 1/4
  c8. c16 \myBar \noBreak
  c16 c c c \myBar
  r16 c c c \myBar
  \times 2/3 { c8 c c } \myBar
  \time 3/8
  c16 c \times 2/3 { c4 c8 } \myBar
}

mikeTwentyEight = \relative c' {
  \time 1/4
  c4^\ff^\markup \italic "fury!" \myBar
}

marieTwentyNine = \relative c' {
  \time 7/8
  c8-.^\markup \italic "caca nerveux" c-. c-. c-. c-. c-. c-. \myBar
}

ryanThirty = \relative c' {
  \time 7/8
  c8^\markup \italic "oh shit..." c c c c c c \myBar
}

nobodyThirtyOne = \relative c' {
  \time 4/4
  R1 \myBar
}

eudesThirtyTwo = \relative c' {
  \time 4/4
  c2.:32^\espressivo^\f^\markup \italic \column { "c'est qui qui" "s'occupe de moi !?!" } r4 \myBar
}

mikeThirtyThree = \relative c' {
  \time 4/4
  c4^-^\f^\markup \italic "demi-être" c^- c4.^- r8 \myBar
  r8. c16^\mp c c r8 r2 \myBar
  \cricket
  \tri c4^\markup \italic \column { "en mâchant le pain" "de son enfant" } \tri c r8 \tri c4 r8 \myBar
  \time 5/4
  \tri c4^\markup \italic \column { "et en le lui donnant" "à manger" }  r \tri c4 r \tri c \myBar
}

eudesThirtyFour = \relative c' {
  \time 2/4
  \times 2/3 { c4^\mf^\markup \italic \column { "en gémissant" "il est content, le petit !" } c c } \myBar
  \times 2/3 { c c c} \myBar
  \time 5/8
  R1*3/4 |
}

marieThirtyFive = \relative c' {
  \time 2/4
  R2 \myBar
  \override NoteHead #'style = #'cross
  c16^\mf^\markup \italic "techno beat" c c c c c c c \myBar
  \time 3/4
  c16 c c c c c c c r4 \myBar
  \revert NoteHead #'style
  \cricket
}

ryanThirtySix = \relative c' {
  \time 2/4
  R2 \myBar
  R2 \myBar
  \time 3/4
  r4 c16^\mf^\markup \italic "spoken" c c4 r8 \myBar
}

mikeThirtySeven = \relative c' {
  \time 2/4
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  R2 \myBar
  R2 \myBar
  \time 3/4
  r2 r16 c8.^\espressivo^\markup \italic "fed up" \myBar
}

mikeThirtyEight = \relative c' {
  \time 4/4
  \cricket
  r2. \tri c8^\markup \italic \column { "picking food from baby's (intern's)" "teeth and eating it, smacking lips" } \tri c \myBar
  \time 3/4
  r2 \tri c8 \tri c \myBar
  r2 \tri c8 r \myBar
}

ryanThirtyNine = \relative c' {
  \time 4/4
  c2^\mf^\<^\markup \italic \column { "eating the" "intern's leg" } r4 c^\mp^\markup \italic "yes!" \myBar
  r4 c^\f^\markup \italic "ok..." r2 \myBar
}

mikeForty = \relative c' {
  \time 4/4
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  r2 c4^\mf^\markup \italic "no" r \myBar
  e4^"NO!" r \bNormal bes,2^\espressivo ^\markup \italic "robust" \myBar
}

mikeFortyOne = \relative c' {
  \time 5/4
  \cricket
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  r2 c4^\markup \italic "keeps chewing..." c r \myBar
}

marieFortyTwo = \relative c' {
  \time 4/4
  c16^\mp^\markup \italic \column { "en cueillant les poux du stagiare" "et en les grignotant" } c c c    c c c c    c c c c    c c c c \myBar
  \time 3/4
  c16 c c c    c c c c    c c c c \myBar
}

mikeFortyThree = \relative c' {
  \time 4/4
  c4^\mf^\markup \italic "hey"-\staccatissimo r4 r8 c4.^\markup \italic "i want some" |
}

nobodyFortyFour = \relative c' {
  \time 2/4
  R2^\markup \italic \column { "elle incline" "sa tête..." }  \myBar
}

marieFortyFive = \relative c' {
  \time 4/4
  c16^\markup \italic "en continuant" c c c    c c c c    c c c c    c c c c \myBar
  \time 5/4
  c16 c c c    c c c c    c c c c    c c c c    c c c c \myBar
}

mikeFortySix = \relative c' {
  \time 4/4
  r4    c16^\mp^\markup \italic \column { "en grignotant" "les poux du CDI" } c c c    c c c c    c c c c \myBar
  \time 5/4
  c16 c c c    c c r8 r4. c4^>^\f ^\markup \italic "!!!" r8 \myBar
}

ryanFortySeven = \relative c' {
  \time 4/4
  R1 \myBar
  \time 5/4
  r4. c8:32^\mf^\markup \italic \column { "mischievous laughter" "keeps eating leg" } c4.:32 r8 r4 \myBar
}

nobodyFortyEight = \relative c' {
  \time 2/4
  R2
}

mikeFortyNine = \relative c' {
  \time 4/4
  \cricket
  \tri c4^\markup \italic \column { "en se léchant la patte" "et en essuyant le bébé" } \tri c r2 \myBar
  \time 6/4
  \tri c4 \tri c r8 \tri c4 r8 r2 \myBar
  \time 4/4
  \tri c4 r r2 \myBar
}

eudesFifty = \relative c' {
  \time 4/4
  r2 c2:32^\mf^\markup \italic "c'est bien !!" \myBar
  \time 6/4
  r2 r4. c8:32 c4.:32 r8 \myBar
  \time 4/4
  R1 \myBar
}

mikeFiftyOne = \relative c' {
  \time 3/4
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  f2.^\mf^\>^\markup \italic \column { "breast-feeding the intern" "repulsive sound of joy..." }  \myBar
  R2. \myBar
  \time 4/4
  f,4r f r |
  r8 f4^\p r8 r2 |
}

marieFiftyTwo = \relative c' {
  \time 3/4
  R2. \myBar
  \saNormal
  c'2.^\mf\trill^\markup \italic "awww..." \myBar
  \time 4/4
  c1^\> \myBar
  \cricket
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  r2\! c,4^\f^\markup \italic "not!" r |
}

ryanFiftyThree = \relative c' {
  \time 3/4
  R2. \myBar
  \tNormal
  aes'2.^\mf\trill^\markup \italic "awww..." \myBar
  \time 4/4
  aes1^\> \myBar
  \cricket
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  r2\! c,4^\f^\markup \italic "not!" r \myBar
}

nobodyFiftyFour = \relative c'{
  R1^\fermataMarkup \bar "|."
}

eudesMusic = {
  \autoBeamOff
  \cricket
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  $(mmrest-of-length mikeOne)
  $(mmrest-of-length ryanThree)
  $(mmrest-of-length mikeFour)
  $(mmrest-of-length marieSeven)
  $(mmrest-of-length mikeNine)
  $(mmrest-of-length marieTwelve)
  $(mmrest-of-length nobodyFourteen)
  \eudesFifteen
  $(mmrest-of-length nobodySixteen)
  $(mmrest-of-length marieEighteen)
  \nobodyNineteen
  $(mmrest-of-length mikeTwenty)
  $(mmrest-of-length ryanTwentyOne)
  $(mmrest-of-length mikeTwentyTwo)
  $(mmrest-of-length marieTwentyThree)
  $(mmrest-of-length mikeTwentyFour)
  $(mmrest-of-length ryanTwentyFive)
  $(mmrest-of-length mikeTwentySix)
  $(mmrest-of-length ryanTwentySeven)
  $(mmrest-of-length mikeTwentyEight)
  $(mmrest-of-length marieTwentyNine)
  \nobodyThirtyOne
  \eudesThirtyTwo
  $(mmrest-of-length mikeThirtyThree)
  \eudesThirtyFour
  $(mmrest-of-length mikeThirtyEight)
  $(mmrest-of-length ryanThirtyNine)
  $(mmrest-of-length mikeFortyOne)
  $(mmrest-of-length marieFortyTwo)
  $(mmrest-of-length mikeFortyThree)
  $(mmrest-of-length nobodyFortyFour)
  $(mmrest-of-length marieFortyFive)
  \nobodyFortyEight
  \eudesFifty
  $(mmrest-of-length marieFiftyTwo)
  \nobodyFiftyFour
}

eudesWords = \lyricmode {
}

marieMusic = {
  \autoBeamOff
  \cricket
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  \qFour
  $(mmrest-of-length mikeOne)
  \marieTwo
  \marieFive
  \marieSeven
  \marieTen
  \marieTwelve
  $(mmrest-of-length nobodyFourteen)
  $(mmrest-of-length eudesFifteen)
  $(mmrest-of-length nobodySixteen)
  \marieEighteen
  \nobodyNineteen
  $(mmrest-of-length mikeTwenty)
  $(mmrest-of-length ryanTwentyOne)
  $(mmrest-of-length mikeTwentyTwo)
  \marieTwentyThree
  $(mmrest-of-length mikeTwentyFour)
  $(mmrest-of-length ryanTwentyFive)
  $(mmrest-of-length mikeTwentySix)
  $(mmrest-of-length ryanTwentySeven)
  $(mmrest-of-length mikeTwentyEight)
  \marieTwentyNine
  \nobodyThirtyOne
  $(mmrest-of-length eudesThirtyTwo)
  $(mmrest-of-length mikeThirtyThree)
  \marieThirtyFive
  $(mmrest-of-length mikeThirtyEight)
  $(mmrest-of-length ryanThirtyNine)
  $(mmrest-of-length mikeFortyOne)
  \marieFortyTwo
  $(mmrest-of-length mikeFortyThree)
  \nobodyFortyFour
  \marieFortyFive
  \nobodyFortyEight
  $(mmrest-of-length eudesFifty)
  \marieFiftyTwo
  \nobodyFiftyFour
}

marieWords = \lyricmode {
  \repeat unfold 25 \skip 1
  oui
  oui oui
  oui oui oui
  ha ha ha ha ha
  ou ou ou ou ou
  uh oh
}

ryanMusic = {
  \autoBeamOff
  \cricket
  \berioGoalposts
  \revert Staff.BarLine.bar-extent
  \revert Voice.Stem.direction
  \qFour
  $(mmrest-of-length mikeOne)
  \ryanThree
  \ryanSix
  \ryanEight
  \ryanEleven
  \ryanThirteen
  $(mmrest-of-length nobodyFourteen)
  $(mmrest-of-length eudesFifteen)
  $(mmrest-of-length nobodySixteen)
  \ryanSeventeen
  \nobodyNineteen
  $(mmrest-of-length mikeTwenty)
  \ryanTwentyOne
  $(mmrest-of-length mikeTwentyTwo)
  $(mmrest-of-length marieTwentyThree)
  $(mmrest-of-length mikeTwentyFour)
  \ryanTwentyFive
  $(mmrest-of-length mikeTwentySix)
  \ryanTwentySeven
  $(mmrest-of-length mikeTwentyEight)
  \ryanThirty
  \nobodyThirtyOne
  $(mmrest-of-length eudesThirtyTwo)
  $(mmrest-of-length mikeThirtyThree)
  \ryanThirtySix
  $(mmrest-of-length mikeThirtyEight)
  \ryanThirtyNine
  $(mmrest-of-length mikeFortyOne)
  $(mmrest-of-length marieFortyTwo)
  $(mmrest-of-length mikeFortyThree)
  $(mmrest-of-length nobodyFortyFour)
  \ryanFortySeven
  \nobodyFortyEight
  $(mmrest-of-length eudesFifty)
  \ryanFiftyThree
  \nobodyFiftyFour
}

ryanWords = \lyricmode {
  \repeat unfold 25 \skip 1
  oui
  oui oui
  oui oui oui
  ha ha ha ha ha
  ou ou ou ou ou
  uh oh
  \repeat unfold 17 \skip 1
  a -- lors, com -- ment "dire ?"
  vous n'é -- tiez pas là, et on est de -- scen -- du
  dans une sorte de
  \repeat unfold 7 \skip 1
  par -- ty time
}

mikeMusic = \relative c' {
  \autoBeamOff
  \cricket
  \berioGoalposts
  \revert Voice.Stem.direction
  \revert Staff.BarLine.bar-extent
  \qFour
  \mikeOne
  $(mmrest-of-length ryanThree)
  \mikeFour
  $(mmrest-of-length marieSeven)
  \mikeNine
  $(mmrest-of-length ryanThirteen)
  \nobodyFourteen
  $(mmrest-of-length eudesFifteen)
  \nobodySixteen
  $(mmrest-of-length marieEighteen)
  \nobodyNineteen
  \mikeTwenty
  $(mmrest-of-length ryanTwentyOne)
  \mikeTwentyTwo
  $(mmrest-of-length marieTwentyThree)
  \mikeTwentyFour
  $(mmrest-of-length ryanTwentyFive)
  \mikeTwentySix
  $(mmrest-of-length ryanTwentySeven)
  \mikeTwentyEight
  $(mmrest-of-length marieTwentyNine)
  \nobodyThirtyOne
  $(mmrest-of-length eudesThirtyTwo)
  \mikeThirtyThree
  \mikeThirtySeven
  \mikeThirtyEight
  \mikeForty
  \mikeFortyOne
  $(mmrest-of-length marieFortyTwo)
  \mikeFortyThree
  $(mmrest-of-length nobodyFortyFour)
  \mikeFortySix
  \nobodyFortyEight
  \mikeFortyNine
  \mikeFiftyOne
  \nobodyFiftyFour
}

mikeWords = \lyricmode {
  \repeat unfold 40 \skip 1
  my bé -- bé
  my bé -- bé
}

%#(format #t "~a\n" (ly:music-duration-length (mmrest-of-length mikeMusic)))

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Le patron revient" "   " "   "  } }

\markup \huge \fill-line { \center-column { \italic "(ils cachent le stagiaire sous un drap comme si de rien n'était...)" "   " } }


\score {
  <<
    \new Staff \with { instrumentName = \markup \center-column { "Eudes" "(agneau)" } shortInstrumentName = "E.P." } \new Voice = "eudes" \eudesMusic
    \new Lyrics \lyricsto "eudes" \eudesWords
    \new Staff \with { instrumentName = \markup \center-column { "Marie" "(rongeuse)" } shortInstrumentName = "M.P." } \new Voice = "marie" \marieMusic
    \new Lyrics \lyricsto "marie" \marieWords
    \new Staff \with { instrumentName = \markup \center-column { "Ryan" "(singe)" } shortInstrumentName = "R.V." } \new Voice = "ryan" \ryanMusic
    \new Lyrics \lyricsto "ryan" \ryanWords
    \new Staff \with { instrumentName = \markup \center-column { "Mike" "(Mike)" } shortInstrumentName = "M.S." } \new Voice = "mike" \mikeMusic
    \new Lyrics \lyricsto "mike" \mikeWords
  >>
  \layout {}
  %\midi {}
}
