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
  score-markup-spacing #'basic-distance = #1

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

nhP =   \override NoteHead.style = #'petrucci

lexicon = \markup \justify {
  Petrucci-style notes indicate approximate pitches...but they
  should be perfectly approximate...or else...
}

marie = \relative c'' {
  \Hairlen #5
  \crap
  \override NoteHead.style = #'petrucci
  \clef treble
  \tempo "presto con fuoco" 4=256
  \time 3/4
  \footnote "" #'(0 . 0) \lexicon
  ees2.^\ff^\markup \italic "clown" |
  \time 2/4
  d4 cis |
  c b |
  bes a |
  bes r4 %{\airf g%} |
  des r4 %{\airf g,%} |
  des r4 %{\airf g,%} |
  \time 3/4
  r8 ees8^\f^\< ~ ees2-\bendAfter #2 |
  \time 2/4
  des4^\ff c4 |
  des2:32^\markup \italic "mitrailleuse" |
  des4.:32 bes8^\markup \italic "auto-masochiste" ~ |
  bes8 r bes4 |
  r8 bes4 r8 |
  bes4 r4 |
  ees2^\markup \italic "clown" |
  \time 3/4
  b4 bes a-. |
  \time 4/4
  cis1:32^\markup \italic "mitrailleuse" |
  \time 3/4
  fis,2.:32 |
  \time 2/4
  cis'2:32 |
  \time 3/4
  fis,4.:32 cis':32 |
  \time 2/4
  fis,4:32 gis^\markup \italic "petit singe"^\> |
  \time 4/4
  a a a^\< a |
  a a a^\ff r |
  ees'2.^\markup \italic "clown" r8 a,^\mf ~ |
  \time 3/4
  a2^\markup \italic "mouette" r4 |
  \time 2/4
  e'!2^\f^\markup \italic "clown" |
  \time 4/4
  cis1:32^\ff^\markup \italic "mitrailleuse"
  \time 2/4
  cis2:32 |
  \time 6/8
  g4^\mf^\markup \italic "auto-masochiste" r8 g4 r8 |
  g4 r8 g4 r8 |
  \time 7/8
  g4 r8 fis4 f |
  \time 5/4
  bes4^\markup \italic "petit singe" bes bes bes bes |
  \time 9/8
  ges4^\markup \italic "auto-masochiste" r8 ges4 r8 f4 r8 |
  \time 3/4
  ees'2.:32^\ff^\markup \italic "mitrailleuse" |
  \time 9/8
  g,4^\mf^\markup \italic "auto-masochiste" r8 g4 r8 g4 r8 |
  \time 4/4
  des'1^\ff^\markup \italic "âne/mouette hybride" ~ |
  \time 3/4
  des8 r ees,4^\mf r8 c'8^\ff ~ |
  c2. |
  \time 2/4
  r4 ees,^\mf |
  bes'4:32^\f^\markup \italic "mitrailleuse" r4  |
  ees4:32^\mf r4 | 
  \time 3/4
  cis2.^\ff^\markup \italic "clown" |
  \time 4/4
  a4^\f^\markup \italic "petit singe" a gis gis |
  \time 3/4
  gis r8 d'4.^\ff^\markup \italic "clown" ~ | 
  d2 r4 |
  \time 2/4
  b^\f^\markup \italic "petit singe" bes |
  \times 2/3 { a aes aes } |
  \times 2/3 { aes aes aes } | 
  \mark \markup \italic "(fanfare)"
  \time 6/8
  des4. ges, |
  des' ges, |
  \time 2/4
  des'4 ges, |
  \mark \markup \italic "(ord. (enfin...))"
  \time 4/4
  e2^\mf^\<^\markup \italic "moyen singe" r4 fis ~ |
  fis r8 fis ~ fis4 r8 fis ~ |
  \time 3/4
  fis4 r8 fis4. |
  ees'2.:32^\ff^\markup \italic "mitrailleuse" |
  fis,2^\mf^\markup \italic "moyen singe" r8 gis8 ~ |
  \time 2/4
  gis4 r |
  dis'4.:32^\ff^\markup \italic "mitrailleuse" r8 |
  \time 4/4
  cis1^\markup \italic "mouette" |
  \time 5/4
  \times 4/5 { e,4^\mf^\markup \italic "moyen singe" e e e e } r4 |
  \time 3/4
  c'2:32^\ff^\markup \italic "mitrailleuse" r8 b ~ |
  b2.^\markup \italic "clown" |
  g4^\markup \italic "un enfant méchant" a8 g e4 
  e e r |
  \time 4/4
  a^\mf a gis r |
  \time 7/8
  cis2^\f^\markup \italic "clown" fis,8. fis8. |
  \time 9/8
  fis4 r8 fis4^\markup \italic "moyen singe" r8 gis4 r8 |
  \time 4/4
  gis4 r fis r |
  \time 3/4
  a2 r4 |
  fis2^\markup \italic "grand singe" r4 |
  fis2 r4 |
  e2 r4 |
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark "état de choc profond"
  R2. |
  R2. |
  \time 2/4
  R2 |
  \time 3/4
  cis'16.^\ff^\markup \italic "enfantin" cis cis cis cis cis r8. |
  R2. |
  r4 cis16.^\f cis r16 r4 |
  r2 c'8^\p^\markup \italic "souris"-\bendAfter #2 r |
  a8.^\mp^\markup \italic "mignon" fis fis fis |
  fis8. r16 \cricket \tri c,8^\markup \italic "grognemenet" \saNormal
     \override NoteHead.style = #'petrucci e'^\ff^\markup \italic "fou chez fou" bes' f
  ees8 d des c \times 2/3 { b b b }
  \times 2/3 { r8 c c } \times 2/3 { c c c }  \times 2/3 { c c c } |
  fis,4.^\fp^\<^\markup \italic "sirène" ( \glissando dis'8^\f ) ais^\fp^\< ( \glissando e'^\f )
  \time 2/4
  dis4.^\fp ( \glissando bis'8^\f ) |

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
  ä %ä
  ä %ä
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
  hä hä hä hä hä hä
  hä hä
  mi
  si si si si si
  \skip 1
  ga ia hä
  hä hä hä hä hä hä hä
  hä hä hä hä hä hä hä hä
  hai hai hai
  
}

ryan = \relative c'' {
  \crap
  \clef "treble_8"
  \override NoteHead.style = #'petrucci
  r2 r8 c8^\markup \italic "clown" ~ |
  c4 a4 |
  a4 bes|
  g2:32^\markup \italic "machine gun" |
  g:32 |
  \times 2/3 { r4 g g } |
  b,8^\markup \italic "nasal" r4 gis8 |
  r4 a8 r4 gis8 |
  r4 a8 e:32^\markup \italic "machine gun" |
  e2:32 |
  e8:32 r4. |
  e4.:32 r8 |
  r8 fis4^\markup \italic "ape" r8 |
  r8 fis4 r8 |
  b'2:32^\markup \italic "hyena" \glissando |
  g2.:32 \glissando |
  \times 2/3 { ees2-. ees-. ees-. } |
  \times 8/12 { r2. \cricket c4^\markup \italic "stupid" c c c c c c c2 } |
  \tNormal
  \override NoteHead.style = #'petrucci
  r4 gis4^\markup \italic "goofy" |
  r a r ais |
  r b r2 |
  \cricket
  r2 c4^\markup \italic "gay" c |
  c r c |
  c r |
  \tNormal
  \override NoteHead.style = #'petrucci
  \tupFrac
  \clef treble
  \times 7/6 { g'4^\markup \italic "siren" \glissando g'-. g,\glissando g'8 ~ g8-. g,4\glissando g'8 ~ g-.
  } ees,8^\markup \italic "vocoder" ees ees ees |
  ees8 ees r cis4.^\markup \italic "slow siren" ( \glissando
  dis4. \glissando e2 \glissando
  f2. \glissando g2 \glissando |
  gis2. \glissando ais4. \glissando ) |
  b2.^\markup \italic "tape slowing down..."-\bendAfter #2 |
  b4 r8 b4 r8 b4 r8 |
  b1 |
  \times 7/10 {
    a2^\markup \italic "slower..." a a4 ~ a a2 a4 ~ a
  } a4 ~ |
  a2 |
  r4 dis,^\markup \italic "slower" ( \glissando |
  e2 \glissando fis4 ) |
  r2 b \glissando ( |
  ais4 ) r4 gis^\markup \italic "crystalline" ~ |
  gis2 gis4 |
  gis gis |
  \times 2/3 { gis gis gis } |
  ais2:32^\markup \italic "machine gun" |
  fis4.^\markup \italic "dumb" cis |
  fis cis |
  fis4 cis |
  \cricket 
  \times 2/3 { c4^\markup \column { "cross between a big black woman" "and a Jewish grandmother" } c c } r c |
  c r8 c8. c8. r8 c ~ |
  c16 c8. r8 c8 c c |
  \tNormal
  \override NoteHead.style = #'petrucci
  r4 \times 2/3 { b8^\markup \italic "nasal" b b } b r |
  b2.^\markup \italic "operatic" |
  \times 2/3 { r4 e^\markup \italic "ol' fashioned" dis } |
  \times 2/3 { b gis r } |
  \times 2/3 { gis8^\markup \italic "woody the woodpecker " a e' } gis4-. cis,-. fis8-.^\markup \italic "gargled" eis-. |
  %\tupFrac
  \cricket
  \times 8/9 {
    r4 c^\markup \italic "Boston accent"   c c    \times 2/3 { c4 c c }   c4 c8 c4 c8 ~ } |
  c4
  \tNormal 
  \override NoteHead.style = #'petrucci
  \times 2/3 { a8^\markup \italic "machine gun" a a }
  \cricket
  \times 10/11 {
    c4^\markup \italic "post-pubescent Strong Sad" c8 ~ c c4 c c8 ~ c c8 c c4 \times 2/3 { c c8 ~ c c4 } \times 2/3 { c c r }
  }
  \tNormal 
  \override NoteHead.style = #'petrucci
  fis,^\markup \italic "white on black" |
  cis r r4. |
  fis4 cis4 r4 r4 cis8 ~ |
  cis4 r2. |
  c2 r4 |
  r4. b4. |
  r4. bes |
  R2. |
  R2. |
  R2. |
  \time 2/4
  R2 | 
  \times 2/3 { des''4^\markup \italic "clown" c b } r4 |
  R2. |
  r4 b r4 |
  r2 aes8^\markup \italic "bambi"-\bendAfter #2 r |
  \tupFrac
  \times 3/5 { r4 bes^\markup \italic "cooing" ees d des }
  des4 r2 |
  a'2.^\markup \italic "OMFG!!!1" |
  b,2^\markup \italic "siren" ( \glissando fis'4^\markup \italic "gorilla" ) |
  fis,, e \times 2/3 { r8 a4 } |
  r4 gis4 |
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
  ba ha ha
  ba
  mi
  oh lit -- tle cu -- tie
  ga!!!
  hoi
  huh huh
  heh heh
}
petr = \override NoteHead.style = #'petrucci

eudes = \relative c' {
  \crap
  \clef "treble_8"
  \petr
  fis2.^\markup \italic "mouette" |
  r4 dis,:32^\markup \italic "simplet" |
  dis2:32 |
  dis:32 |
  dis4:32 r |
  r8 cis4.:32 |
  cis4:32 r |
  R2. |
  g''4^\markup \italic "phoque" fis |
  g g |
  \cricket
  \times 5/7 { c,4^\markup \italic "prétentieux" c2 \times 2/3 { c4 c c } c8 c4 c8 } c4 |
  \bNormal
  \petr
  r4. fis,8^\markup \italic "emphysème" ~
  fis r fis4
  r8 fis4 r8 fis cis'8^\markup \italic "strident/nasal" ~ |
  cis2. b4^\markup \italic "Peter Griffin" |
  \times 2/3 { fis8 fis fis } r4 c'4 |
  c c |
  c \times 2/3 { fis,8 fis fis } r4 |
  \clef "treble_8"
  r ais'^\markup \italic "idiot/débile" |
  ais ais ais ais |
  ais ais \clef bass r8 e,4.^\markup \italic "grand singe" ~ |
  e4 r e2 ~ |
  e4 r2 |
  ees2 |
  \tNormal
  \petr
  r4 ees'2.^\markup \italic "sirène/bande lente" ( \glissando |
  aes2 ) |
  R2. |
  \cricket
  r4. r4 c,8^\markup \italic "gay" |
  \times 7/8 { c4 c8 c c c c16 c c c }
  \times 2/3 { c8 c c } c4 c8 c4. r4 |
  \tNormal
  \petr
  cis'8^\markup \italic "MORTAL KOMBAT" b4 r4. d8 b4 |
  r4. c8 a4 |
  r4. b,8.^\markup \italic "pop arabe" b b b |
  b b cis [ b ] r4 |
  R2. |
  \clef bass
  ees,4^\markup \italic "nasale" \times 2/3 { ees2 ees4 ~ ees ees2 } \times 2/3 { ees2 ees4 ~ ees ees2 } |
  f2^\markup \italic "chaman sympa" f4 ~ |
  f f e,2^\markup \italic "chaman méchant" ~ |
  e4 r8 f4. ~ |
  f2. |
  r4. f8 ~ |
  f4. r8 |
  r8 f4 a'8^\markup \italic "le grand singe fait sa fanfare" |
  \times 2/3 { dis,1 ais dis } |
  ais2 r4 dis ~ |
  dis r \times 2/3 { b2 dis4 ~ }
  \times 2/3 { dis b2 } e8^\markup \italic "techno" b |
  e b e b e b |
  f'2^\markup \italic "phoque lent"-\bendAfter #2 r8 g ~ g4-\bendAfter #2 r |
  bes4.-\bendAfter #2 r8 |
  a1-\bendAfter #-2 |
  \clef treble
  \override NoteHead #'no-ledgers = ##t
  e'''2.^\markup \italic "grincement aigu" ~ e2 ~ |
  e2 ~ e8 r |
  \revert NoteHead #'no-ledgers
  \cricket
  r4 c,,4^\markup \italic "explication à la con" r |
  \times 2/3 { c c c } c |
  r8 c c c c c |
  c1 |
  \bNormal
  \petr
  r2 cis,4.^\markup \italic "dénouement de grand singe" ~ |
  cis4 r8 r8 b4 r8 cis4 |
  r8 cis4 r8 r4 b4 |
  r8 cis4. r4 |
  b2 r4 |
  cis2 r4 |
  d2 r8 \cricket \tri c'8^\markup \italic "grognement" ~ |
  \tri c2 r4 |
  R2. |
  \time 2/4
  R2 |
  r2 r16 \tri c8. |
  R2. |
  r4 r8. \tri c16 ~ \tri c8 r |
  R2. |
  R2. |
  \bNormal \nhP
  r4. bes,8^\markup \italic "mitrailleuse dauphine" bes bes |
  bes bes bes bes c'8 c |
  c c f f f f |
  \clef treble
  g b d g a, e' |
  a b, fis' cis' |
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
  \skip 1
  \skip 1
  \skip 1
  \repeat unfold 7 hä
  \repeat unfold 4 hä \repeat unfold 4 ha
  \repeat unfold 10 hä
}

mike = \relative c {
  \clef "treble_8"
  \crap
  R2. |
  R2 |
  R2 |
  R2 |
  \petr
  fis8-.^\markup \italic "perv" fis-. fis-. fis-. |
  \cricket
  r4. c'8^\markup \italic "dumb" |
  c8 c4 r8 |
  \times 3/5 { c4 c c c c } |
  \tNormal
  \petr
  c'2:32^\markup \italic "machine gun" |
  a:32 |
  bes:32 |
  r4 gis^\markup \italic "fat old lady" |
  r8 gis4 r8 |
  gis4 r |
  b b |
  g r8 dis,4.:32^\markup \italic "machine gun" |
  dis4:32 r4 dis2:32 |
  dis4:32 e2^\markup \italic "nasal" |
  gis2 |
  a4. b4. |
  c2-\bendAfter #2 |
  f'2.^\markup \italic "molto vib."
  \cricket
  c,8^\markup \italic "fag hag" c |
  c4 c c c |
  c4 c8 c c4 c |
  \tNormal
  \petr
  g'2.:32^\markup \italic "machine gun" |
  g2:32 |
  g4:32 r4 r2 |
  r8 a,4.^\markup \italic "limpid" ~ |
  a4 aes,8^\markup \italic "vocoder" aes aes aes |
  aes aes r bes''16.^\markup \italic "stupid" bes bes bes |
  bes bes bes bes \times 2/3 { g8 g g } g8 r |
  %\tempo \markup \general-align #Y #DOWN { \column { \italic 3 \note #"6" #UP } = \note #"4" #UP } |
  g8 g g g r4 g8 g g g |
  r4 g8 g g g r4 \clef bass d8 |
  d8 d r4 d8^\markup \italic "slizow dizown" cis |
  c \times 2/3 { ees,2 des ces } |
  des2 aes ~ |
  aes2 aes8 aes |
  aes r r2 |
  fes2 ~ |
  fes ~ |
  fes |
  R2. |
  \clef treble a''8^\markup \italic "dolphin on meth" bes d f c' r gis, a |
  cis e b' r g, aes |
  c ees bes' r r4 |
  \times 6/7 { a,4^\markup \italic "monkey" a a a a a a } |
  fis8.^\markup \italic "too fast" cis fis cis |
  fis8. cis fis cis |
  fis cis fis8 |
  \tupFrac
  \times 5/6 { e2^\markup \italic "lil' monkey" f gis4 ~ gis fis2 a gis } \times 2/3 { dis'2 %|
  cis cis } \times 2/3 {  cis %|
  b b } gis4 |
  f4.^\markup \italic "dumb" r8 |
  \clef bass r2 bes,,2^\markup \italic "disgust" |
  r4 \times 2/3 { r4 g'2^\markup \italic "nasal" } \times 2/3 { r4 g2 } |
  \times 2/3 { r4 g2 } r4 |
  r4 cis2:32^\markup \italic "fratty" |
  cis2.:32 |
  cis2:32 b4:32 |
  b2:32 r4 a4 ~ |
  a2 ais4.:32 |
  a2.:32 r4. |
  cis4^\markup \italic "out of breath" cis cis cis |
  cis cis cis |
  d2. |
  bes2. |
  ges2. |
  R2. |
  R2. |
  \time 2/4
  R2 |
  \clef treble
  \times 2/3 { a'4^\markup \italic "stupid seal" g a } r |
  R2. |
  r4 g^\markup \italic "ape" r |
  r2 f4^\markup \italic "dumb" |
  \clef bass
  r4 g,^\markup \italic "relief"-\bendAfter #-3 r4 |
  \clef treble
  r4. cis'4.:32^\markup \italic "machine gun" ( |
  cis2:32 \glissando g4:32 ) |
  \times 4/5 { g4.^\markup \italic "self-masochist" g4. g4. g4. cis4^\markup \italic "monkey" cis4 cis4 cis4 } |
   
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
  he
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
  wut wut wut
  huh
  oui
  ah
  hä
  ä ä ä ä
  ä ä ä ä
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "La blague" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Mike]" "Donc elle lui fait « Mais comment est-ce que tu savais" "que j'aime les cornichons ? » Et le type, il lui fait" "« C'était dans tes yeux ! »" "   " } }

\score {
  \new ChoirStaff <<
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

%{
  SNORT
  SNORT
  SNORT
  [[[loud]]]
  Hé, je connais une blague !
  C'est quoi ta blague ?
  Quand j'étais petit, awww ma mère m'a battu très très fort. uhh
  Des fois, elle s'y est mise avec ses mains. Des fois c'était avec un fouet.
  Une fois, en rentrant, elle a vu que j'avais défait mes nattes
  à l'école et elle a rit
    MAIS QU'EST QU'ELLE A RIT
    MAIS QU'EST QU'ELLE A RIT
    MAIS QU'EST QU'ELLE A RIT
  [[[loud]]]
%}

\markup \huge \fill-line { \center-column { "[Marie]" "Moi je connais une blague." "   " } }

\markup \huge \fill-line { \center-column { "[Eudes, Ryan, Mike]" "C'est quoi ta blague ?" "   " } }

\markup \huge \fill-line { \center-column { "[Marie]" "Quand j'étais petit..." "   " } }

\markup \huge \fill-line { \center-column { "[Eudes, Ryan, et Mike]" "Awwwww..." "   " } }

\markup \huge \fill-line { \center-column { "[Marie]" "Ma mère me battait très fort." "   " } }

\markup \huge \fill-line { \center-column { "[Eudes, Ryan, Mike]" "uh" "   " } }

\markup \huge \fill-line { \center-column { "[Marie]" "Des fois c'était avec un fouet, et des fois elle s'y mettait avec..." "   " } }

\markup \huge \fill-line { \center-column { "[Ryan]" "Moi je connais une blague." "   " } }

% pickup + 5

allTwo = \relative c' {
  \partial 16
  \cricket
  \time 5/4
  c16^\markup "mitrailleuse" |
  \repeat unfold 20 c
}

allTwoWords = \lyricmode {
  a^\ff \repeat unfold 20 ha
}

\markup {
  \fill-line {
    \center-column {
      \score {
        <<
          \new Staff \with { instrumentName = \markup \column { "M.P." "R.V." "E.P." "M.S." } } \new Voice = "all" \allTwo
          \new Lyrics \lyricsto "all" \allTwoWords
        >>
       \layout {indent = #0 ragged-right = ##t }
      }
      "   "
      "   "
}}}

\markup \huge \fill-line { \center-column { "[Ryan et Mike]" "J'adore !" "   " } }

\markup \huge \fill-line { \center-column { "[Eudes]" "Moi j'ai fait une blague une fois, mais elle n'était pas marrante et personne n'a rit." "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" "Et moi, j'ai gagne le concours intérnational de la blague." "   " } }

\markup \huge \fill-line { \center-column { "[Marie]" "Quand ça ?" "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" "Maintenant..." "   " } }

\version "2.17.28"

mahlerUp = \relative c'' {
  \key d \major
  \clef treble
  <a d fis>1 |
  <d, fis a>2. <a' d fis>4 |
  <a d fis>1 |
  <d, fis a>2. <d' fis a>4 |
  <d fis a>1 ~ |
  <d fis a>1 |
  <d, fis a>1 |
  <d fis a>2 <d fis a d> |
  <d fis a d>1 ~ |
  <d fis a d> |
  <d fis a d>1 |
  <d fis a d> |
  \key ees \major
  <ees g bes ees> ~ |
  \time 8/4
  <ees g bes ees>1.. \glissando
  <fes aes ces fes>8 r |
}

mahlerDown = \relative c {
  \clef bass
  \key d \major
  d4 a d a |
  d a d a |
  d a d a |
  d a d a |
  d1:32 |
  d4 a d a |
  d1:32 |
  d4 a d a |
  d1:32 |
  d1:32 |
  d2 a |
  d a |
  \key ees \major
  ees'1 ~ |
  ees1.. \glissando fes8 r8 |
}

marieYay = \relative c'' {
  \crap
  fis32^\ff^\markup \italic "triomphal" fis8.. ~ fis4 ~ fis 
  \override NoteHead.style = #'petrucci
  e32^\markup \italic "japonais" e e e e e e e 
  ees ees ees ees d d d d r8 fis8^\markup \italic "petite fille" \times 2/3 { e d \times 2/3 { cis16 cis cis } } \times 2/3 { \times 2/3 { c16 c c } c8 r } |
  ees4^\mf^\markup \italic "débordant de joie"-\bendAfter #-3 r8 d4-\bendAfter #-3 r8 c16 c8. ~ |
  c8-\bendAfter #-3 \times 2/3 { c16^\> c c }
     \times 4/6 { b b bes bes a a }
     \times 2/3 { gis gis gis^\p } r8 \revert NoteHead #'style fis'32^\f^\markup \italic "triomphal" fis8.. ~ |
  fis16 \override NoteHead.style = #'petrucci d^\> \times 2/3 { c c c }
     r8 d^\markup \italic "dénouement" ~
     d16 a8. ~
     a8. fis16 ~ |
  fis8^\pp-\bendAfter #-3 r8 r4 r2 |
  R1*9 |
}

marieWordsYay = \lyricmode {
  hor -- rah
  ha ha ha ha ha ha ha ha
  ha ha ha ha ha ha ha ha
  ya ya ya ha ha ha ha ha ha ha
  ah ah
  trop bien
  ha ha ha ha ha ha ha ha ha ha ha ha
  hor -- rah
  a ha ha ha
  ah ah ah
}

mikeYay = \relative c' {
  \MonoShift
  \FatText
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s2 s4-"merci," s4-"merci," |
  s4 s4*3/5-"je veux" s-"surtout" s-"remercier" s-"la DRAC" s-"Ile-de-France" |
  s2 s2-"qui m'a accompagné"
  s1-"tout au long de la création de cette blague"
  s1-"et j'aimerais également remercier..."
  s1-"vous...Monsieur..."
  s1-"merci...merci..."
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
}

mikeWordsYay = \lyricmode {
}

ryanYay = \relative c' {
  \tNormal
  \crap
  d32^\markup \italic "a major scale" d16. [ ( cis16 b a g fis e ] d8 [ e16 fis g a b cis ] |
  d8 [ e16 fis g a b cis ] d8 [ cis16 b a g fis e ] |
  d8 ) r8 \override NoteHead.style = #'petrucci \times 2/3 { fis8^\markup \italic "structuralist" fis fis } e16 e ees ees d16 r8 fis16 |
  c4:32^\markup \italic "machine gun" c8:32 r8 c2:32 |
  r8 \times 2/3 { b16 b b } a8^\markup \italic "dénouement" ~ \times 2/3 { a8 g16 } \times 2/3 {fis8 e16 } d8 ~ d8 r |
  R1*3 |
  \cricket
  r2 c'16^\markup \italic "umm..." c8. r4 |
  R1*6 |
}

ryanWordsYay = \lyricmode {
  hor -- rah
  ah ah ah ha ha ha ha ha
  ya ha __ _ ha
  ha ha hor -- rah hor -- rah hor -- rah
  bra -- vo
}

eudesYay = \relative c' {
  \override NoteHead.style = #'petrucci
  \crap
  \clef bass
  \times 2/3 { d8 c b } \times 4/6 { c16 b r8 r16 d }
     cis16 r8. \cricket r8 c8 |
  c16 c c8 c16 c c8 ~
     \times 2/3 { c16 \bNormal \override NoteHead.style = #'petrucci g16 g g fis8 ~ } fis8 \times 2/3 { g16 fis8 ~ } |
  fis8 r \revert NoteHead.style fis32 fis8.. ~ fis4 \override NoteHead.style = #'petrucci a32 g8.. ~ |
  g16 r16 r16. a32 a4 \cricket r8. c16 ~ c8 r |
  c16 c r8 r c c4 c16 c8. |
  \times 2/3 { c8 c c } r4 r2 |
  R1*9 |
}

eudesWordsYay = \lyricmode {
  ya ha ha ha ha
  ya ha
  bien mé -- rit -- é
  viel a -- mi
  ha ha ha ha ha ha
  hor -- rah
  ha ha
  ha ha
  yes
  ha ha
  voi -- là, bra -- vo, par ex -- emple
}

\score {
  \new ChoirStaff <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marieYay
    \new Lyrics \lyricsto "marie" \marieWordsYay
    \new Staff = "ryanstaff" \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryanYay
    \new Lyrics \lyricsto "ryan" \ryanWordsYay
    \new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudesYay
    \new Lyrics \lyricsto "eudes" \eudesWordsYay
    \new Staff = "mikestaff" \with { instrumentName = "Mike" } \new Voice = "mike" \mikeYay
    \new Lyrics \lyricsto "mike" \mikeWordsYay
    \new PianoStaff <<
      \new Staff \mahlerUp
      \new Staff \mahlerDown
    >>
  >>
  \layout {
    indent = #0
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

\markup \huge \fill-line { \center-column { "[Eudes]" "J'ai pas compris la blague." "   " } }
