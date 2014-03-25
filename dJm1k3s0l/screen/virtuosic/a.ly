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
  \partial 4
  \key d \major
  \Hairlen #7
  a\p\< \glissando ( fis'8-.\f ) a\p\glissando\< ( d,,4\f\trill\> ) d16-.\p\< e-. fis-. g-. a-. b-. \times 2/3 { cis-. d-. e-. } |
  fis8-.\f\> a-. a-. a-. a4.\p^\trill \bar "||"
}

