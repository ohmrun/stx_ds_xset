package stx.ds.xset.pack.suit.xsetwith;

typedef XSetKeyComparable<K,V>  = stx.assert.comparable.term.XSetKey<K,V>;
typedef XSetKeyEq<K,V>          = stx.assert.eq.term.XSetKey<K,V>;
typedef XSetKeyOrd<K,V>         = stx.assert.ord.term.XSetKey<K,V>;

typedef XSetValComparable<K,V>  = stx.assert.comparable.term.XSetVal<K,V>;
typedef XSetValEq<K,V>          = stx.assert.eq.term.XSetVal<K,V>;
typedef XSetValOrd<K,V>         = stx.assert.ord.term.XSetVal<K,V>;

typedef XSetComparable<K,V>     = stx.assert.comparable.term.XSet<K,V>;
typedef XSetEq<K,V>             = stx.assert.eq.term.XSet<K,V>;
typedef XSetOrd<K,V>            = stx.assert.ord.term.XSetKey<K,V>;

typedef XSetWithComparable<K,V>  = stx.assert.comparable.term.XSetWith<K,V>;
typedef XSetWithEq<K,V>          = stx.assert.eq.term.XSetWith<K,V>;
typedef XSetWithOrd<K,V>         = stx.assert.ord.term.XSetWith<K,V>;