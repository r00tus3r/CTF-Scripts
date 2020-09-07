package com.badlogic.gdx.utils;

import java.io.IOException;
import java.io.Writer;

public class XmlWriter extends Writer {
  private String currentElement;
  
  public int indent;
  
  private boolean indentNextClose;
  
  private final Array<String> stack = new Array();
  
  private final Writer writer;
  
  public XmlWriter(Writer paramWriter) { this.writer = paramWriter; }
  
  private void indent() throws IOException {
    int i = this.indent;
    int j = i;
    if (this.currentElement != null)
      j = i + 1; 
    for (i = 0; i < j; i++)
      this.writer.write(9); 
  }
  
  private boolean startElementContent() throws IOException {
    String str = this.currentElement;
    if (str == null)
      return false; 
    this.indent++;
    this.stack.add(str);
    this.currentElement = null;
    this.writer.write(">");
    return true;
  }
  
  public XmlWriter attribute(String paramString, Object paramObject) throws IOException {
    if (this.currentElement != null) {
      this.writer.write(32);
      this.writer.write(paramString);
      this.writer.write("=\"");
      Writer writer1 = this.writer;
      if (paramObject == null) {
        paramString = "null";
      } else {
        paramString = paramObject.toString();
      } 
      writer1.write(paramString);
      this.writer.write(34);
      return this;
    } 
    throw new IllegalStateException();
  }
  
  public void close() throws IOException {
    while (this.stack.size != 0)
      pop(); 
    this.writer.close();
  }
  
  public XmlWriter element(String paramString) throws IOException {
    if (startElementContent())
      this.writer.write(10); 
    indent();
    this.writer.write(60);
    this.writer.write(paramString);
    this.currentElement = paramString;
    return this;
  }
  
  public XmlWriter element(String paramString, Object paramObject) throws IOException { return element(paramString).text(paramObject).pop(); }
  
  public void flush() throws IOException { this.writer.flush(); }
  
  public XmlWriter pop() throws IOException {
    if (this.currentElement != null) {
      this.writer.write("/>\n");
      this.currentElement = null;
    } else {
      this.indent = Math.max(this.indent - 1, 0);
      if (this.indentNextClose)
        indent(); 
      this.writer.write("</");
      this.writer.write((String)this.stack.pop());
      this.writer.write(">\n");
    } 
    this.indentNextClose = true;
    return this;
  }
  
  public XmlWriter text(Object paramObject) throws IOException {
    boolean bool;
    startElementContent();
    if (paramObject == null) {
      paramObject = "null";
    } else {
      paramObject = paramObject.toString();
    } 
    if (paramObject.length() > 64) {
      bool = true;
    } else {
      bool = false;
    } 
    this.indentNextClose = bool;
    if (this.indentNextClose) {
      this.writer.write(10);
      indent();
    } 
    this.writer.write(paramObject);
    if (this.indentNextClose)
      this.writer.write(10); 
    return this;
  }
  
  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2) throws IOException {
    startElementContent();
    this.writer.write(paramArrayOfChar, paramInt1, paramInt2);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/XmlWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */