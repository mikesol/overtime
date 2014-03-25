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
  \times 8/11 { r2 \times 4/5 {r8 \times 4/7 { r8. \times 2/3 { r16 ais-.\p r16 } r8 } r4 } r4. } \bar "||"
}