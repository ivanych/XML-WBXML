use strict;
use warnings;
use Test::More tests => 10;
BEGIN { use_ok('XML::WBXML') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

ok(defined &XML::WBXML::xml_to_wbxml, "found x2w");
my $out = XML::WBXML::xml_to_wbxml("<SyncML></SyncML>");
ok(defined $out);
ok(length $out);
my $wbxml_string = "\x02\x9f\x53\x6a\x00\x2d";
is($out, $wbxml_string);

$out = XML::WBXML::xml_to_wbxml("<SyncML></SyyyyyyncML>");
ok(not defined $out);

ok(defined &XML::WBXML::wbxml_to_xml, "found w2x");
$out = XML::WBXML::wbxml_to_xml($wbxml_string);
ok(defined $out);
ok(length $out);
is($out . "\n", <<END_XML);
<?xml version="1.0"?><!DOCTYPE SyncML PUBLIC "-//SYNCML//DTD SyncML 1.1//EN" "http://www.syncml.org/docs/syncml_represent_v11_20020213.dtd"><SyncML xmlns="syncml:SYNCML1.1"></SyncML>
END_XML

