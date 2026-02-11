import Bar from "./widget/Bar";
import style from "./style.scss";
import { App, Gtk, Gdk } from "astal/gtk4";

App.start({
  css: style,
  main() {
    const bars = new Map<Gdk.Monitor, Gtk.Widget>()
    App.get_monitors().forEach((gdkmonitor) => {
      bars.set(gdkmonitor, Bar(gdkmonitor))
    });

    App.connect("monitor-added", (_, gdkmonitor) => {
      console.log("Connected!", gdkmonitor)
      bars.set(gdkmonitor, Bar(gdkmonitor))
    })
    App.connect("monitor-removed", (_, gdkmonitor) => {
      console.log("Disconnected!", gdkmonitor)
      bars.get(gdkmonitor)?.destroy()
      bars.delete(gdkmonitor)
    })
  },
});
