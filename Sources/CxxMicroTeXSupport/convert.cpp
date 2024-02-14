#include "convert.h"

#include <codecvt>
#include <locale>
#include <string>

std::wstring convertUtf8ToUtf16(const std::string &utf8) {
  // Yes, it's deprecated, but portable and there doesn't seem to be a replacement..
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  return std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>>().from_bytes(utf8);
#pragma clang diagnostic pop
}
