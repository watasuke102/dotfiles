import Gdk from 'types/@girs/gdk-3.0/gdk-3.0';
import {Bar} from './bar/bar';

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

function create_bar_for_each_monitor() {
  const monitor_len = Gdk.Display.get_default()?.get_n_monitors() ?? 1;
  console.log(Array(monitor_len));
  [...Array(monitor_len)].forEach(console.log);
  console.log('=================');
  App.config({
    windows: [...Array(monitor_len)].map((_, i) => Bar(i)),
  });
}
create_bar_for_each_monitor();
