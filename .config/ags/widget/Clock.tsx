import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";
import { With } from "gnim";

export function Clock() {
  const time_var = createPoll('', 1000, 'date "+%m/%d (%a) %H:%M:%S"');

  return (
    <menubutton cssClasses={["clock"]}>
      <box spacing={4} valign={Gtk.Align.CENTER}>
        <With value={time_var}>
          {str => {
            const [date, day_of_week, time] = str.split(" ");
            return <box spacing={4}>
              <label cssClasses={["date"]} label={date} />
              <label cssClasses={["day_of_week"]} label={day_of_week} />
              <label cssClasses={["time"]} label={time} />
            </box>;
          }}
        </With>
      </box>
      <popover>
        <Gtk.Calendar />
      </popover>
    </menubutton>
  );
}
