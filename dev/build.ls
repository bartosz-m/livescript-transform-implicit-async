config = import \../.compiler.config
# loading livescript-transform resets all loaded plugins in cjs mode
# we need to import all files that we need before we import livescript-system
import 
    \livescript-system

livescript-system
    ..watch = false
    ..clean = true
    ..config = config
    ..build!