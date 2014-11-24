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

Personal Thoughts
=================

This is a lovely idea, sadly proprietary which makes widespread adoption in some circles
difficult. An open scheme for this sort of encoding, freely available, would be amazing
but probably impossible due to the patent process.

The company are also pushing their "1word" thing as an income generator. This lets you buy
a single word for your location. Again, they would be a sole provider of this service,
with total control. But something like this service already exists...

IP names can be bought and sold by many providers, so there is a
market, and if one registrar goes belly up you move your IP name
registration elsewhere. And IP names can not only have IP numbers
assigned, they can have locations, via DNS LOC records. So I could easily take my
`barry.rowlingson.com` IP name and add location metadata to the DNS
entry for it. Instead of buying a 1word from what3words, my location
could be taken from that. I'm then free to update my location.

Note this doesn't affect the what3words system, which is essentially a 
coordinate reference system over the whole globe.