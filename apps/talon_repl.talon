win.title: /Talon (- )?REPL/
-
tag(): user.talon_python

^test [<user.ordinals>] last$:
    history_entry = user.history_get(ordinals or 1)
    user.paste("sim('{history_entry}')")
    key(enter)
^test <phrase>$:
    user.paste("sim('{phrase}')")
    key(enter)
^debug action {user.talon_actions}$:
    user.paste("actions.find('{user.talon_actions}')")
    key(enter)
^debug list {user.talon_lists}$:
    user.paste("actions.user.talon_pretty_print(registry.lists['{talon_lists}'])")
    key(enter)
^debug tags$:
    user.paste("actions.user.talon_pretty_print(registry.tags)")
    key(enter)
^debug settings$:
    user.paste("actions.user.talon_pretty_print(registry.settings)")
    key(enter)
^debug modes$:
    user.paste("actions.user.talon_pretty_print(scope.get('mode'))")
    key(enter)
^debug scope {user.talon_scopes}$:
    user.paste("actions.user.talon_pretty_print(scope.get('{talon_scopes}'))")
    key(enter)    
^debug running apps$: 
    user.paste("actions.user.talon_pretty_print(ui.apps(background=False))")
    key(enter)
^debug all windows$: 
    user.paste("actions.user.talon_pretty_print(ui.windows())")
    key(enter)
^debug {user.running} windows$:
    user.paste("actions.user.talon_debug_app_windows('{running}')")
    key(enter)