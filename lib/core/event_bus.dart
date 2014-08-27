part of angular.core_internal;

abstract class EventBus {
  /**
   * Triggers a [CustomEvent] referenced by the [name] parameters upwards towards the root of the
   * view tree. If intercepted, by a parent view containing a matching view event listener
   * (which is registered via the [on] method), then the event listener callback function will be
   * executed.
   *
   * The triggered [CustomEvent] references the [data] so that they can be retrieved in the listener.
   */
  CustomEvent emit(String name, [data]);

  /**
   * Triggers a [CustomEvent] referenced by the [name] parameters downwards towards the leaf nodes of
   * the view tree. If intercepted, by a child view containing a matching view event listener
   * (which is registered via the [on] method), then the event listener callback function will be
   * executed.
   *
   * The triggered [CustomEvent] references the [data] so that they can be retrieved in the listener.
   */
  CustomEvent broadcast(String name, [data]);

  /**
   * Registers a view-based event listener to intercept events triggered by [broadcast] (from any
   * parent view) or [emit] (from child view) that match the given event [name].
   */
  CustomEvent on(String name);
}

class CustomEvent {
  /**
   * Data attached to the event. This would be the optional parameter from [EventBus.emit] and
   * [EventBus.broadcast].
   */
  final data;

  final String name;

  /// true or false depending on if [stopPropagation] was executed.
  bool get propagationStopped => _propagationStopped;
  bool _propagationStopped = false;

  /// true or false depending on if [preventDefault] was executed.
  bool get defaultPrevented => _defaultPrevented;
  bool _defaultPrevented = false;

  /**
   * [name]: The name of the view event.
   * [data]: Arbitrary data attached to the event.
   */
  CustomEvent(this.name, this.data);

  /// Prevents the intercepted event from propagating further
  void stopPropagation () {
    _propagationStopped = true;
  }

  /// Sets the defaultPrevented flag to true.
  void preventDefault() {
    _defaultPrevented = true;
  }
}