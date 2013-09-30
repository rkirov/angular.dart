library angular.directives.all;

import 'package:di/di.dart';
import '../bootstrap.dart';

import 'ng_mustache.dart';             export 'ng_mustache.dart';
import 'ng_a.dart';                    export 'ng_a.dart';
import 'ng_bind.dart';                 export 'ng_bind.dart';
import 'ng_bind_html.dart';            export 'ng_bind_html.dart';
import 'ng_class.dart';                export 'ng_class.dart';
import 'ng_events.dart';               export 'ng_events.dart';
import 'ng_cloak.dart';                export 'ng_cloak.dart';
import 'ng_controller.dart';           export 'ng_controller.dart';
import 'ng_disabled.dart';             export 'ng_disabled.dart';
import 'ng_hide.dart';                 export 'ng_hide.dart';
import 'ng_if.dart';                   export 'ng_if.dart';
import 'ng_include.dart';              export 'ng_include.dart';
import 'ng_model.dart';                export 'ng_model.dart';
import 'ng_repeat.dart';               export 'ng_repeat.dart';
import 'ng_template.dart';             export 'ng_template.dart';
import 'ng_show.dart';                 export 'ng_show.dart';
import 'ng_style.dart';                export 'ng_style.dart';
import 'ng_switch.dart';               export 'ng_switch.dart';
import 'ng_non_bindable.dart';         export 'ng_non_bindable.dart';

void registerDirectives(Module module) {
  module.type(NgTextMustacheDirective);
  module.type(NgAttrMustacheDirective);
  module.type(NgAAttrDirective);
  module.type(NgBindAttrDirective);
  module.type(NgBindHtmlAttrDirective);
  module.type(NgClassAttrDirective);
  module.type(NgClassOddAttrDirective);
  module.type(NgClassEvenAttrDirective);
  module.type(NgCloakAttrDirective);
  module.type(NgCloakClassDirective);
  module.type(NgControllerAttrDirective);
  module.type(NgDisabledAttrDirective);
  module.type(NgHideAttrDirective);
  module.type(NgIfAttrDirective);
  module.type(NgUnlessAttrDirective);
  module.type(NgIncludeAttrDirective);
  module.type(NgRepeatAttrDirective);
  module.type(NgShowAttrDirective);
  module.type(InputTextDirective);
  module.type(InputCheckboxDirective);
  module.type(NgModel);
  module.type(NgSwitchAttrDirective);
  module.type(NgSwitchWhenAttrDirective);
  module.type(NgSwitchDefaultAttrDirective);

  module.type(NgBlurAttrDirective);
  module.type(NgChangeAttrDirective);
  module.type(NgClickAttrDirective);
  module.type(NgContextMenuAttrDirective);
  module.type(NgDoubleClickAttrDirective);
  module.type(NgDragAttrDirective);
  module.type(NgDragEndAttrDirective);
  module.type(NgDragEnterAttrDirective);
  module.type(NgDragLeaveAttrDirective);
  module.type(NgDragOverAttrDirective);
  module.type(NgDragStartAttrDirective);
  module.type(NgDropAttrDirective);
  module.type(NgFocusAttrDirective);
  module.type(NgKeyDownAttrDirective);
  module.type(NgKeyPressAttrDirective);
  module.type(NgKeyUpAttrDirective);
  module.type(NgMouseDownAttrDirective);
  module.type(NgMouseEnterAttrDirective);
  module.type(NgMouseLeaveAttrDirective);
  module.type(NgMouseMoveAttrDirective);
  module.type(NgMouseOutAttrDirective);
  module.type(NgMouseOverAttrDirective);
  module.type(NgMouseUpAttrDirective);
  module.type(NgMouseWheelAttrDirective);
  module.type(NgScrollAttrDirective);
  module.type(NgTouchCancelAttrDirective);
  module.type(NgTouchEndAttrDirective);
  module.type(NgTouchMoveAttrDirective);
  module.type(NgTouchStartAttrDirective);
  module.type(NgStyleAttrDirective);
  module.type(NgNonBindableAttrDirective);
  module.type(NgTemplateElementDirective);
}
