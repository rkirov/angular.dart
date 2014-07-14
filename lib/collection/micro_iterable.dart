library angular.collection;

import 'dart:collection';

const int _LIST_ELEMENTS = 20;

class MicroIterable<E> extends Object with IterableMixin implements Iterable  {
  var _element0;
  var _element1;
  var _element2;
  var _element3;
  var _element4;
  var _element5;
  var _element6;
  var _element7;
  var _count = 0;

  MicroIterable(e0, e1, e2, e3, e4, e5, e6, e7, count) {
    _element0  = e0 ;
    _element1  = e1 ;
    _element2  = e2 ;
    _element3  = e3 ;
    _element4  = e4 ;
    _element5  = e5 ;
    _element6  = e6 ;
    _element7  = e7 ;
    _count = count;
  }

  Iterator<E> get iterator => new _ListIterator(this);

  bool contains(Object element) {
    if (_element0 == element) return true;
    else if (_element1 == element) return true;
    else if (_element2 == element) return true;
    else if (_element3 == element) return true;
    else if (_element4 == element) return true;
    else if (_element5 == element) return true;
    else if (_element6 == element) return true;
    else if (_element7 == element) return true;
    else return false;
  }

  String join([String separator = ""]) {
    if (_element0 == null) return null;
    var joined = '${_element0}';
    if (_element1 == null) return joined;
    joined = '$joined$separator$_element1';
    if (_element2 == null) return joined;
    joined = '$joined$separator$_element2';
    if (_element3 == null) return joined;
    joined = '$joined$separator$_element3';
    if (_element4 == null) return joined;
    joined = '$joined$separator$_element4';
    if (_element5 == null) return joined;
    joined = '$joined$separator$_element5';
    if (_element6 == null) return joined;
    joined = '$joined$separator$_element6';
    if (_element7 == null) return joined;
    joined = '$joined$separator$_element7';
    return joined;
  }

  List<E> toList({bool growable}) {
    if (growable != null) return new List.from(this, growable: growable);
    return new List.from(this);
  }

  Set<E> toSet() {
    Set set = new HashSet();
    if (_count == 0) return set;
    if (_element0  != null) set.add(_element0 );
    if (_count == 1) return set;
    if (_element1  != null) set.add(_element1 );
    if (_count == 2) return set;
    if (_element2  != null) set.add(_element2 );
    if (_count == 3) return set;
    if (_element3  != null) set.add(_element3 );
    if (_count == 4) return set;
    if (_element4  != null) set.add(_element4 );
    if (_count == 5) return set;
    if (_element5  != null) set.add(_element5 );
    if (_count == 6) return set;
    if (_element6  != null) set.add(_element6 );
    if (_count == 7) return set;
    if (_element7  != null) set.add(_element7 );
    if (_count == 8) return set;
    return set;
  }

  int get length => _count;

  bool get isEmpty => _count == 0;

  bool get isNotEmpty => _count != 0;

  E get first {
    if (_element0  != null) return _element0 ;
    if (_element1  != null) return _element1 ;
    if (_element2  != null) return _element2 ;
    if (_element3  != null) return _element3 ;
    if (_element4  != null) return _element4 ;
    if (_element5  != null) return _element5 ;
    if (_element6  != null) return _element6 ;
    if (_element7  != null) return _element7 ;
  }

  E get last {
    if (_element7  != null) return _element7 ;
    if (_element6  != null) return _element6 ;
    if (_element5  != null) return _element5 ;
    if (_element4  != null) return _element4 ;
    if (_element3  != null) return _element3 ;
    if (_element2  != null) return _element2 ;
    if (_element1  != null) return _element1 ;
    if (_element0  != null) return _element0 ;
  }

  E get single {
    if (length == 0) throw "No elements";
    if (length > 1) throw "More then one element";
    return elementAt(0);
  }

  E elementAt(int index) {
    if (index == 0 ) return _element0 ;
    if (index == 1 ) return _element1 ;
    if (index == 2 ) return _element2 ;
    if (index == 3 ) return _element3 ;
    if (index == 4 ) return _element4 ;
    if (index == 5 ) return _element5 ;
    if (index == 6 ) return _element6 ;
    if (index == 7 ) return _element7 ;
  }
}

class _ListIterator<E> implements Iterator {

  MicroIterable _iterable;
  var _length;
  var _current;
  var _cursor = 0;

  _ListIterator(iterable): _iterable = iterable, _length = iterable.length, _cursor = 0;

  bool moveNext() {
    int length = _iterable.length;
    if (_length != length) {
      throw new ConcurrentModificationError(_iterable);
    }
    if (_cursor >= length) {
      _current = null;
      return false;
    }
    _current = _iterable.elementAt(_cursor);
    _cursor++;
    return true;
  }

  E get current => _current;

}