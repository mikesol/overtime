 \version "2.17.26"
#(set-global-staff-size 17.82)
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

lexicon = \markup \column {
  \line { † = glitch }
  \line { ‡ = megaglitch }
  \line { \general-align #Y #DOWN \musicglyph #"scripts.espr" = enflé }
  \line { \general-align #Y #DOWN \musicglyph #"scripts.tenuto" = appuyé, puis coupé de manière abrupte }
  \line { \general-align #Y #DOWN \with-color #blue \musicglyph #"noteheads.s2" = lecteur trop rapide }
  \line { \general-align #Y #DOWN \with-color #red \musicglyph #"noteheads.s2" = lecteur trop lent }
}

Red = \override NoteHead #'color = #red
Blue = \override NoteHead #'color = #blue
Black = \revert NoteHead #'color

\include "defs-devel.ly"
%{
  We Touch and Love Sin
    Touch Touch
    Touch Touch
      Touch
      We Touch
  We Touch and Lo 

      No T
    We Touch and
    No Touch

    We Tocuh  
  Hand

    Hand
  No Hand Touch

    No Touch
      We Touch and

  --We Touch and
  -|We Touch and Love Sin Touch Touch
  --We Tou
  -.Hand
  --Hand
  :-)We Touch and Love Sin Touch Touch
  %%Hand
%}

dag = ^\markup { "†"}
ddag = ^\markup { "‡"}

\header {
  title = "Les amants"
  composer = "dJm1k3s0l"
}
marie = \relative c'' { \autoBeamOff\numericTimeSignature
  \key e \major
  \time 5/4
  \tempo %{"normal"%} 4=160
  \footnote "" #'(0 . 0) \lexicon
  gis4 fis8 fis fis4 gis e |
  \time 3/4
  b'8 [ gis ] r4 e |
  b'8 [ gis ] r4 e4\dag |
  \time 3/8
  gis4 fis8\ddag |
  \time 3/4
  dis4 cis8 cis cis\dag r8 |
  R2. |
  \time 2/8
  R4 |
  \time 5/8
  gis'4 fis8 fis\ddag e |
  \time 3/4
  b'8 [ gis ] r2 |
  \time 3/8
  R4. |
  \time 3/4
  gis4 r2 |
  \time 7/8
  r4. \times 2/3 { r4 b, gis'\dag } |
  \time 4/4
  fis4 r4 r dis8 b' |
  \time 2/4
  gis4 fis8 fis8\dag |
  \time 5/8
  \clef "treble_8"
  \tempo %{"slow"%} 4=135  
  \Red
  bis,4. ais8 ais\ddag
  \tempo %{"fast"%} 4=360
  \clef treble
  \time 5/4
  \Blue
  bis'4 ais8 ais ais4 bis ais\dag |
  \tempo %{"slow"%} 4=135
  \time 2/4
  \clef "treble_8"
  \Red
  bis,4.^\espressivo ais16\ddag ais\ddag |
  \time 7/16
  %\ottava #-1
  dis,4.^\espressivo r16 |
  e4. r16 |
  \time 3/8
  e4.^\espressivo |
  \tempo %{"fast"%} 4=360
  \time 5/4
  R1*5/4 |
  \tempo %{"normal"%} 4=160
  \time 5/4
  \clef "treble"
  \Black
  gis'4 fis8 fis fis4 gis e |
  \time 5/8
  b'8 [ gis ] r4 e8\ddag |
  \time 3/8 |
  dis4 cis8\dag |
  \time 2/4
  \tempo 4=100
  a'4 a |
  a8 a a16 a a a |
  \times 2/3 { r4 a a } |
  \time 3/4
  \tempo 4=160
  fis4 e8 e e4 |
  \time 4/4
  \tempo 4=192
  gis4. r8 gis4. r8 |
  \time 5/4
  gis2. r2 |
  \time 3/4
  \saNormal
  gis2. |
  \time 3/4
  \tempo 4=160
  fis4 e8 e8 e4 |
  \time 3/8
  \times 2/3 { a8\dag a\dag a\dag } r |
  \tempo 4.=80
  a8 e r |
  a e r |
  a e r |
  \time 5/4
  \tempo 4=260
  \Blue
  gis4 fis8 fis fis4 gis4 e4 |
  \time 2/4
  b'\dag gis\dag |
  \tempo 4=96
  \time 3/4
  \Black
  bis2. |
  \time 5/8
  gis4. ~ gis4\dag |
  \time 3/8
  \tempo 4.=100
  gis8 fis16 fis fis8 |
  gis e\ddag r |
  r b'4\dag |
  \tempo 4.=120
  b,4. |
  b4.
  b4\dag bis'8 ~ |
  bis gis gis\dag |
  \time 3/4
  \tempo %{"normal"%} 4=120
  \Red
  e4 d8 d d4\dag |
  \time 5/4
  \tempo %{"fast"%} 2=140
  \Blue
  cis'4 b8 b b4 cis8 b a4
  \time 2/4
  gis4 fis8 fis\ddag |
  \tempo %{"normal"%} 4=140
  \Black
  \time 3/4
  ais4 gis16 gis\dag r8 gis8 fis16\ddag r |
  \tempo 4=180
  \time 5/8
  b2^\espressivo ~ b8\dag |
  \time 2/4
  R2 %b4.^\espressivo r8 |
  b4.^\espressivo r8 |
  \time 5/8
  b2^\espressivo r16 b16 ~|
  \time 2/4
  b4\dag^\espressivo g-- |
  \time 3/4
  R2. |
  \tempo 4=220
  \time 2/4
  b4 g\dag |
  \tempo 2=180
  \Blue
  ais4 gis8 gis |
  gis4 gis\ddag |
  \tempo 4=152
  \Black
  dis\ddag gis\dag |
  \time 3/4
  cis,4 ais'8 [ g ] eis4\dag |
  \time 2/4
  fis4 e8 e\dag |
  \time 3/4
  \tempo %{"fast"%} 2.=100
  \Blue
  a4 g8 g g4\ddag |
  \tempo 4=140
  \Red
  \time 5/8
  dis2 cis8 |
  \time 2/4
  \Black
  \times 2/3 { gis'8 [ eis\dag ] r } \times 2/3 { gis8 [ eis\dag ] r } |
  \times 2/3 { gis8 [ eis\dag ] r } \times 2/3 { gis8 [ eis\dag ] r } |
  \time 7/16
  \times 2/3 { gis8 [ eis\dag ] r } gis8.\ddag |
  \tempo 4=200
  \time 4/4
  gis4 fis8 fis r8 e4.-- |
  \tempo 4=140
  \time 7/16
  \times 2/3 { a8 [ fis\dag ] r } gis8.\ddag |
  \time 4/4
  \tempo 4=200
  gis4 fis8 fis \times 2/3 { fis4 gis e\dag } |
  \time 3/4
  fis8 fis fis4 gis |
  \time 2/4
  R2 |
  \time 5/8
  \tempo 4=180
  \Red
  dis4 cis8 cis cis\dag |
  \time 4/4
  \tempo 4=132
  \Black
  fis4\dag fis\dag fis\dag fis\dag |
  \time 4/4
  b4^\espressivo\dag \Blue cis g16 g g8 cis16 b a8\dag |
  \tempo 4=120
  \time 3/8
  \Red
  gis4.--
  \time 7/8
  \Black
  cis4 b8 b b8. cis\dag |
  \time 4/4
  \tempo 4=160
  gis4 fis8 fis fis r r4 |
  \time 3/4
  e4 b'8 [ gis ] r4 |
  \time 2/4
  b8 [ gis ] r4 |
  \time 3/8
  b4\ddag r8 |
  \time 9/8
  \tempo 2=100
  gis4\dag gis\dag gis\dag gis\dag r8 |
  \tempo 4=116
  \time 4/4
  gis4 fis8 fis \times 2/3 { fis4 gis r } |
  \tempo 4=124
  \time 4/4
  b2^\espressivo ~ b8 r4 fis8\ddag |
  \time 3/8
  gis4.-- |
  \time 5/4
  \tempo 4=340
  \Blue
  ais4 gis8 gis gis4 ais4 fis |
  \time 4/4
  \tempo 2=100
  \Black
  ais2.-- ~ ais16 eis16\ddag eis\ddag r |
  fis4 r fis r |
  \tempo "poco accel."
  g4\dag r g r |
  g4\dag r g r |
  \time 2/4
  a4 e8 e\ddag |
  \time 5/4
  \tempo 2=140
  eis4 dis8 dis \times 2/3 { dis4 eis dis } r4 |
  \tempo 4.=60
  \time 6/8
  gis4.^\espressivo r4 bis,8 |
  \time 7/8
  gis'4.^\espressivo r2 |
  \time 6/8
  gis4.^\espressivo r4 bis,8 |
  \time 7/8
  gis'4.^\espressivo r2 |  
  \time 6/8
  gis4.^\espressivo r4 bis,8 |
  \time 4/4
  gis'4.^\espressivo r8 r4. gis8\dag |
  \tempo 4=200
  \time 5/4
  gis4 fis8 fis fis4 gis4 e |
  \time 6/8
  \tempo 4.=60
  gis4.^\espressivo r4 bis,8 |
  gis'4.^\espressivo r4. |
  \tempo 4=200
  \time 5/4
  gis4 fis8 fis fis4 gis e |
  \time 3/8
  b'8 [ gis\dag ] r |
  \time 7/8
  dis4 cis8 cis\dag gis'4 fis8\ddag |
  \time 6/8
  \tempo 4.=60
  gis4.^\espressivo r4. |
  \time 7/8
  \tempo 8=200
  b,16\dag b\dag b\dag b\dag b\dag b\dag b\dag b\dag b\dag b\dag b\dag b\dag b\dag fis\ddag |
  \time 5/4
  \tempo 4=180
  fis'4 e8 e e4 fis\dag a8 [ fis\dag ]
  \tempo 4=200
  bis,4 gis'\dag bis, gis'\dag bis,\dag |
  \time 3/8
  e4 d8\ddag |
  \time 12/8
  f4.\dag f\dag f\dag f\dag |
  \time 4/4
  dis8 fisis\ddag gis4 fis8 fis fis4 |
  \tempo 4=180
  \time 6/4
  cis'1.-- |
  \time 3/4
  \tempo 4=384
  \Blue
  b4 a8 g a4 |
  b a g\dag |
  \tempo 4=100
  \Black
  gis4\dag gis\dag gis\dag
  \tempo 4=180
  gis\dag gis\dag gis\dag |
  gis\dag gis\dag gis\dag |
  \time 6/8
  fis8 gis\dag r fis gis\dag r |
  fis8 gis\dag r fis gis\dag r |
  \time 3/8
  fis8 gis\dag r |
  \time 4/4
  \tempo 4=272
  cis4 b8 b b cis a4\dag |
  \tempo 4=144
  \times 2/3 { ais8 gis\dag r } \times 2/3 { ais8 gis\dag r } \times 2/3 { ais8 gis\dag r } \times 2/3 { ais8 gis\dag r } |
  \tempo 4= 200
  bis,4\dag bis\dag bis\dag bis\dag |
  \time 3/4
  bis\dag bis\dag bis\dag |
  \time 2/4
  cis'2-- |
  \time 4/4
  gis4 fis8 fis fis4\dag cis\ddag |
  \time 5/8
  b'4\dag gis4.\ddag |
  \time 4/4
  \Red
  e2. d4\ddag |
  \time 3/4
  c2.-- |
  \time 4/4
  \Black
  gis'4.^\espressivo r8 gis4.^\espressivo r8 |
  \time 3/8
  gis4.^\espressivo\dag |
  \time 3/4
  a8\dag a\dag a\dag a\dag a\dag a\dag |
  \time 6/8
  gis4. gis
  \time 7/8
  gis gis4\dag fis\dag |
  \time 3/4
  b4 a8 a a4 |
  \time 5/4
  eis4 dis8 dis dis4 eis cis
  \time 4/4
  ais'8\dag ais\dag ais\dag ais\dag ais\dag ais\dag ais\dag ais\dag |
  \time 7/8
  ais8\dag ais\dag ais\dag ais\dag ais\dag ais\dag ais\dag |
  \tempo 4=160
  \time 2/4
  \Red
  dis,2 |
  \time 5/8
  cis4 cis r8
  \time 2/4
  \Black
  gis'4.^\espressivo r8 |
  gis4.^\espressivo r8 |
  \time 5/8
  gis4.^\espressivo a8\ddag r |
  a4. ais4\dag |
  \time 2/4
  gis4 ( a ) |
  \time 3/4
  fis4 e8 e e4\dag |
  \tempo 4=300
  gis4\ddag fis\ddag fis\ddag |
  \time 9/8
  cis'4 b8\ddag a4.\dag a4.\dag |
  \time 4/4
  a4\dag ais4 gis8 gis gis4\dag |
  \time 3/8
  gis4 fis8 | %fis fis4\dag |
  \time 5/4
  \tempo 2=120
  b4\dag b\dag b\dag b\dag b\dag |
  \tempo 4.=160
  \time 6/8
  gis4 fis8\ddag cis'4 b8\ddag |
  \time 5/8
  cis4 b8\ddag gis4\ddag |
  \tempo 2=120
  \time 4/4
  b4 a8 a a4\ddag g\ddag |
  \time 3/4
  ais4 gis8 gis gis4 |
  \time 2/4
  a4 g8 g |
  \time 3/8
  b4.\dag |
  \time 3/4
  b4 a8 gis a4 |
  a\dag a\dag a\dag |
  b4 a8 gis a4\dag |
  \time 6/8
  a4.\ddag a\ddag |
  a\ddag a\ddag |
  \time 2/4
  b4 a\ddag
  \time 5/8
  cis4 b8 ais8 b |
  b4 a8 gis a\dag |
  \time 3/4
  \tupFrac
  \times 3/5 { bis4\dag bis\dag bis\dag bis\dag bis\dag } |
  cis4 b8 b\dag dis8 cis\ddag |  
  \time 5/4
  \tempo %{"normal"%} 4=160
  gis4 fis8 fis fis4 gis e |
  \time 3/4
  b'8 [ gis ] r4 e |
  b'8 [ gis ] r4 e4\dag |
  \time 5/4
  gis4 fis8 fis fis4 r2 |
  \time 3/4
  gis4 fis8 fis fis4 |
  \time 4/4
  gis^\espressivo e\ddag b'\ddag b,\ddag |
  \time 3/4
  gis'4 r2 |
  \time 7/8
  r4. \times 2/3 { r4 b, gis'\dag } |
  %\time 4/4
  %fis4 r4 r dis8 b' |
  \time 2/4
  gis4^\espressivo r |
  %\time 4/4
  %gis4 fis8 fis8-. e2 |
  %\time 3/4
  %\cricket
  %c4^"(Ryan)" r2 |
  %r2 r8 c
  \bar "|." |
}

marieWords = \lyricmode {
  We Touch and Love Sin
  Touch Touch Touch Touch Touch
  We Touch
  We Touch and Lo
  We Touch a
  No Touch.
  Hand
  No Hand Touch
  No Touch
  We Touch a
  We Touch and
  We Touch and Love Sin Touch
  We Touch and
  We
  We
  We
  We Touch and Love Sin Touch Touch Touch
  We Touch
  No No No No No No No No No No
  We Touch and Love
  No No
  Yes %{Hand%} Yes
  We Touch and Love
  No No No
  Sin Touch Sin Touch Sin Touch
  We Touch and Love Sin Touch Touch We
  Love
  Love
  We Touch and Love Sin Touch Touch
  Touch Touch Touch No Sin a
  We Touch and Love
  We Touch and Love Sin Touch Touch
  We Touch and
  We Touch a We To
  We %{We%} We We We Sin
  We Sin
  We Touch and Love Sin
  We We
  Touch Touch Touch  
  We Touch and
  We Touch and Love
  We Touch
  \repeat unfold 6 uch
   We Touch a Touch
  \repeat unfold 2 uch
  We Touch and Love Sin Touch
  Touch and Love Sin %Touch
  %{Touch and Love Sin Touch%}
  We Touch and Love
  %{Touch and Love Sin Touch%} \repeat unfold 4 Touch
  Hand We Touch and Love Sin Touch Touch
  We
  We Touch and Love Sin
  We Touch and Love Touch Touch
  Touch Touch
  Touch Touch Touch Touch
  We Touch and Love Sin %Touch
  Yes We
  No
  We Touch and Love Sin Touch
  We Touch and
  \repeat unfold 6 Touch
  We Touch and 
  We Touch and Love Sin Touch
  \repeat unfold 3 { Hand No Hand }
  Hand
  We Touch and Love Sin Touch
  Hand No Hand
  We Touch and Love Sin Touch Touch
  We Touch and
  We Touch
  Hand
  \repeat unfold 13 Yes No
  We Touch and Love Sin Touch
  We Touch We Touch We We Touch
  \repeat unfold 4 Touch
  We Touch We Touch and Love
  We
  We Touch and Love Sin Touch Touch
  \repeat unfold 3 We
  \repeat unfold 6 We
  \repeat unfold 5 { We Touch }
  We Touch and Love Sin Touch
  \repeat unfold 4 { We Touch }
  \repeat unfold 7 Sin
  We
  We Touch and Love Sin
  Touch Hand
  We Touch
  We
  \repeat unfold 3 Yes
  \repeat unfold 6 No
  \repeat unfold 4 Yes
  No
  We Touch and Love
  We Touch and Love Sin Touch
  \repeat unfold 15 No
  We Touch and
  Yes Yes Yes Touch No No Yes
  We Touch and Lo
  \repeat unfold 3 We
  We To
  We We We
  We Touch and Love
  We Touch %and Love
  \repeat unfold 5 We
  \repeat unfold 3 { We To }
  We
  We Touch and Love We
  We Touch and Love
  We Touch and
  Hand
  We Touch and Love
  Hand Hand Hand
  We Touch and Touch
  \repeat unfold 4 Touch
  We Touch
  We Touch and Love
  We Touch and Love
  \repeat unfold 5 Hand
  We Touch and We To
  We Touch and Love Sin
  Touch Touch Touch Touch Touch
  We Touch and Love
  We Touch and Love
  Sin Touch Touch Touch
  Hand
  No Hand %Touch
  %No Touch
  %We Touch and
  Yes
  %wait...
  %Yes
}

ryan = \relative c' { \autoBeamOff\numericTimeSignature
  \key e \major
  \clef "treble_8"
  dis4_\markup \italic { [en suivant les paroles et les indications d'articulation de Marie] } cis8 cis cis4 dis b |
  fis'8 [ dis ] r4 b fis'8 [ dis ] r4 b |
  dis4 cis8 |
  dis4 cis8 cis cis r8 |
  R2. |
  \time 2/8
  b8 fis'\ddag |
  dis4 cis8 cis b |
  fis'8 [ dis ] r2 |
  dis4 b8 |
  e4 r2 |
  r4. \times 2/3 { e4\dag b e }
  dis4 r4 r4 b8 fis' |
  dis4 cis8 cis8 |
  \Red
  dis,4. cis8 cis |
  \Blue
  gisis''4 fisis8 fisis fisis4 gisis4 fisis |
  \Red
  cis,4. r8 |
  R1*7/16 |
  cis4. r16 |
  cis4. |
  \Blue
  gis''4 fis8 fis fis4 gis e |
  \Black
  r2 dis4 eis4 cis4 |
  gis'8 [ eis ] r4 cis8 |
  R4. |
  \time 2/4
  \tempo 4=100
  R2 |
  e8 e e16 e e e |
  \times 2/3 { r4 e e } |
  \time 3/4
  \tempo 4=160
  dis4 cis8 cis cis4 |
  \time 4/4
  \tempo 4=192
  dis4. r8 dis4. r8 |
  \time 5/4
  cis2. \cricket c2 |
  \time 3/4
  \tNormal
  cis2. |
  \time 3/4
  \tempo 4=160
  cis4 b8 b8 b4 |
  \time 3/8
  R4. |
  \tempo 4.=80
  e8 b r |
  e b r |
  e b r |
  \time 5/4
  \tempo 4=260
  \Blue
  dis4 cis8 cis cis4 dis4 b4 |
  \time 2/4
  fis' dis |
  \tempo 4=96
  \time 3/4
  \Black
  dis2. |
  \time 5/8
  \Blue
  dis16 b dis b dis b dis b dis b\dag |
  \time 3/8
  \Black
  \tempo 4.=100
  cis8 b16 b b8 |
  cis a r |
  R4. |
  \tempo 4.=120
  dis4. |
  dis4.
  dis4 dis8 ~ |
  dis cis cis |
  \time 3/4
  \tempo %{"normal"%} 4=120
  bis4 ais8 ais ais4 |
  \time 5/4
  \tempo %{"fast"%} 2=140
  \Blue
  gis4 fis8 fis fis4 gis8 fis e4
  \time 2/4
  dis4 cis8 cis |
  \tempo %{"normal"%} 4=140
  \time 3/4
  \Black
  fis4 e16 e r8 dis8 cis16 r |
  \tempo 4=180
  \time 5/8
  cis2^\espressivo ~ cis8 |
  \time 2/4
  cis4.^\espressivo r8 |
  b4.^\espressivo r8 |
  \time 5/8
  b2^\espressivo r16 b16 ~|
  \time 2/4
  b4^\espressivo d-- |
  \time 3/4
  R2. |
  \tempo 4=220
  \time 2/4
  e4 c |
  \tempo 2=180
  \Blue
  fis4 e8 e |
  e4 fis |
  \tempo 4=152 
  \Black
  bis dis |
  \time 3/4
  a4 e'8 [ cis ] a4 |
  \time 2/4
  R2 |
  \time 3/4
  \tempo %{"fast"%} 2.=100
  \Blue
  dis4 cis8 cis cis4 |
  \Black
  \tempo 4=140
  \time 5/8
  \Red
  bis2 ais8 |
  \Black
  \time 2/4
  \times 2/3 { eis'8 [ cis ] r } \times 2/3 { eis8 [ cis ] r } |
  \times 2/3 { eis8 [ cis ] r } \times 2/3 { eis8 [ cis ] r } |
  \time 7/16
  \times 2/3 { eis8 [ cis ] r } gis8. |
  \tempo 4=200
  \time 4/4
  dis'4 cis8 cis r8 b4.-- |
  \tempo 4=140
  \time 7/16
  \times 2/3 { eis8 [ cis ] r } dis8. |
  \time 4/4
  \tempo 4=200
  r2 \times 2/3 { r4 eis ais, } |
  \time 3/4
  cis8 cis cis4 dis |
  \time 2/4
  cis8 cis cis4 |
  \time 5/8
  \tempo 4=180
  bis4 ais8 ais ais |
  \time 4/4
  \tempo 4=132
  b4 b b b |
  \time 4/4
  dis4^\espressivo e b16 b b8 e16 d c8 |
  \tempo 4=120
  \time 3/8
  dis4.
  \time 7/8
  gis4 fis8 fis fis8. gis |
  \time 4/4
  \tempo 4=160
  eis4 dis8 dis dis r r4 |
  \time 3/4
  b4 fis'8 [ dis ] r4 |
  \time 2/4
  gis8 [ e ] r4 |
  \time 3/8
  a4 r8 |
  \time 9/8
  \tempo 2=100
  cis,4 cis cis cis r8 |
  \tempo 4=116
  \time 4/4
  dis4 cis8 cis \times 2/3 { cis4 dis r } |
  \tempo 4=124
  \time 4/4
  e2 ~ e8 r8 r4 |
  \time 3/8
  cis4. |
  \time 5/4
  \tempo 4=340
  \Blue
  fis4 e8 e e4 fis4 d |
  \time 4/4
  \Black
  \tempo 2=100
  dis2. ~ dis16 ais16 ais r |
  cis4 r cis r |
  \tempo "poco accel."
  cis4 r cis r |
  dis4 r dis r |
  \time 2/4
  f4 r4 |
  \time 5/4
  \tempo 2=140
  cis4 b8 b \times 2/3 { b4 cis a } r4 |
  \tempo 4.=60
  \time 6/8
  cis4. r4 gis8 |
  \time 7/8
  cis4. r2 |
  \time 6/8
  bis4. r4 bis8 |
  \time 7/8
  cis4. r2 |  
  \time 6/8
  dis4. r4 dis8 |
  \time 4/4
  dis4. r8 r4. e8 |
  \tempo 4=200
  \time 5/4
  eis4 dis8 dis dis4 eis4 cis |
  \time 6/8
  \tempo 4.=60
  \clef bass 
  bis4. r4 gis,8 |
  gis4. r4. |
  \clef "treble_8"
  \tempo 4=200
  \time 5/4
  cis'4 b8 b b4 cis a |
  \time 3/8
  e'8 [ cis ] r |
  \time 7/8
  bis4 ais8 ais cisis4 r8 |
  \time 6/8
  \tempo 4.=60
  dis4. r4. |
  \time 7/8
  \tempo 8=200
  g,16 g g g g g g g g g g g g d |
  \time 5/4
  \tempo 4=180
  d'4 c8 c c4 d e8 [ cis ]
  \tempo 4=200
  gis4 e' gis, e' gis, |
  \time 3/8
  c4 bes8 |
  \time 12/8
  cis4. cis cis cis |
  \time 4/4
  b8 dis dis4 cis8 cis cis4 |
  \tempo 4=180
  \time 6/4
  dis1. |
  \time 3/4
  \tempo 4=384
  \Blue
  dis4 cis8 cis cis4 |
  dis cis b |
  \Black
  \tempo 4=100
  b4 b b
  \tempo 4=180
  bis bis bis |
  bis bis bis |
  \time 6/8
  cis8 cis r cis cis r |
  cis8 cis r b b r |
  \time 3/8
  b8 b r |
  \time 4/4
  \tempo 4=272
  dis4 cis8 cis cis dis b4 |
  \tempo 4=144
  \times 2/3 { cis8 b r } \times 2/3 { fis'8 e r } \times 2/3 { e8 dis r } \times 2/3 { e8 dis r } |
  \tempo 4= 200
  a4 a a a |
  \time 3/4
  a a a |
  \time 2/4
  cis2 |
  \time 4/4
  dis4 cis8 cis cis4 gis |
  \time 5/8
  dis'4 cis4. |
  \time 4/4
  \clef bass
  \Red
  ais,2. gis4 |
  \time 3/4
  ais2. |
  \time 4/4
  \clef "treble_8"
  \Black
  cis'4. r8 cis4. r8 |
  \time 3/8
  cis4. |
  \time 3/4
  e8 e e e e e |
  \time 6/8
  dis4. dis
  \time 7/8
  dis dis4 cis |
  \time 3/4
  eis4 dis8 dis dis4 |
  \time 5/4
  cis4 b8 b b4 cis a
  \time 4/4
  e'8 e e e e e e e |
  \time 7/8
  e8 e e e e e e |
  \tempo 4=160
  \time 2/4
  gis,2 |
  \time 5/8
  g4 g r8
  \time 2/4
  bis4. r8 |
  bis4. r8 |
  \time 5/8
  bis4. e8 r |
  d4. e4 |
  \time 2/4
  cis4 ( d ) |
  \time 3/4
  cis4 b8 b b4 |
  \tempo 4=300
  d4 d d |
  \time 9/8
  fis4 e8 cis4. cis4. |
  \time 4/4
  cis4 dis4 cis8 cis cis4 |
  \time 3/8
  dis4 cis8 | %cis cis4 |
  \time 5/4
  \tempo 2=120
  d4 d d d d |
  \tempo 4.=160
  \time 6/8
  dis4 cis8 fis4 e8 |
  \time 5/8
  fis4 e8 b4 |
  \tempo 2=120
  \time 4/4
  dis4 cis8 cis cis4 cis |
  \time 3/4
  e4 cis8 cis cis4 |
  \time 2/4
  e4 e8 e |
  \time 3/8
  gis4. |
  \time 3/4
  dis4 cis8 cis cis4 |
  fis fis fis |
  eis4 dis8 cis dis4 |
  \time 6/8
  d4. d |
  d d |
  \time 2/4
  gis4 fis
  \time 5/8
  ais4 g8 g8 g |
  e4 d8 cis d |
  \time 3/4
  \tupFrac
  \times 3/5 { eis4 eis eis eis eis } |
  eis4 eis8 eis ais,8 ais |
  \time 5/4
  \tempo %{"normal"%} 4=160
  dis4 cis8 cis cis4 dis b |
  \time 3/4
  fis'8 [ dis ] r4 b |
  fis'8 [ dis ] r2 |
  \time 5/4
  dis4 cis8 cis cis4 r2 |
  \time 3/4
  cis4 b8 b b4 |
  \time 4/4
  cis a a' a, |
  \time 3/4
  e'4 r2 |
  \time 7/8
  r4. \times 2/3 { r4 b e } |
  \time 2/4
  e4 r |
  %\time 4/4
  %gis4 fis8 fis8 e2 |
  %\time 3/4
  %\cricket
  %c4^"(Ryan)" r2 |
  %r2 r8 c
\bar "|." |  
}

ryanWords = \lyricmode {
  \repeat unfold 16 \skip 1
  No Touch
  \repeat unfold 5 \skip 1
  We Touch
  \repeat unfold 1 \skip 1
  Hand
  \repeat unfold 20 \skip 1
  We Touch and Love Sin Touch
  \repeat unfold 20 \skip 1
  Hand
  \repeat unfold 20 \skip 1
  \repeat unfold 5 { Sin Touch }
  \repeat unfold 32 \skip 1
  We
  \repeat unfold 40 \skip 1
  Touch and Love
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Les Amants" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Mike]" "Personne n'aime le harcèlement sexuel. C'est pour ça que Leaderex" "vous propose ses « 10 règles de conduite intime au travail »." "Bonne chance. 1, 2, 2, 2," "   " } }

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marie
    \new Lyrics \lyricsto "marie" \marieWords
    \new Staff = "ryanstaff" \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    \new Lyrics \with { alignAboveContext = #"ryanstaff" } \lyricsto "ryan" \ryanWords
  >>
  \layout {}
  \midi {}
}