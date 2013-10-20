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
  subtitle = "Troisième tome"
  composer = "djm!ke$o1"
}

ryan = \relative c' { \autoBeamOff\numericTimeSignature
  \key e \major
  \time 5/4
  \clef "treble_8"
  \tempo %{"normal"%} 4=160
  gis4 fis8 fis fis4 gis e |
  \time 3/4
  b'8 [ gis ] r4 e |
  b'8 [ gis ] r4 e4 |
  \time 3/8
  gis4 fis8 |
  \time 3/4
  dis4 cis8 cis cis r8 |
  R2. |
  \time 2/8
  b8 fis' |
  \time 5/8
  gis4 fis8 fis e |
  \time 3/4
  b'8 [ gis ] r4 e |
  b'8 [ gis ] r2^"(the first musical interlude starts)" |
  r4 gis4 fis8 fis |
  fis4 r2 \bar "||"
}

ryanWords = \lyricmode {
  We Touch and Love Sin
  Touch Touch Touch Touch Touch
  We Touch
  We Touch and Lo
  No Touch.
  We Touch a
  No Touch.
  No Touch.
  We Touch and Love...
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Les Amants" "   " "   "  } }

\score {
  <<
    \new Staff = "ryanstaff" \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    \new Lyrics \lyricsto "ryan" \ryanWords
  >>
  \layout {}
  \midi {}
}

\markup \huge \italic \justify {
  [Gazing off stage, Ryan sees the pigeon afar.  The pigeon emerges and they
  gaze lovingly, nay, lustfully at each other.  After a moment of wonderment,
  they advance towards each other before engaging in a giant, man-pigeon
  embrace.]
}


\markup { \column { "   " "   "}}

\markup \huge \fill-line { \center-column { "[Ryan]" "Puis-je ?..." \italic \line { [subtext being "puis-je enlever votre masque" ] } "   " } }

\markup \huge \fill-line { \center-column { "[Mike]" "coo coo" "   " } }

\markup \huge \italic \justify {
  [During the dénouement of the music, Ryan takes off the mask, revealing
   underneath...
   another, smaller pigeon head.  The music stops suddenly.  3 second pause of astonishment.  The music begins again, same longing look, same
   long embrace.]
}
\markup { \column { "   " "   "}}

\markup \huge \fill-line { \center-column { "[Mike]" "coo coo ?" \italic \line { [subtext being "puis-je enlever votre masque" ] } "   " } }

\markup \huge \fill-line { \center-column { "[Ryan]" "oui, pigeon de la pigeon de la pigeon" "   " } }

\markup \huge \italic \justify {
  [During the dénouement of the music, the pigeon tries to take off Ryan's mask.
  Except that this is not a mask, it is his face, and he screams a blood-curdling
  scream of a person whose face is being pulled off.]
}
