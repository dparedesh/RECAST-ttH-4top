# authentificate with credentials
if [ -z "$RECAST_USER" ]; then echo "Enter user name:"; read RECAST_USER; fi
if [ -z "$RECAST_PASS" ]; then echo "Enter password for $RECAST_USER:"; read -s RECAST_PASS; fi
if [ -z "$RECAST_TOKEN" ]; then echo "Enter Gitlab API access token:"; read RECAST_TOKEN; fi

eval "$(recast auth setup -a $RECAST_USER -a $RECAST_PASS -a $RECAST_TOKEN -a default)"
eval "$(recast auth write --basedir authdir)"

# add analysis temporarily to catalogue
$(recast catalogue add $PWD)
recast catalogue ls
recast catalogue describe analysis/ttH4tSSML
recast catalogue check analysis/ttH4tSSML

eval $(recast auth reana-setup)

