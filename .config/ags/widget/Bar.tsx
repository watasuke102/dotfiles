import { App, Astal, Gdk } from "astal/gtk4";
import { Battery } from "./Battery";
import { Clock } from "./Clock";
import { HyprlandWindowTitle } from "./HyprlandWindowTitle";
import { HyprlandWorkspaces } from "./HyprlandWorkspaces";
import { AudioVolume } from "./AudioVolume";
import { Wifi } from "./Wifi";
import { Tray } from "./Tray";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  let monitor_index = -1;
  App.get_monitors().forEach((e, i) => {
    if (e.model === gdkmonitor.model) {
      monitor_index = i;
    }
  });

  return (
    <window
      visible
      cssClasses={["Bar"]}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <box cssClasses={["centerbox"]} spacing={12}>
        <HyprlandWorkspaces monitor={monitor_index} />
        <Wifi />
        <HyprlandWindowTitle />
        <AudioVolume />
        <Battery />
        <Clock />
        <Tray />
      </box>
    </window>
  );
}
