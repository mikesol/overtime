 \version "2.17.26"
#(set-global-staff-size 15.87)
#(ly:set-option 'point-and-click #f)
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

\include "defs-devel.ly"

airmark = \markup \translate #`(0.0 . ,(- 0.8 0.1)) \draw-circle #0.8 #0.1 ##f

\header {
  title = "La blague"
	  composer = "DjM!k€$01"
}

crap = {
  \autoBeamOff
  \numericTimeSignature
  \override Staff.StaffSymbol.layer = #3
}

marie = \relative c'' {
  \crap
  \override NoteHead.style = #'petrucci
  \clef treble
  \tempo 4=256
  \time 3/4
  ees2.^\ff |
  \time 2/4
  d4 cis |
  c b |
  bes a |
  bes r4 %{\airf g%} |
  des r4 %{\airf g,%} |
  des r4 %{\airf g,%} |
  \time 3/4
  r8 ees8 ~ ees2 |
  \time 2/4
  des4 c4 |
  des2:32 |
  des4.:32 bes8 ~ |
  bes8 r bes4 |
  r8 bes4 r8 |
  bes4 r4 |
  ees2 |
  \time 3/4
  b4 bes a-. |
  \time 4/4
  cis1:32 |
  \time 3/4
  fis,2.:32 |
  \time 2/4
  cis'2:32 |
  \time 3/4
  fis,4.:32 cis':32 |
  \time 2/4
  fis,4:32 gis |
  \time 4/4
  a a a a |
  a a a r |
  ees'2. r8 a, ~ |
  \time 3/4
  a2 r4 |
  \time 2/4
  e'!2 |
  \time 4/4
  cis1:32
  \time 2/4
  cis2:32 |
  \time 6/8
  g4 r8 g4 r8 |
  g4 r8 g4 r8 |
  \time 7/8
  g4 r8 fis4 f |
  \time 5/4
  bes4 bes bes bes bes |
  \time 9/8
  ges4 r8 ges4 r8 f4 r8 |
  \time 3/4
  ees'2.:32 |
  \time 9/8
  g,4 r8 g4 r8 g4 r8 |
  \time 4/4
  des'1 ~ |
  \time 3/4
  des8 r ees,4 r8 c'8 ~ |
  c2. |
  \time 2/4
  r4 ees, |
  bes'8 a r4  |
  ees'8 ees r4 | 
  \time 3/4
  cis2. |
  \time 4/4
  a4 a gis gis |
  \time 3/4
  gis r8 d'4. ~ | 
  d2 r4 |
  \time 2/4
  b bes |
  \times 2/3 { a aes aes } |
  \times 2/3 { aes aes aes } | 
  \time 6/8
  des4. ges, |
  des' ges, |
  \time 2/4
  des'4 ges, |
  \time 4/4
  e2 r4 fis ~ |
  fis r8 fis ~ fis4 r8 fis ~ |
  \time 3/4
  fis4 r8 fis4. |
  ees'2.:32
  fis,2 r8 gis8 ~ |
  \time 2/4
  gis4 r |
  dis'4. r8 |
  \time 4/4
  cis1 |
  \time 5/4
  \times 4/5 { e,4 e e e e } r4 |
  \time 3/4
  c'2:32 r8 b ~ |
  b2.
  g4 a8 g e4 
  e e r |
  \time 4/4
  a a gis r |
  \time 7/8
  cis2 fis,8. fis8. |
  \time 9/8
  fis4 r8 fis4 r8 gis4 r8 |
  \time 4/4
  gis4 r fis r |
  \time 3/4
  a2 r4 |
  fis2 r4 |
  fis2 r4 |
  e2 r4 |
}

marieWords = \lyricmode {
  Bah
  ha ha
  ha ha
  ha ha
  ha %\airmark
  ä %\airmark
  ä %\airmark
  Bah
  ha ha
  hä __ _
  ä ä ä ä
  Bä
  hä hä hä
  ä ë ä ë ä ë 
  ï ï ï ï ï ï ï ï
  Bä
  Ba
  Bä
  hä __ _
  a a a a a a a
  ï ï ï ï ï
  a a a
  ä
  a a a
  a
  å
  a
  å
  ä ä
  ä ä
  Bä
  ha ha ha ha ha
  Bä
  ha ha ha ha ha ha ha ha
  ä a ä a ä a
  hö hö hö hö hö
  ä
  hö hï
  ä
  a
  hå hå hå hå hå
  a
  Ba
  ha ha ha ha ha ha
  cor -- ni -- "chon !"
  Bä ha ha ha
  ha hou hi ha
  ou ou ou i
  
}

ryan = \relative c'' {
  \crap
  \clef "treble_8"
  \override NoteHead.style = #'petrucci
  r2 r8 c8 ~ |
  c4 a4 |
  a4 bes|
  g2:32 |
  g:32 |
  \times 2/3 { r4 g g } |
  b,8 r4 gis8 |
  r4 a8 r4 gis8 |
  r4 a8 e:32 |
  e2:32 |
  e8:32 r4. |
  e4.:32 r8 |
  r8 fis4 r8 |
  r8 fis4 r8 |
  b'2:32 \glissando |
  g2.:32 \glissando |
  \times 2/3 { ees2-. ees-. ees-. } |
  \times 8/12 { r2. \cricket c4 c c c c c c c2 } |
  \tNormal
  \override NoteHead.style = #'petrucci
  r4 gis4 |
  r a r ais |
  r b r2 |
  \cricket
  r2 c4 c |
  c r c |
  c r |
  \tNormal
  \override NoteHead.style = #'petrucci
  \tupFrac
  \clef treble
  \times 7/6 { g'4 \glissando g'-. g,\glissando g'8 ~ g8-. g,4\glissando g'8 ~ g-.
  } ees,8 ees ees ees |
  ees8 ees r des4. ( \glissando
  dis4. \glissando e2 \glissando
  f2. \glissando g2 \glissando |
  gis2. \glissando ais4. \glissando ) |
  b2.-\bendAfter #2 |
  b4 r8 b4 r8 b4 r8 |
  b1 |
  \times 7/10 {
    a2 a a4 ~ a a2 a4 ~ a
  } a4 ~ |
  a2 |
  r4 dis, ( \glissando |
  e2 \glissando fis4 ) |
  r2 b \glissando ( |
  ais4 ) r4 gis ~ |
  gis2 gis4 |
  gis gis |
  \times 2/3 { gis gis gis } |
  ais2:32 |
  fis4. cis |
  fis cis |
  fis4 cis |
  \cricket 
  \times 2/3 { c4 c c } r c |
  c r8 c8. c8. r8 c ~ |
  c16 c8. r8 c8 c c |
  \tNormal
  \override NoteHead.style = #'petrucci
  r4 \times 2/3 { b8 b b } b r |
  b2. |
  \times 2/3 { r4 e dis } |
  \times 2/3 { b gis r } |
  \times 2/3 { gis8 a e' } gis4-. cis,-. fis8-. eis-. |
  %\tupFrac
  \cricket
  \times 8/9 {
    r4 c   c c    \times 2/3 { c4 c c }   c4 c8 c4 c8 ~ } |
  c4
  \tNormal 
  \override NoteHead.style = #'petrucci
  \times 2/3 { a8 a a}
  \cricket
  \times 10/11 {
    c4 c8 ~ c c4 c c8 ~ c c8 c c4 \times 2/3 { c c8 ~ c c4 } \times 2/3 { c c r }
  }
  \tNormal 
  \override NoteHead.style = #'petrucci
  fis, |
  cis r r4. |
  fis4 cis4 r4 r4 cis8 ~ |
  cis4 r2. |
  c2 r4 |
  r4. b4. |
  r4. bes |
  R2. |
}

ryanWords = \lyricmode { 
  Bä
  ha ha ha
  ha __ _
  a ha
  hun hun hun hun hun
  hä __ _ _
  hä
  hö hö
  yi __ _
  hi hi hi
  Il a dit "« c'é" tait dans tes "yeux » !"
  ou ou ou ou
  No we don't, sil -- ly!
  ou -- a ou -- a ou -- a
  fun -- ni -- est joke e -- ver!
  ou
  a
  wuh uh uh
  wa
  uh uh uh uh uh
  wuh
  wuh
  uh
  no
  hou hou hou hou hou hou
  ä
  ee oo ee oo ee oo
  oh my God
  j'a -- dore les blagues sur les cor -- ni -- chons
  tell it a -- gain
  a!
  Good times! Good times!
  ä ä ä ä ä quoi quoi
  You see, it's fun -- ny cause you're an ass -- hole.
  ha ha ha
  I hate my -- self for be -- ing so pas -- sive ag -- gres -- sive.
  Oh snap.
  Oh snap.
  Snap.
  Snap.
  Snap.
  Snap.
}
petr = \override NoteHead.style = #'petrucci

eudes = \relative c' {
  \crap
  \clef "treble_8"
  \petr
  fis2. |
  r4 dis,:32 |
  dis2:32 |
  dis:32 |
  dis4:32 r |
  r8 cis4.:32 |
  cis4:32 r |
  R2. |
  g''4 fis |
  g g |
  \cricket
  \times 5/7 { c,4 c2 \times 2/3 { c4 c c } c8 c4 c8 } c4 |
  \bNormal
  \petr
  r4. fis,8 ~
  fis r fis4
  r8 fis4 r8 fis cis'8 ~ |
  cis2. b4 |
  \times 2/3 { fis8 fis fis } r4 c'4 |
  c c |
  c \times 2/3 { fis,8 fis fis } r4 |
  \clef "treble_8"
  r ais' |
  ais ais ais ais |
  ais ais \clef bass r8 e,4. ~ |
  e4 r e2 ~ |
  e4 r2 |
  ees2 |
  \tNormal
  \petr
  r4 ees'2. ( \glissando |
  aes2 ) |
  R2. |
  \cricket
  r4. r4 c,8 |
  \times 7/8 { c4 c8 c c c c16 c c c }
  \times 2/3 { c8 c c } c4 c8 c4. r4 |
  \tNormal
  \petr
  cis'8 b4 r4. d8 b4 |
  r4. c8 a4 |
  r4. b,8. b b b |
  b b cis [ b ] r4 |
  R2. |
  \clef bass
  ees,4 \times 2/3 { ees2 ees4 ~ ees ees2 } \times 2/3 { ees2 ees4 ~ ees ees2 } |
  f2 f4 ~ |
  f f e,2 ~ |
  e4 r8 f4. ~ |
  f2. |
  r4. f8 ~ |
  f4. r8 |
  r8 f4 a'8 |
  \times 2/3 { dis,1 ais dis } |
  ais2 r4 dis ~ |
  dis r \times 2/3 { b2 dis4 ~ }
  \times 2/3 { dis b2 } e8 b |
  e b e b e b |
  f'2 r8 g ~ g4 r |
  bes4. r8 |
  a1 |
  \clef treble
  \override NoteHead #'no-ledgers = ##t
  e'''2.^\markup \italic "grincement aigu" ~ e2 ~ |
  e2 ~ e8 r |
  \revert NoteHead #'no-ledgers
  \cricket
  r4 c,,4 r |
  \times 2/3 { c c c } c |
  r8 c c c c c |
  c1 |
  \bNormal
  \petr
  r2 cis,4. ~ |
  cis4 r8 r8 b4 r8 cis4 |
  r8 cis4 r8 r4 b4 |
  r8 cis4. r4 |
  b2 r4 |
  cis2 r4 |
  d2 r4 |
} 

eudesWords = \lyricmode {
  Ba
  he __ _ _ _
  he __ _
  he he he he
  c'est drôle, ce que vous ve -- nez de "dire !"
  e e e e in
  hä
  ha ha ha
  hä hä hä hä
  ha ha ha
  he he he he
  he he he
  he he hä
  oui
  j'a -- dore la par -- tie où vous a -- vez dit
  fun -- ni -- est joke e -- ver
  fun -- ny fun -- ny fun -- ny
  c'é -- tait un pu -- tain de blague
  ä ä ä ä ä ä ä
  a djia nia
  j'ai mal au où y
  ha ou ha ou ha ou ha ou
  a -- ou a -- ou a -- ou a -- ou
  ou ou ou ou
  i
  lui, il est mar -- rant, mais il est trop mé -- chant
  hou hi hou hi ha
  he hou hou hou
}

mike = \relative c {
  \clef "treble_8"
  \crap
  R2. |
  R2 |
  R2 |
  R2 |
  \petr
  fis8-. fis-. fis-. fis-. |
  \cricket
  r4. c'8 |
  c8 c4 r8 |
  \times 3/5 { c4 c c c c } |
  \tNormal
  \petr
  c'2:32 |
  a:32 |
  bes:32 |
  r4 gis |
  r8 gis4 r8 |
  gis4 r |
  b b |
  g r8 dis,4.:32 |
  dis4:32 r4 dis2:32 |
  dis4:32 e2 |
  gis2 |
  a4. b4. |
  c2-\bendAfter #2 |
  f'2.^\markup \italic "vib."
  \cricket
  c,8 c |
  c4 c c c |
  c4 c8 c c4 c |
  \tNormal
  \petr
  g'2.:32 |
  g2:32 |
  g4:32 r4 r2 |
  r8 a,4.:32 |
  a4:32 aes,8 aes aes aes |
  aes aes r bes''16. bes bes bes |
  bes bes bes bes \times 2/3 { g8 g g } g8 r |
  \tempo \markup \general-align #Y #DOWN { \column { \italic 3 \note #"6" #UP } = \note #"4" #UP } |
  g8 g g g r4 g8 g g g |
  r4 g8 g g g r4 \clef bass d8 |
  d8 d r4 d8 cis |
  c \times 2/3 { ees,2 des ces } |
  des2 aes ~ |
  aes2 aes8 aes |
  aes r r2 |
  fes2 ~ |
  fes ~ |
  fes |
  R2. |
  \clef treble a''8 bes d f c' r gis, a |
  cis e b' r g, aes |
  c ees bes' r r4 |
  \times 6/7 { a,4 a a a a a a } |
  fis8. cis fis cis |
  fis8. cis fis cis |
  fis cis fis8 |
  \tupFrac
  \times 5/6 { e2 f gis4 ~ gis fis2 a gis } \times 2/3 { dis'2 %|
  cis cis } \times 2/3 {  cis %|
  b b } gis4 |
  f4. r8 |
  \clef bass r2 bes,,2 |
  r4 \times 2/3 { r4 g'2 } \times 2/3 { r4 g2 } |
  \times 2/3 { r4 g2 } r4 |
  r4 cis2:32 |
  cis2.:32 |
  cis2:32 b4:32 |
  b2:32 r4 a4 ~ |
  a2 ais4.:32 |
  a2.:32 r4. |
  cis4 cis cis cis |
  cis cis cis |
  d2. |
  bes2. |
  ges2. |
}

mikeWords = \lyricmode {
  ha ha ha hea
  Donc tu "vois ?" C'é -- tait dans tes "yeux !"
  hä __ _ _
  Oh my God!
  Oh my God!
  he __ _ he __ _
  hun hun hun hun hun
  a
  Oh my God, we DON'T say Schloß in this ope -- ra.
  hä __ _ _
  he __ _
  fun -- ni -- est joke e -- ver!
  fun -- ny fun -- ny fun -- ny fun -- ny
  ha ha ha ha
  ha ha ha ha
  ha ha ha ha
  ha ha ha ha
  ha ha ha
  c'é -- tait un pu -- tain de blague quoi
  ha ha ha
  oua
  he he he he hi
  he he he he hi
  he he he he hi
  hä hä hä hä hä hä hä
  a ou a ou a ou a ou
  a ou a
  ä ou ä ou ä ou ä
  ä ä ä ä ä ä huh
  uh hä hä hä
  ha __ _ _ _ _ yeah!
  hä __ _
  \repeat unfold 7 huh
  \repeat unfold 3 huh
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "La blague" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Mike]" "Donc elle lui fait « Mais comment est-ce que tu savais" "que j'aime les cornichons ? » Et le type, il lui fait" "« C'était dans tes yeux ! »" "   " } }

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marie
    \new Lyrics \lyricsto "marie" \marieWords
    \new Staff = "ryanstaff" \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    \new Lyrics \lyricsto "ryan" \ryanWords
    \new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudes
    \new Lyrics \lyricsto "eudes" \eudesWords
    \new Staff = "mikestaff" \with { instrumentName = "Mike" } \new Voice = "mike" \mike
    \new Lyrics \lyricsto "mike" \mikeWords
  >>
  \layout {
    \context {
      \Voice
      %\override TextScript #'layer = #6
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