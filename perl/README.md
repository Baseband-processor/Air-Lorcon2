 
Air::Legacy (FAQ)
============================================

![image of wireless_security](./Network_encryption.jpg)

Why "Legacy"?
========================================

The first name was Air::Lorcon2 because the library was centered only on Lorcon2 API, now things have changed, drastically.
Perl hasn't an official library for wireless security nor it has a working framework for it, the things must change, now.

"Legacy" is the union of Lorcon2, reaver, aircrack-ng (and its modules) and other cryptanalytic tools for CCMP/TKIP protocol.

Why (not) Python?
========================================

Honestly, I never liked Python, but I must admit that its community is extremely well organized (even better than the Perl community under almost all points of view).

Python nowadays is a top language for the CyberSecurity (and it is used as "top language" also in more fields: some "distant" examples are artificial intelligence and finance), but nothing is written in Perl, remembering that Perl has the same potentialities of every normal programming language, why don't write some usefull security tool in Perl?
is fast and easy to write, exists few Perl-libraries on security, but XS is still a fast and affidable way for starting the development of a bigger project, this is one example:

Lorcon2, as you may know, is a really interesting library, which permits to test the security of a network, why don't start from it? 

how can I contribute?
================================
If you want to become a contributor start contacting me at <Baseband@cpan.org>

what I can't do with this module?
==================================================
In general, the Lorcon2 library offers an huge set of functionalities for crafting frames, injecting them into the network, sniffing from multiple interfaces in real-time and processing the received frames, obviously you shouldn't completely rely only in this library, for a detailed list of all Perl's sugested libraries, please see the homonymous section.

how am I supposed to use this library
==================================================
"The author declines every responsability from any illegal use of this software"

This phrase is almost ubiquitous in ourdays but can help to understand the possible illegal issues that you can encounter while using this library __improperly__ 

can I effectively break the latest wireless security protocols using this library?
==============================================================================================
No, the entire _Air::Toolkit_ is designed for a more in-dept type of wireless-security assurance, it is suggested mainly for security practicioner and **not** for the casual users, if you think that is possible to crack WPA/WPA2 in few seconds with an old smartphone please, change interests.

WHY there isn't only Lorcon's function in this library?
=================================================================================================
The project grows exponentially in those months, perl has so much unused potential and this can be the right way for express it, I am also including Reaver utilities, I plan to include also some air-crack utilities and, maybe in future, write an entire OOP framework for wireless security with perl. 

CURRENT VERSION
====================

The latest version of Air::Legacy is: 00.00


**Edoardo Mantovani, 2020**

<img src="https://media3.giphy.com/media/ADiOs8AqeverrAuT4Q/giphy.gif" alt="drawing" width="2500%"/>

