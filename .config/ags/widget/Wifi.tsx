import { bind } from "astal";
import Network from "gi://AstalNetwork";

export function Wifi() {
  const wifi = bind(Network.get_default(), "wifi");
  return (
    <box cssClasses={["wifi"]} visible={wifi.as(Boolean)} spacing={4}>
      {wifi.as((wifi) => [
        <image iconName={bind(wifi, "icon_name")} />,
        <label label={bind(wifi, "ssid")} />,
      ])}
    </box>
  );
}
