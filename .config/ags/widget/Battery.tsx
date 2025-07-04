import { bind, Variable } from "astal";
import AstalBattery from "gi://AstalBattery";
import { mergeBindings } from "../../../../../usr/share/astal/gjs/_astal";

export function Battery() {
  const battery = AstalBattery.get_default();
  const battery_percentage = bind(battery, "percentage");
  const battery_charging = bind(battery, "charging");
  const class_name = Variable.derive(
    [battery_percentage, battery_charging],
    (percent, is_charging) => {
      if (is_charging) return "charging";
      if (percent < 0.2) return "critical";
      if (percent < 0.4) return "warning";
      return "normal";
    }
  );

  return (
    <box
      cssClasses={["battery"]}
      spacing={4}
      visible={bind(battery, "is_present")}
    >
      <image iconName={bind(battery, "iconName")} />
      <slider
        value={battery_percentage}
        cssClasses={["levelbar", class_name.get()]}
        widthRequest={100}
      />
      <label
        label={bind(battery, "percentage").as((p) => `${Math.floor(p * 100)}%`)}
      />
    </box>
  );
}
