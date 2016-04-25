#!/bin/bash

aclocal --install -I m4 &&
  autoconf &&
  autoheader &&
  touch NEWS README AUTHORS ChangeLog &&
  automake --add-missing --copy 
