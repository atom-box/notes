# notes
Only the first assert runs.  
Put two and the second one is ignored.

Some of these presumed easy phpunit methods are not available(assertNull).  (I traced it back just on these 
	use Dx\Event\Logger\CommentInterface;
	use Dx\PHPUnit\CatalogTestCase;
	use Dx\PHPUnit\TestLogger;
Our tests have been written with few or no 'assert' style functions.
The functions seem to end with things like this->fixture->import

Figure out what is 'expects'.  Is that php? Unittesting? Our function?
Continue hoisting tests into that same position. Try from cheatsheet too.

# HISTORY
MY TESTING
vendor/bin/phpunit  -- src/DealExpress/AdminBundle/Tests/MinimumAdvertisedPrice/ImporterTest.php

RAY 25 MINUTE m.a.p. IMPORT
time bin/console dx:e:s3:test data_import --no-debug {s3://dx-data/import/,}officedepot/map/ZONE74_PRICE20201117.CSV.zip

ALEX STORY
bin/console d:e:s3:test edi_inbound s3://dx-it-dev/staging-as2/edi/inbox/ECGRID-OFFICESUPPLY/2020-10-12/500-20201012153118-2eb3eace.x12-783542990.500.0.2020101215311767@as2.ecgrid.com dx-${STACKNAME}.officesupply-dev.com-dev/development/edi/inbox/ --no-debug 	

# My naive test
 src/DealExpress/AdminBundle/Tests/MinimumAdvertisedPrice/ImporterTest.php
100 public function testTryTodDoAnything() : void
101 {
102     // assertNull($this->logCount['saved']);
103     // $this->logs->assertLogsContains(' ');
104     // $this->logs->assertLogsContains('Cheese Castle');
105     // $this->maPriceRepository->expects($this->never())->method('persist');
106
107 //    $this->assertTrue('ham' == 'ham');
108     echo "(((test-test-test)))";
109     // $this->assertTrue(strlen('OfficeSupplies') >= 10);
110     $this->assertNotSame('horse', 'algebra');
111     $this->assertNotSame('inchoate', 'inchoate');
112
113 }
114

# Alex described a mock
A mock is a hollow image of a saloon , to satisfy Truman
Everything is public
It is a recreation of the class.

A mock is a series of elephant pieces to fool a room of blind men.

