\version "2.19.0"
#(set-global-staff-size 100)
#(set-default-paper-size "a1")
Hairlen =
#(define-music-function (parser location n) (number?)
#{
  \override Hairpin #'minimum-length = #n
  \override Hairpin #'springs-and-rods = #ly:spanner::set-spacing-rods
#})

\relative c' {
  \numericTimeSignature
  \clef "treble_8"
  \override Hairpin #'transparent = ##t
  \revert DynamicText #'extra-spacing-width
  #(set-accidental-style 'dodecaphonic)
  cih128\mf [ eeh'16 bisih,32 fis128 aeseh64 gis32 d8 ceh''16 a128 fes,64 b,32 a16 gisih64 gis32 ] r8 deseh'128\f\< [ ( c64-.\p\< ) c16-_\pp\< c32-^\ff\< c64.->\mf\< c16-!\mp\< c128_\open\ff\< c8\p\<-- c32\mp_\stopped ] |
}