Урок 4#
Выражение, Редукция
acos (cos pi)
3.1415...
max 5 42
42

(max 5) 42
42

3+ sin 42
2.0834
Частичное применение функции.
3 + (max 5) 42
45

sumSquares x y = x ^2 + y ^2
rock'n'roll = 42

let fortyTwo = 39 + 3
let f x = if x > 0 then 1 else (-1)

Prelude> f 5
1
Prelude> f (-5)
-1

let g x = (if x > 0 then 1 else (-1)) + 3
Prelude> g 5
4
Prelude> g (-7)
2

max5 x = max 5 x

Prelude> max5 4
5
Prelude> max5 42
42
let max5' = max 5 (частично примененная функция max) безточечный стиль.

let discount limit proc sum = if sum >= limit then sum*(100-proc)/100 else sum
let standartDiscount = discount 1000 5
Prelude> standartDiscount 2000
1900.0
Prelude> standartDiscount 900
900.0

prefix style
Prelude> max 6 7
7
Prelude> 6 + 7 //infix style
13
Prelude> 6 `max` 7
7
Prelude> (+) 6 7
13
Prelude>- 7
-7
Prelude> max (-6) 7
7

12#
Prelude> 3 + 5 * 8
43
Prelude> sin 5 + 4 -> (sin 5) + 4

Prelude> (3 - 9) - 5 // left associative
Prelude> 3 - (9 - 5) // right associative
Prelude> infixl  7

-- из стандартной библиотеки
infixr 8 ^, `logBase`
infixl 7 *, /, `div`, `mod`
infixl 6 +, -
infix 4 ==, /=, >, >=, <, <=

by default keft and priority 9.
13#
module Demo where
Own operators
{-
! # $ % & . / < = > ? @ \ ^ | - ~
-}
special symbol : в середине использовать

infixl 6 *+*
a *+* b = a ^ 2 + b ^ 2

Prelude>3 *+* 4
25
Prelude>(*+*) 3  4
25

(*+*) a  b = a ^ 2 + b ^ 2

#14 Частичное применение оператора
(/) 2
(2 /) - сечение оператора
функция одного аргумента
Prelude> (2 /) 4
0.5
Prelude> (/ 2) 4
2.0
Prelude> (- 2) исключение не сечение
-2

#15
module Demo where
f $ x = f x
$ - right associative
0.5
Prelude> sin 0
0.0
Prelude> sin $ 0
0.0
Чтобы избавиться от избыточных скобок.
Prelude> sin (pi/2)
1.0
Prelude> sin $ pi/2
1.0
{- f (g x (h y)) == f $ g x (h y) == f $ g x $ h y -}

#16 Числовые типы и числовые литералы
Prelude> :t 3
3::Num a => a
Prelude> let x = 3::Int
Prelude> :type x
x::Int
Prelude> let y = 3::Double
Prelude> y
3.0
Prelude> let z = y + 17
Prelude> :t z
z::Double
Prelude> :t 3.5
3.5::Fractional a => a (Double, Float)
Prelude> 1234567888899999999999999999999999999999999999999999999999999999999::Integer
1234567888899999999999999999999999999999999999999999999999999999999

#17 Вывод типа выражения
строгая статическая проверка типов.

Prelude> :type 'c'
'c'::Char
Prelude> :type '\n'
'\n'::Char

Prelude> :type True
True::Bool
Prelude> :t False
False::Bool

#17 Тип функции
->

Prelude> not False
True
Prelude> :t not
not :: Bool -> Bool

Prelude> (&&) False True
False
Prelude> ((&&) False) True // как на функцию одного аргумента

Prelude> Bool->(Bool->Bool)
-> right associative
Prelude> Bool->Bool->Bool
Bool -> ( Bool -> Bool ) the same as Bool -> Bool -> Bool
Prelude> :t (&&)
(&&)::Bool -> Bool -> Bool

#19 Импорт модулей и справочная система

module Demo where

import Data.Char

test = isDigit '7'
ghci demo

*Demo> test
True
*Demo> import Data.Complex
*Demo Data.Complex>

#20 Тип кортежа
Prelude> (2, True)
(2, True)
Prelude> (2, True, 'c')
(2, True, 'c')

Prelude> fst (2, True)
2
Prelude> snd (2, True)
True

Prelude> :t ('x', True)
('x', True)::(Char, Bool)
Prelude> (3) - единичного кортежа нет
Prelude> () - пустой кортеж
Prelude> :t ()
() :: ()

#20 Тип списка
Списки гомогенны - один тип.
Длина списка - не фиксирована.

Prelude> [1, 2 , 3]
Prelude> [False, True]
Prelude> :t [False, True]
[False, True] :: [Bool]

Prelude> :t ['H', 'i']
['H', 'i'] :: [Char]

Prelude> :t "Hi"
"Hi" :: [Char]

Prelude> "Hi" :: String

#22 Базовые операции над списками


Prelude> let str = 'H': "ello"
Prelude> str
"Hello"

Prelude> str ++ " world"
"Hello  world"

#23 Рекурсивное определение функции

module Demo where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

ghci demo

*Demo> factorial
factorial (n - 1) - // отличное от входящего аргумента
if n == 0 then 1  - // терминируещее условие

Редукция и подстановка значения

{-
factorial 2
   ~> if 2 == 0 then 1 else 2 * factorial 1
   ~> 2 * factorial 1
   ~> 2 * (if 1 == 0 then 1 else 1 * factorial 0)
   ~> 2 * 1 * factorial 0
   ~> 2 * factorial 0
   ~> 2 * (if 0 == 0 then 1 else 0 * factorial (-1))
   ~> 2 * 1
   ~> 2
-}

#24 Сопоставление с образцом

module Demo where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial' 0 = 1
factorial' n = n * factorial' (n-1)

#25 Незавершающиеся программы и ошибки
error, undefined

Prelude> error "ABC"
*** Exception: ABC

Prelude> undefined
*** Exception: Prelude.undefined

module Demo where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial' 0 = 1
factorial' n = n * factorial' (n-1)

factorial'' 0 = 1
factorial'' n = if n < 0 then error "arg must be >= 0" else n * factorial'' (n-1)


Prelude> factorial'' (-3)
*** Exception: arg must be >= 0

undefined - bottom
принято использовать маркировать еще не написанные части программы.
или куда исполнение программы никогда не дойдет.

#26 Охранные выражения (guards)

module Demo where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial' 0 = 1
factorial' n = n * factorial' (n-1)

factorial'' 0 = 1
factorial'' n = if n < 0 then error "arg must be >= 0" else n * factorial'' (n-1)

factorial''' 0 = 1
factorial''' n | n < 0 = error "arg must be >= 0"
               | n > 0 = n * factorial''' (n-1)


factorial4::Integer->Integer
factorial4 n | n == 0 = 1
             | n > 0 = n * factorial''' (n-1)
             | otherwise = error "arg must be >= 0"

#27 Рекурсия с явным аккумулятором.

factorial5::Integer->Integer
factorial5 n  | n >= 0 = helper 1 n
              | otherwise = error "arg must be >= 0"

helper acc 0 = acc
helper acc n = helper (acc * n) (n - 1)

#28 Отступы.
Табуляция - 8 пробелов

module Demo where

roots:: Double -> Double -> Double -> (Double, Double)

roots a b c =
  (
    (-b - sqrt(b ^ 2 - 4 * a *c)) / (2 * a)
  ,
    (-b + sqrt(b ^ 2 - 4 * a *c)) / (2 * a)
  )

roots:: Double
     -> Double
     -> Double
     -> (Double, Double)

#29 Выражение let..in..

module Demo where

roots:: Double -> Double -> Double -> (Double, Double)

roots a b c =
  (
    (-b - sqrt(b ^ 2 - 4 * a *c)) / (2 * a)
  ,
    (-b + sqrt(b ^ 2 - 4 * a *c)) / (2 * a)
  )

roots' a  b c =
   let d = sqrt (b ^ 2 - 4 *a * c) in //локальное связывание
   ((-b -d) / (2* a), (-b + d ) / (2 * a))

let x = True in (True, x)
(True, True)

roots'' a  b c =
   let { d = sqrt (b ^ 2 - 4 *a * c); x1 = (-b -d) / (2* a); x2 = (-b + d ) / (2 * a) }
   in (x1, x2)

roots''' a  b c =
   let
      x1 = (-b -d) / aTwice
      x2 = (-b + d ) / aTwice
      d = sqrt $ b ^ 2 - 4 *a * c
      aTwice = 2 * a
   in (x1, x2)

#30 Локальные связывания функций и образцов.
factorial6 n
    | n >= 0 = let
        helper acc 0 = acc
        helper acc n = helper (acc * n) (n - 1)
      in helper 1 n
    | otherwise = error "arg must be >= 0"

rootDiffs a b c = let
    (x1, x2) = roots a b c
    in x2 - x1

#31 Конструкция where

roots'''' a  b c = (x1, x2) where
   x1 = (-b -d) / aTwice
   x2 = (-b + d ) / aTwice
   d = sqrt $ b ^ 2 - 4 *a * c
   aTwice = 2 * a

let in - выражение
let x = 2 in x^2
where выражением не является
x^2 where x = 2 - неправильно, только в теле функций.


factorial7::Integer->Integer
factorial7 n  | n >= 0 = helper 1 n
              | otherwise = error "arg must be >= 0"
  where
     helper acc 0 = acc
     helper acc n = helper (acc * n) (n - 1)


#32 Полиморфные функции. (может быть вызвана на значениях разных типов)
for example
(+) - полиморфный оператор.
полиморфизм - параметрический и специальный.
Prelude> let id x = x
Prelude> :t id
id::t -> t

Prelude> id True
True
Prelude> id 5
5
Prelude> (id id) 4
4
Prelude>:t id True
id True :: Bool

Prelude>:t (id id)
(t - > t) -> (t - > t)
(t - > t) -> t - > t
Prelude>:t (id id)
(id id):: t -> t

Prelude> let k x y = x
Prelude> k 42 True
42

Prelude> k 42 55
42

Prelude> :t k
k:: t1 -> t -> t1
Prelude> :t const
k:: a -> b -> a

Prelude> :t const True
const True::b -> Bool

Prelude> :t undefined
undefined::a //подходит для любого типа. (универсально полиморфный тип)


Prelude> :t error "AAA!!!!111"
error "AAA!!!!111"::a

Prelude> :t error
error :: [Char] -> a

#33 Наиболее общий тип.

Ограничение полиморфизма указание явного типа.

module Demo where

mono:: Char -> Char
mono x = x

semiMono :: Char -> a -> Char // частичное ограничение
semiMono x y = x

Алгоритм Хиндли Дамаса Миллера. (самый общий)

#34 Функции высших порядков

Prelude> :t ($)
($) :: (a -> b) -> a -> b

module Demo where

apply2 f x = f (f x) //когда a и b одинаковые.

Prelude> :t apply2
apply2 :: (t -> t) -> t -> t

Prelude> apply2 (+5) 22
32
Prelude> apply2 (++ "AB") "CD"
"CDABAB"

-- flip f y x = f x y

Prelude> flip (/) 4 2
0.5
Prelude> (/) 4 2
2.0
Prelude> flip const 5 True
True
Prelude> :t flip
flip :: (a -> b -> c)-> a -> b -> c

Prelude> :t flip const
flip const :: b -> c -> c

#35 Анонимные функции - лямбда

Prelude> let f x = 2 * x + 7
Prelude> f 10
27

Prelude> (\x -> 2 * x + 7) 10
27

Prelude> let f' = \x -> 2 * x + 7
Prelude> f' 10
27

Prelude> let lenVec x y = sqrt $ x^2 + y^2
Prelude> let lenVec x = \y -> sqrt $ x^2 + y^2
Prelude> let lenVec = \x ->\y -> sqrt $ x^2 + y^2
Prelude> lenVec 3 4
5
Prelude> let lenVec = \x y -> sqrt $ x^2 + y^2
Prelude> lenVec 3 4
5

Prelude> let p1 = ((1, 2), (3, 4))
Prelude> let p2 = ((3, 4), (5, 6))
Prelude> fst $ fst p1
1

module Demo where
import Data.Function

sumFstFst = (+) `on` helper
   where helper pp = fst $ fst pp

Prelude> sumFstFst p1 p2

sumFstFst' = (+) `on` (\pp -> fst $ fst pp)

#36 Оператор композиции функций

Две полиморфные функции f и g

f :: b -> c
g :: a -> b
x::a

g x -b
f (g x)->c
Получить функцию a -> c
\x -> f (g x)

Prelude> let compose f g = \x -> f (g x)
Prelude> :t compose
compose :: (t1 -> t) -> (t2 -> t1) -> t2 -> t

Prelude> :i (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
infixr 9 .

sumFstFst' = (+) `on` (fst . fst)

doIt x = f ( g (h x ))
doIt = f . (g . h)

#37 Полиморфизм кортежей и списков

Prelude> :t [True, False]
[True, False] :: Bool

Prelude> :t "aqaqa"
"aqaqa" :: [Char]

Prelude> :t []
[] :: [a]

Prelude> :t (++)
(++) :: [a] -> [a] -> [a]

Prelude> :t (:)
(:) :: a -> [a] -> [a]

Prelude> (,) True 3
(True, 3) - миксфиксный стиль

Prelude> (,,) True 3 'c'

Prelude> :t (,)
(,) :: a -> b -> (a, b)
Prelude> :t (,,)
(,) :: a -> b -> c-> (a, b, c)

Prelude> :t (,) True 'c'
(,) True 'c' :: (Bool, Char)

Prelude> let dup x = (x,x)
Prelude> :t dup
dup:: t -> (t,t)

Prelude> :t fst
fst :: (a, b) -> a

#38 Каррирование.

module Demo where
import Data.Function

avg:: (Double, Double) -> Double
avg p = (fst p + snd p) / 2

Prelude> fst (1, 2) // можно смотреть как на функцию двух аргументов
1

Prelude> :t on
on::(b->b->c)->(a->b)->a->a->c

Prelude> :t fst `on` (^2)

Prelude> :t curry fst `on` (^2)
curry fst `on` (^2) :: Num c => c -> c -> c

Prelude> :t curry avg `on` (^2)
curry avg `on` (^2) :: Double -> Double -> Double

Prelude> cur f x y = f (x, y)

Prelude> :t uncurry
uncurry:: (a->b->c) -> (a, b) -> c

#39 Контексты
Prelude> :t 7
7 :: Num a => a
Num a - контекст

Prelude> :t (+)
(+) :: Num a => a -> a -> a

Prelude> :t (>)
(>) :: Ord a => a -> a -> Bool

Prelude> :t (> 7)
(> 7)::(Num a,  Ord a) => a -> Bool

Prelude> :t (> (1,2))
(> (1,2)) :: (Num t, Num t1, Ord t, Ord t1) => (t,t1) -> Bool

#40 Объявление класса типов

module Demo where

class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool

Prelude> :t (==)
(==) :: Eq a => a -> a -> Bool

Prelude> :t (== 42)
(== 42) :: (Eq a, Num a) => a -> Bool
Prelude> :t (== 'x')
(== 'x') :: Char -> Bool

Prelude> :t elem
elem :: Eq a => a -> [a] -> Bool

#41 Объявление представителей класса типов

module Demo where

class Eq a where
    (==), (/=) :: a -> a -> Bool

instance Eq Bool where
    True  == True  = True
    False == False = True
    _     == _     = False

    x /= y = not (x == y)

class Eq a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y) //реализация по умолчанию в интерфейсе(класс типов)

instance Eq Bool where
    True  == True  = True
    False == False = True
    _     == _     = False


циклические
class Eq a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y) //реализация по умолчанию в интерфейсе(класс типов)
    x == y = not (x /= y)

// при реализации теперь можно реализовать одно из двух.

instance Eq Bool where
    True  == True  = True
    False == False = True
    _     == _     = False

// в документации minimal complete defenition - минимальное полное определение.

#42 Полиморфизм кортежей и списков.

module Demo where

class Eq a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y)
    x == y = not (x /= y)

instance Eq Bool where
    True  == True  = True
    False == False = True
    _     == _     = False

instance Eq a, Eq b => Eq (a, b) where
   p1 == p2 = fst p1 == fst p2 && snd p1 == snd p2

id == (\x -> x) функции сравнивать на равенство невозможно.

#43 Расширение класса(Class Extention)

module Demo where

class Eq a where
    (==), (/=) :: a -> a -> Bool
    x /= y = not (x == y)
    x == y = not (x /= y)

class (Eq a) => Ord a where
    (<), (<=), (>=), (>) :: a -> a -> Bool
    max, min :: a -> a -> a
    compare :: a -> a -> Ordering
{- Minimal complete definition: either compare or <= -}
// реализация по умолчанию циклическая по этому compare or <= нужно реализовать все остальное выводится.

Prelude> :i Ordering
data Ordering = LT | EQ | GT

//множественное наследование
class (Eq a, Printable a) => MyClass a where
...
MyClass расширение класов типов Eq, Printable
не наследование реализации, а наследование интерфейсов. (граф наследования)

#44 Классы Show и Read
Prelude> :t show
show :: Show a => a -> String


Prelude> show 5
"5"
Prelude> show 5.0
"5.0"
Prelude> show [1,2]
"[1,2]"

Prelude> :t read
read :: Read a => String -> a

Prelude> read "5" error

Prelude> read "5"
Prelude> read "5" :: Int
5

Prelude> read "5" :: Double
5.0

Prelude> read "[1,2]" :: Double
[1.0,2.0]

Prelude> reads "5 rings" :: [(Int,String)]
[(5," rings")]

#45 Классы Enum и Bounded

module Demo where

class Enum a where
   succ, pred :: a -> a
   toEnum :: Int -> a
   fromEnum :: a -> Int

Prelude> succ 4
5

Prelude> pred 4
3

Prelude> succ 'z'
'{'

Prelude> fromEnum 'z'
122

Prelude> toEnum 122::Int
122

Prelude> toEnum 122::Char
'z'

class Bounded a where // для указания верхней и нижней границу
    minBound, maxBound :: a

Prelude> succ False
True

Prelude> succ True error

Prelude> minBound Bool
False

Prelude> maxBound Bool
True

#46 Класс Num и его расширения

module Demo where

class Num a where
   (+), (-), (*) :: a -> a -> a
   negate :: a -> a
   abs :: a -> a
   signum :: a -> a
   fromInteger :: Integer -> a

   x - y = x + negate y
   negate x = 0 - x

Prelude> fromInteger 3
3

Prelude> :t fromInteger 3
fromInteger 3 :: Num a => a

{-
LAW abs x * signum x == x
-}

type Integral :: * -> Constraint
class (Real a, Enum a) => Integral a where
  quot :: a -> a -> a  // более ефективный аналог div
  rem :: a -> a -> a   // более ефективный аналог rem нюансы со знаками
  div :: a -> a -> a
  mod :: a -> a -> a
  quotRem :: a -> a -> (a, a)
  divMod :: a -> a -> (a, a)
  toInteger :: a -> Integer
  {-# MINIMAL quotRem, toInteger #-}
        -- Defined in `GHC.Real'
instance Integral Word -- Defined in `GHC.Real'
instance Integral Integer -- Defined in `GHC.Real'
instance Integral Int -- Defined in `GHC.Real'

Prelude> :i Fractional
type Fractional :: * -> Constraint
class Num a => Fractional a where
  (/) :: a -> a -> a
  recip :: a -> a
  fromRational :: Rational -> a
  {-# MINIMAL fromRational, (recip | (/)) #-}
        -- Defined in `GHC.Real'
instance Fractional Float -- Defined in `GHC.Float'
instance Fractional Double -- Defined in `GHC.Float'

Prelude> :i Floating
type Floating :: * -> Constraint
class Fractional a => Floating a where
  pi :: a
  exp :: a -> a
  log :: a -> a
  sqrt :: a -> a
  (**) :: a -> a -> a
  logBase :: a -> a -> a
  sin :: a -> a
  cos :: a -> a
  tan :: a -> a
  asin :: a -> a
  acos :: a -> a
  atan :: a -> a
  sinh :: a -> a
  cosh :: a -> a
  tanh :: a -> a
  asinh :: a -> a
  acosh :: a -> a
  atanh :: a -> a
  GHC.Float.log1p :: a -> a
  GHC.Float.expm1 :: a -> a
  GHC.Float.log1pexp :: a -> a
  GHC.Float.log1mexp :: a -> a
  {-# MINIMAL pi, exp, log, sin, cos, asin, acos, atan, sinh, cosh,
              asinh, acosh, atanh #-}
        -- Defined in `GHC.Float'
instance Floating Float -- Defined in `GHC.Float'
instance Floating Double -- Defined in `GHC.Float'

Prelude> :i RealFrac
type RealFrac :: * -> Constraint
class (Real a, Fractional a) => RealFrac a where
  properFraction :: Integral b => a -> (b, a)
  truncate :: Integral b => a -> b
  round :: Integral b => a -> b
  ceiling :: Integral b => a -> b
  floor :: Integral b => a -> b
  {-# MINIMAL properFraction #-}
        -- Defined in `GHC.Real'
instance RealFrac Float -- Defined in `GHC.Float'
instance RealFrac Double -- Defined in `GHC.Float'

Prelude> :i RealFloat
type RealFloat :: * -> Constraint
class (RealFrac a, Floating a) => RealFloat a where
  floatRadix :: a -> Integer
  floatDigits :: a -> Int
  floatRange :: a -> (Int, Int)
  decodeFloat :: a -> (Integer, Int)
  encodeFloat :: Integer -> Int -> a
  exponent :: a -> Int
  significand :: a -> a
  scaleFloat :: Int -> a -> a
  isNaN :: a -> Bool
  isInfinite :: a -> Bool
  isDenormalized :: a -> Bool
  isNegativeZero :: a -> Bool
  isIEEE :: a -> Bool
  atan2 :: a -> a -> a
  {-# MINIMAL floatRadix, floatDigits, floatRange, decodeFloat,
              encodeFloat, isNaN, isInfinite, isDenormalized, isNegativeZero,
              isIEEE #-}
        -- Defined in `GHC.Float'
instance RealFloat Float -- Defined in `GHC.Float'
instance RealFloat Double -- Defined in `GHC.Float'


#47 Модели вычислений

module Demo where

sumIt :: Int -> Int -> Int
sumIt x y = x + y

Prelude> sumIt (1 + 2 ) 3
6

енергичная стратегия
ленивая стратегия - принята в Haskell.

{-
ленивая стратегия
sumIt (2 + 3) 4
  ~> (2 + 3) + 4
  ~> 5 + 4
  ~> 9

енергичная стратегия
sumIt (2 + 3) 4
  ~> sumIt 5  4
  ~> 5 + 4
  ~> 9
-}

redox

#48 Свойства ленивой модели

add7::Int -> Int -> Int
add7 x y = x + 7

{-
редукция
add7 1 (2 + 3)
   ~> 1 + 7
   ~> 8

add7 1 (2 + 3)
     ~> add7 1 5
     ~> 1  + 7
     ~> 8
-}

dup :: Int -> (Int, Int)
dup x = (x, x)

{-
dup (2+3)
   ~> (2+3, 2+3)
   ~> (5, 2+3)
   ~> (5, 5)

dup (2+3)
   ~> dup 5
   ~> (5, 5)

// механизм разделения -> оптимизация, сокращения графа.
dup (2+3)
   ~> (p, p) p = 5
   ~> (5, p)
   ~> (5, 5)
-}

#49 Строгие и нестрогие функции

module Demo where

const42 :: a -> Int
const42 = const 42

Prelude> const42 True
42

Prelude> const42 123
42

елеминировать расходимости.
Prelude> const42 undefined
нестрогая функция.

строгие и нестрогие функции.

#50 Слабая головная нормальная форма (weak head normal form)

{-
NF ( нельзя произвести дополн вычислений)
42
(3,4)
\x -> x + 2

не NF
"Real " + "world" (имеется редокс и можно выполнить редукцию)
sin (pi/2)
(\x -> x + 2) 5
(3, 1+5)

WHNM (слабая заголовочная норм. форма)
\x -> x + 2*3
(3, 1+5)
(,) (4*5)
(+) (7^2)
WHNM  > NF

#51 Форсирование вычислений

thunc - отложенная цепочка вычислений.

sec - нарушает ленивую
{-
seq:: a-> b -> b (flip const)
seq _|_ b = _|_ (первый аргумент расходится - расходится)
seq a b   = b
-}

Prelude> seq 1 2
2

Prelude> seq undefined 2
*** Exception: Prelude.undefined

Prelude> seq (id undefined) 2
*** Exception: Prelude.undefined

Prelude> seq (undefined, undefined) 2
2

Prelude> seq (\x->undefined) 2
2

seq - форсирует вычисление но до WHNM.

#52 Аппликация с вызовом по значению


module Demo where

{-
seq:: a-> b -> b (flip const)
seq _|_ b = _|_ (первый аргумент расходится - расходится, _|_ - bottom)
seq a b   = b

($!) :: (a -> b) -> a -> b
f $! x = x `seq` f x (вычислить аргумент x и применить функцию f)
строгий оператор применения, апликация с вызовом по значению.
-}

Prelude> const 42 undefined
42

Prelude> const 42 $ undefined
42

Prelude> const 42 $! undefined
*** Exception: Prelude.undefined

factorial::Integer -> Integer
factorial n | n >= 0 = helper 1 n
            | otherwise = error "arg must be >= 0"
    where
       helper acc 0 = acc
       helper acc n = (helper $! (acc * n)) (n-1)

53 Модули
Программа - набор модулей
Main module

demo.hs

module Demo where
Неявно импортируется Prelude

import Data.Char
char.hs
Data - директория
Data.Char - Data\char.hs

Prelude> toLower 'C'
'c'

import Data.Char (toUpper)
import Data.Char (toUpper, toLower)
import Data.Char hiding (toLower)

import Data.List
import Data.Set

Prelude> :t union error (Data.List?, Data.Set? in both)
Prelude> :t Data.List.union
Data.List.union :: Eq a => [a] -> [a] -> [a]

import qualified Data.Set (префикс)

import qualified Data.Set as Set - псевдоним
Prelude> :t Set.union
Set.union :: Ord a => Set.Set a -> Set.Set a -> Set.Set a

import Prelude hiding (имя функции)

#54 Экспорт модулей

module Test where

sumIt x y = x + y
const42 = const 42

module Demo where

import Test
f1 = const42 True
f2 = sumIt 3 4

*Demo> f1
42
*Demo> f2
7

Ограничить
module Test(sumIt) where
const42 - недоступна теперь для Demo.

#55 Этапы компиляции
-> core -> STG(графовая машина, редукция) -> C-- -> C, LVVM.

#56 Конструирование списков
Списки - рекурсивным поределением типов данных.
базовый контейнерный тип.
Prelude> []
[]
Prelude> 3 : []
[3]

Prelude> let lst = 5 : 3 : []
Prelude> lst
[5,3]
: - правоасоциативный бинарный оператор.
Prelude> 7 : lst
[7,5,3]

Prelude> [5,3] == lst
True


Prelude> let cons42 = (42 : ) //сечение опреатора
Prelude> :t cons42
cons42:: [Integer] -> [Integer]
Prelude> cons42 [1,2,3]
[42,1,2,3]

#57 Деконструкция списков

Prelude> :t head
head :: [a] -> a

Prelude> head [1,2,3]
1

Prelude> :t tail
tail :: [a] -> [a]

Prelude> tail [1,2,3]
[2,3]

head, tail - частичные функции.
Prelude> head []
*** Exception: Prelude.head: empty list

second :: [a] -> a
second xs = head (tail xs)
xs - список иксов(x)

Prelude> second [1,2,3]
2
second - частичная не будет работать уже при second [1]

second :: [a] -> a
second = head . tail

Prelude> second [1,2,3]
2

Сопоставление с образцом
(,) - конструктор образца.
let fst' ((,) x y) = x

Prelude> fst' ("Hi" , 3)
"Hi"

let head' ((:) x xs) = x

Prelude> head' [1,2,3]
1

Prelude> let tail' (x : xs) = xs
(x : xs) - infix style

Prelude> let tail' [1,2,3]
[2,3]

Prelude> let tail'' (_ : xs) = xs

second :: [a] -> a
second = head . tail


second' :: [a] -> a
second' = (_ : xs) = head xs
Prelude> second' [1,2,3]
2

second'' :: [a] -> a
second'' = (_ : x : _) = x

58 Рекурсия над списками

module Demo where
import Prelude hiding (length, (++), null)

length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs
1 + 1 + 1 .. + 0

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x : xs ++ ys
(x:xs) ++ ys = x : (xs ++ ys)
first list - n, second - k
n

null :: [a] -> Bool
null [] = True
null  _ = False

#59 Рекурсия над списками 2

module Demo where

import Prelude hiding (last, init, reverse)

last:: [a] -> a
last (x:[]) = x
last (_:xs) = last xs

init :: [a] -> a
init [x] = []
init (x:xs) = x : init xs

(x:[]) - [x] the same

init :: [a] -> a
init [_] = []
init (x:xs) = x : init xs

Prelude> init [1,2,3]
[1,2]

init :: [a] -> a
init [] = error "ERROR!!"
init [_] = []
init (x:xs) = x : init xs

Prelude> init []
*** Exception: ERROR!!

{-
sum, product :: (Num a) => [a] -> a
maximum, minimum :: (Ord a) => [a] -> a
-}

reverse :: [a] -> [a]
reverse l = rev l [] where
   rev []     a = a
   rev (x:xs) a = rev xs (x:a)

Prelude> reverse "ABCD"
"DCBA"

#61 Сопоставление с образцами по списочному и несписочному аргументам

module Demo where

import Prelude hiding (take, drop, splitAt, (!!))

take :: Int -> [a] -> a
take n _ | n <= 0 = []
take _  []        = []
take n (x:xs)     = x : take (n-1) xs

Prelude> take 5 "Hello World!"
"Hello"

Prelude> take 5 "Hi"
"Hi"

drop :: Int -> [a] -> [a]
drop n xs | n <= 0 = xs
drop _ []          = []
drop n (_:xs)      = drop (n-1) xs

splitAt :: Int -> [a] -> ([a], [a])
splitAt n xs = (take n xs, drop n xs)

(!!) обратится по индексу в списке

xs     !! n | n < 0 = error "Prelude.!!: negative index"
[]     !! _         = error "Prelude.!!: index to large"
(x:_)  !! 0         = x
(_:xs) !! n         = xs !! (n-1)

Prelude> "Hello World!" !! 6
'W'

#62 Функции с аргументами предикатами

module Demo where

import Prelude hiding (filter, takeWhile, dropWhile, span, break)

filter :: (a->Bool) -> [a] -> [a]
filter p [] = []
filter p (x:xs)
    | p x       = x: filter p xs
    | otherwise = filter p xs

Prelude> filter (< 3) [1, 2, 3, 4, 1, 2, 3, 4]
[1,2,1,2]

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs)
   | p x       = x : takeWhile p xs
   | otherwise = []

Prelude> takeWhile (< 3) [1, 2, 3, 4, 1, 2, 3, 4]
[1,2]

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p xs@(x:xs')
   | p x       = dropWhile p xs'
   | otherwise = xs

Prelude> dropWhile (< 3) [1, 2, 3, 4, 1, 2, 3, 4]
[3, 4, 1, 2 ,3 ,4]

span :: (a -> Bool) -> [a] -> ([a],[a])
span p xs = (takeWhile p xs, drop While p xs)

break :: (a -> Bool) -> [a] -> ([a],[a])
break p = span(not . p)

Prelude> span (< 3) [1, 2, 3, 4, 1, 2, 3, 4]
([1, 2], [3, 4, 1, 2 ,3 ,4])

Prelude> break (> 3) [1, 2, 3, 4, 1, 2, 3, 4]
([1, 2 , 3], [4, 1, 2 ,3 ,4])

#63 Функция map

module Demo where

import Prelude hiding (map, concat, concatMap)

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs

Prelude> map (+10) [1, 2, 3, 5]
[11, 12, 13, 15]

Prelude> map (^2) [1, 2, 3, 5]
[1, 4, 9, 25]

Prelude> map length ["aa", "bbb", "ccccccc"]
[2, 3, 7]

concat :: [[a]] -> [a]
concat []       = []
concat (xs:xss) = xs ++ concat xss

Prelude> concat ["Hello", " ", "world", "!"]
"Hello world!"

concatMap :: (a -> [b]) -> [a] -> [b]
cocatMap f = concat . map f
//cocatMap f xs = concat (map f xs)

Prelude> concatMap (\x -> [x, x ,x]) "ABCD"
"AAABBBCCCDDD"

#64 Использование map

module Demo where

import Prelude hiding (and, or, all, any)

and, or :: [Bool] -> Bool

and []     = True
and (x:xs) = x && and xs

or []      = False
or (x:xs)  = x || or xs

all :: (a -> Bool) -> [a] -> Bool
all p = and . map p

Prelude> all odd [1, 3, 5]
True
Prelude> all odd [1, 2, 3, 5]
False

any ::(a -> Bool) -> [a] -> Bool
any p = or . map p

Prelude> any odd [1, 3, 5, 2]
True

Prelude> any even [1, 3, 5]
False

Prelude> words "Abc is not ABC"
["Abc", "is", "not", "ABC"]

Prelude> unwords . words $ "Abc is not ABC"
"Abc is not ABC"

Prelude> unwords . map reverse . words $ "Abc is not ABC"
"cbA si ton CBA"

revWords :: String -> String
revWords = unwords . map reverse . words

#65 Этапы компиляции

module Demo where

import Prelude hiding (zipWith, zipWith3)

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _  []    _   = []
zipWith _  _     []  = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

Prelude> zipWith (+) [1,2] [3,4,5]
[4,6]
Prelude> zipWith (,) [1,2] [3,4,5]
[(1,3),(2,4)]

#66 Бесконечные списки

Prelude> let bot = not bot
Prelude> bot
бесконечный цикл зависает

Prelude> let ones = 1 : ones
Prelude> :t ones
ones :: [Integer]

Prelude> let nats n = n : nats (n + 1)
Prelude> nats 5
печатает числа

Prelude> take 10 $ nats 5
[5 , 6, 7 ,8 , 9, 10, 11, 12, 13, 14]
Prelude> head $ nats 42
42

{-
head (x:xs) = x
head [] = error "Empty list"

head $ nats 42   -- сопоставление с образцом в head
~> head (42, nats (42 + 1)) -- подстановка определения head
~> 42

head $ nats (40+2)   -- сопоставление с образцом в head
~> head (40+2), nats (40+2) + 1)) -- подстановка определения head
~> 40+2
~> 42
-}

Prelude> let squares = map (^2) $ nats 1
Prelude> :t squares
squares :: [Integer]

Prelude> take 10 $ squares
[1, 4 ,9, 16, 25, 36, 49 ,64, 81, 100]

#67 Функции, порождающие бесконечные списки

module Demo where

import Prelude hiding (repeat, replicate, cycle, iterate)

repeat :: a -> [a]
repeat x = xs where xs = x : xs

Prelude> take 5 $ repeate 'z'
"zzzzz"

replicate :: Int -> a -> [a]
replicate n x = take n (repeat x)

Prelude> replicate 5 'z'
"zzzzz"

cycle :: [a] -> [a]
cycle [] = error "cycle: empty list"
cycle xs = ys where ys = xs ++ ys

iterate :: (a -> a) -> a -> [a]
iterate f x = x : iterate f (f x)

Prelude> take 5 $ iterate (^2) 2
[2, 4, 16, 256, 65536 ]

#68 Арифметические последовательности

Prelude> [1..10]
[1, 2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10]

Prelude> enumFromTo 1 10
[1, 2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10]

Prelude> :t enumFromTo
enumFromTo  :: Enum a => a -> a -> [a]

Prelude> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"

// Шаг
Prelude> [1, 3..10] //шаг 2 список нечетных чисел.
[1, 3, 5, 7, 9]

Prelude> enumFromThenTo 1 3 10
[1, 3, 5, 7, 9]

Prelude> take 5 $ [1..]
[1, 2, 3, 4, 5]

Prelude> take 5 $ enumFrom 1
[1, 2, 3, 4, 5]

Prelude> take 5 $ [7, 14 ..]
[1, 2, 3, 4, 5]

#69 Выделение списков (list comprehension)
Prelude> let xs = [1..20]
Prelude> [ x^2 | x <- xs ]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400]

Prelude> [ x^2 | x <- xs,  x^2 < 200 ]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196]

Prelude> [ (x, y) | x <- [1,2],  y <- [1,2]]
[(1, 1), (1,2), (2,1), (2,2)]

Prelude> [ (x, y, z) | x <- xs,  y <- xs,  z <- xs, x^2 + y^2==z^2, x <= y]
[ (3, 4, 5), (5, 12, 13), (6, 8, 10), (8, 15, 17), (9, 12, 15), (12, 16, 20)]

#70 Определение правой свёртки

module Demo where

import Prelude hiding (foldr)

sumList :: [Integer] -> Integer
sumList []  = 0
sumList (x:xs) = x + sumList xs

productList ::[Integer] -> Integer
productList []  = 1
productList (x:xs) = x * productList xs

concatList :: [[a]] -> [a]
concatList []  = []
concatList (x:xs) = x ++ concatList xs

foldr :: ( a -> b -> b)-> b -> [a] -> b //свертка
foldr f ini [] = ini
foldr f ini (x:xs) = x `f` foldr f ini xs

Prelude> sumList [1,2,3]
6

sumList :: [Integer] -> Integer
//sumList xs = foldr (+) 0 xs
sumList = foldr (+) 0


Prelude> sumList [1,2,3]
6

#71 Оформление сворачивающей функции

foldr :: ( a -> b -> b)-> b -> [a] -> b //свертка
foldr f ini [] = ini
foldr f ini (x:xs) = x `f` foldr f ini xs

-- посчитать сумму квадратов положительных элементов списка
sumPositiveSquares :: [Integer] -> Integer
--sumPositiveSquares = undefined
sumPositiveSquares = foldr (\x s -> if x > 0 then x^2 + s else s) 0

Prelude> sumPositiveSquares [1,(-2),3]
10

sumPositiveSquares = foldr f 0 where
      f x s | x > 0 = x^2 + s
            | otherwise = s

#72 Порядок обхода списка при свёртке

Prelude> foldr (-) 5 [1,2,3]
-3
Prelude> (1 - (2 - (3 - 5)))
-3

{-
foldr f ini 1:2:3:[]
~-> 1 `f` foldr f ini (2:3:[])
~-> 1 `f` (2 `f` foldr f ini (3:[]))
~-> 1 `f` (2 `f` (3 `f` foldr f ini []))
~-> 1 `f` (2 `f` (3 `f` ini))
-}

#73 Левая свёртка
module Demo where

import Prelude hiding (foldl)

{-
foldr f ini [1,2,3] ~>> 1 `f` (2 `f` (3 `f` ini))

((ini `f` 1) `f` 2) `f` 3

f(f(f ini 1) 2) 3)

foldl :: (b -> a -> b) -> b -> [a] -> b
-}

#74 Реализация левой свёртки

module Demo where

import Prelude hiding (foldl)

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f (f ini x) xs

{-
foldl f ini 1:2:3:[]
~-> foldl f (f ini 1) (2:3:[])
~-> foldl f (f (f ini 1) 2) (3:[])
~-> foldl f (f (f (f ini 1) 2) 3) []
~-> f (f (f ini 1) 2) 3) --большое отложенное выражение thunk
-}

для левой свертки есть строгая версия, которая в хаскеле обычно используется.

#75 Строгая версия левой свёртки

module Demo where

import Prelude hiding (foldl)
{-
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f (f ini x) xs
-}

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f ini' xs
    where ini' = f ini x

// Строгая версия Data.List
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f ini [] = ini
foldl' f ini (x:xs) = ini' `seq` foldl' f  ini' xs
         where ini' = f ini x

#76 Продуктивность правой свёртки

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f (f ini x) xs

foldr :: ( a -> b -> b)-> b -> [a] -> b
foldr f ini [] = ini
foldr f ini (x:xs) = f x (foldr f ini xs)

any :: (a -> Bool) -> [a] -> Bool
any p = foldr (\x b -> px || b) False

{-
any (==2) [1..]
~> foldr (\x b -> (==2) x || b) False (1:[2..])
~> (\x b -> (==2) x || b) 1 (foldr (\x b -> (==2) x || b) False [2..])
~> False || (foldr (\x b -> (==2) x || b) False [2..])
~> (foldr (\x b -> (==2) x || b) False 2:[3..])
~> True || (foldr (\x b -> (==2) x || b) False [3..])
~> True
-}

(||) :: Bool -> Bool -> Bool
False || x  = x
True  || _  = True

#77 Свёртки-многостаночники
Prelude> foldr (\x (s, p) -> (x+s, x*p)) (0,1) [1,2,3,4]
(10,24)

#78 Версии свёрток без начального значения

foldr1 :: (a -> a -> a)-> [a] -> a // более мономорфен
foldr1 _ [x] = x
foldr1 f (x:xs) = f x (foldr1 f xs)
foldr1 _ [] = error "foldr1: EmptyList"


foldl1 :: (a -> a -> a)-> [a] -> a
foldl1 f (x:xs) = foldl f x xs
foldl1 _ []     = error "foldl1: EmptyList"

maximum :: (Ord a) => [a] -> a
maximum = foldl1 max

#79 Левое сканирование

module Demo where

import Prelude hiding (foldl, scanl)

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f ini [] = ini
foldl f ini (x:xs) = foldl f (ini `f` x) xs

{-
foldl f ini [1, 2, 3] ~>> ((ini `f` 1) `f` 2) `f` 3

??? ~>> [ini, ini `f` 1, (ini `f` 1) `f` 2, ((ini `f` 1) `f` 2) `f` 3]
-}

scanl :: (b -> a -> b) -> b -> [a] -> b
scanl f ini    = [ini]
scanl f ini (x:xs) = ini : scanl f (ini `f` x) xs

Prelude> scanl (*) 1 [1..10]
[1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800]
(первые 10 факториала)

#80 Продуктивность левого сканирования

module Demo where

import Data.List (scanl)

facs :: (Num a, Enum a) => [a]
facs = scanl (*) 1 [1..]

partialSum :: Num a => [a] -> [a]
partialSum = scanl (+) 0

Prelude> facs !! 5 -- находим факториал по индексу елемента
120

Prelude> partialSum [1..10]
[0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

Prelude> take 15 . partialSum . map (**(-1)) $ facs

[0.0, 1.0, 2.0, 2.5, 2.666666666665, 2.70833333 , 2.71666 ... ]

#81 Правое сканирование

module Demo where

import Prelude hiding (foldr, scanr)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f ini [] = ini
foldr f ini (x:xs) = x `f` (foldr f ini xs)

{-
foldr f ini [1,2,3] ~>> 1 `f` (2 `f` (3 `f` ini))

??? ~>> [1 `f` (2 `f` (3 `f` ini)), 2 `f` (3 `f` ini), 3 `f` ini, ini]
-}

scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr _ ini [] = [ini]
scanr f ini (x:xs) = (x `f` q): qs
                       where qs@(q:_) = scanr f ini xs

Prelude> scanr (+) 0 []
[0]

Prelude> scanr (+) 0 [1,2,3]
[6,5,3,0]

#82 Развёртки

module Demo where

unfold ::(b -> (a, b)) -> b -> [a]
unfold f ini = let (x, ini') = f ini in
    x : unfold f ini'

{-
iterate f x  == [x, f x, f (f x), f (f (f x)), ... ]
iterate:: (a -> a) -> a -> [a]
-}

iterate' f = unfold (\x -> (x, f x))

Prelude> take 10 . iterate' (^2) $ 2
[2,4,16,256,65536,4294967296,18446744073709551616,340282366920938463463374607431768211456,
115792089237316195423570985008687907853269984665640564039457584007913129639936,
13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084096]

#83 Тип данных Maybe

module Demo where

import Data.List

Prelude> :t Nothing
Nothing::Maybe a

Prelude> :t Just
Just:: a -> Maybe a

Prelude> :t Just True
Just True:: Maybe Bool

Prelude> :t Just False
False True:: Maybe Bool

Prelude> :t find
find::(a -> Bool) -> [a] -> Maybe a

Prelude> find odd [2,3,4]
Just 3

Prelude> find odd [2,6,4]
Nothing

Prelude> :t lookup
lookup :: Eq a => a -> [(a, b)] -> Maybe b

Prelude> lookup 2 [(2,'a'), (3, 'b')]
Just 'a'
Prelude> lookup 4 [(2,'a'), (3, 'b')]
Nothing

#84 Завершающиеся развёртки

module Demo where

unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
unfoldr f ini = helper (f ini) where
    helper (Just (x, ini')) = x: unfoldr f ini'
    helper Nothing          = []

Prelude> unfoldr (\x -> if x == 10 then Nothing else Just (x, x+2)) 0
[0, 2, 4, 6, 8]

#85 Объявление типа данных

module Demo where

import Prelude hiding (Bool, True, False)

data Bool = True | False

alwaysTrue :: Int -> Bool
alwaysTrue n = True

#86 Сопоставление с образцом

module Demo where

data B = T | F deriving (Show, Eq, Read, Enum)

not' :: B -> B
not' T = F
not' F = T

Prelude> not' F
T

Prelude> F == T
False

Prelude> succ T
F

not' :: B -> B
not' T = F
// теперь частичная функция

Prelude> :set -fwarn-incomplete-patterns

#87 Образцы для стандартных типов

module Demo where

intToChar :: Int -> Char
intToChar 0 = '0'
intToChar 1 = '1'
intToChar 2 = '2'
intToChar 3 = '3'
intToChar 4 = '4'
intToChar 5 = '5'
intToChar 6 = '6'
intToChar 7 = '7'
intToChar 8 = '8'
intToChar 9 = '9'
intToChar _ = 'N'

isz :: Char -> Bool
isz 'z' = True
isz _   = False

stringToBool :: String -> Bool
stringToBool "true"  = True
stringToBool "false" = False

#88 Точная семантика сопоставлений

module Demo where

foo 1 2  = 3
foo 0 _  = 5

Prelude> foo 0 undefined
5

_ wildcard joker

foo 1 2  = 3
foo 0 x  = 5

Prelude> foo 0 undefined
5

Prelude> foo undefined 0
*** Exception: Prelude.undefined

Prelude> foo 1 (5-3) --форсирует вычисление

#89 Конструкция case...of...

module Demo where

data LogLevel = Error | Warning | Info

cmp :: LogLevel -> LogLevel -> Ordering

lessThanError :: LogLevel -> Bool
lessThanError lvl =
   case cmp lvl Error of
      LT -> True
      _  -> False

#90 Типы произведения

module Demo where

data Point = Pt Double Double deriving Show

origin :: Point
origin = Pt 0.0 0.0

distanceToOrigin :: Point -> Double
distanceToOrigin (Pt x y) = sqrt (x ^ 2 + y ^ 2)


Prelude> :t Pt
Pt :: Double -> Double -> Point

Prelude> Pt 3.0 4.0
Pt 3.0 4.0

Pt Double Double - по сути декартово произведение.

data Point = Point Double Double deriving Show

#91 Типы сумм произведений

module Demo where

rootsOld :: Double -> Double -> (Double, Double)
rootsOld a b c = (x1, x2) where
     x1 = helper (-d)
     x2 = helper d
     helper x = (-b + x)/ (2 * a)
     d = sqrt discr
     discr = b ^ 2 - 4 * a * c


Prelude> rootsOld 1 1 6
(NaN, NaN)

data Roots = Roots Double Double | None
     deriving Show

roots :: Double -> Double -> Double -> Roots
roots a b c
  | discr >= 0 = Roots x1 x2
  | otherwise = None
  where
    x1 = helper (-d)
    x2 = helper d
    helper x = (-b + x) / (2 * x)
    d = sqrt discr
    discr = b ^ 2 - 4 * a * c

#92 Функции, заменяющие конструкторы

module Demo where

data Shape = Circle Double | Reactangle Double Double
             deriving Show

square :: Double -> Shape
square a = Rectangle a a

{-
isSquare :: Shape -> Bool
isSquare (square _) = True
isSquare _ = False
-}

Prelude> import Data.Ratio
*Demo Data.Ratio> 2 % 3
2 % 3
*Demo Data.Ratio> 2 % 3 + 1 % 6
5 % 6

#93 Ленивые образцы

module Demo where

fromMaybe (Just x) = x
fromMaybe Nothing  = error "!!!"


fromMaybe' ~(Just x) = x
fromMaybe Nothing  = error "!!!" -- сюда никогда не доберемся!

fromMaybe' ~(Just x) = x
--fromMaybe Nothing  = error "!!!" -- сюда никогда не доберемся!

(***) :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
(***) f g p = (f $ fst p, g $ snd p)

Prelude> succ *** pred $ (5, 5)
(6, 4)

Prelude> const 1 *** const 2 $ (5,5)
(1, 2)

*Demo> const 1 *** const 2 $ (undefined,undefined)
(1, 2)
*Demo> const 1 *** const 2 $ undefined
(1, 2)

(***) :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
(***) f g (x, y) = (f x, g y)

Prelude> const 1 *** const 2 $ (5,5)
(1, 2)

*Demo> const 1 *** const 2 $ (undefined,undefined)
(1, 2)
*Demo> const 1 *** const 2 $ undefined
*** Exception: Prelude.undefined

(***) :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
(***) f g ~(x, y) = (f x, g y)

*Demo> const 1 *** const 2 $ undefined
(1, 2)

#94 Метки полей

module Demo where

data Person' = Person' String String Int

firstName' :: Person' -> String
firstName' (Person' x _ _) = x

lastName' :: Person' -> String
lastName' (Person' ) _ y _) = y

age' :: Person' -> Int
age' (Person' ) _ _ z) = z

data Person = Person { firstName :: String, lastName:: String, age :: Int }
     deriving (Show, Eq)

*Demo> let john = Person "John" "Smith" 33
*Demo> age john
33
*Demo> lastName john
"Smith"
*Demo> john
Person {firstName = "John", lastName = "Smith", age == 33}

infixl 1 &

:{

*Demo> john & firstName
"John"
*Demo> f $ g $ h $ x
*Demo> f & g & h & x

#95 Использование синтаксиса записей

module Demo where

data Person = Person { firstName :: String, lastName:: String, age :: Int }
     deriving (Show, Eq)

*Demo> let john = Person "John" "Smith" 33
*Demo> let xavier = Person {age = 40, firstName = "Phideaux", lastName = "Xavier"}
*Demo> xavier
Person {firstName = "Phideaux" ,lastName = "Xavier", age = 40}
*Demo> let unknownBill = Person {firstName = "Bill"}

module Demo where

data Person = Person { firstName :: String, lastName:: String, age :: Int }
     deriving (Show, Eq)

updateAge :: Int -> Person -> Person
updateAge newAge person = person {age = newAge}

*Demo> xavier & age
40
*Demo> updateAge 42 xavier
Person {firstName = "Phideaux" ,lastName = "Xavier", age = 42}

#96 Синтаксис записей и сопоставление с образцом

module Demo where

data Person = Person { firstName :: String, lastName :: String, age :: int }
     deriving (Show, Eq)

name :: Person -> String
name person = firstName person ++ " " ++ lastName person

name' :: Person -> String
name' (Person fn ln _ ) = fn ++ " " ++ ln

name'' :: Person -> String
name'' (Person {lastName = ln, firstName =fn}) = fn ++ " " ++ ln

#98 Стандартные параметризованные типы

module Demo where

twice :: a -> [a]
twice x = [x,x]

twice :: a -> [] a
twice x = [x,x]

*Demo> :t twice
twice :: a -> [a]

thrice :: a -> (,,) a a a
thrice x = (,,,) x x x

*Demo> :t thrice
thrice :: a -> (a, a, a)

id' :: (->) a a
id' x = x

k:: a ->(b->a)
k x y = x

k:: (->) a ((->) b a)
k x y = x

{-
data Maybe a = Nothing | Just a

data Either a b = Left a | Right b

-}

*Demo> :t Just(2::Int)
Just(2::Int) :: Maybe Int

*Demo> :t Just 'w'
Just 'w' :: Maybe Char

*Demo> Left "ABC"
Left "ABC" :: Either [Char] b

*Demo> Right True
Right True :: Either a Bool

#99 Виды (кайнды)
Prelude> :kind Char
Char :: *

Prelude> :k Int
Int :: *

Prelude> :k Maybe
Maybe :: * -> *

Prelude> :k Maybe Int
Maybe Int :: *

Prelude> :k Either Int Char
Either Int Char :: *

Prelude> :k []
[] :: * -> *

Prelude> :k [] Int
[] Int :: *

Prelude> :k [Int]
[Int] :: *

Prelude> :k Int -> [] Int
Int -> [] Int :: *

Prelude> :k (,)
(,) :: * -> * -> *

Prelude> :k (->)
(->) :: * -> * -> *

Prelude> :k (->) Char [Char]
(->) Char [Char] :: *

#100 Строгий конструктор данных

module Demo where

import Data.Complex
import Data.Ratio

data CoordLazy a = CoordLazy a a
     deriving Show

data CoordStrict a = CoordStrict !a !a
     deriving Show

getXLazy :: CoordLazy a -> a
getXLazy (CoordLazy x _ ) -> x

getXStrict :: CoordStrict a -> a
getXStrict (CoordStrict x _) = x

Prelude> getXLazy (CoordLazy 3 undefined)
3
Prelude> getXStrict (CoordStrict 3 undefined)
*** Exception: Prelude.undefined

Prelude> 2 :+ 5
2 :+ 5

{-
data Complex = !a :+ !a
data Ration a = !a :% !a
-}

Prelude> 2  `CoordStrict` 5
CoordStrict 2 5

#101 Рекурсия в определении типа

module Demo where

data List a = Nil | Cons a (List a)
     deriving Show

Prelude> :t Nil
Nil :: List a

Prelude> :t Cons 'z' Nil
Cons 'z' Nil :: List Char

Prelude> let yz = Cons 'y' (Cons 'z' Nil)
Prelude> :t yz
yz :: List Char
Prelude> yz
Cons 'y' (Cons 'z' Nil)

Prelude> Cons 'x' yz
Cons 'x' (Cons 'y' (Cons 'z' Nil))

{-
data [] a = [] | a : ([] a)
-}

#102 Представление выражений

module Demo where

infixl 6 :+:
infixl 7 :*:

data Expr = Val Int | Expr :+: Expr | Expr :*: Expr -- | Expr :-: Expr | ...
     deriving (Show, Eq)

expr1 = Val 2 :+: Val 3 :*: Val 4
expr2 = (Val 2 :+: Val 3) :*: Val 4

Prelude> Val 2 :+: Val 2 == Val 4
False

eval :: Expr -> Int
eval (Val n) = n
eval (e1 :+: e2) = eval e1 + eval e2
eval (e1 :*: e2) = eval e1 * eval e2

Prelude> eval expr1
14
Prelude> eval expr2
20

Prelude> eval (Val 2 :+: Val 2) == eval (Val 4)
True

expand :: Expr -> Expr
expand ((e1 :+: e2) :*: e) = expand e1 :*: expand e :+: expand e2 :*: expand e
expand (e :*: (e1 :+: e2)) = expand e :*: expand e1 :+: expand e :*: expand e2
expand (e1 :+: e2)         = expand e1 :+: expand e2
expand (e1 :*: e2)         = expand e1 :*: expand e2
expand e                   = e

Prelude> expand expr2
Val 2 :*: Val 4 :+: Val 3 :*: Val 4

#103 Синонимы типа

module Demo where

import Data.Char
import qualified Data.Map as Map

-- type String = [Char]

allUpper :: String -> Bool
allUpper = all isUpper

type IntegerList = [Integer]

sumSquares :: IntegerList -> IntegerList
sumSquares = foldrl (+) . map (^2)

Prelude> let xs = [1,2]::IntegerList
Prelude> xs
[1,2]

Prelude> let xs = [1,2]::[Integer]
Prelude> xs == ys
True

type AssocList k v = [(k,v)]

lookup' :: Eq => k -> AssocList k v -> Maybe v
lookup' _   []       = Nothing
lookup' key ((x,y):xyz)
       | key == x    = Just
       | otherwise   = lookup' key xyz

type IntMap = Map.Map Int
Prelude> :k Map.Map
Map.Map :: * -> * -> *

Prelude> :k Map.Map Int
Map.Map Int :: * -> *

#104 Объявление newtype
newtype - создает обертку над существующим типом с единственным конструктором.

module Demo where

newtype IntList = IList [Int]

example = IList [1,2]

Prelude> example
error

newtype IntList = IList [Int] deriving Show

Prelude> example
IList [1,2]

data IntList' = IList' [Int] deriving Show

newtype - более ленив.

ignore' :: IntList' -> String
ignore' (IList' _) = "Hello"

ignore :: IntList -> String
ignore (IList _) = "Hello"

Prelude> ignore' undefined
*** Exception: Prelude.undefined

Prelude> ignore undefined
"Hello"

newtype Identity a = Identity { runIdentity :: a }
        deriving (Eq, Ord)

Prelude> :k Identity
Identity :: * -> *

Prelude> :t Identity
Identity :: a -> Identity a

Prelude> :t runIdentity
runIdentity :: Identity a -> a

#105 Класс типов Monoid

module Demo where

class Monoid a where
  mempty :: a             --нейтральный елемент
  mappend :: a -> a -> a  -- операция

  mconcat :: [a] -> a --свёртка
  mconcat = foldr mappend mempty

{-
mempty 'mappend' x = x
x 'mappend' mempty = x
(x 'mappend' y) 'mappend' z = x 'mappend' (y 'mappend' z)

instance Monoid [a] where
   mempty = []
   mappend = (++)

Prelude> mconcat [[1,2],[],[3,4,5]]
[1,2,3,4,5]

newtype Sum a = Sum { getSum :: a }
     deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Sum a) where
   mempty = Sum 0
   Sum x `mappend` Sum y = Sum (x + y)

Prelude> Sum 2 `mappend` Sum 3
Sum {getSum = 5}

newtype Product a = Product { getProduct :: a }
     deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Product a) where
   mempty = Product 1
   Product x `mappend` Product y = Product (x * y)

#106 Прочие моноиды

instance (Monoid a, Monoid b) => Monoid (a,b) where
    mempty = (mempty, mempty)
    (x1,x2) `mappend` (y1,y2) =
                  (x1 `mappend` y1, x2 `mappend` y2)

Prelude> ("ABC", Product 2) `mappend` ("CDE", Product 3)
("ABCCDE", Product{getProduct = 6}


instance Monoid a => Monoid (Maybe a) where
    mempty = Nothing
    Nothing `mappend` m = m
    m `mappend` Nothing = m
    Just m1 `mappend` Just 2 m2 = Just (m1 `mappend` m2)

newtype First a = First { getFirst :: Maybe a }
        deriving (Eq, Ord, Read, Show)

instance Monoid (First a) where
    mempty = First Nothing
    First Nothing `mappend` r = r
    l `mappend` _             = l

Prelude> mconcat $ map First [Nothing, Just 3, Just 5)
First {getFirst = Just 3}

Prelude> getFirst $ map First [Nothing, Just 3, Just 5]
Just 3

Prelude> let firstConcat = getFirst . mconcat . map First
Prelude> firstConcat [Nothing, Just 3, Just 5]
Just 3

#107 Эндоморфизмы как моноиды

module Demo where

class Monoid a where
  mempty :: a             --нейтральный елемент
  mappend :: a -> a -> a  -- операция

  mconcat :: [a] -> a     --свёртка
  mconcat = foldr mappend mempty

Prelude>:t [(*2), (+5), (^2)]
[(*2), (+5), (^2)] :: Num a => [a -> a]

Prelude>zipWith ($) [(*2), (+5), (^2)] [1, 2, 3]
[2, 7 ,9]

newtype Endo a = Endo { appEndo :: a -> a }

instance Monoid (Endo a) where
    mempty = Endo id
    Endo f `mappend` Endo g = Endo (f . g)


Prelude>:t map Endo [(*2), (+5), (^2)]
map Endo [(*2), (+5), (^2)] :: Num a => [Endo a]

Prelude>:t mconcat $ map Endo [(*2), (+5), (^2)]
mconcat $ map Endo [(*2), (+5), (^2)] :: Num a => Endo a

Prelude>:t appEndo $ mconcat $ map Endo [(*2), (+5), (^2)]
appEndo $ mconcat $ map Endo [(*2), (+5), (^2)] :: Num a => a -> a

Prelude>(appEndo $ mconcat $ map Endo [(*2), (+5), (^2)]) 4
42

#108 Класс типов Functor

module Demo where

import Prelude hiding(Functor, fmap)

class Functor f where
    fmap :: (a -> b) -> f a -> f b

instance Functor [] where
    fmap = map

Prelude> map succ [1, 2, 3]
[2, 3, 4]

instance Functor Maybe where
    fmap _ Nothing  = Nothing
    fmap f (Just a) = Just (f a)

Prelude> fmap (*2) Nothing
Nothing

Prelude> fmap (*2) (Just 21)
Just 42

109 Представитель класса типов Functor для бинарного дерева

module Demo where

import Data.Functor

data Tree a = Leaf a | Branch (Tree a) a (Tree a)
   deriving Show

testTree = Branch (Leaf 2) 3 (Leaf 4)

instance Functor Tree where
   fmap g (Leaf x)    = Leaf (g x)
   fmap g (Branch l x r) = Branch (fmap g l) (g x) (fmap g r)

Prelude> testTree
Branch (Leaf 2) 3 (Leaf 4)

Prelude> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b

Prelude> fmap (^2) testTree
Branch (Leaf 4) 9 (Leaf 16)

Prelude> (^2) `fmap` testTree
Branch (Leaf 4) 9 (Leaf 16)

Prelude> (^2) <$> testTree
Branch (Leaf 4) 9 (Leaf 16)

Prelude> (^2) <$> [1, 2, 3]
[1, 4, 9]
infixl 4 <$>

Prelude> (+5) <$> (^2) <$> testTree
Branch (Leaf 9) 14 (Leaf 21)

Prelude> 42 <$ testTree
Branch (Leaf 42) 42 (Leaf 42)

#110 Представители Functor для двухпараметрических типов

module Demo where

import Prelude hiding (Functor, fmap)

class Functor f where
   fmap :: ( a -> b) -> f a -> f b

instance Functor ((,) s) where
   fmap g (x,y) = (x, g y)

Prelude> :k (,)
(,) :: * -> * -> *

Prelude> :k (,) Int
(,) Int :: * -> *

-- ( a -> b) -> f a -> f b
-- ( a -> b) -> (,) s a -> (,) s b  -- prefix
-- ( a -> b) -> (s,a)   -> (s,b)    -- mixfix

Prelude> fmap succ (1, 'A')
(1, 'B')


instance Functor (Either e) where
   fmap _ (Left x) = Left x
   fmap g (Right y) = Right (g y)

-- ( a -> b) -> Either e a -> Either e b

Prelude> fmap (+3) $ Right 1
Right 4
Prelude> fmap (+3) $ Left 1
Left 1
Prelude> fmap (+3) $ Left "ABC"
Left "ABC"

instance Functor ((->) e) where
    fmap = .

-- ( a -> b) -> (e -> a) -> (e -> b)
-- ( a -> b) -> (e -> a) -> e -> b

Prelude> fmap lenght tail "ABC"
2

#111 Законы для функторов

module Demo where

import Prelude hiding (Functor, fmap)

{- Законы для функторов
 (1)  fmap id = id
 (2)  fmap (f . g) = fmap f . fmap g
-}

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor [] where
  fmap _ []     =  []
  fmap g (x:xs) = g x : fmap g xs

Prelude> fmap id [1, 2 ,3]
[1, 2 ,3]

Prelude> fmap id (Just 42)
Just 42

Prelude> (fmap (+1) . fmap (^2)) [1, 2, 3]
[2, 5, 10]

Prelude> fmap ((+1) . (^2)) [1, 2, 3]
[2, 5, 10]

#112 Стрелка Клейсли

module Demo where

f :: a -> b

    -- ФУНКЦИИ С ЭФФЕКТАМИ
f :: a -> Maybe b      -- иногда могут завершиться неудачей
f :: a -> [b]          -- могут возвращать много результатов
f :: a -> (Either s) b -- иногда могут завершиться типизированным исключением
f :: a -> (s, b)       -- могут делать записи в лог
f :: a -> ((->) e, b)  -- могут читать из внешнего окружения
f :: a -> (State s) b  -- работают с изменяемым состоянием
f :: a -> IO b         -- осуществляют ввод/вывод (файлы, консоль)

Обобщая, получаем стрелку Клейсли:

f :: a -> m b
-}

113 Класс типов Monad

module Demo where

{-
class Monad m where
   return :: a -> m a
   (>>=) :: m a -> (a -> m b) -> m b --произносят bind
   ...

infixl 1 >>=
-}

Prelude> :t return True
return True :: Monad m => m Bool

Prelude> return True :: [] Bool
[True]
Prelude> return True :: Maybe Bool
Just True

toKleisli :: Monad m => (a -> b) -> (a -> m b)
toKleisli f = \x -> return (f x)

toKleisli :: Monad m => (a -> b) -> a -> m b
toKleisli f x = return (f x)

Prelude> :t toKleisli cos
toKleisli cos :: (Floating b, Monad m) => b -> m b

Prelude> toKleisli cos 0 :: [Double]
[1.0]

Prelude> toKleisli cos 0 :: Maybe Double
Just 1.0

Prelude> toKleisli cos 0 :: IO Double
1.0

#114 Оператор монадического связывания

module Demo where

import Prelude hiding (($))

{-
class Monad m where
   return :: a -> m a
   (>>=) :: m a -> (a -> m b) -> m b --произносят bind
   ...

infixl 1 >>=
-}

infixr 0 $
($) :: (a -> b) -> a -> b
f $ x = f x

infixl 1 &
(&) :: a -> (a -> b) -> b
f & x = f x

Prelude> (+1) $ (*3) $ (+2) $ 5
22

Prelude> 5 & (+2) & (*3) & (+1)
22

Prelude> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b
Prelude> :t flip fmap
flip fmap :: Functor f => f a -> (a -> b) -> f b

#115 Полное определение класса Monad

module Demo where

import Prelude hiding ((=<<),(<=<))

{-
class Monad m where
   return :: a -> m a
   (>>=) :: m a -> (a -> m b) -> m b --произносят bind

   (>>) :: m a -> m b -> m b
   x >> y = x >>= \_ -> y

   fail :: String -> m a
   fail s = error s
-}

(=<<) :: Monad m => (a -> m b) -> m a -> m b
(=<<) = flip (>>=)

--оператор рыбки, композиции монадических вычислений, композиция стрелок Клейсли
(<=<):: Monad m => (b -> m c) -> (a -> m b) -> (a -> m c)
(<=<):: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
f <=< g = \x -> g x >>= f

(<=<) f g x= g x >>= f


#116 Identity как монада

module Demo where

newtype Identity a = Identity { runIdentity :: a }
     deriving (Eq, Show)

{-
class Monad m where
   return :: a -> m a
   (>>=) :: m a -> (a -> m b) -> m b --произносят bind
-}

instance Monad Identity where
    return x = Identity x
    Identity x >>= k = k x

wrap'n'succ :: Integer -> Identity Integer
wrap'n'succ x = Identity (succ x)

Prelude> runIdentity (wrap'n'succ 3)
4

Prelude> wrap'n'succ 3
Identity {runIdentity = 4}

Prelude> runIdentity $ wrap'n'succ 3
4

Prelude> runIdentity $ wrap'n'succ 3 >>= wrap'n'succ
5

Prelude> runIdentity $ wrap'n'succ 3 >>= wrap'n'succ >>= wrap'n'succ
6

Prelude> let (&) = flip ($)
Prelude> 3 & succ & succ & succ
6

Prelude> succ 3 & succ & succ

Prelude> runIdentity $ return 3 >>= wrap'n'succ >>= wrap'n'succ >>= wrap'n'succ
6

#117 Первый и второй законы для монад

Prelude> runIdentity $ return 3 >>= wrap'n'succ
4

{- первый закон монад
return a >>= k = k a
-}

Prelude> runIdentity $ wrap'n'succ 3 >>= return
4

{- второй закон монад
m >>= return = m
-}

#118 Третий закон для монад

{- третий закон монад

(m >>= k) >>= k' = m >>= (k >>= k')
(m >>= k) >>= k' = m >>= (k x >>= k')
(m >>= k) >>= k' = m >>= (\x -> k x >>= k')

m >>= k >>= k' = m >>= \x -> k x >>= k'
m >>= k >>= k' = m >>= (\x -> k x >>= k')
-}

Prelude> runIdentity $ wrap'n'succ 3 >>= (\x -> wrap'n'succ x >>= wrap'n'succ)
6

Prelude> runIdentity $ wrap'n'succ 3 >>= (\x -> wrap'n'succ x >>= (\y -> wrap'n'succ y))
6

#119 От законов монад к императивному программированию

goWrap0 =
  wrap'n'succ 3 >>=
  wrap'n'succ >>=
  wrap'n'succ >>=
  return


Prelude> runIdentity goWrap0
6

goWrap1 =
  wrap'n'succ 3 >>= (\x ->
  wrap'n'succ >>= (\y ->
  wrap'n'succ >>= (\z ->
  return z)))

Prelude> runIdentity goWrap1
6

goWrap2 =
  wrap'n'succ 3 >>= (\x ->   -- x := succ3;
  wrap'n'succ x >>= (\y ->   -- y := succ x;
  wrap'n'succ y >>= (\z ->   -- z := succ y;
  return (x,y,z))))          -- return (x,y,z)

Prelude> runIdentity goWrap2
(4, 5, 6)

goWrap2 =
  wrap'n'succ 3 >>= \x ->
  wrap'n'succ x >>= \y ->
  wrap'n'succ y >>   -- игнорирование возвращаемого значения
  return (x+y)

goWrap2 =
  wrap'n'succ 3 >>= \x ->
  wrap'n'succ x >>= \y ->
  return (x+y)

#120 От законов монад к императивному программированию

{-
do { e1; e2 } = e1 >> e2

do { p <- e1; e2 } = e1 >>= \p -> e2

do { let v = e1; e2 } = let v = e1 in do e2
-}

goWrap4 =
  let i = 3 in
  wrap'n'succ i >>= \x ->
  wrap'n'succ x >>= \y ->
  wrap'n'succ y >>
  return (i, x+y)

Prelude> runIdentity goWrap4
(3, 9)

goWrap5 =
  let i = 3
  x <- wrap'n'succ i
  y <- wrap'n'succ x
  wrap'n'succ y
  return (i, x+y)

Prelude> runIdentity goWrap5
(3, 9)

Prelude> :t goWrap5
goWrap5 :: Identity (Integer, Integer)

#121 Монада Maybe

module Demo where

import Prelude hiding (Maybe, Just, Nothing)

data Maybe a = Nothing | Just a
     deriving (Eq, Ord)

{-
class Monad m where
   return :: a -> m a
   (>>=):: m a -> (a -> m b) -> m b
   (>>):: m a -> m b -> m b
   fail :: String -> m a
-}

instance Monad Maybe where
    return = Just

    (Just x) >>= k = k x
    Nothing  >>= _ = Nothing

    (Just _) >> m  = m
    Nothing  >> _  = Nothing

    fail _ = Nothing

#122 Пример использования монады Maybe

module Demo where

type Name = String
type DataBase = [(Name, Name)]

fathers, mothers :: Database

father = [("Bill","John"),
          ("Ann","John"),
          ("John","Piter")]

mothers = [("Bill","Jane"),
           ("Ann","Jane"),
           ("John","Alice"),
           ("Jane","Dorothy"),
           ("Alice","Mary")]

getM, getF :: Name -> Maybe Name
getM person = lookup person mothers
getF person = lookup person fathers

Prelude> :t lookup
lookup :: Eq a => a -> [(a,b)] -> Maybe b

Prelude> getF "Bill" >>= getM >>= getM
Just "Mary"

Prelude> do { f <- getF "Bill"; gm <- getM f; getM gm }
Just "Mary"

--Ищем бабушек
granmas :: Name -> Maybe (Name, Name)
granmas person = do
  m   <- getM person
  gmm <- getM m
  f   <- getF person
  gmf <- getM f
  return (gmm, gmf)

Prelude> granmas "Ann"
Just ("Dorothy", "Alice")

Prelude> granmas "John"
Nothing

#123 Монада списка

module Demo where

{-
class Monad m where
   return :: a -> m a
   (>>=):: m a -> (a -> m b) -> m b
   (>>):: m a -> m b -> m b
   fail :: String -> m a
-}

Prelude> return 4::[Int]
[4]

Prelude> [1,2] >>= (\x -> [x,x,x])
[1,1,1,2,2,2]

Prelude> [1,2] >>= (\x -> [x,x])
[1,1,2,2]

Prelude> [1,2] >>= (\x -> [x])
[1,2]

Prelude> [1,2] >>= (\x -> [])
[]

{-
instance Monad [] where
   return x = [x]
   xs >>= k = concat (map k ks)
   fail _ = []
-}

Prelude> map (\x -> [x,x,x]) [1,2]
[[1,1,1],[2,2,2]]

Prelude> concat (map (\x -> [x,x,x]) [1,2])
[1,1,1,2,2,2]

list = [(x,y) | x <- [1,2,3], y <- [4,5,6]]

list' = do
 x <- [1,2,3]
 y <- [4,5,6]
 return (x,y)

list'' =
   [1,2,3] >>= (\x ->
   [4,5,6] >>= (\y ->
   return (x,y)))

#124 Условные вычисления в монадах

module Demo where

lst = [(x, y) | x <- [1,2,3], y <- [1,2], x /= y]
lst' = do
  x <- [1,2,3]
  y <- [1,2]
  True <- return (x /= y)
  return (x,y)

Prelude> lst
[(1,2),(2,1),(3,1),(3,2)]

lst'' = do
  [1,2,3]         >>= (\x ->
  [1,2]           >>= (\y ->
  return (x /= y) >>= (\b ->
  case b of True -> return (x,y)
            _    -> fail "...")))

lst''' = do
  x <- [1,2,3]
  y <- [1,2]
  if x /= y then "Z" else []
  return (x,y)

lst''' = do
  x <- [1,2,3]
  y <- [1,2]
  if x /= y then "ZZ" else []
  return (x,y)

#125 Ввод-вывод (Монада IO)

module Main where

main = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn $ "Nice to meet you, "++ name ++ "!"

Prelude> ghci Main.hs
Prelude> :t main
main :: IO ()

Prelude> :t putStrLn
putStrLn :: String -> IO ()

Prelude> :t getLine
getLine :: IO String

#126 Тип IO

module Demo where

{-
getCharFromConsole :: Char


getCharFromConsole :: RealWorld -> (RealWorld, Char)
-}

{-
newtype IO a = IO (RealWorld -> (RealWorld, a))
-}

#127 Монада IO

newtype IO a = IO (RealWorld -> (RealWorld, a))
return :: a -> IO a
(>>=) :: IO a -> (a -> IO b) -> IO b

instance Monad IO where
    return a = \w -> (w,a)
    (>>=) m k = \w -> case m w of (w',a) -> k a w'

#128 Устройство getLine и putStr

getLine' :: IO String
getLine' = do
   c <- getChar
   if c == '\n' then
      return []
   else do
      cs <- getLine'
      return (c:cs)

Prelude> getLine'
qwerty
"qwerty"

Prelude> :t putChar
putChar :: Char -> IO ()

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs

#129 Полезные вспомогательные функции

module Demo where

import Control.Monad

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs

{-
sequence_ :: Monad m => [m a] -> m ()
sequence_ = foldr (>>) (return ())
-}

Prelude> sequence_ [Just 1, Just 2]
Just ()

Prelude> sequence_ [Just 1, Nothing]
Nothing

Prelude> sequence_ [[1,2], [3,4,5,6]]
[(),(),(),(),(),(),(),()]

putStr'' :: String -> IO ()
putStr'' = sequence_ . map putChar

Prelude> sequence_ [putChar 'a', putChar 'b']
ab*Demo>

Prelude> sequence_ $ map putChar "ab"
ab*Demo>

{-
mapM :: Monad m => (a -> m b) -> [a] -> m ()
mapM_ f = sequence_ . map f
-}

Prelude> mapM_ (\x -> [x,x]) "ABC"
[(),(),(),(),(),(),(),()]

Prelude> map (\x -> [x,x]) "ABC"
["AA","BB","CC"]

putStr''' :: String -> IO ()
putStr''' = mapM_ putChar

{-
sequence :: Monad m => [m a] -> m [a]
sequence ms = foldr k (return []) ms
   where
     k :: Monad m => m a -> m [a] -> m [a]
     k m m' = do
       x <- m
       xs <- m'
       return (x:xs)

mapM :: Monad m => (a -> m b) -> [a] -> m [b]
mapM f = sequence . map f
-}

Prelude> sequence [Just 1, Just 2]
Just [1,2]

Prelude> sequence [Just 1, Nothing]
Nothing

Prelude> sequence [getLine, getLine]
ab
cde
["ab","cde"]

Prelude> mapM_ putChar "Hello"
Hello*Demo>

Prelude> mapM putChar "Hello"
Hello[(),(),(),(),()]

#130 Простейший Reader

{-
instance Functor ((->) e) where
     fmap g h = g . h

fmap :: (a -> b) -> f a -> f b
     :: (a -> b) -> (e -> a) -> (e - > b)

instance Monad ((->) e) where
     -- return :: a -> e -> a
        return x = \_ -> x
        (>>=) :: (e -> a) ->(a -> e -> b) -> e -> b
        m >>= k = \e -> k (m e) e
-}

safeHead = do
   b <- null
   if b
   then return Nothing
   else do
      h <- head
      return $ Just h

Prelude> safeHead []
Nothing

Prelude> safeHead [1,2]
Just 1

safeHead' = do
   e <- id
   if null e
   then return Nothing
   else return $ Just (head e)

#131 Универсальный Reader 1

module Demo where

newtype Reader r a = Reader { runReader :: (r -> a) }

--runReader :: Reader r a -> r -> a

instance Monad (Reader r) where
    return x = Reader $ \e -> x
    m >>= k = Reader $  \e ->
       let v = runReader m e
       in runReader (k v) e

ask :: Reader r r
ask = Reader id

Prelude> runReader ask 42
42

-- Пример
type User = String
type Password = String
type Usertables = [(User, Password)]

pwds:: UserTables
pwds = [("Bill", "123"), ("Ann", "qwerty"), ("John", "2sRq8P")]

firstUser :: Reader UsersTable User
firstUser = do
   e <- ask
   return $ fst (head e)

Prelude> runReader firstUser pwds
"Bill"

#132 Универсальный Reader 2

asks :: (r -> a) -> Reader r a
asks = Reader

firstUserPwd :: Reader UsersTable Password
firstUserPwd = do
   pwd <- asks (snd .head)
   return pwd

Prelude> runReader firstUserPwd pwds
"123"

firstUserPwd :: Reader UsersTable Password
firstUserPwd = asks (snd .head)

userCount :: Reader UsersTable Int
firstUserPwd = asks length

local :: (r -> r) -> Reader r a -> Reader r a
local f m = Reader $ \e -> runReader m (f e)

localTest :: Reader UserTable  (Int, Int)
localTest = do
    count1 <- usersCount
    count2 <- local (("Mike", "1"):) userCount
    return (count1, count2)

Prelude> runReader localTest pwds
(3,4)

#134 Интерфейс для монады Writer

instance (Monoid w) => Monad (Writer w) where
     return x = Writer (x, mempty)
     m >>= k =
       let (x, u) = runWriter m
           (y, v) = runWriter $ k x
       in Writer (y, u `mappend` v)

tell :: Monoid w => w -> Writer w ()
tell w = writer ((), w)

calc :: (Int -> Int -> Int) -> Int -> Int -> Writer String Int
calc op arg1 arg2 = do
   let res = arg1 `op` arg2
   if abs res < 128 then
      return res
   else do
      tell "overwlow"

Prelude> execWriter $ calc (+) 33 44
""
Prelude> runWriter $ calc (+) 33 44
(77,"")

Prelude> runWriter $ calc (+) 99 44
(143,"overflow")

calc :: (Int -> Int -> Int) -> Int -> Int -> Writer String Int
calc op arg1 arg2 = do
   let res = arg1 `op` arg2
   tell "ok "
   if abs res < 128 then
      return res
   else do
      tell "overwlow"

Prelude> execWriter $ calc (+) 33 44
"ok "

Prelude> execWriter $ calc (+) 99 44
"ok overflow"

#135 Монада State

module Demo where
import Control.Monad (replicateM)

newtype State s a = State { runState :: s -> (a, s) }
-- runState :: State s a -> s -> (a, s)

instance Monad (State s) where
   return a = State $ \st -> (a, st)

   m >>= k = State $ \st->
     let (a, st') = runState m st
         m' = k a
     in runState m' st'

execState :: State s a -> s -> s
execState m s = snd (runState m s)

evalState :: State s a -> s -> a
evalState m s = fst evalState

#136 Интерфейс для монады State

get :: State s s
get = State $ \st -> (st, st)

Prelude> runState get 5
(5,5)

put :: s -> State s ()
put st = State $ \_ -> ((), st)

Prelude> runState (put 7) 5
((),7)

tick :: State Int Int
tick = do
   n <- get
   put (n+1)
   return n

Prelude> runState tick 5
(5,6)

modify :: (s -> s) -> State s ()
modify f = State $ \s -> ((), f s)

modify f = do
   s <- get
   put (f s)

Prelude> runState (modify (^2)) 5
((), 25)

#137 Программирование в монаде State

tick :: State Int Int
tick = do
   n <- get
   put (n+1)
   return n

succ' :: Int -> Int
succ' n = execState tick n

Prelude> succ' 3
4

plus :: Int -> Int -> Int
plus n x = execState (sequence $ replicate n tick) x

Prelude> 4 `plus` 5
9

Prelude> execState (sequence $ replicate 4 tick) 5
9

Prelude> runState (sequence $ replicate 4 tick) 5
([5,6,7,8], 9)

Prelude> runState (sequence_ $ replicate 4 tick) 5
((), 9)

{-
replicateM :: (Monad m) => Int -> m a -> m [a]
replicateM n = sequence . replicate n
-}

plus :: Int -> Int -> Int
plus n x = execState (sequence $ replicate n tick) x

plus' :: Int -> Int -> Int
plus' n x = execState (replicateM n tick) x
