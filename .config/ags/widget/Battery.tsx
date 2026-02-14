import AstalBattery from "gi://AstalBattery";
import { createBinding, createComputed } from "gnim";

export function Battery() {
  const battery = AstalBattery.get_default();
  const battery_percentage = createBinding(battery, "percentage");
  const battery_charging = createBinding(battery, "charging");
  const class_name = createComputed(
    //[battery_percentage, battery_charging],
    () => {
      if (battery_charging()) return "charging";
      const percent = battery_percentage();
      if (percent < 0.2) return "critical";
      if (percent < 0.4) return "warning";
      return "normal";
    }
  );

  return (
    <box
      cssClasses={["battery"]}
      visible={createBinding(battery, "is_present")}
    >
      <image iconName={createBinding(battery, "iconName")} />
      <slider
        value={battery_percentage}
        cssClasses={class_name(e => ["levelbar", e])}
        widthRequest={100}
      />
      <label
        cssClasses={['num']}
        label={createBinding(battery, "percentage").as((p) => Math.floor(p * 100).toString())}
      />
      <label cssClasses={['unit']} label="%" />
    </box>
  );
}
