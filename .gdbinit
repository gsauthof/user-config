# global history file:
# set history filename ~/.cache/gdb_history
# local history file, relative to the CWD:
set history filename .gdb_history
set history save

# if you use a debugger, you probably know what you are doing ...
set confirm no

# pretty print structures
set print pretty on

# use something better for x86 than the default AT&T syntax
# e.g. destination, source operand ordering FTW
python
if 'i386' in gdb.execute('show architecture', to_string=True):
    # i.e. this yields an error on other target architectures
    gdb.execute('set disassembly-flavor intel')
end
