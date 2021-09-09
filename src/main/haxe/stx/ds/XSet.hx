package stx.ds;

typedef XSetKeyComparable<K,V>    = stx.assert.comparable.term.XSetKey<K,V>;
typedef XSetKeyEq<K,V>            = stx.assert.eq.term.XSetKey<K,V>;
typedef XSetKeyOrd<K,V>           = stx.assert.ord.term.XSetKey<K,V>;

typedef XSetValComparable<K,V>    = stx.assert.comparable.term.XSetVal<K,V>;
typedef XSetValEq<K,V>            = stx.assert.eq.term.XSetVal<K,V>;
typedef XSetValOrd<K,V>           = stx.assert.ord.term.XSetVal<K,V>;

typedef XSetComparable<K,V>       = stx.assert.comparable.term.XSet<K,V>;
typedef XSetEq<K,V>               = stx.assert.eq.term.XSet<K,V>;
typedef XSetOrd<K,V>              = stx.assert.ord.term.XSetKey<K,V>;

typedef XSetWithComparable<K,V>   = stx.assert.comparable.term.XSetWith<K,V>;
typedef XSetWithEq<K,V>           = stx.assert.eq.term.XSetWith<K,V>;
typedef XSetWithOrd<K,V>          = stx.assert.ord.term.XSetWith<K,V>;

typedef XSetPlaceComparable       = stx.assert.comparable.term.XSetPlace;
typedef XSetPlaceEq               = stx.assert.eq.term.XSetPlace;
typedef XSetPlaceOrd              = stx.assert.ord.term.XSetPlace;

typedef With<K,V>                 = stx.ds.xset.With<K,V>;
typedef XSet<K,V>                 = stx.ds.xset.XSet<K,V>;
typedef XSetPlaceSum              = stx.ds.xset.XSetPlace.XSetPlaceSum;
typedef XSetPlace                 = stx.ds.xset.XSetPlace;

typedef XSetTree                  = stx.ds.xset.XSetTree;
typedef XSetTreeType              = stx.ds.xset.XSetTreeType;

typedef XSetVal<K,V>              = stx.ds.xset.XSetVal<K,V>;
typedef XSetValSum<K,V>           = stx.ds.xset.XSetVal.XSetValSum<K,V>;

typedef XSetWith<K,V>             = stx.ds.xset.XSetWith<K,V>;
typedef XSetWithState             = stx.ds.xset.XSetWithState;