import { bind } from "astal";
import Hyprland from "gi://AstalHyprland";

export function HyprlandWindowTitle() {
  const hyprland = Hyprland.get_default();

  return (
    <box cssClasses={["hyprland_window_title"]} spacing={4}>
      <image iconName="window-symbolic" />
      <box hexpand>
        {bind(hyprland, "focused_client").as((client) =>
          client ? (
            <label label={bind(client, "title").as(String)} />
          ) : (
            <label label="<null>" />
          )
        )}
      </box>
    </box>
  );
}
