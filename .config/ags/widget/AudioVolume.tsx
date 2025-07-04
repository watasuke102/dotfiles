import { bind } from "astal/binding";
import Wp from "gi://AstalWp";

export function AudioVolume() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;
  return (
    <box cssClasses={["audio_volume"]} visible={Wp.get_default() !== null}>
      <button onClicked={() => speaker.set_mute(!speaker.get_mute())}>
        <image iconName={bind(speaker, "volume_icon")} />
      </button>
      <slider
        cssClasses={["volume_slider"]}
        value={bind(speaker, "volume")}
        // FIXME: does not work!
        onNotifyValue={(self) => speaker.set_volume(self.value)}
        widthRequest={100}
      />
      <label
        label={bind(speaker, "volume").as((v) => `${Math.floor(v * 100)}%`)}
      />
    </box>
  );
}
