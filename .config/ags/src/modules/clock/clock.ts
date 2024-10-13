const date = Variable('', {
  poll: [500, 'date "+%m/%d (%a) %H:%M:%S"'],
});

export function Clock() {
  return Widget.Box({
    spacing: 12,
    children: [
      Widget.Label({
        label: '',
      }),
      Widget.Label({
        class_name: 'clock',
        label: date.bind(),
      }),
    ],
  });
}
