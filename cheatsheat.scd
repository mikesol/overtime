//! fans out x times
5!4 //[5,5,5,5]

// softclip takes values over 0.5 down under 1
[0.25, 0.5, 1, 2, 4, 8, 32, 64].softclip // [ 0.25, 0.5, 0.75, 0.875, 0.9375, 0.96875, 0.9921875, 0.99609375 ]


// @ is piont
2@2 // Point(2,2)

Array.series(5, 10, 2);

(1..4)!2

4.4.clip(0,5)
5.5.clip(0,5)