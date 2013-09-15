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
  title = "L'anglais"
	  composer = "dJm1KEsøL"
}

crap = {
  \autoBeamOff
  \numericTimeSignature
  \override Staff.StaffSymbol.layer = #3
  \key b \major
}

marie = \relative c'' {
  \crap
  \time 9/8
  \tempo "Triomphal" 4.=200
  a4.^\f a8 a a a8. a |
  \time 3/4
  a4 a a |
  \time 9/8
  a4. a8 a a a8. a |
  \time 2/4
  a4 a |
  \time 9/8
  gis4. gis8 gis gis gis8. gis |
  \time 3/4
  gis4 gis gis |
  \time 6/8
  gis4. gis8 gis8 r |
  gis4. gis8 gis r8 |
  gis4. gis8 gis8 r |
  \tupFrac
  \times 3/4 { gis2. gis gis gis } | 
  \time 2/4
  gis2 |
  \time 6/8
  r4. gis |
  \time 2/4
  R2 |
  g4. ~ g8 r4 g4. ~ |
  g8 r4 g8 ~ g8 r4 g8 |
  \tempo \markup { \note #"4." #UP = \note #"4" #UP } |
  \time 2/4
  b4 b8 b8 |
  \time 5/8
  b8 b b b r |
  \time 2/4
  b4 b8 b8 |
  \time 5/8
  b8 b b b r |
  \time 7/8
  b4 b8 b8 b4 r8 |
  \time 3/4
  b8 b b b r4 |
  R1^\fermataMarkup |
  \time 2/1
  \tempo "Langsam" 2=92
  e,\breve^\mp^\< \glissando |
  gis\breve^\> \glissando ( |
  \once \override Score . TimeSignature #'stencil =
  #(lambda (grob)
    (grob-interpret-markup grob
      (markup #:override '(baseline-skip . 0)
      (#:center-column (#:concat (#:number "1" #:raise 1 #:fontsize -5 #:column (#:number "3" #:number "4")) #:number "1")))))
  \time 7/4
  e4\! ) r4 r2 r4 cis^\< ( \glissando d4^\mf ) |
  \time 9/8
  \tempo "Triomphal" 4.=200
  a'4.^\subF a8 a8 a8 a8. a |
  \time 3/4
  a4 a a |
  \time 9/8
  a'4. a8 a8 a8 a8. a |
  \time 4/4
  a4 a a a |
  \time 9/8
  a4. a a |
  \time 4/4
  a2 a |
  \time 7/8
  a4. a4 a |
  \tempo \markup { \note #"4." #UP = \note #"4" #UP } |
  gis8 gis gis gis gis gis r |
  gis8 gis gis gis gis gis r |
  gis8 gis gis gis gis r |
  gis8 gis gis gis r4 |
  R1*7/8 |
\once \override Score . TimeSignature #'stencil =
#(lambda (grob)
  (grob-interpret-markup grob (markup #:override '(baseline-skip . 0) (#:column (#:huge #:bold "?" #:number "4")))))
  \time 4/4
  \MonoShift
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s4*2/3-"Deuxième" s-"leçon," s-"où" s-"on" s-"apprend" s-"à" |
  s8-"dire" s-"des" s-"phrases" s-"plus" s-"longues" s-"que" s-"ta"
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
  \saNormal
  r8 |
  R1 |
  R1 |
  R1 |
  r2..^\markup \italic { Cat like } gis,8 |
  cis gis4. ~ gis4 \times 2/3 { fisis8 gis fisis } |
  fis4 e dis r8 gis^\markup \italic { Really? } ~ |
  gis4 r gis2 ~ |
  gis4 r gis4.^\markup \italic { Seriously? } r8 |
  b2 r4 bes^\markup \italic { Come on... } ~ |
  bes r a4 r |
  R1*5 |
}

marieWords = \lyricmode {
  I speak -- a the Eng -- lish
  I I I
  I speak -- a the Eng -- lish
  I I
  I speak -- a the Eng -- lish
  I I I
  I speak -- a I speak -- a I speak -- a
  I I I I
  I I
  I I I I
  Kit -- chen, I'm in the Bri -- an!
  Kit -- chen is chic -- ken chic -- ken.
  Chic -- ken kit -- chen.
  Bri -- an Bri -- an.
  Mon "Dieu !"
  Mon
  I speak -- a the Eng -- lish I I I
  I speak -- a the Eng -- lish I speak I speak
  I I I I I I I speak
  Bri -- an owes me mo -- ney
  Bri -- an owes me mo -- ney
  Bri -- an owes me five fuc -- king dol -- lars.
  wa wa wa wa wa wa wa wa wa wa wa wa wa wa wa
}

ryan = \relative c' {
  \crap
  \clef "treble_8"
  \time 9/8
  d4.^\f d8 d d d8. d |
  \time 3/4
  d4 d d |
  \time 9/8
  d4. d8 d d d8. d |
  \time 2/4
  d4 d |
  c4. c8 c8 c8 c8. c |
  r8 cis4 cis r8 |
  cis4 cis4 r8 cis8 ~ |
  cis8 cis4 r4 cis8 ~ |
  cis4 cis4 r4 |
  \times 2/3 { d2 d2 r8 } |
  r4 d4. d8 ~ |
  d8 r4 d4. |
  r8 d4 r8 |
  d4 r d  |
  e2 |
  e4. ~ e8 e4 ~ e8 e4 ~ |
  e4 e4 ~ e8 e4. |  
  \time 2/4
  dis4 dis8 dis8 |
  \time 5/8
  dis8 dis dis dis r |
  \time 2/4
  e4 e8 e8 |
  \time 5/8
  e8 e e e r |
  \time 7/8
  g4 g8 g8 g4 r8 |
  \time 3/4
  fis8 fis fis fis r4 |
  R1^\fermataMarkup |
  \time 2/1
  \tempo "Langsam" 2=92
  cis\breve^\mp^\< \glissando |
  e\breve^\> \glissando ( |
  \time 7/4
  d2\! \glissando cis4 ) r4 r4 cis^\< ( \glissando d4^\mf ) |
  cis4.^\subF cis8 cis cis cis8. cis |
  cis4 cis cis |
  cis4. cis8 cis cis   \FatText
  \MonoShift
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s4.-"Hello" |
  s2-"Mr." s2-"English!"
  s4.-"I" s4.-"be" s4.-"is"
  s2*2/3-"wanting" s2*2/3-"to" s2*2/3-"learn"
  s2-"the" s1*3/8-"you!"
  %s1-\markup \override #'(line-width . 126) \justify { le sang de vos péchés coulera dans la rivière et fera revenir celui qui nous donne du "pain !" "                                               " } |
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
  \tNormal
  \time 7/8
  bis8 bis bis bis bis bis r |
  cis8 cis cis cis cis cis r |
  \time 6/8
  dis dis dis dis dis r |
  dis dis dis dis r4 |
  \time 7/8 |
  R1*7/8 |
  R1 |
  R1 |
  \MonoShift
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s2 s2-"[inhale cigarette]"
  s2 s2-"Tu vois, l'anglais, c'est pas"
  s1-"vraiment une langue."
  s1-"C'est un ensemble de pratiques"
  s2-"reparties entre"
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
  \times 2/3 { c8 c c ~ } c8 r |
  \times 2/3 { c8 c c ~ } c8 r \times 2/3 { c8 c c ~ } c8 r |
  \times 2/3 { c8 c c ~ } c8 r \times 2/3 { c8 c c ~ } c8 r |
  \times 2/3 { c8 c c ~ } c8 r \times 2/3 { c8 c c ~ } c8 r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
}

ryanWords = \lyricmode { 
  I speak -- a the Eng -- lish
  I I I
  I speak -- a the Eng -- lish
  I I
  I speak -- a the Eng -- lish
  I speak I speak I speak
  I speak I speak I speak I speak I speak
  I speak I speak I speak
  Kit -- chen, hel -- lo I'm Bri -- an.
  Kit -- chen is chic -- ken chic -- ken
  Chic -- ken kit -- chen, Bri -- an Bri -- an.
  Mon "Dieu !"
  Mon
  I speak -- a the Eng -- lish
  I I I
  I speak -- a the
  Bri -- an owes me mo -- ney
  Bri -- an owes me mo -- ney
  Bri -- an owes me five fuc -- king dol -- lars.
  \repeat unfold 21 { plu -- si -- eurs }
}

mike = \relative c' {
  \crap
  \clef "treble_8"
  e4.^\f e8 e e e8. e |
  e4 e e |
  fis4. fis8 fis fis fis8. fis |
  fis4 fis |
  dis4. dis8 dis dis dis8. dis |
  r8 e2 r8 |
  e2 r8 e8 ~ |
  e4. r8 e4 ~ |
  e4 e2 |
  fis4. fis8 fis fis |
  fis8. fis fis4 fis8 ~ |
  fis8 fis4 fisis4. ~ |
  fisis8 fisis8 fisis fisis |
  fisis2 fisis4 |
  \time 2/4
  %\once \override TextScript.self-alignment-X = #CENTER
  g2-\parenthesize^"=" |
  \time 9/8
  a4. a8 a a a8. a |
  \time 4/4
  \times 2/3 { a2 a4 } \times 2/3 { a2 a4 } |
  \time 2/4
  b,,4 b8 b8 |
  \time 5/8
  b8 b b b r |
  \time 2/4
  b4 b8 b8 |
  \time 5/8
  b8 b b b r |
  \time 7/8
  b4 b8 b8 b4 r8 |
  \time 3/4
  b8 b b b r4 |
  R1^\fermataMarkup |
  R1*2 |
  R1*2 |
  R1*7/4 |
  e'4. e8 e e e8. e |
  e4 e b' ~ |
  b2. ~ b4. ~ |
  b1 |
  e,4. e8 e e e8. e |
  \times 2/3 { e4 e e } fis4 fis8 fis
  fis fis fis fis4 fis 
  \time 7/8
  fis8 fis fis fis fis fis r |
  eis8 eis eis eis eis eis r |
  \time 6/8
  fis fis fis fis fis r |
  fis fis fis fis r4 |
  \time 7/8 |
  R1*7/8 |
  R1 |
  \clef bass
  r2.. gis,,8 |
  \tempo "Ein Jazzermanns Tempo" 4=100 
  \time 4/4
  \repeat percent 5 {
    cis4 b a gis |
    fis \times 2/3 { e8 fis e } dis8 gis4 gis8 |
  }
  \cricket
  \times 2/3 { c'8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
} 

mikeWords = \lyricmode {
  I speak -- a the Eng -- lish
  I I I
  I speak -- a the Eng -- lish
  I I
  I speak -- a the Eng -- lish
  I I I I I
  I speak -- a the Eng -- lish
  I I I
  I speak -- a the
  I speak
  I
  I speak -- a the Eng -- lish
  I speak I speak
  Kit -- chen, hel -- lo I'm Bri -- an!
  Kit -- chen is chic -- ken chic -- ken.
  Chic -- ken kit -- chen.
  Bri -- an Bri -- an.
  I speak -- a the Eng -- lish I I I
  I speak -- a the Eng -- lish I I I
  I speak -- a the Eng -- lish I speak
  Bri -- an owes me mo -- ney
  Bri -- an owes me mo -- ney
  Bri -- an owes me five fuc -- king dol -- lars.
  ba dum dum dum dum dum ba da da dut dum ba
  \repeat unfold 10 { plu -- si -- eurs }
}

eudes = \relative c'' {
  \crap
  R1*9/8 |
  R2. |
  R1*9/8 |
  R2 |
  R1*9/8 |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2 |
  R2. |
  R2 |
  R1*9/8 |
  R1 |
  R2 |
  R1*5/8 |
  R2 |
  R1*5/8 |
  R1*7/8 |
  R2. |
  \time 4/4
  \cricket
  \tempo "andante con moto, ma non troppo"
  c,4^\mf c \times 2/3 { c8 c c } \times 2/3 { c8 c r^\fermata } |
  R1*2 |
  R1*2 |
  R1*7/4 |
  R1*9/8 |
  R2. |
  R1*9/8 |
  R1 |
  \bNormal
  \clef bass
  a,2^\f a4 a a8 ~ |
  a a \times 2/3 { d4 d d } r |
  \times 2/3 { d4 d d } r8 d d
  R1*7/8 |
  R1*7/8 |
  R2. |
  r2 r8 gis, ~ |
  gis gis gis gis cis cis r |
  R1 |
  R1 |
  \cricket
  \Cross
  \repeat percent 2 { c'4^\markup \italic "charleston" c8 c8 c4 c8 c8 }
  c4 c8 c8 \revert NoteHead #'style \cricket c8 c c c |
  \Cross
  \repeat percent 12 { c4^\markup \italic "charleston" c8 c8 c4 c8 c8 } \bar "||"
}

eudesWords = \lyricmode {
  I don't speak -- a the Eng -- rish.
  Now I speak En -- glish! Look at me! Look at me! Look at
  Bri -- an is my wo -- man.
  \repeat unfold 9 \skip 1
  sing it sis -- ta!
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "L'anglais" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Mike]" "Do you speak English ?" "   " } }

\score {
  \new ChoirStaff <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marie
    \new Lyrics \lyricsto "marie" \marieWords
    \new Staff = "mikestaff" \with { instrumentName = "Mike" } \new Voice = "mike" \mike
    \new Lyrics \lyricsto "mike" \mikeWords
    \new Staff = "ryanstaff" \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    \new Lyrics \lyricsto "ryan" \ryanWords
    \new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudes
    \new Lyrics \lyricsto "eudes" \eudesWords
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