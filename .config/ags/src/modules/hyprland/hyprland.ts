import {FlatButton} from 'src/common/index';

const hyprland = await Service.import('hyprland');

export const Hyprland = {
  focused_title: () =>
    Widget.Label({
      class_name: 'focused_title',
      label: hyprland.active.client.bind('title'),
      hexpand: true,
      truncate: 'end',
      setup: self => (self.label = hyprland.active.client.title),
    }),
  workspaces: () => {
    const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${ws}`);
    return Widget.EventBox({
      onScrollUp: () => dispatch('+1'),
      onScrollDown: () => dispatch('-1'),
      child: Widget.Box({
        children: hyprland.active.workspace.bind('id').as(current_ws =>
          Array.from({length: 10}, (_, i) => i + 1).map(i =>
            FlatButton({
              class_names: ['workspace_button'],
              label: `${i}`,
              attribute: i,
              onClicked: () => dispatch(i),
              // - border-color is set as 'transparent' by FlatButton
              // - Gtk does not support '!important'
              // so write CSS directly; it prioritized as the highest
              css:
                i === current_ws
                  ? `
                border-bottom-style: solid;
                border-bottom-color: #98c379;
              `
                  : '',
            }),
          ),
        ),

        setup: self =>
          self.hook(hyprland, () =>
            self.children.forEach(btn => {
              btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute);
            }),
          ),
      }),
    });
  },
};
