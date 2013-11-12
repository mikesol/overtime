\version "2.17.26"
#(set-global-staff-size 15.87)
#(ly:set-option 'point-and-click #f)
\paper {
  %ragged-last-bottom = ##f
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
  a4. a8 a8 a8 a8. a |
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
  \qFour
  \time 4/4
  \MonoShift
  \FatText
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
  r2..^\markup \italic { Cat like } gis8^\f |
  cis gis4. ~ gis4 \times 2/3 { fisis8 gis fisis } |
  fis4 e dis r8 gis^\markup \italic { Really? } ~ |
  gis4 r gis2 ~ |
  gis4 r gis4.^\markup \italic { Seriously? } r8 |
  b2 r4 bes^\markup \italic { Come on... } ~ |
  bes r a4 r |
  R1*5 |
  \qFour
  \time 4/4
  \MonoShift
  \FatText
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s4*4/6-"Troisième" s-"leçon," s-"où" s-"on" s-"apprend" s-"à" |
  s4*4/6-"dire" s-"le" s-"mot" s-"plusieurs" s-"en" s-"boucle" |
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
  \saNormal
  \time 6/4
  R1. |
  \time 12/8
  a4.^\f a8 a a a8. a a a |
  \time 6/4
  b2 b b |
  \time 9/8
  cis4. cis8 cis cis cis8. cis |
  \time 6/4
  cis4 d cis d cis d
  \time 4/4
  cis4. cis cis4 |
  \time 3/8
  cis4. |
  \time 5/2
  d2 d d d d |  
  R1 |
  R1*9/8 |
  R1 |
  R1*9/8 |
  R1 |
  R1*9/8 |
  R1 |
  R1*9/8 |
  R1 |
  R2. |
  \transpose e ees \relative c'' {
    \time 9/8
    cis4. cis8 cis cis cis8. cis8. |
    \time 2/4
    cis4 cis |
    \time 6/8
    dis4. dis8 dis r8 |
    dis4. dis8 dis r8 |
    dis4. dis8 dis r8 |
    \time 9/8
    eis4. eis8 eis eis eis8. eis8. |
    \time 3/4
    eis4 eis eis |
    \time 9/8
    eis4. eis8 eis eis eis8. eis8. |
    eis4. eis eis |
    \time 5/8
    eis4. eis4 |
    \time 9/8
    eis4. eis8 eis eis eis8. eis8. |
    \time 6/8
    cis4. cis8 cis cis |
    dis4. dis8 dis dis |
    eis4. eis8 eis eis |
    cis4. cis8 cis cis |
    \time 3/8
    eis4. |
    \time 4/4
    eis4 disis8 cisis8 bis4 ais |
    gisis4 bis8 gisis eis4 eis' |
  }
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
  I speak -- a the En -- glish I speak
  Brian Brian Brian
  I speak -- a the En -- glish
  I speak I speak I speak
  I I I I
  Je par -- le chin -- "ois !"
  I speak -- a the Eng -- lish
  I speak
  I speak -- a I speak -- a I speak -- a
  I speak -- a the Eng -- lish
  I I I
  I speak -- a the Eng -- lish
  I I I I I
  I speak -- a the Eng -- lish
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I 
  Spre -- chen Sie Eng -- lisch
  mit wun -- der -- bar "Ja !"
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
  \FatText
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
  \FatText
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
  R1*2 |
  \times 2/3 { c8^\mf c c ~ } c r \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \tNormal
  \time 12/8
  d4.^\f d8 d d d8. d d d |
  \time 6/4
  d2 d d |
  \time 9/8
  cis4. cis8 cis cis cis8. cis |
  \time 6/4
  e4 fis e fis e fis
  \time 4/4
  e4. e e4 |
  \time 3/8
  e4. |
  \time 5/2
  d2 d d d d |  
  \time 4/4
  \cricket
  c2 c8 c r4 |
  \time 9/8
  c2 c4 r4.
  \time 4/4
  c2 c8 c r4 |
  \time 9/8
  c2 c4 r4.  
  \time 4/4
  c2 c8 c r4 |
  \time 9/8
  c2 c4 r4.  
  \time 4/4
  c2 c8 c r4 |
  \time 9/8
  \noTr c2.\startTrillSpan c4\stopTrillSpan r8 |
  \time 4/4
  c2 c8 c r4 |
  \time 3/4
  c2 c4 |
  \tNormal
  \transpose e ees \relative c' {
    cis4. ( ~ cis ~ cis ~ |
    cis2 ~ |
    cis2. ~ |
    cis2. ~ |
    cis2. ~ |
    cis4. ~ cis8 dis4 ~ dis4. ~ |
    dis2. ~ |
    dis4. ~ dis ~ dis ~ |
    dis4. ~ dis ~ dis ~ |
    dis4. ~ dis4 |
    eis4. ~ eis ~ eis ) |
    \time 6/8
    eis4. eis8 eis eis |
    fisis4. fisis8 fisis fisis |
    gisis4. gisis8 gisis gisis |
    eis4. eis8 eis eis |
    \time 3/8
    gisis4. |
    \time 4/4
    eis4 disis8 cisis8 bis4 ais |
    gisis4 bis8 gisis eis4 eis' |
  }
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
  Kit -- chen, I'm in the Bri -- an.
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
  \repeat unfold 3 { plu -- si -- eurs }
  I speak -- a the En -- glish I speak
  Brian Brian Brian
  I speak -- a the En -- glish
  I speak I speak I speak
  I I I I
  Je par -- le chin -- "ois !"
  \repeat unfold 5 { Damn nig -- ga, awww shit. }
  I
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I 
  Spre -- chen Sie Eng -- lisch
  mit wun -- der -- bar "Ja !"
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
  R1 |
  \cricket
  \Cross
  \repeat percent 2 { c4^\markup \italic "charleston"^\mp c8 c8 c4 c8 c8 }
  c4 c8 c8 \revert NoteHead #'style \cricket c8 c c c |
  \Cross
  \repeat percent 12 { c4^\markup \italic "charleston" c8 c8 c4 c8 c8 } \bar "||"
  R1 |
  R1 |
  \cricket
  \times 2/3 { c8 c c^\mf ~ } c r \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |  
  \time 12/8
  \saNormal
  fis4.^\f fis8 fis fis fis8. fis fis fis |
  \time 6/4
  gis2 gis gis |
  \time 9/8
  a4. a8 a a a8. a |
  \time 6/4
  a4 a a a a a |
  \time 4/4
  a4. a a4 |
  \time 3/8
  a4. |
  \time 5/2
  a2 a a a a |
  \time 4/4
  \cricket
  c,2 c8 c r4 |
  \time 9/8
  c2 c4 r4.
  \time 4/4
  c2 c8 c r4 |
  \time 9/8
  c2 c4 r4.  
  \time 4/4
  c2 c8 c r4 |
  \time 9/8
  c2 c4 r4.  
  \time 4/4
  c2 c8 c r4 |
  \time 9/8
  \noTr c2.\startTrillSpan c4\stopTrillSpan r8 |
  \time 4/4
  c2 c8 c r4 |
  \time 3/4
  c2 c4 |
  \tNormal
  \transpose e ees \relative c' {
    eis4. eis8 eis eis eis8. eis |
    r4 eis4 ~ |
    eis8 eis eis eis eis8. eis16 ~ |
    eis16 r8. r8 fisis4. |
    fisis8 fisis fisis fisis8. fisis |
    r4. fisis4. fisis8 fisis fisis |
    fisis8. fisis r4. |
    gisis4. gisis8 gisis8 gisis8 gisis8. gisis |
    r4. gisis4. gisis8 gisis8 gisis |
    gisis8. gisis8. r4 |
    gisis4. gisis8 gisis8 gisis gisis8. gisis8. |
    gis4. gis8 gis gis |
    ais4. ais8 ais ais |
    bis4. bis8 bis bis |
    gis4. gis8 gis gis |
    bis4. |
    bis4 gisis8 ais bis4 ais |
    gisis bis8 gisis eisis4 bis' |
  }
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
  Kit -- chen, I'm in the Bri -- an!
  Kit -- chen is chic -- ken chic -- ken.
  Chic -- ken kit -- chen.
  Bri -- an Bri -- an.
  I speak -- a the Eng -- lish I I I
  I speak -- a the Eng -- lish I I I
  I speak -- a the Eng -- lish I speak
  Bri -- an owes me mo -- ney
  Bri -- an owes me mo -- ney
  Bri -- an owes me five fuc -- king dol -- lars.
  \repeat unfold 9 \skip 1
  sing it sis -- ta!
  \repeat unfold 6 \skip 1
  \repeat unfold 3 { plu -- si -- eurs }
  I speak -- a the En -- glish I speak
  Brian Brian Brian
  I speak -- a the En -- glish
  I speak I speak I speak
  I I I I
  Je par -- le chin -- "ois !"
  \repeat unfold 5 { Damn nig -- ga, awww shit. }
  \repeat unfold 7 { I speak -- a the Eng -- lish }
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I 
  Spre -- chen Sie Eng -- lisch
  mit wun -- der -- bar "Ja !"
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
  R1*9/8 | \pageBreak
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
  r2.. gis8^\mf |
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
  R1 |
  R1 |
  \times 2/3 { c8 c c^\mf ~ } c r \times 2/3 { c8 c c ~ } c r \times 2/3 { c8 c c ~ } c r |
  \time 12/8
  \bNormal
  b,4.^\f b8 b b b8. b b b |
  \time 6/4
  e,2 e e |
  \time 9/8
  a4. a8 a a a8. a |
  \time 6/4
  a4 a a a a a |
  \time 4/4
  a4. a a4 |
  \time 3/8
  a4. |
  \time 5/2
  a2 a a a a |
  R1 |
  R1*9/8 |
  R1 |
  R1*9/8 |
  R1 |
  R1*9/8 |
  R1 |
  R1*9/8 |
  R1 |
  R2. |
  \bNormal
  \transpose e ees \relative c' {
    gis4. gis8 gis8 gis gis8. gis |
    gis4 gis |
    ais ais r |
    ais ais r |
    ais2 ais4 |
    r4. ais4. ais |
    r4 bis2 |
    bis4. r4. r4. |
    bis2 ~ bis16 bis16 ~ bis4 r |
    bis2 ~ bis16 bis ~ |
    bis4. r bis |
    ais,4. ais8 ais ais |
    bis4. bis8 bis bis |
    eis,4. eis8 eis eis |
    ais4. ais8 ais ais |
    bis4. |
    R1 |
    r2. eis,4 |
  }
}

eudesWords = \lyricmode {
  I don't speak -- a the Eng -- rish.
  Now I speak En -- glish! Look at me! Look at me! Look at
  Bri -- an is my wo -- man.
  ba dum dum dum dum dum ba da da dut dum ba
  \repeat unfold 10 { plu -- si -- eurs }
  \repeat unfold 3 { plu -- si -- eurs }
  I speak -- a the En -- glish I speak
  Brian Brian Brian
  I speak -- a the En -- glish
  I speak I speak I speak
  I I I I
  Je par -- le chin -- "ois !"
  I speak -- a the Eng -- lish
  \repeat unfold 8 { I speak } I
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I speak -- a the
  I
  "Ja !"
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

\pageBreak
\markup \huge \fill-line { \center-column { "[Marie]" "Quatrième leçon." "Contrôle d'anglais obligatoire avec traduction en langue des signes." "   " } }

\markup \huge \fill-line { \center-column { "[Eudes]" "Why don't you tell me about your house?" "   " } }

%\pageBreak

\markup \huge \fill-line { \center-column { "[Ryan]" \line { "Yes, uh, well...  you......" }
"uh..."
"uh.... ss"
"mmmm... my chart*"
"is uh... having"
"a image†"
"of . uh .‡ the house."
"§it is, uh, very‖ uh .¶ big.uh.※"
"and, uh,‽ please,◊"
"please will@ you❧, look⁂ at"
"look my¤ chart.$"
"as you will÷ see....#"
"on chart™"
"mmm...〥 "
"weeeeellll∀"
"weeeee〄llll☞"
"[Ryan et Eudes]"
"weee『lllllll〠" "   " } }

oneLine = {
  \stopStaff
  \once \override Staff . StaffSymbol #'line-count = #1
  \startStaff
}

fiveLines = {
  \stopStaff
  \revert Staff . StaffSymbol #'line-count
  \startStaff
}

%{
⸮
❧
⁂
¤
$
÷
#
™
〥
∀
〄
⸕
『
〠
%}
allTwo = \relative c' {
%\override DynamicTextSpanner #'outside-staff-priority = #1
\override TextScript #'outside-staff-priority = #1
  \cadenzaOn
  \key b \minor
  fis8^"chart*"^\p^\< \repeat unfold 4 fis8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <d fis>8^"image†" \repeat unfold 4 <d fis>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b d a'>8^"uh‡" \repeat unfold 4 <b d a'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b e g>8^"§it" \repeat unfold 4 <b e g>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a e' g>8^"very‖" \repeat unfold 4 <a e' g>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a cis g'>8^"uh¶" \repeat unfold 4 <a cis g'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a cis fis>8^"big.uh※"^\> \repeat unfold 4 <a cis fis>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a d fis>8^"and,uh‽" \repeat unfold 4 <a d fis>8 \bar ""
  \oneLine
  s1 \bar "|"
  \fiveLines
  <a d fis>4^"please,◊"^\p \times 2/3 { \repeat unfold 3 <a d fis>8 } \bar ""
  <a d fis>4 \times 2/3 { \repeat unfold 3 <a d fis>8 } \bar ""
  <a d fis>4 \times 2/3 { \repeat unfold 3 <a d fis>8 } \bar "|"
  \repeat unfold 5 <b fis'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b e a>8^"will@"^\< \repeat unfold 4 <b e a>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b e g>8^"you❧" \repeat unfold 4 <b e g>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a cis g'>8^"look⁂" \repeat unfold 4 <a cis g'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a cis b'>8^"my¤" \repeat unfold 4 <a cis b'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b d a'>8^"chart$" \repeat unfold 4 <b d a'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b fis' d'>8^"will÷" \repeat unfold 4 <b fis' d'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b g' d'>8^"see....#" \repeat unfold 4 <b g' d'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a g' cis>8^"chart™" \repeat unfold 4 <a g' cis>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <cis g' e'>8^"mmm...〥" \repeat unfold 4 <cis g' e'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b g' e'>8^"weeeeellll∀" \repeat unfold 4 <b g' e'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <b fis' d'>8^"weeeee〄" \repeat unfold 4 <b fis' d'>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a g' cis>8^"llll☞" \repeat unfold 4 <a g' cis>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a e''>8^"weee『" \repeat unfold 4 <a e''>8 \bar ""
  \oneLine
  s1 \bar ""
  \fiveLines
  <a fis''>8^"lllllll〠"^\f \repeat unfold 4 <a fis''>8 \bar ""
  \oneLine
  s1 \bar ""
}

allTwoWords = \lyricmode {
  \repeat unfold 9 { \repeat unfold 5 { do } }
  \repeat unfold 3 { I speak -- a the }
  \repeat unfold 15 { \repeat unfold 5 { do } }
}

\score {
 <<
    \new Staff \with { instrumentName = \markup \column { "M.P." "M.S." "E.P." } } \new Voice = "all" \allTwo
    \new Lyrics \lyricsto "all" \allTwoWords
>>
\layout {indent = 0 }
}

marieThree = \relative c''' {
  \key b \minor
  \time 2/4
  R2 R2 R2 |
  \time 34/16
  g16^\f \repeat unfold 33 g16 \bar "||"
}

marieThreeWords = \lyricmode {
  \repeat unfold 34 do
}

ryanThree = \relative c' {
  \tNormal
  \key b \minor
  fis4^\mf \times 2/3 { fis8 fis fis }
  fis4 \times 2/3 { fis8 fis fis }
  fis4 \times 2/3 { fis8 fis fis }
  \cricket
  c1*34/16^\f |
}

ryanThreeWords = \lyricmode {
  \repeat unfold 3 { I speak -- a the }
  weeeeeelllll
}

mikeThree = \relative c'' {
  \tNormal
  \key b \minor
  a4^\mf \times 2/3 { a8 a a }
  a4 \times 2/3 { a8 a a }
  a4 \times 2/3 { a8 a a }
  \cricket
  c,1*34/16^\f |
}

mikeThreeWords = \lyricmode {
  \repeat unfold 3 { I speak -- a the }
  weeeeeelllll
}

eudesThree = \relative c' {
  \tNormal
  \key b \minor
  d4^\mf \times 2/3 { d8 d d }
  d4 \times 2/3 { d8 d d }
  d4 \times 2/3 { d8 d d }
  \cricket
  c1*34/16^\f |
}

eudesThreeWords = \lyricmode {
  \repeat unfold 3 { I speak -- a the }
  weeeeeelllll
}

\pageBreak

\score {
  \new ChoirStaff <<
    \new Staff \with { %{instrumentName = "Marie"%} } \new Voice = "marie" \marieThree
    \new Lyrics \lyricsto "marie" \marieThreeWords
    \new Staff = "mikestaff" \with { %{instrumentName = "Mike"%} } \new Voice = "mike" \mikeThree
    \new Lyrics \lyricsto "mike" \mikeThreeWords
    \new Staff = "ryanstaff" \with { %{instrumentName = "Ryan"%} } \new Voice = "ryan" \ryanThree
    \new Lyrics \lyricsto "ryan" \ryanThreeWords
    \new Staff = "eudesstaff" \with { %{instrumentName = "Eudes"%} } \new Voice = "eudes" \eudesThree
    \new Lyrics \lyricsto "eudes" \eudesThreeWords
  >>
  \layout {
    indent = 0
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

\markup \huge \fill-line { \center-column { "[Marie]" "Cinquième leçon." "Y'a pas de cinquième leçon." "Sixième leçon." "   " } }

marieFour = \relative c'' {\autoBeamOff
  \time 3/4
  \key d \major
  c2 ~ c8 gis8 |
  \time 4/4
  a fis e d \times 2/3 { a cis e } \times 2/3 { b' cis b }
  \times 2/3 { a fis fis } \times 2/3 { g a g } fis4. fis8 |
  e g b d \times 2/3 { cis a a } \times 2/3 { b cis b } |
  \cricket r16 c, c c \times 2/3 { c8 c r } r2 |
  \MonoShift
  \FatText
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s2-"[voir ci-dessous...]"
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
}

marieFourWords = \lyricmode {
  Schloß
  et sept -- i -- ème le -- çon où on chante
  tous les noms des per -- sonnes dans cette salle
  qui ont trom -- pé leur par -- te -- naire au moins une
  je vais ac -- cou -- cher
}

ryanFour = \relative c' {\autoBeamOff
  \tNormal
  \key d \major
  \times 2/3 { g8 g g } g4 g32 g g g gis8 |
  a fis e d \times 2/3 { a cis e } \times 2/3 { g a g }
  \times 2/3 { fis8 g gis } \times 2/3 { a b cis } cis8 ( b4 ) a8 | 
  g g g b g8 \cricket c16 c c8 c16 c |
  c16 c r8 r4 c16 c8 c16 c c \times 2/3 { c c c } |
  \MonoShift
  \FatText
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s2-"[voir ci-dessous...]"
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent
}

ryanFourWords = \lyricmode {
  six -- ième le -- çon look at my butt
  et sept -- i -- ème le -- çon où on chante
  tous les noms des per -- sonnes dans cette salle
  qui ont trom -- pé leur par WHAT THE FUCK IS HAP -- PEN -- ING?
  Al -- lez, al -- longe toi main -- te -- nant
}

mikeFour = \relative c' {\autoBeamOff
  \saNormal
  \key d \major
  \times 2/3 { e8 e e } e4. gis8 |
  a fis e d \times 2/3 { a a cis } \times 2/3 { e e eis }
  \times 2/3 { fis8 cis b } \times 2/3 { cis d e } d4. dis8 |
  b8 b e fis \times 2/3 { e e e } \times 2/3 { e e e } |
  fis2
  %\once \override Score.RehearsalMark.self-alignment-X = #LEFT
  %\mark \markup \italic "rall. with sugar..."
  fis'2^\markup \italic "rall. with sugar..." | \noBreak % !!!
  e8 d cis b a d g, cis | \noBreak % !!!!
  \time 2/4
  b ( a4. )
}

mikeFourWords = \lyricmode {
  six -- ième le -- çon
  et sept -- i -- ème le -- çon où on chante
  tous les noms des per -- sonnes dans cette salle
  qui ont trom -- pé leur par -- te -- naire au moins une fois
  en com -- men -- çant par la belle femme, là -- bas
}

eudesFour = \relative c {\autoBeamOff
  \bNormal
  \key d \major
  \times 2/3 { c8 c c } c4. gis'8 |
  a fis e d \times 2/3 { a a a } \times 2/3 { a a a }
  \times 2/3 { d8 d d } \times 2/3 { cis fis fis, } b4. g8 |
  g g g g \times 2/3 { gis8 gis gis } \times 2/3 { gis gis gis } |
  a4. \cricket c'16 c c c c r r4 |
  \MonoShift
  \FatText
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)
  \cricket
  s2-"[voir ci-dessous...]"
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
}

eudesFourWords = \lyricmode {
  six -- ième le -- çon
  et sept -- i -- ème le -- çon où on chante
  tous les noms des per -- sonnes dans cette salle
  qui ont trom -- pé leur par -- te -- naire au moins une fois
  Elle va ac -- cou -- "cher !"
}


\score {
  \new ChoirStaff <<
    \new Staff \with { %{instrumentName = "Marie"%} } \new Voice = "marie" \marieFour
    \new Lyrics \lyricsto "marie" \marieFourWords
    \new Staff = "mikestaff" \with { %{instrumentName = "Mike"%} } \new Voice = "mike" \mikeFour
    \new Lyrics \lyricsto "mike" \mikeFourWords
    \new Staff = "ryanstaff" \with { %{instrumentName = "Ryan"%} } \new Voice = "ryan" \ryanFour
    \new Lyrics \lyricsto "ryan" \ryanFourWords
    \new Staff = "eudesstaff" \with { %{instrumentName = "Eudes"%} } \new Voice = "eudes" \eudesFour
    \new Lyrics \lyricsto "eudes" \eudesFourWords
  >>
  \layout {
    indent = 0
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

\markup \huge \fill-line {
\center-column { "[Marie]"
"Ça fait mal."
"   "
"hiiiiiii"
"   "
"Je te HAIS !"
"   "
"haaaaaaa"
"   "
"J'aurais dû"
"prendre la pilule !"
\transparent "Cp"
\transparent "Çp"
"hiiiiii"
"   "
"   "
"je ne"
"respirerai"
"plus jamais"
"plus jamais"
"plus jamais"
"plus jamais"
"plus jamais"
"plus jamais"
"plus jamais"
"   " 
"   " }
\center-column { "[Ryan]"
\transparent "Ç."
"   "
"hiiiiii"
"  "
"  "
"Pousse !!!" 
"   "
"aaayyyy"
"   "
\transparent "Ç"
"   "
"C'est pas une"
"tête que tu"
"vois, là..."
"res-"
"pire"
"respire"
"respire"
"hi hi hi"
"hi hi"
"hi hi"
"   "
"hooooly"
"shit!"
"   " }
\center-column { "[Eudes]"
"    "
"Pousse !!"
"   "
"Putain, je vais"
"m'évanouir..."
"   "
"haaaaaa"
"   "
"    "
"Ça y est, je vois sa tête, je"
"vois sa tête !"
"   " 
"   "
"haaaa-"
"aaa"
"   "
"   "
"   "
"   "
"   "
"Ça y est, je le"
"vois arri-"
"ver, je le"
"vois arriver, je"
"le vois !"
}
\center-column { "[Mike]"
"    "
"    "
"    "
"    "
"    "
"    "
\italic "[un ECG]"
"d d d"
"     "
"d d d"
"d d d"
"   "
"   "
"d d d"
"     "
"d d d"
"     "
"d d d"
"     "
"d d d"
"     "
"d d d"
"d d d"
"d d d"
"d d d"
}
}


\markup \huge \italic \fill-line { \center-column { "..." "   " "[Ryan imitates the crying of a baby.]"  "   " } }

%\markup \huge \fill-line { \center-column { "[Mike]" "Cinquième leçon." "Y'a pas de cinquième leçon." "Sixième leçon." "   " } }

\markup \huge \fill-line { \center-column { "[Eudes]" "C'est la huitième leçon d'anglais." "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" "Oui, mais est-ce qu'on est sûr de savoir la paternité de cette leçon ?" "   " } }

\markup \huge \italic \fill-line { \center-column { "[Ryan arrête de pleurer et ils regardent tous Marie, qui, gênée, hausse les épaules...]" "   " } }

\markup \huge \fill-line { \center-column { "[Eudes]" "Bon, on la remets ?" "   " } }

\markup \huge \fill-line { \center-column { "[Ryan]" "Ouais, ce sera plus simple..." "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" "Shhh, ce sera plus simple..." "   " } }

\markup \huge \fill-line { \center-column { "[Eudes]" "Shhhhhh..." "   " } }

\markup \huge \italic \fill-line { \center-column { "[Mike remet la leçon dans sa mère. Après la remise de leçon, deeeeeeeep breath chez tous]" "   " } }
