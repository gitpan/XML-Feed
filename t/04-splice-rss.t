# $Id: 04-splice.t 1958 2006-08-14 05:31:27Z btrott $

use strict;
use Test::More tests => 3;
use XML::Feed;

my $feed = XML::Feed->new('RSS');

my $other = XML::Feed->parse('t/samples/atom.xml')->convert('Atom');
$feed->splice($other);
is(scalar $feed->entries, 2, '2 entries in the feed after splicing');

$feed->splice($other);
is(scalar $feed->entries, 2, 'Still 2 entries after splicing again');

$other = XML::Feed->parse('t/samples/rss10.xml')->convert('Atom');
$feed->splice($other);
is(scalar $feed->entries, 4, 'Now 4 entries after splicing in RSS 1.0 feed');
