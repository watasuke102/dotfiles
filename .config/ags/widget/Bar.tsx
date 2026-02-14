import app from "ags/gtk4/app";
import { Astal, Gdk } from "ags/gtk4";
import { Battery } from "./Battery";
import { Clock } from "./Clock";
import { HyprlandWindowTitle } from "./HyprlandWindowTitle";
import { HyprlandWorkspaces } from "./HyprlandWorkspaces";
import { AudioVolume } from "./AudioVolume";
import { Wifi } from "./Wifi";
import { Tray } from "./Tray";
import { onCleanup } from "gnim";

type Props = {
  index: number;
  gdkmonitor: Gdk.Monitor;
}

export default function Bar(props: Props) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      gdkmonitor={props.gdkmonitor}
      cssClasses={["Bar"]}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
      $={self => onCleanup(() => self.destroy())}
    >
      <box cssClasses={["centerbox"]} spacing={8}>
        <HyprlandWorkspaces monitor={props.index} />
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
