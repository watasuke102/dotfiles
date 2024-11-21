import {Hyprland, Battery, Clock, Network, SystemTray, MachineUsage} from 'src/modules/index';

export function Bar(monitor: number, name: String) {
  return Widget.Window({
    name,
    monitor: monitor,
    className: 'bar',
    exclusivity: 'exclusive',
    anchor: ['top', 'left', 'right'],
    child: Widget.Box({
      children: [Left(monitor), Center(), Right()],
    }),
  });
}

function Left(monitor: number) {
  return Widget.Box({
    spacing: 8,
    children: [Hyprland.workspaces(monitor), Network()],
  });
}
function Center() {
  return Widget.Box({
    children: [Hyprland.focused_title()],
  });
}
function Right() {
  return Widget.Box({
    spacing: 12,
    children: [MachineUsage(), Battery(), Clock(), SystemTray()],
  });
}
