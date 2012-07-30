#Supose you receive a tar.gz file, unpack it and by mistake you do it in, say, your home folder. The .tar.gz did not have a its contents in a root folder, meaning it polluted your home dir.

# ----------------

#How can you identify which files came through the tar and which didn't?

# > You can try to match the file list from the tar to the contents in your home dir using

# tar -tvzf filename.tar.gz

# to get a list of the files in the tar.gz

# > If you extracted the file with --same-owner you may identify them by owner

# ----------------

#How do you prevent tar to overrite any existing files?

# > Untar in a temporary directory.
# > You can use -k option (keep old files)
# > Use -P option to preserve absolute names when creating the .tar.gz
# > Use -w for interactive mode - confirmation for every action

# ----------------

#Suppose the tar was big and you figured out the mistake during the tar unpacking, and interrupted it. How could you identify which of the tar files were unpacked and which weren't? (heuristic)

# > Again, matching it with the .tar.gz list using -tvzf option. You can try joining a file listing from your directory with the .tar.gz file list, then using 'sort | uniq -d'. Duplicate lines should be the files extracted - they are the ones in both listings.

# > Some of the options above may apply (-P, --same-owner)

