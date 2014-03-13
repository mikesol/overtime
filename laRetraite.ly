\version "2.19.0"

\include "defs-devel.ly"

#(set-global-staff-size 15.87)

\header {
  title = "La retraite"
	  composer = "djmikesol"
tagline=""
}

gl = \once \override Beam #'grow-direction = #LEFT
gr = \once \override Beam #'grow-direction = #RIGHT

marie = \relative c' {
  \saNormal
  \question
  \time 4/4
  fis8-.^\p^\markup \italic "sur A" [ fis-. fis-. fis-. fis-. fis-. fis-. fis-. ] |
  \override Score.TimeSignature #'stencil = ##f
  \time 3/8
  \gr g32-.^\< [ g-. g-. g-.   g-. g-.  g-. g-.  g-. g-. g-. g-. ] |
  \time 4/4
  e8-.^\> [ e-. e-. e-. ] a-. [ a-. ] g-. [ g-. ] |
  \time 9/32
  \gr fis32-.^\p [ fis-. fis-.     fis-. fis-.    ] fis-.^\< [ fis-. fis-. fis-. ] |
  \time 5/8
  d'16-.^\mf [ d-. d-. d-.   d-. d-. d-. d-.    d-. d-. ] |
  \time 1/4
  \gl cis32-.^\> [ cis-. cis-. cis-.   cis-.    cis-.     cis-.    cis-.  ] |
  \time 4/4
  b8^\p [ b b b b b ] gis [ gis ] |
  \time 3/8
  \gr a32^\< [ a a a    a a ] \gl a^\> [ a    a a a a ] |
  \time 15/16
  g2^-^\mf^\<^\mordent ( a4^\> ) g16^_ g^_ g^_ |
  \time 4/4
  fis16-. fis-. fis-. fis-. fis-. fis-. fis-. fis-.   d16-. d-. d-. d-. d-. d-. d-. d-. |
  \time 15/16
  c'2^\p^\<^\mordent ( d4 ) c16^_ c^_ c^_ |
  \time 4/4
  b16^\f^\>-. b-. b-. b-. b-. b-. b-. b-.   g16-.^\< g-. g-. g-. g-. g-. g-. g-. |
  \time 18/16
  e'8-.^\f [ e-. e-. e-. e-. e-. e-. ]  d16-.^\< [ d-. ] cis-. [ cis-. ] |
  \time 4/4
  fis^\ff-. [ fis-. fis-. fis-.   fis-. fis-. ] e16-. [ e-. ]  d-. [ d-. d-. d-.  ] cis-. [ cis-.  ] b-. [ b-. ] |
  a16^\>-. [ a-. a-. a-. ] g-. [ g-. ] fis-. [ fis-. ] g-. [ g-. g-. g-. ] a-. [ a-. a-. a-. ] |
  fis1^\p^\mordent |
  g2. a8 g |
  fis2 e |
  d1 ~ |
  d |
}

ryan = \relative c' {
  \tNormal
  \question
  \time 4/4
  d8-.^\p^\markup \italic "sur A" [ d-. d-. d-. d-. d-. d-. d-. ] |
  \override Score.TimeSignature #'stencil = ##f
  \time 3/8
  \gr b32-.^\< [ b-. b-. b-.   b-. b-.  b-. b-.  b-. b-. b-. b-. ] |
  \time 4/4
  cis8-.^\> [ cis-. cis-. cis-. ] cis-. [ cis-. ] cis-. [ cis-. ] |
  \time 9/32
  \gr d32-.^\p [ d-. d-.     d-. d-.    ] ais-.^\< [ ais-. ais-. ais-. ] |
  \time 5/8
  b16-.^\mf [ b-. b-. b-.   b-. b-. b-. b-.    b-. b-. ] |
  \time 1/4
  \gl a32-.^\> [ a-. a-. a-.   a-.    a-.     a-.    a-.  ] |
  \time 4/4
  gis8^\p [ gis gis gis gis gis ] d' [ d ] |
  \time 3/8
  \gr cis32^\< [ cis cis cis    cis cis ] \gl cis^\> [ cis    cis cis cis cis ] |
  \time 15/16
  cis2^-^\mf^\<^\mordent ( e4^\> ) e16^_ e^_ e^_ |
  \time 4/4
  d16-. d-. d-. d-. d-. d-. d-. d-.   a16-. a-. a-. a-. a-. a-. a-. a-. |
  \time 15/16
  fis'2^\p^\<^\mordent ( d4 ) d16^_ d^_ d^_ |
  \time 4/4
  d16^\f^\>-. d-. d-. d-. d-. d-. d-. d-.   b16-.^\< b-. b-. b-. b-. b-. b-. b-. |
  \time 18/16
  cis8-.^\f [ cis-. cis-. cis-. cis-. cis-. cis-. ]  e16-.^\< [ e-. ] e-. [ e-. ] |
  \time 4/4
  d^\ff-. [ d-. d-. d-.   d-. d-. ] a16-. [ a-. ]  b-. [ b-. b-. b-.  ] b-. [ b-.  ] b-. [ b-. ] |
  cis16^\>-. [ cis-. cis-. cis-. ] cis-. [ cis-. ] e-. [ e-. ] e-. [ e-. e-. e-. ] e-. [ e-. e-. e-. ] |
  d1^\p^\mordent |
  cis1 |
  d2 cis |
  d1 ~ |
  d \bar "|."
}

eudes = \relative c {
  \bNormal
  \question
  \time 4/4
  d8-.^\p^\markup \italic "sur A" [ d-. d-. d-. d-. d-. d-. d-. ] |
  \override Score.TimeSignature #'stencil = ##f
  \time 3/8
  \gr e32-.^\< [ e-. e-. e-.   e-. e-.  e-. e-.  e-. e-. e-. e-. ] |
  \time 4/4
  a,8-.^\> [ a-. a-. a-. ] a-. [ a-. ] a-. [ a-. ] |
  \time 9/32
  \gr d32-.^\p [ d-. d-.     d-. d-. ]   cis-.^\< [ cis-. cis-. cis-. ] |
  \time 5/8
  b16-.^\mf [ b-. b-. b-.   b-. b-. b-. b-.    b-. b-. ] |
  \time 1/4
  \gl e32-.^\> [ e-. e-. e-.   e-.    e-.     e-.    e-.  ] |
  \time 4/4
  e,8^\p [ e e e e e ] e [ e ] |
  \time 3/8
  \gr a32^\< [ a a a    a a ] \gl a^\> [ a    a a a a ] |
  \time 15/16
  a2^-^\mf^\<^\mordent ( cis4^\> ) cis16^_ cis^_ cis^_ |
  \time 4/4
  d16-. d-. d-. d-. d-. d-. d-. d-.   fis16-. fis-. fis-. fis-. fis-. fis-. fis-. fis-. |
  \time 15/16
  d2^\p^\<^\mordent ( fis4 ) fis16^_ fis^_ fis^_ |
  \time 4/4
  g16^\f^\>-. g-. g-. g-. g-. g-. g-. g-.   b16-.^\< b-. b-. b-. b-. b-. b-. b-. |
  \time 18/16
  a8-.^\f [ a-. a-. a-. a-. a-. a-. ]  a,16-.^\< [ a-. ] a-. [ a-. ] |
  \time 4/4
  d^\ff-. [ d-. d-. d-.   d-. d-. ] d16-. [ d-. ]  g,-. [ g-. g-. g-.  ] gis-. [ gis-.  ] gis-. [ gis-. ] |
  a16^\>-. [ a-. a-. a-. ] a-. [ a-. ] a-. [ a-. ] cis-. [ cis-. cis-. cis-. ] cis-. [ a-. a-. a-. ] |
  b1^\p^\mordent |
  a1 ~ |
  a |
  d1 ~ |
  d |
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Final" "La retraite" "   " "   "  } }

\markup \huge \fill-line { \center-column { \italic "[pause, tout le monde gêné]" "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" "Je fais mon speech...et puis, je..." "   " } }

\markup \huge \fill-line { \center-column { \italic "[les autres chantent le hymne glitché pendant que Mike parle]" "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" 
\justify {
C’est avec une tristesse incommensurable que j'embarque
dans cette nouvelle aventure. Après tout ce qu’on a vécu…
les hauts…les bas...
A vrai dire, vous êtes la seule famille que j’aie jamais eue.
Tous les matins, en me levant, je n’avais qu’une seule envie,
c’était de vous retrouver ici, ensemble, et IL Y A COMBIEN DE PUTAIN
DE BOITES DANS CETTE PUTAIN DE BOITE.
Bref, grâce à votre loyauté, votre soutien, et une troisième chose,
je peux dire sincèrement que j’ai passé les plus belles années de
ma vie avec…
....
c’est quoi ça ?
}}}

\score {
  \new ChoirStaff <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marie
    %\new Lyrics \lyricsto "marie" \marieWords
    %\new Staff = "mikestaff" \with { instrumentName = "Mike" } \new Voice = "mike" \mike
    %\new Lyrics \lyricsto "mike" \mikeWords
    \new Staff = "ryanstaff" \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    %\new Lyrics \lyricsto "ryan" \ryanWords
    \new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudes
    %\new Lyrics \lyricsto "eudes" \eudesWords
  >>
  \layout {
    \context {
      \Voice
      \override TextScript #'layer = #6
      \override Glissando #'breakable = ##t
      \override TupletNumber #'breakable = ##t
      \override TupletNumber #'avoid-slur = #'ignore
      \override TupletBracket #'breakable = ##t
      \remove "Forbid_line_break_engraver"
    }
    \context {
      \Staff
      %\override TimeSignature #'style = #'numbered
      %\override StaffSymbol #'layer = #4
      %\override TimeSignature #'layer = #3
      %\override TimeSignature #'whiteout = ##t
    }
    \context {
      \Lyrics
      %\override LyricText #'whiteout = ##t
      %\override LyricText #'layer = #6
    }
    \context {
      \Score
      \override NonMusicalPaperColumn #'allow-loose-spacing = ##f
    }
  }
  \midi {}
}
