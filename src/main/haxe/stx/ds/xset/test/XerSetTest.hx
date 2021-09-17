package stx.ds.xset.test;

@:access(stx.ds.xset)class XerSetTest extends TestCase{
	public function test(){
		var a = XSet.makeKV(key(),val());
				a = a.setVal("hello",1);
				//trace(a);
				var ks0 = a.keyspace();

				same(ks0.with.state,CKey);
				is_true(a.hasKey("hello"));
				is_false(a.hasKey("nope"));
				is_true(a.has_leaf(1));
				is_false(a.has_leaf(20));
		__.log().debug(_ -> _.pure(a));
		var b = XSet.makeKV(key(),val());
				b = b.setVal("hello",99);
		__.log().debug(_ -> _.pure(b));
		// var c = a.keyspace().union(b);
		// 		c.valspace();
		//c.has_leaf(99);
		//is_true();
		//var d = a.setspace().union(b);
		// var e = c.setspace().difference(d);
		// //trace(e);
		// var f = d.difference(c);
		//trace(f);
	}
	// public function testDeep(){
	// 	var a = XSetTree.unit();
	// 	var b = obj0();
	// 	var c = b.toSpine();
	// 	var d = XSetTree.fromSpine(c);
	// 	var e = XSetTree.fromSpine(obj1().toSpine());
	// 	trace(d.toObject());
	// 	trace(e.toObject());
	// 	var f = d.keyspace().union(e);
	// 	trace(f.toObject());
	// }
	function obj0():Dynamic{
		return { 
			a : {
				b : {
					c : {
						d : 1 
					} 
				},
				e : [1]
			}
		};
	}
	function obj1():Dynamic{
		return { 
			a : {
				b : {
					c : {
						d : 2
					} 
				} 
			}
		};
	}
	static public function key(){
		return Comparable.String();
	}
	static public function val(){
		return Comparable.Int();
	}
}