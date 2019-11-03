# teslatex



As Dart already has base64 encode and decode functions, we don't need to use third party library. Just add import 'dart:convert'; on top of the file to use the functions.
Encode Text to Base 64

First we decode it using utf8.encode. The result is then encoded to base64 using base64.encode.

	
  String text = "Hello world";
	
  List encodedText = utf8.encode(text);
	
  String base64Str = base64.encode(encodedText);
	
  print('base64: $base64Str');

Decode Text from Base 64

To decode, use base64.decode. Then, In order to get the original text, use utf8.decode on the result.

	
  String decodedText  = utf8.decode(base64.decode(base64Str));
	
  print('text: $decodedText');

Encode File to base64

File encoding is very similar to text encoding. But for getting the bytes of the file, first we create a File instance which refers to a file in the system. Then, use readAsBytesSync to get the bytes. Lastly, use base64.encode to get the result.

	
  // Write a file with content
	
  new File('file.txt').writeAsStringSync("abcde");
	
 
	
  List fileBytes = await new File('file.txt').readAsBytesSync();
	
  String encodedFile = base64.encode(fileBytes);

Decode File from base64

To get the string from a decoded file, ......

	
  String decodedFile = utf8.decode(base64.decode(encodedFile));
	
  print('decoded file: $decodedFile');

Base64 URL Encode

As Base64 URL has different alphabet, use base64Url.encode instead.

	
  String url = 'https://www.woolha.com?a=b&c=d#e';
	
  String encodedUrl = base64Url.encode(utf8.encode(url));
	
  print('encoded URL: $encodedUrl');

Base64 URL Decode

To decode a base64 URL encoded text, use Dart's base64Url.decode first, then use utf8.decode.

	
  String decodedUrl = utf8.decode(base64Url.decode(encodedUrl));
	
  print('decoded URL: $decodedUrl');
