% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/note.R
\name{note_create}
\alias{note_create}
\title{Add note for a object}
\usage{
note_create(
  object = NULL,
  message = NULL,
  ref = NULL,
  author = NULL,
  committer = NULL,
  force = FALSE
)
}
\arguments{
\item{object}{The object to annotate (git_blob, git_commit or
git_tree).}

\item{message}{Content of the note to add}

\item{ref}{Canonical name of the reference to use. Default is
\code{note_default_ref}.}

\item{author}{Signature of the notes note author}

\item{committer}{Signature of the notes note committer}

\item{force}{Overwrite existing note. Default is FALSE}
}
\value{
git_note
}
\description{
Add note for a object
}
\examples{
\dontrun{
## Create and initialize a repository in a temporary directory
path <- tempfile(pattern="git2r-")
dir.create(path)
repo <- init(path)
config(repo, user.name = "Alice", user.email = "alice@example.org")

## Create a file, add and commit
writeLines("Hello world!", file.path(path, "example.txt"))
add(repo, "example.txt")
commit_1 <- commit(repo, "Commit message 1")

## Create another commit
writeLines(c("Hello world!",
             "HELLO WORLD!"),
           file.path(path, "example.txt"))
add(repo, "example.txt")
commit_2 <- commit(repo, "Commit message 2")

## Check that notes is an empty list
notes(repo)

## Create note in default namespace
note_create(commit_1, "Note-1")

## Create note in named (review) namespace
note_create(commit_1, "Note-2", ref="refs/notes/review")
note_create(commit_2, "Note-3", ref="review")

## Create note on blob and tree
note_create(tree(commit_1), "Note-4")
note_create(tree(commit_1)["example.txt"], "Note-5")
}
}
