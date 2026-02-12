import Hyprland from "gi://AstalHyprland";
import { createBinding, With } from "gnim";

export function HyprlandWorkspaces(props: { monitor: number }) {
  const hyprland = Hyprland.get_default();
  const ws = createBinding(hyprland, "workspaces");
  const focused_ws = createBinding(hyprland, "focused_workspace");

  return (
    <box css_classes={["hyprland_workspaces"]}>
      <With value={ws}>
        {workspaces => (
          <box>
            {
              workspaces
                .filter((workspace) => workspace.monitor && workspace.monitor.id == props.monitor)
                .sort((a, b) => a.id - b.id)
                .map((workspace) => (
                  <button
                    css_classes={focused_ws.as((focused) =>
                      workspace == focused ? ["active"] : [""]
                    )}
                    label={workspace.name}
                    onClicked={() => workspace.focus()}
                  />
                ))
            }
          </box>
        )
        }
      </With>
    </box>
  );
}
