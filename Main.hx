using stx.Nano;
using stx.ds.XSet;
using stx.Test;

import stx.ds.xset.test.*;

class Main {
	static function main(){
		__.test().run(
			[new XerSetTest()],
			[]
		);		
	}
}