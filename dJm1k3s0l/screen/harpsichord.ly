up =   \transpose e b \relative c' {
      \key e \major
      %\tempo 4=72
      eih32 f32 fih fis fisih g gih gis gisih a aih ais aisih b bih bis bisih cis cisih d dih dis disih e |

}
\score {
  \new Staff
%{    \relative c' {
      \key e \major
      e8. fis32 gis a b cis dis e8 ~ e2 |
    }
  \transpose e fis \relative c' {
      \key e \major
      %\tempo 4=72
      e8. fis32 gis a b cis dis e8 ~ e2 |
  }
  \transpose e gis \relative c' {
      \key e \major
      %\tempo 4=72
      e8. f32 fis g gis a ais b bis cis d dis e8.. ~ e4 |
  }
%}
  \transpose e b \relative c' {
    e8.. \up \transpose e e' \up \transpose e e'' \up \transpose e e''' \up \transpose e e'''' \up 
  }
  \layout {}
  \midi {}
}