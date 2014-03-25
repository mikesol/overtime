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
\times 2/3 { c4 a8 } c4 |
\time 1/4
c4
\time 2/4
c8 a16 c r a a a |
\time 3/8
d16. d b16 r8 |
\time 1/4
c4 |
\time 2/4
\times 2/3 { c4 a8 } a4 |
\time 5/8
c4 c8 c c
}

ryanWords = \lyricmode {
Oui al -- lo.
Oui.
Oui al -- lo, je vous fais pa -- tien -- ter
Oui
Oui al -- lo
Oui. At -- ten -- dez.
Hey, some bad news, I'm
Oui.
Oui mer -- ci de pa -- tien -- ter.
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


%\markup \huge \fill-line { \center-column { "   " "   " "[sur l'écran]" "Les amants" "   " "   "  } }

%\markup \huge \fill-line { \center-column { "[Marie]" "Personne n'aime le harcèlement sexuel." "[...Mike...en coulisses...« si... »...]" "C'est pour ça que Leaderex vous propose ses" "« 10 règles de conduite intime au travail »."  "Bonne chance. 1, 2, 2, 2," "   " } }

#(define (trem-kludge grob)
  (- (ly:stem-tremolo::calc-y-offset grob)
  (* 0.75 (ly:grob-property grob 'direction))))

\score {
  <<
    \new Staff \with { instrumentName = "Ryan" } \new Voice = "ryan" \ryan
    \new Lyrics \lyricsto "ryan" \ryanWords
    %\new Staff = "eudesstaff" \with { instrumentName = "Eudes" } \new Voice = "eudes" \eudes
    %\displayMusic \new Lyrics \lyricsto "eudes" \eudesWords
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