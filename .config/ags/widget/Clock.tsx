import { Gdk, Gtk } from "astal/gtk4";
import { Variable } from "astal";

export function Clock() {
  const time_var = Variable("").poll(1000, 'date "+%m/%d (%a) %H:%M:%S"');

  return (
    <menubutton cssClasses={["clock"]}>
      <box spacing={4} valign={Gtk.Align.CENTER}>
        {time_var().as((str) => {
          const [date, day_of_week, time] = str.split(" ");
          return [
            <label cssClasses={["date"]} label={date} />,
            <label cssClasses={["day_of_week"]} label={day_of_week} />,
            <label cssClasses={["time"]} label={time} />,
          ];
        })}
      </box>
      <popover>
        <Gtk.Calendar />
      </popover>
    </menubutton>
  );
}
