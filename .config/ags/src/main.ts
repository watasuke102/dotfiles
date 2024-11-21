import Gdk from 'types/@girs/gdk-3.0/gdk-3.0';
import {Bar} from './bar/bar';
import Gtk from 'types/@girs/gtk-3.0/gtk-3.0';

const src_dir = `${App.configDir}/src`;
function load_style() {
  console.log('Reloading styles');
  const css = Utils.exec(`find ${src_dir} -name "*.css"`).split('\n').map(Utils.readFile).join('');
  console.log('\n', css);
  App.resetCss();
  App.applyCss(css);
}
// Initialize style
load_style();
// Hot reload
Utils.monitorFile(src_dir, load_style);

// On (add/remove)ing monitor, it does not work without this
let reload_count = 0;
let windows: Gtk.Window[] = [];

function create_bar_for_each_monitor() {
  const monitor_len = Gdk.Display.get_default()?.get_n_monitors() ?? 1;
  const iter = [...Array(monitor_len)];
  windows.map(w => App.removeWindow(w));
  ++reload_count;
  windows = iter.map((_, i) => Bar(i, `${reload_count}${i}`));
  App.config({windows});
}
create_bar_for_each_monitor();

const hyprland = await Service.import('hyprland');
hyprland.connect('monitor-added', create_bar_for_each_monitor);
hyprland.connect('monitor-removed', create_bar_for_each_monitor);
