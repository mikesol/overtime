 \version "2.17.26"
#(set-global-staff-size 17.82)
#(ly:set-option 'point-and-click #f)

rising = \markup \italic "rising progressively"

#(define (giant-glissando-stencil-hack grob)
  (define (ivr iv r)
    (+ (* r (- (cdr iv) (car iv))) (car iv)))
  (let* ((sten (ly:line-spanner::print grob))
         (x-l (ly:stencil-extent sten X))
         (y-l (ly:stencil-extent sten Y))
         (x-base (car x-l))
         (y-base (car y-l)))
    (ly:stencil-translate
      (make-connected-path-stencil
        `((,(- (ivr x-l 0.33) x-base) ,(- (ivr y-l 0.1) y-base)
           ,(- (ivr x-l 0.66) x-base) ,(- (ivr y-l 0.35) y-base)
           ,(- (ivr x-l 1.00) x-base) ,(- (ivr y-l 1.00) y-base)))
         0.2
         1
         1
         #f
         #f)
      (cons x-base y-base))))

#(define (bendcallback grob) 
   (let* ((orig (ly:grob-original grob)) 
          (siblings 
            (if (ly:grob? orig) 
                (ly:spanner-broken-into orig) 
                '()))) 
       (if (>= (length siblings) 2) 
           (if (not (eqv? grob (car siblings))) 
               (ly:grob-suicide! grob)))))

#(define craZyStemZ

'(
            ;; 3.5 (or 3 measured from note head) is standard length
            ;; 32nd, 64th, 128th flagged stems should be longer
            (lengths . (7.0 7.0 7.0 8.5 10.0 12.0))

            ;; FIXME.  7.0 yields too long beams (according to Ross and
            ;; looking at Baerenreiter examples) for a number of common
            ;; boundary cases.  Subtracting half a beam thickness fixes
            ;; this, but the bug may well be somewhere else.

            ;; FIXME this should come from 'lengths
            (beamed-lengths . (6.52 7.0 7.2))

            ;; The 'normal' minima
            (beamed-minimum-free-lengths . (3.66 3.0 2.5))
            ;;(beamed-minimum-free-lengths . (4.0 3.66 2.5))

            ;; The 'extreme case' minima
            (beamed-extreme-minimum-free-lengths . (4.0 2.5))

            ;; Stems in unnatural (forced) direction should be shortened by
            ;; one staff space, according to [Roush & Gourlay].
            ;; Flagged stems we shorten only half a staff space.
            (stem-shorten . (2.0 1.0))

            ))

#(define leSScraZyStemZ

'(
            ;; 3.5 (or 3 measured from note head) is standard length
            ;; 32nd, 64th, 128th flagged stems should be longer
            (lengths . (4.0 4.0 4.0 5.5 6.0 7.0))

            ;; FIXME.  7.0 yields too long beams (according to Ross and
            ;; looking at Baerenreiter examples) for a number of common
            ;; boundary cases.  Subtracting half a beam thickness fixes
            ;; this, but the bug may well be somewhere else.

            ;; FIXME this should come from 'lengths
            (beamed-lengths . (6.52 7.0 7.2))

            ;; The 'normal' minima
            (beamed-minimum-free-lengths . (3.66 3.0 2.5))
            ;;(beamed-minimum-free-lengths . (4.0 3.66 2.5))

            ;; The 'extreme case' minima
            (beamed-extreme-minimum-free-lengths . (4.0 2.5))

            ;; Stems in unnatural (forced) direction should be shortened by
            ;; one staff space, according to [Roush & Gourlay].
            ;; Flagged stems we shorten only half a staff space.
            (stem-shorten . (2.0 1.0))

            ))

#(define (fan-pitch n p)
;(format #t "FOO ~a ~a\n" p (ly:pitch-semitones p))
   (let* ((ps (- (ly:pitch-semitones p) n))
          (o (quotient ps 7))
          (pit (- ps (* o 7))))
     (ly:make-pitch o
                    pit
                    0)))

#(define (fan n music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map (lambda (x) (fan n x)) es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (fan n e)))
     (if (ly:pitch? p)
         (begin
           (set! p (fan-pitch n p))
           (ly:music-set-property! music 'pitch p)))
     music))

fanMusic =
#(define-music-function (parser location n m)
   (number? ly:music?)
   (fan n m))

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

lexicon = \markup \column {
  \line { † = glitch }
  \line { ‡ = megaglitch }
  \line { \general-align #Y #DOWN \musicglyph #"scripts.espr" = enflé }
  \line { \general-align #Y #DOWN \musicglyph #"scripts.tenuto" = appuyé, puis coupé de manière abrupte }
  \line { \general-align #Y #DOWN \with-color #blue \musicglyph #"noteheads.s2" = lecteur trop rapide }
  \line { \general-align #Y #DOWN \with-color #red \musicglyph #"noteheads.s2" = lecteur trop lent }
}

Red = \override NoteHead #'color = #red
Blue = \override NoteHead #'color = #blue
Black = \revert NoteHead #'color

\include "defs-devel.ly"

\header {
  title = "Les amants"
  subtitle = "Deuxième tome"
  composer = "ΔJmikEs0ל"
}

rushed = {}
slower = {}

rcadenza = \relative c' {
\question
\cadenzaOn
\cricket
\tempo "" 4=156
\times 2/3 { c8^\pp } \times 2/3 { c4 c8 } \times 2/3 { c4 c8 } \bar "|"
\times 2/3 { r4 c8 } \times 2/3 { c4 c8 } \times 2/3 { c4 c c8 c } \bar "|"
c8 c \bar "|"
c8^\ff c4 c8 c4 c8 \bar "|"
c4^\mf c8 c c4 c \bar "|"
\times 2/3 { c8^\f c c } \times 2/3 { c c c } \times 2/3 { c c r } \bar "|"
\times 2/3 { r4 c8^\mf } \times 2/3 { c4 c8 } \times 2/3 { r4 c8 } \bar "||"
\cadenzaOff
}
scooped = \markup \italic "scooped"

joyRyan = {
\revert NoteHead.style
\revert Staff.BarLine.bar-extent
\clef tenor
\stopStaff
\override Staff.StaffSymbol.staff-space = #0.5
\override Staff.StaffSymbol.line-count = #12
\startStaff
\override Stem.details = #craZyStemZ
\override NoteHead.font-size = #-3
\revert Stem.direction
}

tripq = \markup { \note #"4" #UP = \note #"4" #UP }

ryan = \fanMusic #0 \relative c' { \autoBeamOff\numericTimeSignature
%\cricket
%\rcadenza
%\cadenzaOff
\tempo 4=78
\joyRyan
\time 2/4
\TupFrac
%\tupFrac
\mark "*"
\times 23/24 {e4.^\downbow^\mp^\< cis8^.^\f e4.^\downbow^\mp^\< cis8^.^\f e4.^\downbow^\mp^\< cis8^.^\f } r16 |
\times 2/3 { fis16^\mf^> d8. fis16^> d8. fis16^> d8. } |
\times 2/3 { fis16^> d8. fis16^> d8. fis16^> d8. } |
%\tupFrac
\times 21/24 { << { cis4. r8 cis4. r8 cis4. r8 } { s4^\p^\< s16 s16^\f s8 s4^\p^\< s16 s16^\f s8 s4^\p^\< s16 s16^\f s8 } >> }
\times 5/7 { cis8^\mf^\upbow cis^\upbow cis^\upbow cis^\upbow cis^\upbow cis^\upbow cis^\upbow } r16 |
bis4.^\mp^\<-\bendAfter #2 r16^\pMFdynamic bis^- ~ |
bis8. b16^\upbow e4^\downbow^\p^\< ~ |
e8 cis32^\f cis r16 e4^\downbow^\p^\< ~ |
e8 cis32^\f cis \times 9/10 {
g'4^\mf-\bendAfter #3 g-\bendAfter #3 g-\bendAfter #3 g-\bendAfter #3 g-\bendAfter #3 } \times 6/7 {
bis,8^\mf^\upbow bis^\upbow bis^\upbow dis^_ dis^_ dis^_ dis^_
} e4.^\downbow^\p^\< \times 2/3 { cis16^\f cis cis }
\times 7/12 { fis4-\bendAfter #2 r8 fis4-\bendAfter #2 r8 } |
\times 2/3 { cis2^\mp^\downbow g'4^\mf^_ }
\times 3/5 { cis,2^\mp^\downbow bis8^. cis2^\downbow r8 } cis8^_
%% KLUDGE !!
%\once \override TupletBracket.positions =
%#(lambda (grob) (coord-translate (ly:tuplet-bracket::calc-positions grob) '(1.0 . 1.0)))
\times 5/7 {
  bis8^\mf^\upbow bis^\upbow bis^\upbow fis'^\f^_ fis^_ fis^_ fis^_ } |
\times 19/24 { eis4^\mf^\downbow eis^\downbow eis^\downbow eis^\downbow eis^\downbow \times 2/3 { fis4^\downbow cis8^. } }  e16^\downbow^\p^\< ~ e4  ~ |
e8 cis8^\f e4^\downbow |
bis8.^\mp^_ r16 gis16^\p bis8^_^\mp r16 |
\times 2/3 { r8 bis4^_ } r8 eis8^\mp^\>^\rising ~ |
  eis2 ~ |
  eis2 ~ |
  eis2 ~ |
  eis2 ~ |
  eis2 ~ |
  eis4.^\ppp r8\fermata |  
  fis2^\mp^\>^\rising ~ |
  fis2 ~ |
  fis2 ~ |
  fis2 ~ |
  fis2 ~ |
  fis2 ~ |
  fis2 ~ |
  fis2^\ppp \bar "||" |
  r4.^\fermata
      %%%%%%%%%%%%
  \times 2/3 { e8^\turn^\mp%{^\markup \italic "ashamed"%} cis16 r e8^\turn cis16 r e8^\turn cis16 r }
  \times 2/3 { e8^\turn cis16 r e8^\turn cis16 r e8^\turn cis16 r }
    r8 | \bar "||"
      %%%%%%%%%%%%
  bes,2:32^\f |
  r4 bes:32 ~ |
  bes:32 r4 |
  bes2:32 |
  r8. d16:32^\mf ~ d4:32 |
  e'16^\subFdynamic^> cis e4^\downbow d,8:32^\mf |
  d8^.^\mp \times 7/8 { d8:32^-^\subFdynamic r d:32^- r d:32^- r d:32^- r } |
  gis,8^.^\mp cis4.:32^\mf ~ |
  cis8.:32 cis'16 ~ cis-\bendAfter #2 r16 c,8:32 ~ |
  c4.:32 %\revert Stem.details
\cricket
\TupFrac
\times 4/6 { c'16 c c c c c }
  \joyRyan \TupFrac fis,4.:32^\f^\downbow-\bendAfter #-2 |
  \times 4/5 { cis'4^\downbow^_ cis^\downbow^_ cis^\downbow^_ \times 2/3 { cis4^\downbow^_ d,^_ b'^\downbow^_ } } |
  bes2:32^\ff ~ |
  bes8:32 e16^\mf cis cis8^\f-\bendAfter #2 bes8:32 ~ |
  bes8:32 bes4.:32^\f ~ |
  bes4:32 ges'8-\bendAfter #2 ges-\bendAfter #2 |
  aes,8.:32 \times 2/3 { des4^\f^_^\downbow des^_^\downbow des^_^\downbow }
  aes8.:32^\mf fes16^. \times 13/16 { des'4^\f^_^\downbow
  des^_^\downbow des^_^\downbow des^_^\downbow } f4^\fff^\> ~ |
  f2^\markup \italic "falling progressively" ~ |
  f2 ~ |
  f2 ~ |
  f2 ~ |
  f4^\ppp r^\fermata \bar "||" |
  r4. e16^\mp cis |
  \tempo 4=135
  a'8^\mf^. a^. a^. a^. |
  a^. a^. a^. a^. |
  a^. a^. a^. a^. |
  a^. a^. a^. a^. |
  \times 16/17 { g8-\bendAfter #-2 cis,16 g'8-\bendAfter #-2 cis,16 g'8-\bendAfter #-2 cis,16
  g'8-\bendAfter #-2 cis,16 g'8-\bendAfter #-2 cis,16 g'8-\bendAfter #-2 } |
  \times 11/12 {
  f8^\upbow f^\upbow
     f^\upbow f^\upbow
     f^\upbow f^\upbow
    \times 2/3 { aes8^.^\f aes^. aes^. }
    \times 2/3 { c4^\downbow f,,8^\mf }
    g'8-\bendAfter #-2 cis,^.
      }
      e8^\p^\<^\downbow ~ |
  e4 cis8^\f \times 2/3 { g'^\downbow a^\downbow b^\downbow }
     dis,8^\mf ~ dis8.-\bendAfter #3 dis16 ~ |
  dis8-\bendAfter #3 \times 2/3 { gis8 fis16 fis fis8 } e16 cis |
  \times 2/3 { f4^\downbow f^\downbow f^\downbow }
  \times 6/7 { f8^_ f^_ fis^_ cis16 } fis16^.^\mf^\< fis^. |
  \time 3/8
  fis16^.^\f r d'8^\subP^\< \times 2/3  { c,16^\> c c } | \bar "||"
  \tempo 4=174
  \time 2/4

  cis8^\mp^\cresc cis8 g'8. r16 |
  cis,8 cis8^. bes8-\bendAfter #-2 r8 |
  \times 4/7 { cis4^_ g'^\downbow g^\downbow b,8 } |
  \times 2/3 { r4 gis'^\downbow gis^\downbow } |
  
  cis,8 cis8 g'8. r16 |
  c,8 c8^. a8-\bendAfter #-2 r8 |
  \times 4/7 { cis4^_ g'^\downbow g^\downbow b,8 } |
  \times 2/3 { r4 gis'^\downbow gis^\downbow } |
  

  cis,8 cis8 \times 4/5 { gis'8 gis
  gis gis a,8 ~ } a8-\bendAfter #-2 r8 |
  \times 4/7 { cis4^_ g'^\downbow gis^\downbow e8 } |
  \times 2/3 { cis4 b'^\downbow b^\downbow b^\downbow }
  
  % %%% FUCKED Upp!!!!
  d,8 d8 a'8. r16 d,8 fis8^. c8-\bendAfter #-2 r8
  \times 2/3 { a'4^\downbow cis,8 g'^\downbow } |
  \times 2/3 { cis,4 b'^\downbow b^\downbow } |

  d,8 d8 bes'8. r16 |
  fis8 g8^. f8-\bendAfter #-2 r8
  \times 2/3 { \times 4/7 { d4 a' d, a' d, a' d, } b'^\downbow b^\downbow } |

  e,8 e8 bes'8. r16
  g8 gis^. e8-\bendAfter #-2 r8 |
  \times 4/7 { e4^_ g^\downbow gis^\downbow f8 } |
  \times 2/3 { e4 \times 2/3 { b'^\downbow b^\downbow b^\downbow } }

  fis8 fis8 bes8. r16
  \time 3/4
  g8 gis^. fis8-\bendAfter #-2 r8 e a |
  \time 2/4
  %\tempo 4=261
  \mark \markup \fontsize #-4 \general-align #Y #DOWN { \center-column { \fontsize #-1 \italic 3 \note #"4" #UP } = \note #"4" #UP }
  b4^\ff^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow \bar "||"
  b^\decresc^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow b^\downbow |
  b^\downbow a,,8^\mf a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis a, a |
  g' gis r4^\fermata \bar "|."  
}

rcadenzaWords = \lyricmode {
  I like your hair space
  I like you when kind
     slug -- ger
  yes yes
  buc -- ko buc -- ko buck
  Hey pret -- ty boy, Hey
  dol -- lar dol -- lar dol -- lar dol -- lar
  I like your
   hair
}

ryanWords = \lyricmode {
  \repeat unfold 3 { eve -- ry }
  \repeat unfold 6 { hel -- lo }
  \repeat unfold 3 { my }
  \repeat unfold 7 { boy }
  \repeat unfold 2 { girl }
  boy
  \repeat unfold 2 { eve -- ve -- ry }
  \repeat unfold 5 { gone }
  \repeat unfold 3 { my }
  \repeat unfold 4 { you }
  eve -- ve -- ve -- ry
  \repeat unfold 2 { jaw }
  please
  I
  please p please please
  \repeat unfold 3 { boy }
  \repeat unfold 4 { help }
  \repeat unfold 5 { jaw }
  my
  vry eve -- ry
  boy
  please p please please
  hand
  hand
  \repeat unfold 6 { eve -- ry }
  \repeat unfold 4 { bro }
  eve -- ry ev
  o
  yes
  \repeat unfold 4 { dude }
  bra
  bro
  yes bro
  and now I'm gon -- na say
  bro
  \repeat unfold 4 { dude }
  bro
  dude
  bro
  eve -- ry
  yeah 
  \repeat unfold 2 { bro }
  \repeat unfold 2 { yeah }
  bro
  \repeat unfold 3 { dude }
  bro br
  \repeat unfold 4 { dude }
  bro
  eve -- ry
  \repeat unfold 16 { punch }
  cool \repeat unfold 5 { we cool }
  \repeat unfold 6 { pal }
  \repeat unfold 3 { ha }
  yes
  we cool
  punch
  eve -- ry
  \repeat unfold 3 { help }
  \repeat unfold 2 { now }
  We Touch and Love
  eve -- ry
  gone gone gone
  joke joke
  cool we
  We We We
  (now look at me)

  oh my god, love is yes
  oh my my what yes yes
  
  oh my god, love is yes
  oh my my what yes yes
  
  oh my god god god god yes
  oh my man child now god god god

  oh my child yes is god
  child love is man yes yes

  oh my man, child is child
  love is love is love is love yes yes

  oh my yes, god is man
  man is child god man child child child

  love is child's god in man
  god is \repeat unfold 8 { man }
  \repeat unfold 15 { man }
  \repeat unfold 15 { wan -- na dol -- lar? }
  
}

clefdedo = \markup \justify { * \musicglyph #"scripts.upbow" = bouncy. \musicglyph #"scripts.downbow" = scooped. Chaque espace dans la portée correspond à
(environ) un mi ton.
%Hauteurs bien sûr approximatives...
}


imanidiot = {
  \once \override Stem.details = #leSScraZyStemZ
  \once \override Flag.font-size = #-3
  \once \override NoteColumn.stencil = #(lambda (grob)
  (let ((foo (box-grob-stencil grob)))
     (parenthesize-stencil (make-transparent-box-stencil
       (ly:stencil-extent foo X) (ly:stencil-extent foo Y))
       0.2 0.25 0 0.2)))
}


eudes = \fanMusic #0 
%uggghhh...
\transpose c f
\relative c, { \autoBeamOff\numericTimeSignature
\TupFrac
%  \clef bass
  %$(skip-of-length rcadenza)
\revert NoteHead.style
\revert Staff.BarLine.bar-extent
\clef "alto_8"
\stopStaff
\override Staff.StaffSymbol.staff-space = #0.5
\override Staff.StaffSymbol.line-count = #12
\startStaff
\override Stem.details = #craZyStemZ
\override NoteHead.font-size = #-3
\revert Stem.direction

\footnote "" #'(0 . 0) \clefdedo
  fis16^\mf fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r
    fis16 fis ais r  
    fis16 fis ais r  
    fis16 fis ais r  
    fis fis
  \tupFrac
  \times 11/12 {
  gis8.^\mp^\< gis16^\subPd e16 r
    gis8.^\downbow^\mp^\< gis16^\subPd e16 r
    gis8.^\downbow^\mp^\< gis16^\subPd e16 r
    gis8.^\downbow^\mp^\< gis16^\subPd e16 r
  } |
  \times 4/5 { g8^\mp^\upbow g^\upbow g^\upbow g^\upbow g^\upbow }
  \times 4/6 { fis8^\espressivo fis^\espressivo fis^\espressivo fis8^\espressivo fis^\espressivo fis^\espressivo }
  \times 2/3 { fis^\espressivo fis16^\espressivo } << { bis4^\downbow bis8^\downbow ~ |
  bis8 bis4^\downbow bis8^\downbow ~ |
  bis } { s8.^\p^\< s16^\f s8.^\p^\< s16^\f s8.^\p^\< s16^\f s8.^\p^\< s16^\f } >>
  \times 5/7 { gis8^_^\mf gis^_ gis^_ gis^_ gis^_ gis^_ gis^_ } gis8^\f^\downbow
  \times 4/7 { fis8^\mp^. fis^. fis^. fis^. fis^. fis^. fis^. } gis8^\f^\downbow ~ |
  gis16 fis^\mp^. fis^. fis^. fis^. fis^. r gis^\mf^\downbow ~ |
  gis8. gis16^\downbow ~ gis4^\downbow ~ |
  gis16 gis8.^\downbow << { \times 2/3 { gis4^\downbow gis^\downbow gis^\downbow } }
     { \override DynamicText.extra-spacing-width = ##f s8.*2/3^\p^\< s16*2/3^\f s8.*2/3^\p^\< s16*2/3^\f s8.*2/3^\p^\< s16*2/3^\f
        \revert DynamicText.extra-spacing-width } >>
  \times 11/12 { fis16^\mf fis ais r
    fis16 fis ais r
    fis16 fis ais r } \times 3/5 { ais8^\upbow^\f
  ais^\upbow ais^\upbow ais^\upbow ais8^\upbow } r16 \times 2/3 { eis16^\p^. eis^. eis^. } |
  fis16^\mp^\espressivo fis^\espressivo fis^\espressivo fis^\espressivo fis^\espressivo fis^\espressivo fis^\espressivo
  << { \times 2/3 { gis4^\downbow
    gis^\downbow gis^\downbow } }  { \override DynamicText.extra-spacing-width = ##f s8.*2/3^\p^\< s16*2/3^\f s8.*2/3^\p^\< s16*2/3^\f s8.*2/3^\p^\< s16*2/3^\f
        \revert DynamicText.extra-spacing-width } >>
  r16 |
  << { gis4.^\downbow } { s4^\p^\< s16 s16^\f } >> \times 3/4 { fis8^\downbow^\mp fis } b16^>^\f b^> b^> b8^_ b8^_ |
  b^_ gis8^\mf^\downbow gis^\downbow gis^\downbow |
  gis^\downbow gis^\downbow r16
  << { \times 5/8 { g2^\downbow g^\downbow g^\downbow g^\downbow } }
       { \override DynamicText.extra-spacing-width = ##f
s4..*5/8^\p^\< s16*5/8^\f s4..*5/8^\p^\< s16*5/8^\f s4..*5/8^\p^\< s16*5/8^\f s4..*5/8^\p^\< s16*5/8^\f
\revert DynamicText.extra-spacing-width
}  >>
  \times 8/9 { g16^> bes r g^> bes r g^> bes r }
  << { \times 9/16 { g2^\downbow g^\downbow } }
       { \override DynamicText.extra-spacing-width = ##f
s4..*9/16^\p^\< s16*9/16^\f s4..*9/16^\p^\< s16*9/16^\f
\revert DynamicText.extra-spacing-width
}  >>
  \times 8/9 { g16^> bes r g^> bes r g^> bes r }
  bis16^\upbow bis^\upbow bis^\upbow bis^\upbow r8\fermata |
  << { \times 3/4 { fis4.^\downbow fis4.^\downbow fis4^\downbow fis16 fis ais r } }
       { \override DynamicText.extra-spacing-width = ##f
s4*3/4^\p^\< s16 s^\f s4*3/4^\p^\< s16 s^\f s8*3/4^\p^\< s16 s^\f
\revert DynamicText.extra-spacing-width
}  >>

     b16^\upbow | b^\upbow b^\upbow b^\upbow b^\upbow r fis fis ais |
  fis8.^\espressivo \times 5/8  { b8^\upbow b^\upbow b^\upbow b^\upbow } |
  fis16 fis ais g8.^\espressivo \times 6/7 { ais16^\upbow ais^\upbow ais^\upbow ais^\upbow ais^\upbow r8 }
  \times 5/9 { g4^\espressivo b8^\upbow b^\upbow b^\upbow b^\upbow b^\upbow b^\upbow b^\upbow } g8^- ~ |
  g16 \times 7/12 { b8^\upbow b^\upbow b^\upbow b^\upbow b^\upbow b^\upbow } |
  r4.^\fermata r8 |
  r4 %% UGH - should be a....
    \ottava #1 \times 4/7 { dis'8^_^\p%{^\markup \italic "timide"%} dis^_ dis^_ dis^_ dis^_ dis^_ dis^_ } \ottava #0
  r4 |
  b,16^\mf b b' r b, b b' r |
  b, b b' r c,4:32^\f ~ |
  c4:32 r8
    %% UGH - should be a....
    \ottava #1 dis'8-.^\mf \ottava #0
  c,4.:32^\f r8 |
  c4.:32 \times 3/4 {
    c16 c8:32 c:32 c:32 r16
    c16 c8:32 c:32 c:32 r16
    c16 c8:32 c:32 c:32 r16 } |
\times 19/24
  {
    gis'8.:32^\downbow r16 gis4:32^\downbow ~ gis16 r gis4.:32^\downbow r8
    gis4:32^\downbow r8 gis4.:32^\downbow r8 gis4.:32^\downbow r8 gis4.:32^\downbow r8
  } 
  \times 3/4 {
    b,4-\bendAfter #4 b4-\bendAfter #4 b4-\bendAfter #4
    b4-\bendAfter #4 b4-\bendAfter #4
  }
  b16^.^\mf b^. b^. |
  cis2:32^\ff%{^\markup \italic \column {  "grand" "singe" } %}|
  aes4..^-%{^\markup \italic "baleine"%} \times 7/8 {
    aes4^\downbow aes^\downbow aes^\downbow aes^\downbow
     aes^\downbow aes^\downbow aes^\downbow aes^\downbow
  } g16^\mf ~ g4 -\bendAfter #3 |
  \times 3/5 { c'8^\f^\upbow c^\upbow
      c^\upbow c^\upbow c^\upbow c^\upbow c^\upbow c^\upbow
  c^\upbow r } fis,,4:32 ~ |
  fis4.:32 b8^\downbow^\mf |
  r4 b8^\downbow r |
  b8^\mp^\downbow r r4 |
  b8^\p^\downbow r r4 |
  r4 r4^\fermata |
  r4 r16 fis-. r8 |
  R2 |
  r8 gis16^\mf gis gis gis gis gis |
  gis gis gis gis gis gis gis gis |
  gis gis r8 r8 bes'16^\f bes |
  bes bes bes
  \times 25/32 {
    fis4^\upbow fis^\upbow fis^\upbow fis^\upbow
    fis^\upbow fis^\upbow fis^\upbow fis^\upbow } \times 15/16 {
     g8^_ g^_ g^_ g^_ g^_ g^_ g^_ g^_ } 
  \times 17/19 { %34 (16ths)
  bes,4^\upbow bes^\upbow bes^\upbow bes^\upbow bes8^\upbow
  g^_ g^_ g^_ g^_ g^_ g^_ b'16^.^\mf b^. b^. b^. b^. b^. b^. b^. } e,8.^\p^\<^\downbow ~ |
  e8.^\f r16 c8^\mf |
  \times 2/3 { r4 << { bes2^\downbow } { s4..^\mp^\< s16^\f } >> } |
  r4 g8^.^\mp r |
  a4^\downbow a^\<^\downbow ~ |
  a^\f g^\mp |
  bes^\downbow << { bes4^\downbow ~ |
  \times 2/3 { bes2 g4^\mp } } { s4^\< s4.*2/3 s8*2/3^\f } >> |
  r8 bes4^\downbow << { bes8^\downbow ~ |
  bes4 } { s8^\< s8. s16^\f } >> g8^\mp r |
  << { bes2^\downbow ~ |
  bes4. ges8^\downbow  ~ |
  ges2 } { s2^\< s4. s8^\f s4.. s16^\mp } >>  |
  \times 2/3 { r4 e2^\cresc-\bendAfter #3 } |
  fis4 r8 fis ~ |
  fis4-\bendAfter #3 r8 e ~ |
  e4-\bendAfter #3 r8 e |
%HEFWFEWFWE
\override Slur #'stencil = ##f
  e r e4 ( \glissando |
\imanidiot
gis8 ) r e4 ( \glissando |
  \times 2/3 { \imanidiot gis8 ) e4\glissando ( \imanidiot gis8 ) e4-\bendAfter #3 } |
  e4.-\bendAfter #3 e8 ~ |
  e4-\bendAfter #3 e4\bendAfter #3 |
  \times 2/3 { e4 e2\glissando ( } |
  \times 2/3 { \imanidiot a4 ) e2\glissando ( } |
  \times 2/3 { \imanidiot a4 ) e2-\bendAfter #3 } |
  f4-\bendAfter #3 f4-\bendAfter #3 |
  fis2-\bendAfter #3 |
  f2-\bendAfter #2 fis4\glissando ( |
  \imanidiot ais4 ) fis4\glissando ( |
  \imanidiot ais8 ) fis4.-\bendAfter #3 |
  f4.-\bendAfter #3 f8 ~ |
  f4-\bendAfter #3 b8^\ff b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b,^\mf b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis b, b |
  f' fis r4 |
}

eudesWords = \lyricmode {
  \repeat unfold 12 { en ef -- fet }
  en e
  \repeat unfold 4 { moi, je suis }
  \repeat unfold 5 { sans }
  \repeat unfold 8 { mais }
  \repeat unfold 4 { grand }
  \repeat unfold 7 { j'suis }
  gars
  \repeat unfold 7 { mec }
  gars
  \repeat unfold 5 { vous }
  \repeat unfold 3 { genre }
  \repeat unfold 3 { moi }
  \repeat unfold 3 { en ef -- fet }
  \repeat unfold 5 { sans }
  \repeat unfold 10 { mais }
  \repeat unfold 4 { j'suis }
  \repeat unfold 2 { gars }
  \repeat unfold 3 { mec }
  \repeat unfold 3 { meuf }
  \repeat unfold 5 { heure }
  \repeat unfold 4 { oui }
  \repeat unfold 3 { en e }
  \repeat unfold 2 { oui }
  \repeat unfold 3 { en e }
  \repeat unfold 4 { sans }
  \repeat unfold 3 { grand }
  en ef -- fet
  \repeat unfold 5 { j'suis }
  en ef -- fet
  grand
  \repeat unfold 4 { sans }
  en ef -- fet
  grand
  \repeat unfold 5  { sans } 
  grand
  \repeat unfold 7  { sans } 
  mais
  \repeat unfold 6  { sans }
  \repeat unfold 7  { sans } 
  \repeat unfold 3  { en ef -- fet } 
  mec
  en
  \repeat unfold 2 { mec }
  \repeat unfold 3 { ef -- fec -- tive -- ment }
  \repeat unfold 6 { mec }
  meuf
  \repeat unfold 5 { gars }
  \repeat unfold 3 { mec }
  pote
  meuf
  \repeat unfold 7 { mec }
  meuf
  genre
  \repeat unfold 9 { sans }
  genre
  \repeat unfold 4 { sans }
  mec
  \repeat unfold 16 { ha }
  \repeat unfold 5 { ha }
  \repeat unfold 8 { mais }
  \repeat unfold 8 { sans }
  \repeat unfold 5 { mais }
  \repeat unfold 6 { sans }
  \repeat unfold 8 { du }
  mais
  gars
  vous moi vous vous moi
  vous vous moi
  vous vous meuf
  vous non
  sans moi
  sans sans moi moi
  \repeat unfold 20 { moi }
  \repeat unfold 23 { wan -- na dol -- lar? }
}

\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Les amants" "   " "   "  } }

\markup \huge \fill-line { \center-column { "[Marie]" "Personne n'aime le harcèlement sexuel." "[...Mike...en coulisses...« si... »...]" "C'est pour ça que Leaderex vous propose ses" "« 10 règles de conduite intime au travail »."  "Bonne chance. 1, 2, 2, 2," "   " } }

\score {
  <<
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \rcadenza
    \new Lyrics \lyricsto "ryan" \rcadenzaWords
    %\new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudes
    %\new Lyrics \lyricsto "eudes" \eudesWords
  >>
  \layout {
    #(layout-set-staff-size 17)
    \context {
      \Voice
      \override TextScript #'layer = #6
      \override Glissando #'breakable = ##t
      \override TupletNumber #'breakable = ##t
      \override TupletNumber #'avoid-slur = #'ignore
      \override TupletBracket #'breakable = ##t
      \override TupletBracket #'direction = #UP
      \remove "Forbid_line_break_engraver"
    }
  %{
    \context {
      \Score
      \remove "Metronome_mark_engraver"
    }
    \context {
      \Staff
      \consists "Metronome_mark_engraver"
    }
%}
  }
  %\midi {}
}

#(define (trem-kludge grob)
  (- (ly:stem-tremolo::calc-y-offset grob)
  (* 0.75 (ly:grob-property grob 'direction))))

\score {
  <<
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    \new Lyrics \lyricsto "ryan" \ryanWords
    \new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudes
    \new Lyrics \lyricsto "eudes" \eudesWords
  >>
  \layout {
    \context {
      \Voice
      \override DynamicText #'font-size = #-1
      \override Hairpin #'minimum-length = #6
      \override Hairpin #'springs-and-rods = #ly:spanner::set-spacing-rods
      \override TextScript #'layer = #6
      \override Glissando #'breakable = ##t
      \override Glissando #'stencil = #giant-glissando-stencil-hack
      \override TupletNumber #'breakable = ##t
      \override TupletNumber #'avoid-slur = #'ignore
      \override TupletBracket #'breakable = ##t
      \override TupletBracket #'direction = #UP
      \override BendAfter #'after-line-breaking = #bendcallback
      \remove "Forbid_line_break_engraver"
      \override Script.outside-staff-priority = #1
      \override TupletBracket.outside-staff-priority = #5
      tupletFullLength = ##t
      %tupletFullLengthNote = ##t
      %%%%AHHH
      \override StemTremolo.Y-offset =
#(ly:make-unpure-pure-container trem-kludge ly:stem-tremolo::pure-calc-y-offset)
    }
  %{
    \context {
      \Score
      \remove "Metronome_mark_engraver"
    }
    \context {
      \Staff
      \consists "Metronome_mark_engraver"
    }
    \context {
      \Lyrics
      \override LyricText.font-size = #-3
    }
%}
  }
  %\midi {}
}