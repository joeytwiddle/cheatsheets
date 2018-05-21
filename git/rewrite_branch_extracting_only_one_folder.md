    git checkout -b rewritten-branch

    git filter-branch --prune-empty --subdirectory-filter <folder_name> rewritten-branch

From: https://help.github.com/articles/splitting-a-subfolder-out-into-a-new-repository/
