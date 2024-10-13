const network = await Service.import('network');

export function Network() {
  return Widget.Box({
    spacing: 4,
    children: network.bind('primary').as(primary =>
      primary === 'wifi'
        ? [
            Widget.Icon({
              icon: network.wifi.bind('icon_name'),
            }),
            Widget.Label({
              label: network.wifi.bind('ssid').as(ssid => ssid || '[unknown]'),
            }),
            // TODO: VPN status icon
          ]
        : [],
    ),
  });
}
