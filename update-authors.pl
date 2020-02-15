#!/usr/bin/perl
=pod

    update-authors.pl is part of Atril.

    Atril is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    Atril is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Atril.  If not, see <http://www.gnu.org/licenses/>.

=cut
use strict;
use warnings;

sub ReplaceAuthors {
  my @authors = @_;
  $_ eq 'Alexander <sanek23994%gmail.com>' and $_ = 'Alexander Ovchinnikov <sanek23994%gmail.com>' for @authors;
  $_ eq 'bl0ckeduser <bl0ckedusersoft%gmail.com>' and $_ = 'Gabriel Cormier-Affleck <bl0ckedusersoft%gmail.com>' for @authors;
  $_ eq 'Glorf <michal1.bien%gmail.com>' and $_ = 'Michał Bień <michal1.bien%gmail.com>' for @authors;
  $_ eq 'hekel <hekel%archlinux.info>' and $_ = 'Adam Erdman <hekel%archlinux.info>' for @authors;
  $_ eq 'infirit <infirit%gmail.com>' and $_ = 'Sander Sweers <infirit%gmail.com>' for @authors;
  $_ eq 'Jason Crain <jason%inspiresomeone.us>' and $_ = 'Jason Crain <jason%aquaticape.us>' for @authors;
  $_ eq 'José Aliste <jaliste%src.gnome.org>' and $_ = 'José Aliste <jaliste%gnome.org>' for @authors;
  $_ eq 'leigh123linux <leigh123linux%googlemail.com>' and $_ = 'Leigh Scott <leigh123linux%googlemail.com>' for @authors;
  $_ eq 'lyokha <alexey.radkov%gmail.com>' and $_ = 'Alexey Radkov <alexey.radkov%gmail.com>' for @authors;
  $_ eq 'Martin Wimpress <code%flexion.org>' and $_ = 'Martin Wimpress <martin%mate-desktop.org>' for @authors;
  $_ eq 'monsta <monsta%inbox.ru>' and $_ = 'Vlad Orlov <monsta%inbox.ru>' for @authors;
  $_ eq 'Monsta <monsta%inbox.ru>' and $_ = 'Vlad Orlov <monsta%inbox.ru>' for @authors;
  $_ eq 'oz123 <nahumoz%gmail.com>' and $_ = 'Oz N Tiram <nahumoz%gmail.com>' for @authors;
  $_ eq 'Piiit <pitiz29a%gmail.com>' and $_ = 'Peter Moser <pitiz29a%gmail.com>' for @authors;
  $_ eq 'rootavish <avishkar_gupta%outlook.com>' and $_ = 'Avishkar Gupta <rootavish%gmail.com>' for @authors;
  $_ eq 'rootavish <rootavish%gmail.com>' and $_ = 'Avishkar Gupta <rootavish%gmail.com>' for @authors;
  $_ eq 'raveit <chat-to-me%raveit.de>' and $_ = 'Wolfgang Ulbrich <mate%raveit.de>' for @authors;
  $_ eq 'raveit65 <chat-to-me%raveit.de>' and $_ = 'Wolfgang Ulbrich <mate%raveit.de>' for @authors;
  $_ eq 'raveit65 <mate%raveit.de>' and $_ = 'Wolfgang Ulbrich <mate%raveit.de>' for @authors;
  $_ eq 'rbuj <robert.buj%gmail.com>' and $_ = 'Robert Buj <robert.buj%gmail.com>' for @authors;
  $_ eq 'Scott Balneaves <sbalneav%ltsp.org>' and $_ = 'Scott Balneaves <sbalneav%mate-desktop.org>' for @authors;
  $_ eq 'Wolfgang Ulbrich <chat-to-me%raveit.de>' and $_ = 'Wolfgang Ulbrich <mate%raveit.de>' for @authors;
  $_ eq 'Wu Xiaotian <yetist%gmail.com>' and $_ = 'Wu Xiaotian <xiaotian.wu%i-soft.com.cn>' for @authors;
  $_ eq 'ZenWalker <scow%riseup.net>' and $_ = 'Pablo Barciela <scow%riseup.net>' for @authors;
  return @authors;
}

sub GetCurrentAuthors {
  my @authors;
  open(FILE,"shell/atril.about") or die "Can't open shell/atril.about";
  while (<FILE>) {
    if (/^Authors=*(.+)$/) {
      @authors=split(";",$1);
    }
  }
  close FILE;
  return ReplaceAuthors(@authors);
}

sub GetNewAuthors {
  my @authors = `git log --pretty="%an <%ae>" --since "2012-01-01" -- . "_.h" "_.c" | sort | uniq | sed 's/@/%/g' | sed '/^mate-i18n.*/d'`;
  chomp @authors;
  return ReplaceAuthors(@authors);
}

my @A = GetCurrentAuthors;
my @B = GetNewAuthors;
for (@B) {
  s/<\d+\+(.+?)%users\.noreply\.github\.com>/<$1%users\.noreply\.github\.com>/;
  s/<(.+?)%users\.noreply\.github\.com>/https:\/\/github.com\/$1/;
}
my @merged = sort { $a cmp $b } keys %{{map {($_ => 1)} (@A, @B)}};
print join(';',@merged) . ';';
