import Network from "gi://AstalNetwork";
import { createBinding, With } from "gnim";

export function Wifi() {
  const wifi = createBinding(Network.get_default(), "wifi");

  return (
    <With value={wifi}>
      {(wifi) =>
        <box cssClasses={["wifi"]} visible={!!wifi} spacing={4}>
          <image iconName={createBinding(wifi, "icon_name")} />
          <label label={createBinding(wifi, "ssid")} />
        </box>
      }
    </With>
  );
}
