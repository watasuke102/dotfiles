const flat_button_classname = 'flat_button';

export function FlatButton(...args: Parameters<typeof Widget.Button>) {
  if (args[0]) {
    let modified = false;
    if (Array.isArray(args[0].class_names)) {
      modified = true;
      args[0].class_names.unshift(flat_button_classname);
    }
    if (Array.isArray(args[0].classNames)) {
      modified = true;
      args[0].classNames.unshift(flat_button_classname);
    }
    if (Array.isArray(args[0]['class-names'])) {
      modified = true;
      args[0]['class-names'].unshift(flat_button_classname);
    }
    if (!modified) {
      args[0].class_names = [flat_button_classname];
    }
  }
  return Widget.Button(...args);
}
