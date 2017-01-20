c = get_config()

# if we send EOT (CTRL+D) we mean it
c.TerminalInteractiveShell.confirm_exit = False
