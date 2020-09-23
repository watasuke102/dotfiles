# Defined in - @ line 1
function plasma-reset --wraps='kquitapp5 plasmashell ; kstart5 plasmashell' --description 'alias plasma-reset=kquitapp5 plasmashell ; kstart5 plasmashell'
  kquitapp5 plasmashell ; kstart5 plasmashell $argv;
end
