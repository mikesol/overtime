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
  score-markup-spacing = #'((basic-distance . 10) (minimum-distance . 5))
}

qFour = \once \override Score . TimeSignature #'stencil =
#(lambda (grob)
  (grob-interpret-markup grob (markup #:override '(baseline-skip . 0) (#:column (#:huge #:bold "?" #:number "4")))))


\include "defs-devel.ly"

airmark = \markup \translate #`(0.0 . ,(- 0.8 0.1)) \draw-circle #0.8 #0.1 ##f

\header {
  title = "Coupure de courant"
	  composer = "djm|kesøl"
tagline=""
}

crap = {
  \numericTimeSignature
  \override Staff.StaffSymbol.layer = #3
  \key g \major
  \time 4/4
}

marie = \relative c'' {
  \crap
  b2^\espressivo^\mf^\> ~ b8 r8 r4 |
  << { r4 fis4 ~ fis2 ~ |
  fis1 ~ |
  fis2. r4 |
  } { s4 s2.^\< s2 s2\!^\> s2. s4\! } >>
}

marieWords = \lyricmode {
  lux lux
}

ryan = \relative c' {
  \crap
  \clef "treble_8"
  c1^\mf^\markup \italic "lurching, with trills" ~ |
  c1 ~ |
  c8 r a^\mp^\markup \italic "doux" a d b b b |
  \times 2/3 { b b b } r b8 ~ b4 r4 |  
}

ryanWords = \lyricmode {
  r
  \repeat unfold 10 oo
}

mike = \relative c' {
  \crap
  %slows down
  \override Beam.grow-direction = #LEFT
  \times 40/11 { e32^\mf^\> [ e e e e e e e e e e ] }
  \override Beam.grow-direction = #RIGHT
  \times 24/8 { d32^\< [ d d d d d d d ] } |
  d2:32^\mf
  \override Beam.grow-direction = #LEFT
  \times 44/11 { d32^\> [ d d d d d d d d d d ] } r8\! |  
} 

mikeWords = \lyricmode {
  lu u "..."
}

eudes = \relative c {
  \crap
  \clef bass
  d4^\mf^- r g^- r |
  d^- r g,^- r |
  d'^- r g^- r |
  d^- r g,^- r \bar ":|."
}

eudesWords = \lyricmode {
  Come home
  Come home
  Come home
  Come home
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Coupure de courant" "   " "   "  } }

\markup \huge \fill-line { \center-column { \italic "[Mike pousse un petit gémissement de chiot]" "   " } }

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
