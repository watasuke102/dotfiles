import {FlatButton} from 'src/common/index';

const system_tray = await Service.import('systemtray');

export function SystemTray() {
  return Widget.Box({
    spacing: 4,
    children: system_tray.bind('items').as(items =>
      items.map(item =>
        FlatButton({
          child: Widget.Icon({icon: item.bind('icon')}),
          on_primary_click: (_, event) => item.activate(event),
          on_secondary_click: (_, event) => item.openMenu(event),
          tooltip_markup: item.bind('tooltip_markup'),
        }),
      ),
    ),
  });
}
