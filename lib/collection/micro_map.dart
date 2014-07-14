library angular.collection;

import 'dart:collection';

const int MODE_ARRAY = 0;
const int MODE_MAP = 1;

/**
 * MicroMap is backed by fields until it reaches length 8. After that it
 * _delegates storage to a standard HashMap.
 * Once micromap enters map mode (i.e. _delegate map is constructed) it would
 * not revert into fields mode (even after removals).
 */
class MicroMap<K, V> implements Map {

  var _key0; var _obj0;
  var _key1; var _obj1;
  var _key2; var _obj2;
  var _key3; var _obj3;
  var _key4; var _obj4;
  var _key5; var _obj5;
  var _key6; var _obj6;
  var _key7; var _obj7;
  // Invariants:
  // _delegate != null -> _key*, _obj* = null, _count = 0
  // _delegate == null -> 0 <= _count <= 8
  int _count;
  Map<K, V> _delegate;


  MicroMap() {
    _count = 0;
  }

  bool containsValue(Object value) {
    if (_delegate == null) {
      if (_count == 0) return false;  if(_obj0 == value) return true;
      if (_count == 1) return false;  if(_obj1 == value) return true;
      if (_count == 2) return false;  if(_obj2 == value) return true;
      if (_count == 3) return false;  if(_obj3 == value) return true;
      if (_count == 4) return false;  if(_obj4 == value) return true;
      if (_count == 5) return false;  if(_obj5 == value) return true;
      if (_count == 6) return false;  if(_obj6 == value) return true;
      if (_count == 7) return false;  if(_obj7 == value) return true;
      if (_count == 8) return false;
    }
    return _delegate.containsValue(value);
  }

  bool containsKey(Object key) {
    if (_delegate == null) {
      if (_count == 0) return false;   if(_key0 == key) return true;
      if (_count == 1) return false;   if(_key1 == key) return true;
      if (_count == 2) return false;   if(_key2 == key) return true;
      if (_count == 3) return false;   if(_key3 == key) return true;
      if (_count == 4) return false;   if(_key4 == key) return true;
      if (_count == 5) return false;   if(_key5 == key) return true;
      if (_count == 6) return false;   if(_key6 == key) return true;
      if (_count == 7) return false;   if(_key7 == key) return true;
      if (_count == 8) return false;
    }
    return _delegate.containsKey(key);
  }

  V putIfAbsent(K key, V ifAbsent()) {
    if (_delegate == null) {
      if (_count == 0)  { _count++; _key0 = key;  return _obj0 = ifAbsent();  } else if (key == _key0) return _obj0;
      if (_count == 1)  { _count++; _key1 = key;  return _obj1 = ifAbsent();  } else if (key == _key1) return _obj1;
      if (_count == 2)  { _count++; _key2 = key;  return _obj2 = ifAbsent();  } else if (key == _key2) return _obj2;
      if (_count == 3)  { _count++; _key3 = key;  return _obj3 = ifAbsent();  } else if (key == _key3) return _obj3;
      if (_count == 4)  { _count++; _key4 = key;  return _obj4 = ifAbsent();  } else if (key == _key4) return _obj4;
      if (_count == 5)  { _count++; _key5 = key;  return _obj5 = ifAbsent();  } else if (key == _key5) return _obj5;
      if (_count == 6)  { _count++; _key6 = key;  return _obj6 = ifAbsent();  } else if (key == _key6) return _obj6;
      if (_count == 7)  { _count++; _key7 = key;  return _obj7 = ifAbsent();  } else if (key == _key7) return _obj7;
      if (_count == 8) _copyAllElementsToMap();
    }
    return _delegate.putIfAbsent(key, ifAbsent);
  }

  void addAll(Map<K, V> other) {
    other.forEach((K key, V value) => this[key] = value);
  }

  void _fill(int idx, Object key, Object value) {
    if (idx == 0)  { _key0 = key; _obj0 = value; return; }
    if (idx == 1)  { _key1 = key; _obj1 = value; return; }
    if (idx == 2)  { _key2 = key; _obj2 = value; return; }
    if (idx == 3)  { _key3 = key; _obj3 = value; return; }
    if (idx == 4)  { _key4 = key; _obj4 = value; return; }
    if (idx == 5)  { _key5 = key; _obj5 = value; return; }
    if (idx == 6)  { _key6 = key; _obj6 = value; return; }
    if (idx == 7)  { _key7 = key; _obj7 = value; return; }
  }

  V remove(Object key) {
    if (_delegate == null) {
      var value = null;
      var seenIdx = -1;
      if (_count == 0)   { return null; } else if (key == _key0) { seenIdx = 0 ; value = _obj0; _obj0 = null;}
      if (_count == 1)   { if (seenIdx != -1) { if (seenIdx != 0)  _fill(seenIdx, _key0, _obj0); _count--;} return value; } else if (key == _key1)  { seenIdx = 1 ; value = _obj1; _obj1 = null;}
      if (_count == 2)   { if (seenIdx != -1) { if (seenIdx != 1)  _fill(seenIdx, _key1, _obj1); _count--;} return value; } else if (key == _key2)  { seenIdx = 2 ; value = _obj2; _obj2 = null;}
      if (_count == 3)   { if (seenIdx != -1) { if (seenIdx != 2)  _fill(seenIdx, _key2, _obj2); _count--;} return value; } else if (key == _key3)  { seenIdx = 3 ; value = _obj3; _obj3 = null;}
      if (_count == 4)   { if (seenIdx != -1) { if (seenIdx != 3)  _fill(seenIdx, _key3, _obj3); _count--;} return value; } else if (key == _key4)  { seenIdx = 4 ; value = _obj4; _obj4 = null;}
      if (_count == 5)   { if (seenIdx != -1) { if (seenIdx != 4)  _fill(seenIdx, _key4, _obj4); _count--;} return value; } else if (key == _key5)  { seenIdx = 5 ; value = _obj5; _obj5 = null;}
      if (_count == 6)   { if (seenIdx != -1) { if (seenIdx != 5)  _fill(seenIdx, _key5, _obj5); _count--;} return value; } else if (key == _key6)  { seenIdx = 6 ; value = _obj6; _obj6 = null;}
      if (_count == 7)   { if (seenIdx != -1) { if (seenIdx != 6)  _fill(seenIdx, _key6, _obj6); _count--;} return value; } else if (key == _key7)  { seenIdx = 7 ; value = _obj7; _obj7 = null;}
      if (_count == 8)   { if (seenIdx != -1) { if (seenIdx != 7) _fill(seenIdx, _key7, _obj7); _count--;} return value; }
      return null;
    } else {
      return _delegate.remove(key);
    }
  }

  void clear() {
    if (_delegate == null) {
      _clearAllElements();
    } else {
      _delegate.clear();
    }
  }

  void forEach(void f(K key, V value)) {
    if (_delegate == null) {
      if (_count == 0)  return; f(_key0 , _obj0 );
      if (_count == 1)  return; f(_key1 , _obj1 );
      if (_count == 2)  return; f(_key2 , _obj2 );
      if (_count == 3)  return; f(_key3 , _obj3 );
      if (_count == 4)  return; f(_key4 , _obj4 );
      if (_count == 5)  return; f(_key5 , _obj5 );
      if (_count == 6)  return; f(_key6 , _obj6 );
      if (_count == 7)  return; f(_key7 , _obj7 );
    } else {
      _delegate.forEach(f);
    }
  }

  Iterable<K> get keys {
    if (_delegate == null) _copyAllElementsToMap();
    return _delegate.keys;
  }

  Iterable<V> get values {
    if (_delegate == null) _copyAllElementsToMap();
    return _delegate.values;
  }

  int get length => _delegate == null ? _count : _delegate.length;
  bool get isEmpty => _delegate == null ? _count == 0 : _delegate.isEmpty;
  bool get isNotEmpty => _delegate == null ? _count != 0 : _delegate.isNotEmpty;

  V operator [](K key) {
    if (_delegate == null) {
      if (_count == 0)  return null; if (key == _key0) return _obj0;
      if (_count == 1)  return null; if (key == _key1) return _obj1;
      if (_count == 2)  return null; if (key == _key2) return _obj2;
      if (_count == 3)  return null; if (key == _key3) return _obj3;
      if (_count == 4)  return null; if (key == _key4) return _obj4;
      if (_count == 5)  return null; if (key == _key5) return _obj5;
      if (_count == 6)  return null; if (key == _key6) return _obj6;
      if (_count == 7)  return null; if (key == _key7) return _obj7;
      if (_count == 8) return null;
    } else {
      return _delegate[key];
    }
  }

  void operator []=(K key, V value) {
    if (_delegate == null) {
      if      (_count == 0)  { _key0  = key; _obj0  = value; _count++; } else if (key == _key0)  { _obj0  = value; }
      else if (_count == 1)  { _key1  = key; _obj1  = value; _count++; } else if (key == _key1)  { _obj1  = value; }
      else if (_count == 2)  { _key2  = key; _obj2  = value; _count++; } else if (key == _key2)  { _obj2  = value; }
      else if (_count == 3)  { _key3  = key; _obj3  = value; _count++; } else if (key == _key3)  { _obj3  = value; }
      else if (_count == 4)  { _key4  = key; _obj4  = value; _count++; } else if (key == _key4)  { _obj4  = value; }
      else if (_count == 5)  { _key5  = key; _obj5  = value; _count++; } else if (key == _key5)  { _obj5  = value; }
      else if (_count == 6)  { _key6  = key; _obj6  = value; _count++; } else if (key == _key6)  { _obj6  = value; }
      else if (_count == 7)  { _key7  = key; _obj7  = value; _count++; } else if (key == _key7)  { _obj7  = value; }
      else if (_count == 8) {
        _copyAllElementsToMap();
        _delegate[key] = value;
      }
    } else {
      _delegate[key] = value;
    }
  }

  int get mode {
    return _delegate == null ? MODE_ARRAY : MODE_MAP;
  }

  String toString() {
    var elements = [];
    if (_delegate == null) {
      if (_count > 0)  elements.add('${_key0}: ${_obj0}');
      if (_count > 1)  elements.add('${_key1}: ${_obj1}');
      if (_count > 2)  elements.add('${_key2}: ${_obj2}');
      if (_count > 3)  elements.add('${_key3}: ${_obj3}');
      if (_count > 4)  elements.add('${_key4}: ${_obj4}');
      if (_count > 5)  elements.add('${_key5}: ${_obj5}');
      if (_count > 6)  elements.add('${_key6}: ${_obj6}');
      if (_count > 7)  elements.add('${_key7}: ${_obj7}');
      return '{${elements.join(', ')}}';
    }
    return '$_delegate';
  }

  void _clearAllElements() {
    _count = 0;
    _key0 = null; _obj0 = null;
    _key1 = null; _obj1 = null;
    _key2 = null; _obj2 = null;
    _key3 = null; _obj3 = null;
    _key4 = null; _obj4 = null;
    _key5 = null; _obj5 = null;
    _key6 = null; _obj6 = null;
    _key7 = null; _obj7 = null;
  }

  void _copyAllElementsToMap() {
    _delegate = new HashMap();
    if (_count > 0) _delegate[_key0] = _obj0;
    if (_count > 1) _delegate[_key1] = _obj1; 
    if (_count > 2) _delegate[_key2] = _obj2; 
    if (_count > 3) _delegate[_key3] = _obj3; 
    if (_count > 4) _delegate[_key4] = _obj4; 
    if (_count > 5) _delegate[_key5] = _obj5; 
    if (_count > 6) _delegate[_key6] = _obj6; 
    if (_count > 7) _delegate[_key7] = _obj7;
    _clearAllElements();
  }
}
