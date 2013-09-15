\version "2.17.1"
\include "defs-devel.ly"
% je pars en vacances
#(ly:set-option 'point-and-click #f)
%{
  yeah I'm one crazy motherfucker!!
  shake it
  look at my butt, look at my butt!
%}

#(set-global-staff-size 15.87)

\header {
  title = "Le patron part"
  composer = "dJm!k3sØ1"
}

%%%%%%%%%%%
%%   O   %%
%%%%%%%%%%%
padMM = \override Score.MetronomeMark.padding = #2
marieO = \relative c' {
  \padMM
  \tempo 4=160
  \time 4/4
  \cricket
  c1 ~ |
  c2.. r8 |
  \repeat unfold 6 { r8 c } r d [ b d ] |
  d4 r8 b4 r8 d4 |
  r8 d r c r e c e |
  d4 r8 d r8 d d d |
  r d r d r c e e |
  c4 c r8 c4 c8 ~ |
  c^\markup \italic \column { "[de plus en plus" "comme un oiseau]" } c c4 r8 c r c ~ |
  c r c4 r8 c4 r8 |
  c4 r8 c4 r8 r4 |
  r8 c4 c8 c8. c c8 |
  \times 2/3 { r4 c c } \times 2/3 { c c c } |
  r8^\markup \italic "[singe]" c4 c c c8 |
  \times 2/3 { r4 c c } \times 2/3 { c c c } |
  r4 c c c |
  \time 5/8
  c c r8 \bar "||" |
}

marieOWords = \lyricmode {
  "w0000!"
  \repeat unfold 6 uh
  yeah
  uh yeah uh uh uh you know it
  uh uh I'm gon -- na
  uh uh you take "it!"
  uh uh uh uh uh uh uh
  uh uh uh uh uh
  \repeat unfold 10 uh
  oo aa oo aa 
  aa oo aa aa aa
  aa oo aa aa oo
}

ryanO = \relative c' {
  \time 4/4
  \cricket
  c1 ~ |
  c2 ~ c8 c4. ~ |
  c8 c4. ~ c4 r8 c |
  r c r c r d c d |
  r2 \times 2/3 { c4 c c ~ } |
  c8 c4. ~ c8 r4. |
  \times 2/3 { c4 c c } c4. c8 ~ |
  c2. r4 |
  \override Stem #'stencil = #bendy
  \override Stem #'Y-extent = #grob::always-Y-extent-from-stencil
  \override NoteColumn #'Y-offset = #(lambda (grob) (rand-me -1 1))
  \override NoteHead #'style = #'mensural
  \override Flag #'stencil = ##f
  c16^\markup \italic "[random freaking out]"  c c c c16 c c c c16 c c c c16 c c c |
  c16 c c c c16 c c c c16 c c c c16 c c c |
  \revert Stem #'stencil
  \revert NoteColumn #'Y-offset
  \revert NoteHead #'style
  \revert Flag #'stencil
  \cricket
  c4 \air c \times 2/3 { c c c }
  r8 c c c c c c c |
  c c4. ~ c8^\markup \italic "(shake it!)" r4 c8 |
  \times 4/7 { r8 c c c c r4 } r4 c |
  c16 c c r r4 r4 c16^\markup \italic "[like a dolphin]" c c c |
  c r8 c16 c c c c \times 2/3 { r4 c c } |
  \times 2/3 { c \tri c2 } r8 c4 c8 ~ |
  c \times 2/3 { c4 c c } \bar "||" |
  
}

ryanOWords = \lyricmode {
  "w0000!"
  awww shit
  yeah
  uh uh you know it
  where's the don -- key?
  break out the don -- key!
  \repeat unfold 32 \skip 1
  ha "[aa]" oo oo ee
  you know I cra -- zy mo -- tha -- fuc -- ka
  hm
  look at my butt!
  aa
  look at it!
  \repeat unfold 10 a
  ow ow ow
  brr
  \repeat unfold 5 wa
}

eudesO = \relative c' {
  \cricket
  R1*7 |
  \times 4/5 { c4 c c c c }
  R1*7 |
  r2.. c8 ~ |
  c4. c8 ~ c2 |
  r4. c4 |
}

eudesOWords = \lyricmode {
  I don't like don -- "key!"
  mais, uhhh... "quoi ?"
}

%%%%%%%%%%%
%%   S   %%
%%%%%%%%%%%

marieS = \relative c' {
  \padMM
  \tempo 4=100
  \time 4/4
  \cricket
  c1 ~ |
  c2.. r8 |
  r8 c r c r c r c |
  r c r4 r8 c4. |
  r4 r8. c16 c c8. ~ c4 ~ |
  c4 r4 r8 c16 c ~ c8 r |
  c4 r4 r8 c4 r8 |
  r4 c r4 r8 c | \bar "||"
}

marieSWords = \lyricmode {
  "w0000!"
  uh uh uh uh uh yeah c'est comme hier...
  c'est chouette...
  uh uh uh uh
}

ryanS = \relative c' {
  \time 4/4
  \cricket
  r2 c16 c c4. ~ |
  c1 |
  r2 r8 c r4 |
  r8 c4 c8 ~ c4 r4 |
  c8 c c c ~ c2 |
  r8 c c c c c c c |
  c c ~ c4 ~ c4 r8. c16 ~ | 
  c8. r16 r4 r16 c8. \times 4/6 { c16 c c c r8 }
}

ryanSWords = \lyricmode {
  par -- ty time...
  uh
  awww shit
  where's the don -- key
  you know I cra -- zy mo -- tha -- fuc -- ka
  uh uh look at my butt
}

eudesS = \relative c' {
  \cricket
  R1*8 |
}

eudesSWords = \lyricmode {
}

%%%%%%%%%%%
%%   T   %%
%%%%%%%%%%%

marieT = \relative c' {
  \time 4/4
  \cricket
  \tempo 4=80
  \padMM
  R1 |
  \time 15/16  
  R1*15/16 \bar "||" |
}

marieTWords = \lyricmode {
}

ryanT = \relative c' {
  \time 4/4
  \cricket
  \time 4/4
  R1 |
  \time 15/16  
  r2 r8 c4 r16 |
}

ryanTWords = \lyricmode {
  uhhh
}

eudesT = \relative c' {
  \cricket
  \time 4/4
  R1 |
  \time 15/16  
  R1*15/16 |
}

eudesTWords = \lyricmode {
}


%%%%%%%%%%%
%%   F   %%
%%%%%%%%%%%

dbNB = {
  \bar "'"
  \noBreak
}

bancal = \markup \italic "[rythmes un peu bancal]"

marieF = \relative c' {
  \tempo "unstable" 4=20
  \time 4/4
  \padMM  
  \cricket
  c32 c32 c32 c32 c16^\bancal c \dbNB
    c32 r c32 r c16 c32 c \dbNB
    c16 c c c32 \times 2/3 { c64 c c } \dbNB
    c32 c c c c16 c32 c |
  c2:128 c2:128 |
  \times 4/5 { c32:128 c32 c c c } c8
    c4 ~
    c16 r8 c16
    \times 2/3 { c8 c c } |
  \time 3/4
  c8..:128 c32 \dbNB
    c32 c c c c8 ~ \dbNB
    c4 \bar "|."
}

marieFWords = \lyricmode {
  Hun -- ga wa -- ka chin ning
  hung ming quan cha chin seen fan
  chu ha a a a chu ha sing fa ooo ching a
  niminimi... hahahaha... __ _
  source de la vie
  awww shit
  nia nia nia nia nia
  son corps dans le sé -- pulcre
}

ryanF = \relative c' {
  \time 4/4
  \cricket
  c32 c32 c32 c32 c16^\bancal c \dbNB
    c32 r c32 r c16 c32 c \dbNB
    c16 c c c32 \times 2/3 { c64 c c } \dbNB
    c32 c c c c16 c32 c |
  \FatText
  \MonoShift
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)  
  s1-\markup \override #'(line-width . 126) \justify { le sang de vos péchés coulera dans la rivière et fera revenir celui qui nous donne du "pain !" "                                               " } |
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
  \cricket
  r8 r32 c16 c32 \dbNB
    r32 c c c c c c c \dbNB
    c c8.. ~ \dbNB
    c8. \times 2/3 { c32 c c } |
  c8 r16 c128 c c r r32 \dbNB
    \times 4/5 { r32 c c c \times 2/3 { c64 c c } } c128 c c16.. ~ \dbNB
    c4 |
}

ryanFWords = \lyricmode {
  Hun -- ga wa -- ka chin ning
  hung ming quan cha chin seen fan
  chu ha a a a chu ha sing fa ooo ching a
  uh uh
  yes I'm a cra -- zy mo -- tha -- fuc -- ka
  look at my butt!
  look at it!
  la pous -- si -- ère à la pous -- si -- ère
}

eudesF = \relative c' {
  \cricket
  r4 \dbNB
    r8 c ~ \dbNB
    c16 r c32 c c c \dbNB
    c c c8. |
  \FatText
  \MonoShift
  \hideNotes
  \override TextScript #'whiteout = ##t
  \override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)  
  s1-\markup \override #'(line-width . 126) \fill-line { "   " "pas de sang (ad lib...)"  "  " "pas ça (ad lib...)" "   " } |
  \unFatText
  \unMonoShift
  \unHideNotes
  \revert TextScript #'whiteout
  \revert Staff . BarLine #'Y-extent  
  \cricket
  c8. r16
    r4
    \FatText
    \MonoShift
    \hideNotes
    \override TextScript #'whiteout = ##t
    %\override TextScript #'extra-spacing-width = #'(-0.2 . 0.2)  
    \once \override TextScript #'X-extent = ##f
    s2-\markup %\override #'(line-width . 60)
      \column { \line { mais je me demande, comment les choses } \line { se passent-elles dans l'autre "bureau... ?" } } |
    \unFatText
    \unMonoShift
    \unHideNotes
    \revert TextScript #'whiteout
    \revert Staff . BarLine #'Y-extent  
    \cricket
  r2 r32 c c c c8
}

eudesFWords = \lyricmode {
  "ahhhh !!!"
  ni ni ni ni ni ni "niiiii !!"
  "ahhhh !"
  je mour -- rai "vierge !"
}


\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Le patron part" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Mike]" "Je pars en vacances." "   " } }

\markup \huge \fill-line { \center-column { \italic "(il part)" "   " "   " } }

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marieO
    \new Lyrics \lyricsto "marie" \marieOWords
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryanO
    \new Lyrics \lyricsto "ryan" \ryanOWords
    \new Staff \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudesO
    \new Lyrics \lyricsto "eudes" \eudesOWords
  >>
  \layout {}
  %\midi {}
}

\pageBreak
\markup \huge \fill-line { \center-column { "[sur l'écran]" "le lendemain" "   " "   "  } }

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marieS
    \new Lyrics \lyricsto "marie" \marieSWords
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryanS
    \new Lyrics \lyricsto "ryan" \ryanSWords
    \new Staff \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudesS
    \new Lyrics \lyricsto "eudes" \eudesSWords
  >>
  \layout {}
  %\midi {}
}

\markup \huge \fill-line { \center-column { "[sur l'écran]" "trois jours après" "   " "   "  } }

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marieT
    \new Lyrics \lyricsto "marie" \marieTWords
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryanT
    \new Lyrics \lyricsto "ryan" \ryanTWords
    \new Staff \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudesT
    \new Lyrics \lyricsto "eudes" \eudesTWords
  >>
  \layout {}
  %\midi {}
}

\markup \huge \fill-line { \center-column { "[sur l'écran]" "huit jours après" "   " "   "  } }

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \new Voice = "marie" \marieF
    \new Lyrics \lyricsto "marie" \marieFWords
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryanF
    \new Lyrics \lyricsto "ryan" \ryanFWords
    \new Staff \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudesF
    \new Lyrics \lyricsto "eudes" \eudesFWords
  >>
  \layout {}
  %\midi {}
}
