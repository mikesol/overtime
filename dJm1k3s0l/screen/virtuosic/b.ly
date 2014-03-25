\version "2.19.0"
#(set-global-staff-size 100)
#(set-default-paper-size "a1")

Hairlen =
#(define-music-function (parser location n) (number?)
#{
  \override Hairpin #'minimum-length = #n
  \override Hairpin #'springs-and-rods = #ly:spanner::set-spacing-rods
#})

\relative c {
  \numericTimeSignature
  \clef bass
  \Hairlen #7
  << { g1:32 } { s8\p\< s4 s8\f\> s4 s8\p s8 } >> 
  \times 2/3 { g8:32 d'' d,:32 } ees'16:64\f ges,, e'':64 f,,:64 << { ges''2^\trill } { s8\p\< s8 s8\> s8\! } >> \bar "||"
}