import { App, Astal, Gdk } from "astal/gtk4";
import { Battery } from "./Battery";
import { Clock } from "./Clock";
import { HyprlandWindowTitle } from "./HyprlandWindowTitle";
import { HyprlandWorkspaces } from "./HyprlandWorkspaces";
import { AudioVolume } from "./AudioVolume";
import { Wifi } from "./Wifi";
import { Tray } from "./Tray";

export default function Bar(gdkmonitor: Gdk.Monitor, monitor_index: number) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

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
