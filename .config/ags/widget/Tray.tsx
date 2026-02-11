import { bind } from "astal";
import AstalTray from "gi://AstalTray";

export function Tray() {
  const tray = AstalTray.get_default();

  return (
    <menubutton cssClasses={["tray"]}>
      <popover>
        <box spacing={12}>
          {bind(tray, "items").as((items) =>
            items.map((item) => {
              return (
                <menubutton
                  tooltipMarkup={bind(item, "tooltipMarkup")}
                  usePopover={false}
                  actionGroup={bind(item, "actionGroup").as((ag) => [
                    "dbusmenu",
                    ag,
                  ])}
                  menuModel={bind(item, "menuModel")}
                >
                  <image icon_name={bind(item, "icon_name")} />
                </menubutton>
              );
            })
          )}
        </box>
      </popover>
    </menubutton>
  );
}
