Air::Lorcon2
============

The README is used to introduce the module and provide instructions on
how to install the module, any machine dependencies it may have (for
example C compilers and installed libraries) and any other information
that should be provided before the module is installed.

A README file is required for CPAN modules since CPAN extracts the
README file from a module distribution so that people browsing the
archive can use it get an idea of the modules uses. It is usually a
good idea to provide version information here so that people can
decide whether fixes for the module are worth downloading.

INSTALLATION

To install this module type the following:

   sudo make

Just execute the makefile script outside the C and perl directory, for now there are no tests, they will be added in future.

DEPENDENCIES

This module requires these other modules and libraries:

  - lorcon2
Since the version 3.55, Air::Lorcon2 has an auto-installer, which permits to install a modified version of Lorcon2 and set the Air::Lorcon2.
Unfortunately the official site is closed, some good links for documentation and for download Air::Lorcon2 are:

 - Libpcap (suggested)
 I suggest to use libpcap with the Net::Lorcon2 library for speed up some lorcon's originary functions which uses pcap as beack-end.   
  - https://github.com/kismetwireless/lorcon 
  - http://blog.opensecurityresearch.com/2012/09/getting-started-with-lorcon.html


COPYRIGHT AND LICENCE

Copyright (C) 2020 by Edoardo Mantovani, aka BASEBAND


This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


