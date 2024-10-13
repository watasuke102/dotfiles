import {Hyprland, Battery, Clock, Network, SystemTray, MachineUsage} from 'src/modules/index';

export function Bar(monitor: number) {
  return Widget.Window({
    monitor: monitor,
    className: 'bar',
    exclusivity: 'exclusive',
    anchor: ['top', 'left', 'right'],
    child: Widget.Box({
      children: [Left(), Center(), Right()],
    }),
  });
}

function Left() {
  return Widget.Box({
    spacing: 8,
    children: [Hyprland.workspaces(), Network()],
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
