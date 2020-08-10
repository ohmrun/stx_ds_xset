package stx.ds.xset.pack;

enum Lense<Head,Tail,Key>{
  Unit;
  Pure(tail:Tail,head:Head);
  Then<U>(l:Lense<Head,Tail,Key>,r:Lense<Tail,U,Key>);
  
  Rename(source:Key,target:Key);
  Hoist;
}
