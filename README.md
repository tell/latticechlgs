# latticechlgs
Mirrors and scripts for challenges related to the lattice cryptosystems

## Mirrors
A directory `generators` contains source codes of geenrators of the [SVP Challenge](https://www.latticechallenge.org/svp-challenge/) and the [Ideal Lattice Challenge](https://www.latticechallenge.org/ideallattice-challenge/).

## Notices

Generators in the directory `generators` use the pseudo-random number generator implemented by [NTL](http://www.shoup.net/ntl/).
Note that instances provided by the challenges above are generated by NTL versions between 5.5.2 and 9.3.0.
Namely, the generators built with newer versions of NTL will output different instances.

## Copyright Notices

The copyrights belong to the authors of [SVP Challenge](https://www.latticechallenge.org/svp-challenge/) and [Ideal Lattice Challenge](https://www.latticechallenge.org/ideallattice-challenge/).

## CI
- Travis CI [![Build Status](https://travis-ci.org/tell/latticechlgs.svg?branch=master)](https://travis-ci.org/tell/latticechlgs)
