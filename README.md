# Aaron is Wrong

[![Build Status](https://travis-ci.org/royvandewater/aaron-is-wrong.svg?branch=master)](https://travis-ci.org/royvandewater/aaron-is-wrong)
[![Code Climate](https://codeclimate.com/github/royvandewater/aaron-is-wrong/badges/gpa.svg)](https://codeclimate.com/github/royvandewater/aaron-is-wrong)

If you want to see how wrong Aaron is, just run

``` bash
npm install
npm start
```

This will run 100 games where Aaron plays
until he wins or loses at minimum $1024 dollars.


To run with different options, use

``` bash
npm start -- <numGames> <lower-limit> <upper-limit>
```

The lower limit is the amount of money Aaron is allowed to lose before he quits.
The upper limit is the amount of money Aaron trying to win before he quits
