\version "2.17.30"

first = \relative c' {
  \repeat volta 2 {
    f4 f f8 d4 f8 ~ |
    f8 f16 g a8-. g-. f d4 f8 ~ |
    f g g a g2 ~ |
    g8 g g a g4. g8 |
    g4. g8 g a g4 ~ |
    g8 g16 a g8 a g f e d |
    c4-. c'-. c-. c-. |
  }
  \repeat volta 2 {
    bes8 bes16 c d8 bes a8 a16 bes c8 a |
    g g16 a bes8 g a c c4 |
    bes8 bes16 c d8 bes a8 a16 bes c8 a |
  } \alternative {
    { g8 g16 a bes8 g c4 c | }
    { g8 g16 a bes8 g c4 c ~ | }
  }
  c8 c16 d c4 ~ c4. c16 d |
  c2.. c16 d |
  c8 c16 d c8 c16 d c8 c16 d c8 c16 d |
  c8 c, c c d f f4 ~ |
  f2 ~ f8 f16 g f4 ~ |
  f8 f16 g f8 d f d f4 |
  f1
}

second = \relative c' {
  \repeat volta 2 {
    r8 a r a r a r a |
    r a r a r a r a |
    r a r a r b r b |
    r b r b r b r b |
    r b r b r b r b |
    r b r b r b r g |
    c4-. e-. e-. e-. |
  }
}

third = \relative c {
  \clef bass
  \repeat volta 2 {
    f8 c' c, c' f, c' c, c' |
    f,8 c' c, c' f, c' c, c' |
    f,8 c' c, c' g d' d, d' |
    g, d' d, d' g, d' d, d' |
    g, d' d, d' g, d' d, d' |
    g, d' d, d' g, a g f |
    e4-. c-. c-. c-. |
  }
}

\score {
  <<
    \new Staff \first
    \new Staff \second
    \new Staff \third
  >>
}