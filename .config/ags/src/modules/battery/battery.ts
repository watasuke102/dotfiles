const battery = await Service.import('battery');

export function Battery() {
  if (!battery.available) {
    return Widget.Box();
  }

  return Widget.Box({
    margin_right: 12,
    children: [
      Widget.Overlay({
        child: Widget.CircularProgress({
          rounded: true,
          start_at: 0.75,
          value: battery.bind('percent').as(p => (p > 0 ? p / 100 : 50)),
          class_names: Utils.merge(
            [battery.bind('charging'), battery.bind('percent')],
            (is_charging, percent) => {
              const class_names = ['battery_progress'];
              if (is_charging) {
                class_names.push('battery_charging');
              }
              if (percent <= 20) {
                class_names.push('battery_critical');
              } else if (percent <= 40) {
                class_names.push('battery_warning');
              }
              return class_names;
            },
          ),
        }),
        overlay: Widget.Icon({
          class_name: 'battery_icon',
          icon: battery.bind('icon_name'),
        }),
      }),
      Widget.Label({
        label: battery.bind('percent').as(p => `${p}%`),
      }),
    ],
    tooltip_markup: Utils.merge(
      [battery.bind('charging'), battery.bind('time_remaining')],
      (charging, remain_sec) =>
        // `Pango` is used for markup
        `<b>${Math.floor(Number(remain_sec) / 60)}min</b> remains until ${
          charging ? 'charge completion' : 'battery depletion'
        }`,
    ),
  });
}
