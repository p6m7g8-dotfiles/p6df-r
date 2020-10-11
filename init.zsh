
######################################################################
#<
#
# Function: p6df::modules::R::deps()
#
#>
######################################################################
p6df::modules::R::deps() {
  ModuleDeps=(
    p6m7g8/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::R::external::brew()
#
#>
######################################################################
p6df::modules::R::external::brew() {
}

######################################################################
#<
#
# Function: p6df::modules::R::home::symlink()
#
#>
######################################################################
p6df::modules::R::home::symlink() {

 # XXX: ENV move
}

######################################################################
#<
#
# Function: p6df::modules::R::init()
#
#>
######################################################################
p6df::modules::R::init() {

  p6df::modules::R::Renv::init "$P6_DFZ_SRC_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::R::Renv::init(dir)
#
#  Args:
#	dir - 
#
#>
######################################################################
p6df::modules::R::Renv::init() {
    local dir="$1"

    [ -n "$DISABLE_ENVS" ] && return

    RENV_ROOT=$dir/viking/Renv

    if [ -x $RENV_ROOT/bin/renv ]; then
      export RENV_ROOT
      export HAS_RENV=1

      p6df::util::path_if $RENV_ROOT/bin
      eval "$(p6_run_code renv init - zsh)"
    fi
}

######################################################################
#<
#
# Function: p6df::modules::R::prompt::line()
#
#>
######################################################################
p6df::modules::R::prompt::line() {

  p6_r_prompt_info
}

######################################################################
#<
#
# Function: p6_r_prompt_info()
#
#>
######################################################################
p6_r_prompt_info() {

  echo -n "R:\t  "
  p6_lang_version "R"
}