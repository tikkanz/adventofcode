NB. =========================================================
NB. 5a
test=: 'abc'
check=: '18f47a30'

Input=: 'reyedfim'

require '~addons/ide/qt/qt.ijs'
getmd5=: 'md5'&gethash_jqtide_

is5zeros=: '00000' -: 5&{.
getSaltedMD5=: getmd5@(, ":)
filterGood=: #~ is5zeros"1

getPassword5a=: 3 :0
  8 getPassword5a y
:
  salt=. y
  pwd=. ''
  iter=. 0
  whilst. x > # pwd do.
    res=. filterGood salt&getSaltedMD5"0 iter + i.1e6
    if. #res do. pwd=. pwd , 5{"1 res end.
    iter=. iter+1e6
  end.
  x {. pwd
)

assert check -: 8 getPassword5a test

echo 8 getPassword5a Input

NB. =========================================================
NB. 5b
test=: 'abc'
check=: '05ace8e3'

getpos=: _1 ".("0)  5 {"1 ]  NB. numeric index of digit in password
getPassword5b=: 3 :0
  8 getPassword5b y
:
  salt=. y
  pwd=. 10$' '
  iter=. 0
  whilst. ' ' e. pwd do.
    res=. filterGood salt&getSaltedMD5"0 iter + i.1e6
    if. #res do.
      res=. res #~ (getpos res) e. I. ' ' = pwd  NB. only first pos
      pwd=. (6{"1 res) (getpos res)} pwd
    end.
    iter=. iter+1e6
  end.
  x {. pwd
)

assert check -: 8 getPassword5b test
echo 8 getPassword5b Input
