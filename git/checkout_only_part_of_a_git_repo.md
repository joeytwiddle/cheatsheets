    git init <repo>
    cd <repo>
    git remote add -f origin <url>

    git config core.sparseCheckout true

    echo "some/dir/" >> .git/info/sparse-checkout
    echo "another/sub/tree" >> .git/info/sparse-checkout

From: https://askubuntu.com/questions/460885/how-to-clone-git-repository-only-some-directories#645276

