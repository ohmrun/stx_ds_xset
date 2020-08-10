package stx.ds.xset;

#if test
  import stx.ds.xset.test.*;
#end

typedef XSet<K,V>     = stx.ds.xset.pack.XSet<K,V>;
typedef XSetWith<K,V> = stx.ds.xset.pack.XSetWith<K,V>;
typedef XSetTree      = stx.ds.xset.pack.XSetTree;
typedef XSetPlace     = stx.ds.xset.pack.XSetPlace;
typedef XSetVal<K,V>  = stx.ds.xset.pack.XSetVal<K,V>;

class Package{
  #if test
    static public function tests():Array<utest.Test>{
      return [
        new XerSetTest()
      ];
    }
  #end
}