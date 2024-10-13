const cpu_usage = Variable('', {
  poll: [
    1000,
    `bash -c 'grep "cpu " /proc/stat | awk "{print int((\\$2+\\$4)*100 / (\\$2+\\$4+\\$5))}"'`,
  ],
});
const mem_used_mib = Variable('', {
  poll: [1000, `bash -c 'free --mebi | awk "NR==2{print \\$4}"'`],
});

export function MachineUsage() {
  return Widget.Box({
    spacing: 4,
    children: [
      Widget.Label({
        label: '',
      }),
      Widget.Label({
        label: cpu_usage.bind().as(e => `${e}%`),
      }),
      Widget.Box({
        width_request: 4,
      }),
      Widget.Label({
        label: ' ',
      }),
      Widget.Label({
        label: mem_used_mib.bind().as(e => `${e} Mib`),
      }),
    ],
  });
}
