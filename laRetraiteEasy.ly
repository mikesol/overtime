\version "2.19.0"
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
ragged-last-bottom = ##f
}

\include "defs-devel.ly"

#(set-global-staff-size 20)

\header {
  title = "La retraite"
	  composer = "DJMIKESOL"
tagline=""
}

gl = \once \override Beam #'grow-direction = #LEFT
gr = \once \override Beam #'grow-direction = #RIGHT

marie = \relative c' {
  \saNormal
  \time 4/4
  fis1^\p^\<^\markup \italic "sur la voyelle \"ah\""
  g1^\> |
  e2^\< a4 g |
  fis1^\> |
  d'1^\< |
  cis^\> |
  b2.^\< gis4 |
  a1^\> |
  g2^\< a4 g |
  fis2^\> d |
  c'2^\< d4 c |
  b2 g |
  e'2. d8 cis |
  fis4.^\ff^\> e8 d4 cis8 b |
  a4 g8 fis g4 a |
  fis1^\p |
  g2. a8 g |
  fis2 e |
  d1 ~ |
  d |
}

ryan = \relative c' {
  \tNormal
  \time 4/4
  d1^\p^\< |
  b^\> |
  cis^\< |
  d2^\> ais |
  b1^\< |
  a^\> |
  gis2.^\< d'4 |
  cis1^\> |
  cis2^\< e |
  d2^\> a |
  fis'2 d |
  d^\< b |
  cis^\ff^\> e |
  d4 a b2 |
  cis2 e |
  d1^\p |
  cis |
  d2 cis |
  fis,1 ~ fis |
  \bar "|."
}

eudes = \relative c {
  \bNormal
  \time 4/4
  d1^\p^\< |
  e^\> |
  a,^\< |
  d2^\> cis |
  b1^\< |
  e^> |
  e,^\< |
  a^\> |
  a2^\< cis |
  d^\> fis |
  d^\< fis |
  g2 b |
  a a, |
  d2^\ff^\> g,4 gis |
  a2 cis4 a |
  b1^\p |
  a ~ |
  a |
  d ~ 
  d |
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Final : La retraite" "   "  } }
%{
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
%}
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

%\markup \huge \fill-line { \center-column { "[Marie]" "Trentième leçon d'anglais" "   " } }

%\markup \huge \fill-line { \center-column { "[tutti (avec la vidéo)]" "OVERTIME" "   " } }
