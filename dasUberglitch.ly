 \version "2.17.26"
#(set-global-staff-size 15.60)
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
\include "ami-laid-defs.ly"
\include "les-amants-defs.ly"
\header {
  title = "L'écran"
  composer = "djÉCRAN"
}
\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" \bold "La blague" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Marie]" "...donc elle lui fait « Mais comment est-ce que tu savais" "que j'aime les cornichons ? » Et le type, il lui fait" "« C'était dans tes yeux ! »" "   " } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le bruit" "   " } }

\markup \huge \fill-line { \center-column { "[Mike se met a faire le bruit]" } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Final" \bold "La création du monde" "   "  } }

\markup \huge \fill-line { \center-column { "[Eudes]" "...mais on n'a pas encore vu celle-là..." } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Candidature spontanée" "   "  } }

\markup \huge \fill-line { \center-column { "[le régisseur]" "Embauchez-moi !" "   "  } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "L'anglais" "   "  } }

marieAnglais = \relative c'' {
  \autoBeamOff
  \time 12/8
  \tempo "¡¿¡ FAST !?!"
  \key a \major
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
  cis4. \bar ":|."
}

mikeAnglais = \relative c' {
  \clef "treble_8"
  \autoBeamOff
  \time 12/8
  \key a \major
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
  gis4. |
}

ryanAnglais = \relative c' {
  \clef "treble_8"
  \autoBeamOff
  \time 12/8
  \key a \major
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
}

eudesAnglais = \relative c {
  \clef "bass"
  \autoBeamOff
  \key a \major
  b4.^\f b8 b b b8. b b b |
  \time 6/4
  e,2 e e |
  \time 9/8
  a4. a8 a a a8. a |
  \time 6/4
  a4 a a a a a |
  \time 4/4
  a4. a a4 |
  \time 3/8
  ais4. |
}

anglaisWords = \lyricmode {
  I speak -- a the En -- glish I speak
  Brian Brian Brian
  I speak -- a the En -- glish
  I speak I speak I speak
  I I I I  
}

marieAnglaisWords = \anglaisWords
mikeAnglaisWords = \anglaisWords
ryanAnglaisWords = \anglaisWords
eudesAnglaisWords = \anglaisWords

\score {
  \new ChoirStaff <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marieAnglais" \marieAnglais
    \new Lyrics \lyricsto "marieAnglais" \marieAnglaisWords
    \new Staff = "mikeAnglaisstaff" \with { instrumentName = "Mike" } \new Voice = "mikeAnglais" \mikeAnglais
    \new Lyrics \lyricsto "mikeAnglais" \mikeAnglaisWords
    \new Staff = "ryanAnglaisstaff" \with { instrumentName = "Ryan" } \new Voice = "ryanAnglais" \ryanAnglais
    \new Lyrics \lyricsto "ryanAnglais" \ryanAnglaisWords
    \new Staff = "eudesAnglaisstaff" \with { instrumentName = "Eudes" } \new Voice = "eudesAnglais" \eudesAnglais
    \new Lyrics \lyricsto "eudesAnglais" \eudesAnglaisWords
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
}

\markup \huge \fill-line { \center-column { "   " "[pour les prochaines indications, on quitte la boucle au fur et à mesure]" "   "} }

\markup \huge \fill-line {
\center-column { "[sur l'écran]"
\bold "L'ami laid"
"   "
"   "
\score {
  \new Staff \with {instrumentName="Mike"}
\relative c' {
  \cadenzaOn
  c8^\mp^\lips c c c c r \bar "|"
  c8^\f^\winded c4 \bar ""
  c8 c4 \bar ""
  c8 c4 \bar ""
  c8 \bar "|"
  c16^\mp^\straw c c c^\< c c c c \bar "|"  c8 c16 c8^\f << { c4 } { s8.^\p^\< s16^\f } >> r4 \bar "|"
  c8^\sf^\chew c^\mf c c c c c c8^\mp^\lp r4 \bar "|"
  c16^\f^\>^\breatheAnxiety \repeat unfold 4 { c16 } \repeat unfold 4 \bar "|" { c16 } c16^\mp^\< \repeat unfold 6 c16 c^\f r \bar "|"
  c2^\nose^\sf << {c2^\breathe } { s4..^\> s16^\p } >> r4 \bar "|"
  c8^\mp^\chew c c c c c c c8^\swallow r4 \bar "|"
  c4^\sf^\gag r8 c^>^\cough c^> c^> c^> r8 \bar "|"
  \Tesw c2:32^\p^\gurgle << { c2:32^\swish c2^\suck } { s4..^\< s16^\f s4..^\p^\< s16^\f } >> c8^\mp^\spit c r4 \bar "|"
  \rtesw
  c4^\sf^\hack r2 \bar "|"
  c2:32^\mp^\pleasure \bar "|"
  \cadenzaOff
}

\layout { line-width = #50 }
}
}
\center-column { "[foo]"
"   "
"   "
\score {
  \new Staff \with {instrumentName = \markup \column { "Marie" "Ryan" }}
    \relative c'' {
    \time 3/4
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
  }
  \layout {}}
}
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
}

