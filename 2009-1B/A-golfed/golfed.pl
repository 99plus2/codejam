{say"Case #$_:";$_="";eval'$_.=<>;'x<>;s:[a-z]+:*(/ $&\\s/?:g;s/\)\s*\(/):/g;eval"\$_=<>;say$_;"x<>}for 1..<>
