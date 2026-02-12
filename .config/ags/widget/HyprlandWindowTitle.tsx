import Hyprland from "gi://AstalHyprland";
import Pango from 'gi://Pango?version=1.0';
import { createBinding, With } from "gnim";

export function HyprlandWindowTitle() {
  const hyprland = Hyprland.get_default();
  const focused_client = createBinding(hyprland, "focused_client");

  return (
    <box cssClasses={["hyprland_window_title"]} spacing={4}>
      <image iconName="window-symbolic" />
      <box hexpand>
        <With value={focused_client}>
          {client =>
            (client && client.title) ? (
              <label
                label={client.title.replaceAll(/(\n|\u000d)/g, '')}
                wrap={false}
                ellipsize={Pango.EllipsizeMode.END}
              />
            ) : (
              <label label="<null>" />
            )
          }
        </With>
      </box>
    </box>
  );
}
