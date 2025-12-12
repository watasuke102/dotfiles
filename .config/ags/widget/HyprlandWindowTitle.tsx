import { bind } from "astal";
import Hyprland from "gi://AstalHyprland";
import { Gtk } from "astal/gtk4";
import Pango from 'gi://Pango?version=1.0';

export function HyprlandWindowTitle() {
  const hyprland = Hyprland.get_default();

  return (
    <box cssClasses={["hyprland_window_title"]} spacing={4}>
      <image iconName="window-symbolic" />
      <box hexpand>
        {bind(hyprland, "focused_client").as((client) =>
          [client ? (
            <label
              label={bind(client, "title").as(e => String(e).replaceAll(/(\n|\u000d)/g, ''))}
              wrap={false}
              ellipsize={Pango.EllipsizeMode.END}
            />
          ) : (
            <label label="<null>" />
          )]
        )}
      </box>
    </box>
  );
}
