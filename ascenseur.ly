\version "2.17.21"

#(set-global-staff-size 15.87)

\header {
  title = "l'ascenseur"
  composer = "Claude Joseph Rouget de Lisle"
  arranger = "arr. Mike Solomon"
}

soprano = \relative c' {
  \tempo "¡con maracas!" 4=110
  \time 4/4
  \key g \major
  \clef "treble"
  \partial 4.
  %r2 r8
  d16 d ~ d d8 d16 |
  g8 g16 g ~ g g8 a16 ~ a a8 a16 a a b c |
  d8 d16 d ~ d b8 g16 ~ g g8 g16 b8 g |
  e8 e16 c'16 ~ c16 e,8 ees16 ~ ees16 d8 d16 a'8 fis |
  g8 d16 e ~ e fis8 d16 ~ d d8 e16 d d g a |
  b8 d,16 ees ~ ees b'8 d,16 ~ d b' d, g c8 b |
  b8 d,16 a' ~ a dis,8 aes'16 ~ aes e8 g16 fis d a' b |
  c a fis e c d e g fis d fis d' ~ d c8 d32 ( c ) |
  b8 d,16 g ~ g a8 b16 ~ b8 r d d |
  d8. b16 ~ b g8 d'16 ~ d e8 d16 b8 g |
  d16 cis d e fis e fis g a g a b a e fis g |
  a8 a16 aes ~ aes aes8 aes16 g8 fis16 c' a8 fis |
  a16 b, d g ~ g a8 b16 ~ b a8 g16 f8 g |
  e8 c16 g' ~ g c,8 b'16 ~ b c8 b16 a8 g |
  a16 d, e a aes d, e g fis8 r16 fis ~ fis g8 c16 |
  bes8 g16 ees ~ ees c8 bes'16 ~ bes c,8 d'16 c8 bes |
  a8 a16 aes ~ aes aes8 g16 ~ g fis8 e16 d8 a' |
  g8 d16 g16 ~ g a8 bes16 ~ bes c8 bes16 a8 g |
  a8 d,16 e ~ e fis8 d16 ~ d4 e' |
  d8 d,16 g ~ g a8 b16 ~ b d8 b16 a8 g |
  a d,16 fis ~ fis g8 a16 ~ a4 e' |
  d8 d,16 g ~ g a8 b16 ~ b d8 b16 a8 g |
  a d,16 fis ~ fis g8 a16 ~ a b8 a16 g8 fis |
  g8 d16 e ~ e fis8 g16 ~ g g8 g16 a8 a |
  b8 d,16 g ~ g a8 b16 ~ b d,16 g a \times 2/3 { b8 ais b } |
  c8 d,16 e ~ e g8 c16 ~ c c8 c16 d8 e |
  a,8 a16 aes ~ aes aes8 g16 ~ g fis8 e16 d8 e' |
  d8 d,16 g ~ g a8 d16 ~ d b8 c16 a8 fis |
  g8 d16 e ~ e fis8 d16 ~ d8 \bar ":|."  
}

tenor = \relative c' {
  \time 4/4
  \key g \major
  \clef "treble_8"
  \partial 4.
  %r2 r8
  r4. |
  e8 e16 ees ~ ees ees8 d16 ~ d d8 d16 f8 f |
  e8 e16 ees ~ ees ees8 d16 ~ d d8 d16 des8 des |
  c8 c16 e ~ e c8 ces16 ~ ces bes8 a16 d8 c |
  b8 b16 c ~ c c8 b16 ~ b b8 c16 b8 d |
  fis8 fis16 f ~ f f8 e16 ~ e e8 e16 ees8 ees |
  d8 d16 cis ~ cis cis8 c16 ~ c c8 c16 b8 b |
  bes8 bes16 a ~ a b8 c16 ~ c c8 c16 ees8 ees |
  d8 d16 c ~ c c8 b16 ~ b8 r d d |
  d d16 dis ~ dis dis8 e16 ~ e e8 e16 eis8 eis |
  fis8 d c b16 a16 ~ a d a8 d d |
  e8 e16 ees ~ ees ees8 d16 ~ d d8 d16 c8 c |
  b8 b16 c ~ c c8 cis16 ~ cis cis8 cis16 d8 d |
  c8 c16 b ~ b b8 a16 ~ a a8 a16 bes8 bes |
  b8 b16 c ~ c c8 cis16 ~ cis cis8 cis16 d8 d |
  ees8 ees16 c ~ c bes8 g16 ~ g bes ees g16 aes8 g |
  f8 c16 e16 ~ e c8 ees16 ~ ees c8 bes16 a8 c |
  bes8 bes16 d ~ d d8 g16 ~ g g8 g16 f8 ees |
  d8 d16 des16 ~ des des8 c16 ~ c c8 c16 b8 a |
  b8 b16 c16 ~ c c8 cis16 ~ cis cis8 cis16 d8 d |
  e8 e16 ees ~ ees ees8 d16 ~ d d8 d16 c8 c8 |
  b8 b16 c16 ~ c c8 cis16 ~ cis cis8 cis16 d8 d |
  c8 c16 b ~ b b8 a16 ~ a a8 a16 a8 c |
  b8 b16 c ~ c c8 b16 ~ b b8 b16 e8 e |
  d8 b16 c ~ c c8 cis16 ~ cis cis8 cis16 d8 d |
  e8 b16 c ~ c e8 ees16 ~ ees f8 ees16 d8 c |
  d8 fis16 f ~ f f8 e16 ~ e d8 c16 b8 c |
  b8 b16 c ~ c c8 b16 ~ b b8 a16 d8 c |
  b8 d16 b ~ b b8 b16 ~ b8

}

\score {
  <<
    \new Staff \with { instrumentName = "Marie" } \soprano
    \new Staff \with { instrumentName = "Ryan" } \tenor
  >>
  \layout {}
  \midi {}
}