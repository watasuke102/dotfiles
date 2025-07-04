import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";

export function HyprlandWorkspaces(props: { monitor: number }) {
  const hyprland = Hyprland.get_default();

  return (
    <box css_classes={["hyprland_workspaces"]}>
      {bind(hyprland, "workspaces").as((workspaces) =>
        workspaces
          .filter((workspace) => workspace.monitor.id == props.monitor)
          .sort((a, b) => a.id - b.id)
          .map((workspace) => (
            <button
              css_classes={bind(hyprland, "focused_workspace").as((focused) =>
                workspace == focused ? ["active"] : [""]
              )}
              label={workspace.name}
              onClicked={() => workspace.focus()}
            />
          ))
      )}
    </box>
  );
}
