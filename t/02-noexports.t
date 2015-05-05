use strict;
use warnings;
use Test::More tests => 4;

use XML::WB;

ok(defined &XML::WB::xml_to_wbxml, "found x2w in package");
ok(defined &XML::WB::wbxml_to_xml, "found w2x in package");

ok( (not defined &xml_to_wbxml), "x2w not exported" );
ok( (not defined &wbxml_to_xml), "w2x not exported" );
