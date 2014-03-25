\version "2.19.0"
#(set-global-staff-size 100)
#(set-default-paper-size "a1")
Hairlen =
#(define-music-function (parser location n) (number?)
#{
  \override Hairpin #'minimum-length = #n
  \override Hairpin #'springs-and-rods = #ly:spanner::set-spacing-rods
#})

\relative c'' {
  \numericTimeSignature
  \clef treble
  \time 4/3
  \times 2/3 { c2\f d e f } \bar "||"
  \time 5/3
  \times 2/3 { g2 a b c b } \bar "||"
  \time 5/3
  \times 2/3 { a2 g f e d } \bar "||"
  \time 4/3
  \times 2/3 { c1 } \bar "||"
}