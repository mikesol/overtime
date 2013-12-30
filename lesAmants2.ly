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

\header {
  title = "Les amants"
  subtitle = "Deuxième tome"
  composer = "ΔJmikEs0ל"
}

rushed = {}
slower = {}

rcadenza = \relative c' {
\question
\tempo "" 4=156
\times 2/3 { c8^\pp } \times 2/3 { c4 c8 } \times 2/3 { c4 c8 } \bar "|"
\times 2/3 { r4 c8 } \times 2/3 { c4 c8 } \times 2/3 { c4 c c8 c } \bar "|"
c8 c \bar "|"
c8^\ff c4 c8 c4 c8 \bar "|"
c4^\mf c8 c c4 c \bar "|"
\times 2/3 { c8^\f c c } \times 2/3 { c c c } \times 2/3 { c c r } \bar "|"
\times 2/3 { r4 c8^\mf } \times 2/3 { c4 c8 } \times 2/3 { r4 c8 } \bar "|"
}

ryan = \relative c' { \autoBeamOff\numericTimeSignature
\cricket
\cadenzaOn
\rcadenza
\cadenzaOff
\tempo 4=78
\tNormal
\time 2/4
\TupFrac
%\tupFrac
\times 23/24 {e4.^\mp^\< cis8-.^\f e4.^\markup \italic "sim." cis8-. e4. cis8-. } r16 |
\times 2/3 { fis16^\mf^> d8. fis16^\markup \italic "sim." d8. fis16 d8. } |
\times 2/3 { fis16 d8. fis16 d8. fis16 d8. } |
%\tupFrac
\times 5/6 { cis4. r8 cis4. r8 cis4. r8 }
\times 5/7 { cis8 cis cis cis cis cis cis } r8 |
}

ryanWords = \lyricmode {
I like your hair space
I like you when kind
   slug -- ger
yes yes
buc -- ko buc -- ko buck
Hey pret -- ty boy, Hey
dol -- lar dol -- lar dol -- lar dol -- lar
I like your
 hair

\repeat unfold 3 { eve -- ry }
\repeat unfold 6 { hel -- lo }
\repeat unfold 3 { my }
\repeat unfold 7 { boy }

}

eudes = \relative c, { \autoBeamOff\numericTimeSignature
  \clef bass
  $(skip-of-length rcadenza)
  fis16^\f^\markup \italic { virile } fis ais r
    fis16^\markup \italic "sim." fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r  
    fis16 fis ais r  
    fis16 fis ais r  
    fis fis
  \tupFrac
  \times 11/12 {
  gis8. gis16 e16 r
    gis8. gis16 e16 r
    gis8. gis16 e16 r
    gis8. gis16 e16 r
  } |
}

eudesWords = \lyricmode {
  \repeat unfold 12 { en ef -- fet }
  en e
  \repeat unfold 4 { moi, je sais }
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Les Amants" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Marie]" "Personne n'aime le harcèlement sexuel." "   " } }

\markup \huge \fill-line { \center-column { "[Mike, en coulisses]" "si...." "   " } }

\markup \huge \fill-line { \center-column { "[Marie]" "C'est pour ça que Leaderex vous propose ses" "« 10 règles de conduite intime au travail »." "Bonne chance. 1, 2, 2, 2," "   " } }

\score {
  <<
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
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
      \override TupletBracket #'direction = #UP
      \remove "Forbid_line_break_engraver"
    }
  %{
    \context {
      \Score
      \remove "Metronome_mark_engraver"
    }
    \context {
      \Staff
      \consists "Metronome_mark_engraver"
    }
%}
  }
  %\midi {}
}