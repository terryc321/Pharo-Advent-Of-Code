
# 



3.10 Resources
This section complements Section 3.5. If you want to use your own pngs, have
a look at the class VÞqÞ¯éÞSA# that converts PNG files into Forms. A
form is a piece of graphical memory internally used by Pharo. So you have to
convert your graphics from or to Forms.
Here are some little scripts (that you should execute in order if you want to
reproduce their effect.)
To save a form as a PNG on your disk:
SA#VqÞ¯éÞ Ûîé"ÏÞÇʔ @#ÞÁÇÈé Þ¾"ÏÞÇ ÏÈ"¯ÁAÇʔ
ʞÞ¾ʚÛÈ§ʞ
To save a form as a text (as shown above) that you can later execute to recreate the original form.
| éÿé |
éÿé ʔ= ZéÞ¯È§ âéÞÇÏÈéÈéâʔ ʨ ʔâéÞ |
(SA#VqÞ¯éÞ ¦ÏÞÇ"ÞÏÇ"¯ÁAÇʔ ʞÞ¾ʚÛÈ§ʞ) âéÏÞGÈʔ âéÞ ʩʚ
ʝéÏ ÞÞé é¬ ¦ÏÞÇ ¦ÞÏÇ ¯éâ éÿéîÁ ÞÛÞâÈéé¯ÏÈʝ
éÿé ʔ= @#ÞÁÇÈé
G»é Þ"ÞÏÇʔ éÿé ÞZéÞÇ
Using Uuencoded strings
Storing a form in a plain text can produce large files, you can also use uuencoded of them. This is what IconFactory project is doing.
If you want to manage forms as the method cardbackForm provided in the
project, you can have a look at the IconFactory project on github.
@éÁÁÏ Èú
âÁ¯Èʔ ʙ+ÏÈ"éÏÞĀʟ
ÞÛÏâ¯éÏÞĀʔ ʞ§¯é¬îʔʠʠÛ¬ÞÏ-§ÞÛ¬¯âʠ+ÏÈ"éÏÞĀʞʟ
ÁÏ
This project supports the definition of form as textual resources in methods
that can be then versioned altogether with the code.
Given a base64 encoded string you can get a form with the following expression, here we take the base64 encoded string from +ÏÈ"éÏÞĀ`âé Èú
ÿÇÛÁ+ÏÈÏÈéÈéâ
"ÏÞÇ ¦ÞÏÇ¯ÈÞĀZéÞÇʔ +ÏÈ"éÏÞĀ`âé Èú ÿÇÛÁ+ÏÈÏÈéÈéâ
âɇɅÏ âĀéÞÞĀ ÞZéÞÇ
Following this you can generate a method body with a cache (here named
icons) as follows:
