#!/usr/bin/env bash
# Usage: ./0-whois.sh <domain>
# Məqsəd: whois çıxışındakı Registrant/Admin/Tech sətrlərini CSV "Açar,Dəyər" kimi çap etmək.

domain="$1"
# Domen verilməsə, nümunə üçün holbertonschool.com işlədək
[ -z "$domain" ] && domain="holbertonschool.com"

whois "$domain" | awk '
BEGIN {
  FS=":"                                    # Sətirləri ":" üzrə ayıracağıq
}
/^(Registrant|Admin|Tech)/ {                # Yalnız bu üç sözlə başlayan sətrlər
  key=$1                                    # Məs: "Registrant Name"
  sub(/[[:space:]]+$/, "", key)             # Açarın sonundakı boşluqları sil

  # Dəyəri qəti şəkildə götürmək üçün bütün sətrdən ilk ":"-a qədərini pozuruq,
  # beləliklə dəyərdə sonradan ":" olsa belə itmir.
  val=$0
  sub(/^[^:]*:/, "", val)                   # İlk ":"-a qədərini sil
  sub(/^[[:space:]]+/, "", val)             # Dəyərin əvvəl boşluğunu sil
  sub(/\r$/, "", val)                       # CRLF olarsa, \r-ni sil

  print key "," val                         # CSV: "Açar,Dəyər"
}'
