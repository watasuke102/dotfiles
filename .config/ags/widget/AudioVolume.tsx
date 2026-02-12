import Wp from "gi://AstalWp";
import { createBinding } from "gnim";

export function AudioVolume() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <box cssClasses={["audio_volume"]} visible={Wp.get_default() !== null}>
      <button onClicked={() => speaker.set_mute(!speaker.get_mute())}>
        <image iconName={createBinding(speaker, "volume_icon")} />
      </button>
      <slider
        cssClasses={["volume_slider"]}
        value={createBinding(speaker, "volume")}
        onNotifyValue={(self) => { speaker.volume = self.value }}
        widthRequest={100}
      />
      <label
        label={createBinding(speaker, "volume").as((v) => `${Math.floor(v * 100)}%`)}
      />
    </box>
  );
}
