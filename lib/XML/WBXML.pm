package XML::WBXML;

use 5.00600;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw( xml_to_wbxml wbxml_to_xml );

our @EXPORT = ();

our $VERSION = '0.03';

require XSLoader;
XSLoader::load('XML::WBXML', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

XML::WBXML - Convert between XML and WBXML using libwbxml2

=head1 SYNOPSIS

  use XML::WBXML;

  $wbxml = XML::WBXML::xml_to_wbxml($xml);
  $xml = XML::WBXML::wbxml_to_xml($wbxml);

=head1 DESCRIPTION

This module is a wrapper around Aymerick Jehanne's libwbxml (or perhaps libwbxml2, I am
not sure what the distinction is) library for handling Wireless Binary XML.  You must
install libwbxml2 prior to installing this module.  The library can be found at
http://libwbxml.aymerick.com/  (libwbxml2 itself requires the expat library to be installed.)

The module defines two functions: C<xml_to_wbxml> and C<wbxml_to_xml>.

=head1 EXPORTS

None by default.

=head1 EXPORTABLE FUNCTIONS

=head2 xml_to_wbxml $xml

Given a string containing an XML document, converts it to WBXML (version 1.2).
Returns undef on errors.

(As far as I can tell, the only distinction between version 1.2 and version 1.3
of WBXML is the first byte -- C<0x03> in 1.3 and C<0x02> in 1.2.)

=head2 wbxml_to_xml $wbxml

Given a string containing a WBXML document, converts it to XML (without extra whitespace).
Returns undef on errors.

=head1 DEPENDENCIES

L<libwbxml2>, a C compiler, and (transitively) L<expat>.

=head1 SEE ALSO

Francois Perrad wrote two pure-Perl modules for dealing with WBXML: L<WAP::SAXDriver::wbxml>
for parsing WBXML using a SAX approach and L<WAP::wbxml> for writing it.  While they have their
advantages, I did not find that their output was as nice as libwbxml2's, and they don't provide
a simple conversion interface.

I also wrote L<XML::WBXML::SyncML> which wrapped Perrad's modules to provide a simple conversion
interface (which was limited only to SyncML documents); however, I would highly recommend L<XML::WBXML>
over it, since it is both more correct and more general.  (In fact, I withdrew L<XML::WBXML::SyncML>
from the CPAN within 24 hours of uploading it (since I may want to use the name for a subclass of this
module someday) -- if you really think you'll find it useful you'll need to download it from the BACKPAN.)

=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-xml-wbxml@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

David Glasser C<< <glasser@bestpractical.com> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2005, Best Practical Solutions, LLC.  All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut
