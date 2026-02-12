import AstalTray from "gi://AstalTray";
import Gtk from "gi://Gtk?version=4.0";
import { createBinding, For } from "gnim";

export function Tray() {
  const tray = AstalTray.get_default();
  const items = createBinding(tray, "items");

  const init = (button: Gtk.MenuButton, item: AstalTray.TrayItem) => {
    button.menuModel = item.menuModel;
    button.insert_action_group("dbusmenu", item.actionGroup);
    item.connect("notify::action-group", () => {
      button.insert_action_group("dbusmenu", item.actionGroup);
    })
  }

  return (
    <menubutton cssClasses={["tray"]}>
      <popover>
        <box spacing={12}>
          <For each={items}>
            {(item) => (
              <menubutton $={self => init(self, item)}>
                <image gicon={createBinding(item, "gicon")} />
              </menubutton>
            )}
          </For>
        </box>
      </popover>
    </menubutton>
  );
}
