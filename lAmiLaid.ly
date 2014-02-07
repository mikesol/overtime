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
\include "defs-devel.ly"
\header {
  title = "L'ami laid"
  composer = "DJmiXesOl"
}

\include "ami-laid-defs.ly"

noTime = \once\override Score.TimeSignature.stencil=##f
Tri = \override NoteHead.style = #'triangle
Slash = \override NoteHead.style = #'slash

tous = \relative c' {
  \cricket
  \question
  \time 4/4
  R1^\fermataMarkup^\markup \italic "they arrive..." \bar "|"
  \Tri
  \cadenzaOn
  c8^\mf^\breathe c4 r \bar ""
  c8^\sim c4 r \bar ""
  c8 c4 r \bar ""
  c8 c8 \cricket c8 r4. \bar "|"
  \Tri
  c8 c8 \cricket c4^\markup \italic "discomfort" r4 \bar "|"
  \Tri c4:32^\f \Slash c^\markup \italic "taking out pills" c c \bar "|"
  \tesw \Tri c8^\mf^\gulp c4^\sf^\breathe r4 \bar "|"
  c8^\mf c4^\pleasure r \bar "|"
  c4^\f^\burp r \bar "|"
  c8^\mp^\lips c c c c r \bar "|"
  c8^\f^\winded c4 \bar ""
  c8 c4 \bar ""
  c8 c4 \bar ""
  c8 \bar "|"
  c16^\mp^\straw c c c^\< c c c c c8 c16 c8^\f << { c4 } { s8.^\p^\< s16^\f } >> r4 \bar "|"
  c8^\sf^\chew c^\mf c c c c c c8^\mp^\lp r4 \bar "|"
  c16^\f^\>^\breatheAnxiety \repeat unfold 8 { c16 } c16^\mp^\< \repeat unfold 6 c16 c^\f r \bar "|"
  c2^\nose^\sf << {c2^\breathe } { s4..^\> s16^\p } >> r4 \bar "|"
  c8^\mp^\chew c c c c c c c8^\swallow r4 \bar "|"
  c4^\sf^\gag r8 c^>^\cough c^> c^> c^> r8 \bar "|"
  \Tesw c2:32^\p^\gurgle << { c2:32^\swish c2^\suck } { s4..^\< s16^\f s4..^\p^\< s16^\f } >> c8^\mp^\spit c r4 \bar "|"
  \rtesw
  c4^\sf^\hack r2 \bar "|"
  c2:32^\mp^\pleasure \bar "|"
  \cadenzaOff
  \noTime
  <<
    { \time 9/4 R1*9/4 }

    \new Staff \with {
      \remove "Time_signature_engraver"
      firstClef = ##f
      alignAboveContext = #"main"
    }
    \relative c' { \Tri \cricket c2^\mp^\gerbe^\markup \fontsize #2 "Marie" ~ c1 ~ c4 r2  }
  >>
  \bar "|"
  \cadenzaOn
  c8^\sf r << { c1:^\quake } { s2...^\p^\< s16^\f } >> r4 \bar "|"
  c8^\f^\smitten c16 c8 c16 c8 c16 c8 c16 c8 c16 c8 c16 \bar "|"
  \Slash
  c8^\spray c c \bar "|"
  \Tri
  c8^\breatheHand c8 c8_\sniff
  \Slash
  \tesw
  c8^\spr c r \bar "|"
  \Tri
  c8^\bre c8 c8^\sniff r8 \bar "|"
  c8^\spr r \bar "|"
  \Tri
  c8^\bre c8^\sniff r4 \bar "|"
  \cadenzaOff
  \noTime
  <<
    { \time 9/8 R1*9/8 }

    \new Staff \with {
      \remove "Time_signature_engraver"
      firstClef = ##f
      alignAboveContext = #"main"
    }
    \relative c' { \Tri \cricket \Tri c8^\sniff^\markup \fontsize #2 "Ryan" r4 \cricket c2^\eyes \Slash c4_\faints  \bar "|" }
  >>
 \bar "|"
  \noTime
  \time 4/4
  R1 |
  \noTime
  \time 1/8
  c8^\spr |
  \noTime
  \time 4/4
  R1 |
  \cadenzaOn
  c4^\mp^\breathe c8 r \bar "" c4 c8 r \bar "" c4 c4^\f^\sneeze r \bar "|"
  c8^\mf^\asthma << { c4 } { s8.^\< s16^\f } >> \bar "" c8 << { c4 } { s8.^\< s16^\f } >> \bar "" c8 r4 \bar "|"
  \Slash
  c1:32^\searches \bar "|"
  c4_\inhale r c4 r \bar "|"
  \cadenzaOff
  \noTime
  <<
    {
      r2 r4 \slash c4^\drops r2
      \Tri
      c1 ~ |
      c1^\pick ~ |
      c1^\eat ~ |
      c2^\hands c4^\sneezeShirt r4 |
      c1^\continue ~ |
      c1 |
      R1 |
      R1^\fermataMarkup |
    }
    <<
    \new Staff \with {
      \remove "Time_signature_engraver"
      firstClef = ##f
      alignAboveContext = #"main"
      } \new Voice="eudes"
        \relative c' {
        \cricket
        \time 6/4
        \noTime
        c8^\markup \fontsize #2 "Eudes" c c c c4 r4 r2
        \time 4/4
        c8 c r4 r2 |
        c8 c c r r2 |
        c8 c16 c c8 r r2 |
        c8 c c r r2 |
        c8 c r4 r2 |
        c8 c c r r2 |
        c8 r r4 r2 |
        R1^\fermataMarkup \bar "|."
      }
   \new Lyrics \with { alignAboveContext=#"main" %{alignBelowContext = #"eudes"%} }  \lyricsto "eudes" \lyricmode {
     vous êtes un homme fort
     vi -- ril
     plein de vie
     gas -- tro -- no -- mique
     am -- bi -- dextre
     flu -- ide
     co -- pi -- eux
     beau
   }
   >>
  >>
}

tousWords = \lyricmode {
\in
\out
\in
\out
\in
\out
\in
\out
hi
\in
\out
[mm]
\in
\repeat unfold 3 \skip 1
\skip 1
\out
\in
[əə]
\skip 1
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
\repeat unfold 6 { \out \in }
\repeat unfold 15 \skip 1
\out \in \out \in \out
\skip 1
\out \in \out \in \out
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "L'ami laid" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Elsa (vidéo)]"

"Vous souhaitez faire la connaissance de votre belle collègue"
"mais vous n'avez aucune confiance en vous."
"   "
"Solution : Vous faites appel à votre ami laid"
"pour qu'il vous accompagne au déjeuner."
"   "
"La femme que vous souhaitez mieux connaître"
"vous trouvera forcément plus beau,"
"plus charmant et plus intelligent que lui."
"   "
"Dans l'imaginaire, ça se passe ainsi..." "    " } }

\markup \huge \fill-line { \italic \center-column {
"[Mike et Ryan arrivent pour déjeuner, souriants."
"Marie regarde Mike avec dédain, mépris et dégoût]"
"    " } }

\markup \huge \fill-line { \center-column { "[Eudes]"

"Mais qu'est-ce qu'il est laid, celui-là..." "    " } }

\markup \huge \fill-line { \center-column { "[Marie]"
\italic "[profondement dégoûtée et donc attirée à Ryan]"

"Je t'aime..." "    " } }

\markup \huge \fill-line { \italic \center-column {
"[ils embrassent, Mike s'excite en regardant]"
"    " } }

\markup \huge \fill-line { \center-column { "[Elsa (vidéo)]"

"Mais dans la vraie vie,"
"ça se passe de la manière suivante..."
"    " } }


\score {
  <<
    \new Staff ="main" \with { instrumentName = "Mike" } \new Voice = "tous" \tous
    \new Lyrics \lyricsto "tous" \tousWords
  >>
  \layout {
    \context {
      \Voice
      \override Hairpin #'minimum-length = #6
      \override Hairpin #'springs-and-rods = #ly:spanner::set-spacing-rods
      
    }
  }
  \midi {}
}