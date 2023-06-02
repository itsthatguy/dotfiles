export PATH=$AWS_CLI:$PATH

bins_array=(
  "$DOTSCRIPTS/bins/"
  "$DOTSCRIPTS/secret-bins/"
)

shexport $bins_array
