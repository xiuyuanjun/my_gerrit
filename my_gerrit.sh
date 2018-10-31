How to git-pull a given patch set from Gerrit?Ask Question ?

When working with Gerrit (Code Review), I often need to get a copy of a given patch set for testing or validation purpose. The obvious and easiest way is to download the archive or the patch file through the Gerrit Web interface and manually apply it to my local source.
While the above steps are pretty straightforward and fulfill my needs, in the best world I would like to have the patch set appearing as a commit in my local Git.
I was looking around and didn't find the solution. I found some sparse info that once compiled together gives the following solution.

Say that you want to pull the patch set 2 of the Gerrit change 1222:

Find the remote refs we are interested in:

$ git ls-remote | grep 1220
From http://something.com:8081/MyProject
e2e0212a59240ac5cd7c11220c35542523f44b59        refs/changes/13/713/1
b8c4dceea5eaf1bad711b0ea6938c80ec932726a        refs/changes/20/1220/1
6f20c182ec7f54a2aa9e8f6188a0eef1b0790df4        refs/changes/20/1220/2
ed94a98386d224ce3d86004ce99f61220905a077        refs/changes/22/1222/1

Pull the refs:

git pull origin refs/changes/20/1220/2

#如果报错如：
#fatal: 'origin' does not appear to be a git repository
#fatal: Could not read from remote repository.
#可以执行：
#git remote add origin http://something.com:8081/MyProject

再执行：
git pull origin refs/changes/20/1220/2

This will create a Git commit point that you could eventually rebase:

git rebase
