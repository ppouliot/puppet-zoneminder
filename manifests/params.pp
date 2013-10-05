class zoneminder::params{

  include apache::params

  $cambozola_url     = 'http://www.zoneminder.com/sites/zoneminder.com/downloads/cambozola.jar'
  $zm_db_host        = 'localhost'
  $zm_db_name        = 'zmdb'
  $zm_db_user        = 'zm'
  $zm_db_pass        = 'hard24get'
  $zm_wwwroot        = '/var/www/html/zm'
  $zm_cgi            = '/var/www/cgi-bin'
  $zm_webuser        = $apache::params::user
  $zm_webgrp         = $apache::params::group

  $zoneminder_prereq = ['mysql-devel',
# Moved to apache-mods
#                        'php',
                        'php-gd',
                        'php-process',
                        'php-mbstring',
                        'php-pear',
                        'php-pear-DB',
                        'gcc',
                        'pcre-devel',
                        'gd',
                        'mod_ssl',
                        'glib2-devel',
                        'gcc-c++',
                        'gnutls-devel',
                        'ImageMagick',
                        'openjpeg',
                        'openjpeg-libs',
                        'openjpeg-devel',
                        'perl-Archive-Tar',
                        'perl-Date-Manip',
                        'perl-Expect',
                        'perl-LWP-UserAgent-Determined',
                        'perl-MIME-Lite',
                        'perl-MIME-tools',
                        'perl-Net-SFTP-Foreign',
                        'perl-PHP-Serialization',
                        'perl-Device-SerialPort',
                        'perl-Archive-Zip',
                        'perl-Sys-Mmap',
                        'perl-Module-Load',
                        'perl-LWPx-ParanoidAgent',
                        'perl-Time-HiRes',
                        'subversion',
                        'git',
                        'yasm',
                        'bzip2',
                        'bzip2-devel',
                        'bzip2-libs',
                        'lbzip2',
                        'ffmpeg',
                        'ffmpeg-devel',
                        'kernel-devel',
                        'audiofile-devel']

  $zm_remove_pkg_1 = ['mysql-devel',
                      'pcre-devel',
                      'glib2-devel',
                      'openjpeg-devel',
                      'bzip2-devel',
                      'ffmpeg-devel',
                      'kernel-devel',
                      'audiofile-devel']


  $zm_remove_pkg_2   = ['php',
                        'gnutls-devel',
                        'php-gd',
                        'php-process',
                        'php-mbstring',
                        'php-pear',
                        'php-pear-DB',
                        'gcc',
                        'gd',
                        'mod_ssl',
                        'gcc-c++',
                        'ImageMagick',
                        'openjpeg',
                        'openjpeg-libs',
                        'perl-Archive-Tar',
                        'perl-Date-Manip',
                        'perl-Expect',
                        'perl-LWP-UserAgent-Determined',
                        'perl-MIME-Lite',
                        'perl-MIME-tools',
                        'perl-Net-SFTP-Foreign',
                        'perl-PHP-Serialization',
                        'perl-Device-SerialPort',
                        'perl-Archive-Zip',
                        'perl-Sys-Mmap',
                        'perl-Module-Load',
                        'perl-LWPx-ParanoidAgent',
                        'perl-Time-HiRes',
                        'subversion',
                        'git',
                        'yasm',
                        'bzip2',
                        'bzip2-libs',
                        'lbzip2',
                        'ffmpeg']
}
