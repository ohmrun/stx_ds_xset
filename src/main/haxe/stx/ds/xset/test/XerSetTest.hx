package stx.ds.xset.test;

import stx.ds.xset.Package;

using stx.core.Lift;
using stx.assert.Lift;

@:access(stx.ds.xset)class XerSetTest extends utest.Test{
	public function test(){
		var a = XSet.makeKV(key(),val());
				a = a.setVal("hello",1);
				//trace(a);
				var ks0 = a.keyspace();
				Assert.same(ks0.with.state,CKey);
				a.hasKey("hello").isTrue();
				a.hasKey("nope").isFalse();
				a.hasLeaf(1).isTrue();
				a.hasLeaf(20).isFalse();
		var b = XSet.makeKV(key(),val());
				b = b.setVal("hello",99);
				//trace(b);
		var c = a.keyspace().union(b);
				c.hasLeaf(99).isTrue();
		var d = a.setspace().union(b);
		var e = c.setspace().difference(d);
		//trace(e);
		var f = d.difference(c);
		//trace(f);
	}
	public function testDeep(){
		var a = XSetTree.unit();
		var stx = __.stx();
		var b = __.stx().then(obj0());
		var c = b.toSpine();
		var d = XSetTree.fromSpine(c);
		var e = XSetTree.fromSpine(__.of(obj1()).toSpine());
		trace(d.toObject());
		trace(e.toObject());
		var f = d.keyspace().union(e);
		trace(f.toObject());
	}
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
		return Comparables.string();
	}
	static public function val(){
		return Comparables.int();
	}
}