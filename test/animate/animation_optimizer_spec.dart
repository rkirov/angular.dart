library animation_optimizer_spec;

import '../_specs.dart';

_run(bool animationsAllowed) {
  describe('AnimationLoop: animationsAllowed=$animationsAllowed', () {
    TestBed _;
    AnimationOptimizer optimizer;
    beforeEach(inject((TestBed tb, Expando expand) {
      _ = tb;
      optimizer = new AnimationOptimizer(expand)..animationsAllowed = animationsAllowed;
    }));
    
    it('should prevent animations on child elements', () {
      var animation = new NoOpAnimation();
      _.compile('<div><div></div></div>');
      

      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
      optimizer.track(animation, _.rootElement);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();
      optimizer.forget(animation);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
    });
    
    it('should allow multiple animations on the same element', () {
      var animation1 = new NoOpAnimation();
      var animation2 = new NoOpAnimation();
      _.compile('<div><div></div></div>');
      
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      optimizer.track(animation1, _.rootElement);
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      optimizer.track(animation2, _.rootElement);
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();
      optimizer.forget(animation1);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();
      optimizer.forget(animation2);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
    });

    it('should always animate an element', () {
      _.compile('<div><div></div></div>');
      optimizer.alwaysAnimate(_.rootElement.children[0], "never");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();
      optimizer.alwaysAnimate(_.rootElement.children[0], "always");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
      optimizer.alwaysAnimate(_.rootElement.children[0], "auto");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
    });

    it('alwaysAnimate should not affect children', () {
      _.compile('<div><div></div></div>');
      optimizer.alwaysAnimate(_.rootElement, "never");
      expect(optimizer.shouldAnimate(_.rootElement)).toBeFalsy();
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
      optimizer.alwaysAnimate(_.rootElement, "always");
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
      optimizer.alwaysAnimate(_.rootElement, "auto");
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
    });


    it('alwaysAnimateChildren should not affect element', () {
      _.compile('<div><div></div></div>');

      optimizer.alwaysAnimateChildren(_.rootElement, "never");
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();

      optimizer.alwaysAnimateChildren(_.rootElement, "always");
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);

      optimizer.alwaysAnimateChildren(_.rootElement, "auto");
      expect(optimizer.shouldAnimate(_.rootElement)).toBe(animationsAllowed);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
    });

    it('alwaysAnimate should take priority over alwaysAnimateChildren', () {
      _.compile('<div><div></div></div>');

      optimizer.alwaysAnimateChildren(_.rootElement, "never");
      optimizer.alwaysAnimate(_.rootElement.children[0], "always");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);

      optimizer.alwaysAnimateChildren(_.rootElement, "always");
      optimizer.alwaysAnimate(_.rootElement.children[0], "never");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();
    });

    it('alwaysAnimate should take priority over running animations', () {
      _.compile('<div><div></div></div>');
      var animation = new NoOpAnimation();

      optimizer.track(animation, _.rootElement);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();

      optimizer.alwaysAnimate(_.rootElement.children[0], "always");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);

      optimizer.alwaysAnimate(_.rootElement.children[0], "auto");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();

      optimizer.forget(animation);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);
    });

    it('alwaysAnimateChildren should take priority over running animations',
        () {
      _.compile('<div><div></div></div>');
      var animation = new NoOpAnimation();

      optimizer.track(animation, _.rootElement);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();

      optimizer.alwaysAnimateChildren(_.rootElement, "always");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);

      optimizer.alwaysAnimateChildren(_.rootElement, "auto");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();

      optimizer.forget(animation);
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBe(animationsAllowed);

      optimizer.alwaysAnimateChildren(_.rootElement, "never");
      expect(optimizer.shouldAnimate(_.rootElement.children[0])).toBeFalsy();
    });


    it('alwaysAnimateChildren when nested should prioritize the closest'
    +'element up the tree.',
        () {
      _.compile('<div><div><div></div></div></div>');

      optimizer.alwaysAnimateChildren(_.rootElement, "always");
      expect(optimizer.shouldAnimate(_.rootElement.children[0].children[0]))
        .toBe(animationsAllowed);

      optimizer.alwaysAnimateChildren(_.rootElement.children[0], "never");
      expect(optimizer.shouldAnimate(_.rootElement.children[0].children[0]))
        .toBeFalsy();


      optimizer.alwaysAnimateChildren(_.rootElement, "never");
      optimizer.alwaysAnimateChildren(_.rootElement.children[0], "always");
      expect(optimizer.shouldAnimate(_.rootElement.children[0].children[0]))
        .toBe(animationsAllowed);
    });
  });
}

main() {
  [true, false].forEach(_run);
}
