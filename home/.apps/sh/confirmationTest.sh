read -p "Change all file names to lower case? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "I did it."          # do dangerous stuff
fi

