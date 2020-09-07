package com.badlogic.gdx.utils;

import java.text.MessageFormat;
import java.util.Locale;

class TextFormatter {
  private StringBuilder buffer = new StringBuilder();
  
  private MessageFormat messageFormat;
  
  public TextFormatter(Locale paramLocale, boolean paramBoolean) {
    if (paramBoolean)
      this.messageFormat = new MessageFormat("", paramLocale); 
  }
  
  private String replaceEscapeChars(String paramString) {
    StringBuilder stringBuilder = this.buffer;
    byte b1 = 0;
    stringBuilder.setLength(0);
    int i = paramString.length();
    byte b2 = 0;
    while (b1 < i) {
      char c = paramString.charAt(b1);
      if (c == '\'') {
        this.buffer.append("''");
        b2 = 1;
      } else if (c == '{') {
        byte b3;
        for (b3 = b1 + 1; b3 < i && paramString.charAt(b3) == '{'; b3++);
        byte b4 = b3 - b1;
        b1 = b4 / 2;
        if (b1 > 0) {
          this.buffer.append('\'');
          b2 = b1;
          do {
            this.buffer.append('{');
            b1 = b2 - 1;
            b2 = b1;
          } while (b1 > 0);
          this.buffer.append('\'');
          b2 = 1;
        } 
        if (b4 % 2 != 0)
          this.buffer.append('{'); 
        b1 = b3 - 1;
      } else {
        this.buffer.append(c);
      } 
      b1++;
    } 
    if (b2 != 0)
      paramString = this.buffer.toString(); 
    return paramString;
  }
  
  private String simpleFormat(String paramString, Object... paramVarArgs) {
    this.buffer.setLength(0);
    int i = paramString.length();
    byte b1 = 0;
    byte b = -1;
    byte b2 = 0;
    while (b1 < i) {
      char c = paramString.charAt(b1);
      if (b < 0) {
        if (c == '{') {
          b2 = b1 + 1;
          if (b2 < i && paramString.charAt(b2) == '{') {
            this.buffer.append(c);
            b1 = b2;
          } else {
            b = 0;
          } 
          b2 = 1;
        } else {
          this.buffer.append(c);
        } 
      } else if (c == '}') {
        if (b < paramVarArgs.length) {
          if (paramString.charAt(b1 - 1) != '{') {
            if (paramVarArgs[b] == null) {
              this.buffer.append("null");
            } else {
              this.buffer.append(paramVarArgs[b].toString());
            } 
            b = -1;
          } else {
            throw new IllegalArgumentException("Missing argument index after a left curly brace");
          } 
        } else {
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Argument index out of bounds: ");
          stringBuilder.append(b);
          throw new IllegalArgumentException(stringBuilder.toString());
        } 
      } else if (c >= '0' && c <= '9') {
        b = b * 10 + c - '0';
      } else {
        java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
        stringBuilder.append("Unexpected '");
        stringBuilder.append(c);
        stringBuilder.append("' while parsing argument index");
        throw new IllegalArgumentException(stringBuilder.toString());
      } 
      b1++;
    } 
    if (b < 0) {
      if (b2 != 0)
        paramString = this.buffer.toString(); 
      return paramString;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("Unmatched braces in the pattern.");
    throw illegalArgumentException;
  }
  
  public String format(String paramString, Object... paramVarArgs) {
    MessageFormat messageFormat1 = this.messageFormat;
    if (messageFormat1 != null) {
      messageFormat1.applyPattern(replaceEscapeChars(paramString));
      return this.messageFormat.format(paramVarArgs);
    } 
    return simpleFormat(paramString, paramVarArgs);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/TextFormatter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */