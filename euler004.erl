% A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
% Find the largest palindrome made from the product of two 3-digit numbers.

-module(euler004).
-export([palindrome/1, find_palindrome/0]).

palindrome(N) -> lists:reverse(integer_to_list(N)) == integer_to_list(N).

find_palindrome() -> find_palindrome(999, 999, 0).
find_palindrome(99, 99, CurrentPalindrome) -> CurrentPalindrome;
find_palindrome(X, 99, CurrentPalindrome) when X * X < CurrentPalindrome -> CurrentPalindrome;
find_palindrome(X, 99, CurrentPalindrome) -> find_palindrome(X - 1, X - 1, CurrentPalindrome);
find_palindrome(X, Y, CurrentPalindrome) ->
  case (X * Y > CurrentPalindrome) and palindrome(X * Y) of
    true -> find_palindrome(X, Y - 1, X * Y);
    false -> find_palindrome(X, Y - 1, CurrentPalindrome)
  end.
