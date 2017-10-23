# elm-monty-hall

[Monty Hall](https://en.wikipedia.org/wiki/Monty_Hall_problem) in [Elm](http://elm-lang.org/). 

To run:
 
1. [Install Elm.](https://guide.elm-lang.org/install.html)
   Options include Homebrew (`brew install elm`) and NPM (`npm install -g elm`)
2. Run Elm Reactor in repo root dir: 
   `elm-reactor`
3. GOTO [http://localhost:8000/src/MontyHall.elm](http://localhost:8000/src/MontyHall.elm)

## What it does

Instead of randomizing arbitrary scenarios, this program generates a table of all possible 
scenarios and the outcome of the different strategies (keep/swap door). It does not only provide a
graphical display of outcomes, but also a visualisation of the entire problem space (which is 
surprisingly small!).  

The table does not include which door is revealed, as it does not change the outcome:

- If you have chosen the winning door from the start, the choice of door to reveal is completely 
  arbitrary; both the revealed door and the remaining door will always be losing.
- If you have chosen a losing door initially, there is only one door that _can_ be revealed, and so
  the remaining door will always be winning.  

The program is as purely functional as a program can be, which means that every execution of it 
will always yield the same result. We could just have thrown the program away and saved [the
generated HTML file](./table.html) instead, but sentimentality (and the intended discussions on
code quality) keeps us from doing so.
