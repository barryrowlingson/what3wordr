what3wordr
===========

An interface to the [What3Words API](www.what3words.com).

Currently very alpha. Only deals with 3words, onewords, and positions, the API
can do some other things and return other stuff. And only does one at a time. Will
vectorise all the things later. Maybe.

```
> require(what3wordr)
> options(what3wordsAPIKEY="1Q2W3E4R") # insert your key here
> # xy to 3words
> position_to_w3w(c(51.51257,-0.134879))
[1] "stud.fingernails.chill"
> # oneword to locations
> w3w_to_position("*libertytech")
         x         y
1 51.51257 -0.144879
> # 3words to location
> w3w_to_position("stud.fingernails.chill")
         x         y
1 51.51257 -0.134864
```

Installation: use `devtools`. That's all your getting at the moment, this is wizard-only
territory at the moment.

Here's the [patent](http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/GB2513196).

