 \version "2.17.26"
#(set-global-staff-size 15.60)
#(ly:set-option 'point-and-click #f)
\paper {
  %ragged-last-bottom = ##f
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
\include "fill-line-two.ly"
\include "ami-laid-defs.ly"
\include "les-amants-defs.ly"
\header {
  title = "L'écran"
  composer = "djÉCRAN"
}
\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" \bold "La blague" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Marie]" "...donc elle lui fait « Mais comment est-ce que tu savais" "que j'aime les cornichons ? » Et le type, il lui fait" "« C'était dans tes yeux ! »" "   " } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le bruit" "   " } }

\markup \huge \fill-line { \center-column { "[Mike se met a faire le bruit]" "   " } }

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

\markup \huge \fill-line-two {
\center-column { "[sur l'écran]"
\bold "L'ami laid"
"   "
"   "
\score {
  \new Staff \with {instrumentName="Mike"}
\relative c' {
  \cadenzaOn
  \cricket
  c8^\mp^\lips c c c c r \bar "|"
  c8^\f^\winded c4 \bar ""
  c8 c4 \bar ""
  c8 c4 \bar ""
  c8 \bar "|"
  c16^\mp^\straw c c c^\< c c c c \bar "|"  c8 c16 c8^\f << { c4 } { s8.^\p^\< s16^\f } >> r4 \bar "|"
  c8^\sf^\chew c^\mf c c c \bar "|" c c c8^\mp^\lp r4 \bar "|"
  c16^\f^\>^\breatheAnxiety \repeat unfold 7 { c16 } \repeat unfold 4 \bar "|" { c16 } c16^\mp^\< \repeat unfold 6 c16 c^\f r \bar "|"
  c2^\nose^\sf << {c2^\breathe } { s4..^\> s16^\p } >> r4 \bar "|"
  c8^\mp^\chew c c c \bar "|"
c c c c8^\swallow r4 \bar "|"
%{  c4^\sf^\gag r8 c^>^\cough c^> c^> c^> r8 \bar "|"
  \Tesw c2:32^\p^\gurgle << { c2:32^\swish c2^\suck } { s4..^\< s16^\f s4..^\p^\< s16^\f } >> c8^\mp^\spit c r4 \bar "|"
  \rtesw
  c4^\sf^\hack r2 \bar "|"
  c2:32^\mp^\pleasure \bar "|"
%}
  \cadenzaOff
} \addlyrics {
%\override Lyrics.LyricText.font-size = #-1
\repeat unfold 5 [lp]
\out
\in
\out
\in
\out
\in
\out
\repeat unfold 7 [lp]
[lp] sss [lp] sss sss
[hm] [hm] [hm] [hm] [hm] [hm] [hm] [lp]
\repeat unfold 8 { \in \out } \in
\skip 1 \in
[hm] [hm] [hm] [hm] [hm] [hm] [hm] [əə]
[kk] [kk] [kk] [kk] [kk]
\repeat unfold 6 \skip 1
[əə]
[lp]
[lp]

}

\layout { line-width = #55 }
}
}
\line { \hspace #0 \center-column {
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"[sur l'écran]"
\bold "Les amants"
"   "
"   "
\score {
<<
  \new Staff \with {instrumentName = \markup \column { "Marie" "Ryan" }}
    <<
    \new Voice = "marie" \relative c'' { \voiceOne \autoBeamOff\numericTimeSignature
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
%{
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
      cis4 b8 b\dag dis8 cis\ddag |%}
    } 
  \new Voice = "ryan" \relative c' { \voiceTwo \autoBeamOff
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
%{    \time 2/4
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
    eis4 eis8 eis ais,8 ais |%}
  }
>>
\new Lyrics  = "ryan"

\context Lyrics = "ryan" \lyricsto "ryan" \lyricmode {

%\override Lyrics.LyricText.font-size = #-1

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

}

>>
  \layout { line-width = #55 }}
}}
\center-column { 
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"   "
"[sur l'écran]"
\bold "Le licenciement"
"   "
"trente-deux"
"   "
"trente-trois"
"   "
"trente-quatre"
"   "
"trente-cinq"
"   "
"trente-six"
"   "
"trente-sept"
"   "
"trente-huit"
"   "
"trente-neuf"
"   "
"quarante"
"   "
"quarante et un"
"   "
"quarante-deux"
"   "
"quarante-trois"
"   "
"quarante-quatre"
"   "
"quarante-cinq"
"   "
"quarante-six"
"   "
"quarante-sept"
"   "
"quarante-huit"
"   "
"quarante-neuf"
"   "
"cinquante"
"   "
"cinquante et un"
"   "
"cinquante-deux"
}
}

\pageBreak

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" "   " \fontsize #8  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron revient" "   "  } }

\markup \huge \fill-line { \center-column { "[bruitage d'animaux chez tous]" "   "  } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" "   " \fontsize #6  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron revient" "   "  } }

\markup \huge \fill-line { \center-column { "[bruitage d'animaux chez tous]" "   "  } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" "   " \fontsize #4  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron revient" "   "  } }

\markup \huge \fill-line { \center-column { "[bruitage d'animaux chez tous]" "   "  } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" \fontsize #2  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" \fontsize #0  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" \fontsize #-2  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" \fontsize #-4  "W0000t !!!" "   "} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Le patron part" "   "  } }

\markup \fill-line { \center-column { \huge "[tous]" \fontsize #-6  "W0000t !!!" "   "} }
\pageBreak
\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Je suis le chemin, la vérité, et la vie." \bold "Nul ne vient au Père que par moi." "   "  } }
\markup \huge \fill-line { \center-column { \bold "*Nan, je plaisante, je ne suis qu'un simple écran." "   "  } }
\markup \huge \fill-line { \center-column { \bold "OVERTIME"  } }

%%%%%%%%%%%%%%%%%%


\markup \huge \fill-line { \center-column { "   " "   " "[début d'une série de scénettes]" \bold "Le CDD se prolonge en CDI" "   " } }

\markup \huge \fill-line { \center-column { "[on tire sur Ryan]" "   " } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Haut les pattes" "   " } }

\markup \huge \fill-line { \center-column { "[tout le monde]" "Haut les pattes !" "   " } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "happy_people_making_work" "   "  } }

\markup \huge \fill-line { \center-column { "[tout le monde fait des gestes]" } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Schloß" "   "  } }

\markup \huge \fill-line { \center-column { "[tout le monde]" "   "
\score {
\new PianoStaff
<<
  \new Staff \new Voice = "foo" \relative c' { <e c'>1 }
  \new Lyrics \lyricsto "foo" \lyricmode { "Schloß !!!" }
  \new Staff \relative c { \clef bass <c g'>1 }
>>
\layout {line-width=33} 
}

 "   "  
"    "
} }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Acte de virtuosite gratuit" "   "  } }

\markup \huge \fill-line { \center-column {
\score {
  \new Staff \with{instrumentName=#"Marie"}\new Voice = "foo" \relative c' {
  \partial 4

\shape #'(
           (( 0 . 0) (0 . 0) (0 . 0) (0 . 0))
           ((0 . 0) (0 . 0) (0 . 0) (0 . -0.5))
         ) Slur
ees4^\markup \italic "sur \"a\"" ( g'8 ees f d ees c d bes
   c16 bes aes g f c' bes aes g2^\trill ) \bar "|."
}
\layout {line-width=70} 
}

 "   "  
"    "
} }

\markup  \fill-line { \center-column { \fontsize #12 "[???]" "   "  } }

\markup \huge \fill-line { \center-column { "[sur l'écran]" \bold "Acte de virtuosite payant" "   "  } }

\markup \huge \fill-line { \center-column {
\score {
  \new Staff \with{instrumentName=#"Marie"}\new Voice = "foo" \relative c' {
  \partial 4

\shape #'(
           (( 0 . 0) (0 . 0) (0 . 0) (0 . 0))
           ((0 . 0) (0 . 0) (0 . 0) (0 . -0.5))
         ) Slur
ees4^\markup \italic "sur \"a\"" ( g'8 ees f d ees c d bes
   c16 bes aes g f c' bes aes g2^\trill ) \bar "|."
}
\layout {line-width=70} 
}

 "   "  
"    "
} }
\pageBreak
\markup \huge \fill-line { \center-column { "[avant que Marie ne se termine]" "[sur l'écran]"
\bold "plus aigu"
"[on est en mode \"réagir à l'écran\"]"
"[les indications ci-dessous s'enchaînent rapidement]" }}
\markup \huge \fill-line { \center-column { \bold "molto portamento" }}
\markup \huge \fill-line { \center-column { \bold "con moto" }}
\markup \huge \fill-line { \center-column { \bold "ma non troppo" }}
\markup \huge \fill-line { \center-column { \bold "a due" }}
\markup \huge \fill-line { \center-column { \bold "con fuoco" }}
\markup \huge \fill-line { \center-column {  \bold "a tre" }}
\markup \huge \fill-line { \center-column { \bold "stacatto" }}
\markup \huge \fill-line { \center-column { \bold "a quattro" }}
\markup \huge \fill-line { \center-column { \bold "trémolo" }}
\markup \huge \fill-line { \center-column { \bold "sul ponticello" }}
\markup \huge \fill-line { \center-column { \bold "col legno battuto" }}
\markup \huge \fill-line { \center-column {
  \justify { [à ce moment, on voit un traumatisme de la vie de l'écran qui 
"explique" son comportement] }
}}
\markup \huge \fill-line { \center-column {
  "[après, on est de nouveau pris par sa tirade...]"
}}
\markup \huge \fill-line { \center-column { \bold "Speed-dating chez les asexuels." }}
\markup \huge \fill-line { \center-column { \bold "Manif pour l'apathie." }}
\markup \huge \fill-line { \center-column { \bold "1ère loi du mouvement de Newton." }}
\markup \huge \fill-line { \center-column { \bold "Cannibalisme chez les anoréxiques." }}
\markup \huge \fill-line { \center-column { \bold "I'm so pretty!" }}
\markup \huge \fill-line { \center-column { "[attacca à Coupure de courant]" }}
