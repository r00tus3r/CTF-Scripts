package com.badlogic.gdx.files;

import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class FileHandle {
  protected File file;
  
  protected Files.FileType type;
  
  protected FileHandle() {}
  
  public FileHandle(File paramFile) {
    this.file = paramFile;
    this.type = Files.FileType.Absolute;
  }
  
  protected FileHandle(File paramFile, Files.FileType paramFileType) {
    this.file = paramFile;
    this.type = paramFileType;
  }
  
  public FileHandle(String paramString) {
    this.file = new File(paramString);
    this.type = Files.FileType.Absolute;
  }
  
  protected FileHandle(String paramString, Files.FileType paramFileType) {
    this.type = paramFileType;
    this.file = new File(paramString);
  }
  
  private static void copyDirectory(FileHandle paramFileHandle1, FileHandle paramFileHandle2) {
    paramFileHandle2.mkdirs();
    for (FileHandle fileHandle1 : paramFileHandle1.list()) {
      FileHandle fileHandle2 = paramFileHandle2.child(fileHandle1.name());
      if (fileHandle1.isDirectory()) {
        copyDirectory(fileHandle1, fileHandle2);
      } else {
        copyFile(fileHandle1, fileHandle2);
      } 
    } 
  }
  
  private static void copyFile(FileHandle paramFileHandle1, FileHandle paramFileHandle2) {
    try {
      paramFileHandle2.write(paramFileHandle1.read(), false);
      return;
    } catch (Exception exception) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error copying source file: ");
      stringBuilder.append(paramFileHandle1.file);
      stringBuilder.append(" (");
      stringBuilder.append(paramFileHandle1.type);
      stringBuilder.append(")\nTo destination: ");
      stringBuilder.append(paramFileHandle2.file);
      stringBuilder.append(" (");
      stringBuilder.append(paramFileHandle2.type);
      stringBuilder.append(")");
      throw new GdxRuntimeException(stringBuilder.toString(), exception);
    } 
  }
  
  private static boolean deleteDirectory(File paramFile) {
    emptyDirectory(paramFile, false);
    return paramFile.delete();
  }
  
  private static void emptyDirectory(File paramFile, boolean paramBoolean) {
    if (paramFile.exists()) {
      File[] arrayOfFile = paramFile.listFiles();
      if (arrayOfFile != null) {
        byte b = 0;
        int i = arrayOfFile.length;
        while (b < i) {
          if (!arrayOfFile[b].isDirectory()) {
            arrayOfFile[b].delete();
          } else if (paramBoolean) {
            emptyDirectory(arrayOfFile[b], true);
          } else {
            deleteDirectory(arrayOfFile[b]);
          } 
          b++;
        } 
      } 
    } 
  }
  
  private int estimateLength() {
    int i = (int)length();
    if (i == 0)
      i = 512; 
    return i;
  }
  
  public static FileHandle tempDirectory(String paramString) {
    try {
      File file1 = File.createTempFile(paramString, null);
      if (file1.delete()) {
        if (file1.mkdir())
          return new FileHandle(file1); 
        IOException iOException1 = new IOException();
        StringBuilder stringBuilder1 = new StringBuilder();
        this();
        stringBuilder1.append("Unable to create temp directory: ");
        stringBuilder1.append(file1);
        this(stringBuilder1.toString());
        throw iOException1;
      } 
      IOException iOException = new IOException();
      StringBuilder stringBuilder = new StringBuilder();
      this();
      stringBuilder.append("Unable to delete temp file: ");
      stringBuilder.append(file1);
      this(stringBuilder.toString());
      throw iOException;
    } catch (IOException paramString) {
      throw new GdxRuntimeException("Unable to create temp file.", paramString);
    } 
  }
  
  public static FileHandle tempFile(String paramString) {
    try {
      return new FileHandle(File.createTempFile(paramString, null));
    } catch (IOException paramString) {
      throw new GdxRuntimeException("Unable to create temp file.", paramString);
    } 
  }
  
  public FileHandle child(String paramString) { return (this.file.getPath().length() == 0) ? new FileHandle(new File(paramString), this.type) : new FileHandle(new File(this.file, paramString), this.type); }
  
  public void copyTo(FileHandle paramFileHandle) {
    if (!isDirectory()) {
      FileHandle fileHandle = paramFileHandle;
      if (paramFileHandle.isDirectory())
        fileHandle = paramFileHandle.child(name()); 
      copyFile(this, fileHandle);
      return;
    } 
    if (paramFileHandle.exists()) {
      if (!paramFileHandle.isDirectory()) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Destination exists but is not a directory: ");
        stringBuilder.append(paramFileHandle);
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
    } else {
      paramFileHandle.mkdirs();
      if (!paramFileHandle.isDirectory()) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Destination directory cannot be created: ");
        stringBuilder.append(paramFileHandle);
        throw new GdxRuntimeException(stringBuilder.toString());
      } 
    } 
    copyDirectory(this, paramFileHandle.child(name()));
  }
  
  public boolean delete() {
    if (this.type != Files.FileType.Classpath) {
      if (this.type != Files.FileType.Internal)
        return file().delete(); 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot delete an internal file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot delete a classpath file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public boolean deleteDirectory() {
    if (this.type != Files.FileType.Classpath) {
      if (this.type != Files.FileType.Internal)
        return deleteDirectory(file()); 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot delete an internal file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot delete a classpath file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public void emptyDirectory() { emptyDirectory(false); }
  
  public void emptyDirectory(boolean paramBoolean) {
    if (this.type != Files.FileType.Classpath) {
      if (this.type != Files.FileType.Internal) {
        emptyDirectory(file(), paramBoolean);
        return;
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot delete an internal file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot delete a classpath file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public boolean equals(Object paramObject) {
    boolean bool = paramObject instanceof FileHandle;
    boolean bool1 = false;
    if (!bool)
      return false; 
    paramObject = (FileHandle)paramObject;
    bool = bool1;
    if (this.type == paramObject.type) {
      bool = bool1;
      if (path().equals(paramObject.path()))
        bool = true; 
    } 
    return bool;
  }
  
  public boolean exists() {
    int i = null.$SwitchMap$com$badlogic$gdx$Files$FileType[this.type.ordinal()];
    boolean bool = true;
    if (i != 1) {
      if (i != 2)
        return file().exists(); 
    } else if (file().exists()) {
      return true;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("/");
    stringBuilder.append(this.file.getPath().replace('\\', '/'));
    if (FileHandle.class.getResource(stringBuilder.toString()) == null)
      bool = false; 
    return bool;
  }
  
  public String extension() {
    String str = this.file.getName();
    int i = str.lastIndexOf('.');
    return (i == -1) ? "" : str.substring(i + 1);
  }
  
  public File file() { return (this.type == Files.FileType.External) ? new File(Gdx.files.getExternalStoragePath(), this.file.getPath()) : this.file; }
  
  public int hashCode() { return (37 + this.type.hashCode()) * 67 + path().hashCode(); }
  
  public boolean isDirectory() { return (this.type == Files.FileType.Classpath) ? false : file().isDirectory(); }
  
  public long lastModified() { return file().lastModified(); }
  
  public long length() {
    if (this.type == Files.FileType.Classpath || (this.type == Files.FileType.Internal && !this.file.exists())) {
      inputStream = read();
      try {
        int i = inputStream.available();
        return i;
      } catch (Exception exception) {
        return 0L;
      } finally {
        StreamUtils.closeQuietly(inputStream);
      } 
    } 
    return file().length();
  }
  
  public FileHandle[] list() {
    if (this.type != Files.FileType.Classpath) {
      String[] arrayOfString = file().list();
      byte b = 0;
      if (arrayOfString == null)
        return new FileHandle[0]; 
      FileHandle[] arrayOfFileHandle = new FileHandle[arrayOfString.length];
      int i = arrayOfString.length;
      while (b < i) {
        arrayOfFileHandle[b] = child(arrayOfString[b]);
        b++;
      } 
      return arrayOfFileHandle;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot list a classpath directory: ");
    stringBuilder.append(this.file);
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  public FileHandle[] list(FileFilter paramFileFilter) {
    if (this.type != Files.FileType.Classpath) {
      FileHandle[] arrayOfFileHandle1;
      String[] arrayOfString = file().list();
      if (arrayOfString == null)
        return new FileHandle[0]; 
      FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfString.length];
      int i = arrayOfString.length;
      byte b1 = 0;
      byte b2 = 0;
      while (b1 < i) {
        FileHandle fileHandle = child(arrayOfString[b1]);
        if (paramFileFilter.accept(fileHandle.file())) {
          arrayOfFileHandle2[b2] = fileHandle;
          b2++;
        } 
        b1++;
      } 
      if (b2 < arrayOfString.length) {
        arrayOfFileHandle1 = new FileHandle[b2];
        System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
      } else {
        arrayOfFileHandle1 = arrayOfFileHandle2;
      } 
      return arrayOfFileHandle1;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot list a classpath directory: ");
    stringBuilder.append(this.file);
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  public FileHandle[] list(FilenameFilter paramFilenameFilter) {
    if (this.type != Files.FileType.Classpath) {
      FileHandle[] arrayOfFileHandle1;
      File file1 = file();
      String[] arrayOfString = file1.list();
      if (arrayOfString == null)
        return new FileHandle[0]; 
      FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfString.length];
      int i = arrayOfString.length;
      byte b1 = 0;
      byte b2 = 0;
      while (b1 < i) {
        String str = arrayOfString[b1];
        if (paramFilenameFilter.accept(file1, str)) {
          arrayOfFileHandle2[b2] = child(str);
          b2++;
        } 
        b1++;
      } 
      if (b2 < arrayOfString.length) {
        arrayOfFileHandle1 = new FileHandle[b2];
        System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
      } else {
        arrayOfFileHandle1 = arrayOfFileHandle2;
      } 
      return arrayOfFileHandle1;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot list a classpath directory: ");
    stringBuilder.append(this.file);
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  public FileHandle[] list(String paramString) {
    if (this.type != Files.FileType.Classpath) {
      FileHandle[] arrayOfFileHandle1;
      String[] arrayOfString = file().list();
      if (arrayOfString == null)
        return new FileHandle[0]; 
      FileHandle[] arrayOfFileHandle2 = new FileHandle[arrayOfString.length];
      int i = arrayOfString.length;
      byte b1 = 0;
      byte b2 = 0;
      while (b1 < i) {
        String str = arrayOfString[b1];
        if (str.endsWith(paramString)) {
          arrayOfFileHandle2[b2] = child(str);
          b2++;
        } 
        b1++;
      } 
      if (b2 < arrayOfString.length) {
        arrayOfFileHandle1 = new FileHandle[b2];
        System.arraycopy(arrayOfFileHandle2, 0, arrayOfFileHandle1, 0, b2);
      } else {
        arrayOfFileHandle1 = arrayOfFileHandle2;
      } 
      return arrayOfFileHandle1;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot list a classpath directory: ");
    stringBuilder.append(this.file);
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  public ByteBuffer map() { return map(FileChannel.MapMode.READ_ONLY); }
  
  public ByteBuffer map(FileChannel.MapMode paramMapMode) {
    if (this.type != Files.FileType.Classpath) {
      FileChannel.MapMode mapMode1 = null;
      Object object = null;
      randomAccessFile = object;
      try {
        String str;
        exception = new RandomAccessFile();
        randomAccessFile = object;
        File file1 = this.file;
        randomAccessFile = object;
        if (paramMapMode == FileChannel.MapMode.READ_ONLY) {
          str = "r";
        } else {
          str = "rw";
        } 
        randomAccessFile = object;
        this(file1, str);
        try {
          mappedByteBuffer = exception.getChannel().map(paramMapMode, 0L, this.file.length());
          mappedByteBuffer.order(ByteOrder.nativeOrder());
          return mappedByteBuffer;
        } catch (Exception randomAccessFile) {
          RandomAccessFile randomAccessFile1 = exception;
        } finally {
          paramMapMode = null;
        } 
      } catch (Exception exception) {
        paramMapMode = mapMode1;
      } finally {}
      FileChannel.MapMode mapMode2 = paramMapMode;
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      mapMode2 = paramMapMode;
      StringBuilder stringBuilder1 = new StringBuilder();
      mapMode2 = paramMapMode;
      this();
      mapMode2 = paramMapMode;
      stringBuilder1.append("Error memory mapping file: ");
      mapMode2 = paramMapMode;
      stringBuilder1.append(this);
      mapMode2 = paramMapMode;
      stringBuilder1.append(" (");
      mapMode2 = paramMapMode;
      stringBuilder1.append(this.type);
      mapMode2 = paramMapMode;
      stringBuilder1.append(")");
      mapMode2 = paramMapMode;
      this(stringBuilder1.toString(), exception);
      mapMode2 = paramMapMode;
      throw gdxRuntimeException;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot map a classpath file: ");
    stringBuilder.append(this);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public void mkdirs() {
    if (this.type != Files.FileType.Classpath) {
      if (this.type != Files.FileType.Internal) {
        file().mkdirs();
        return;
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot mkdirs with an internal file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot mkdirs with a classpath file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public void moveTo(FileHandle paramFileHandle) {
    int i = null.$SwitchMap$com$badlogic$gdx$Files$FileType[this.type.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if ((i == 3 || i == 4) && file().renameTo(paramFileHandle.file()))
          return; 
        copyTo(paramFileHandle);
        delete();
        if (exists() && isDirectory())
          deleteDirectory(); 
        return;
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot move a classpath file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot move an internal file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public String name() { return this.file.getName(); }
  
  public String nameWithoutExtension() {
    String str = this.file.getName();
    int i = str.lastIndexOf('.');
    return (i == -1) ? str : str.substring(0, i);
  }
  
  public FileHandle parent() {
    File file1 = this.file.getParentFile();
    File file2 = file1;
    if (file1 == null)
      if (this.type == Files.FileType.Absolute) {
        file2 = new File("/");
      } else {
        file2 = new File("");
      }  
    return new FileHandle(file2, this.type);
  }
  
  public String path() { return this.file.getPath().replace('\\', '/'); }
  
  public String pathWithoutExtension() {
    String str = this.file.getPath().replace('\\', '/');
    int i = str.lastIndexOf('.');
    return (i == -1) ? str : str.substring(0, i);
  }
  
  public BufferedInputStream read(int paramInt) { return new BufferedInputStream(read(), paramInt); }
  
  public InputStream read() {
    if (this.type == Files.FileType.Classpath || (this.type == Files.FileType.Internal && !file().exists()) || (this.type == Files.FileType.Local && !file().exists())) {
      StringBuilder stringBuilder2 = new StringBuilder();
      stringBuilder2.append("/");
      stringBuilder2.append(this.file.getPath().replace('\\', '/'));
      InputStream inputStream = FileHandle.class.getResourceAsStream(stringBuilder2.toString());
      if (inputStream != null)
        return inputStream; 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("File not found: ");
      stringBuilder1.append(this.file);
      stringBuilder1.append(" (");
      stringBuilder1.append(this.type);
      stringBuilder1.append(")");
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    try {
      return new FileInputStream(file());
    } catch (Exception exception) {
      if (file().isDirectory()) {
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append("Cannot open a stream to a directory: ");
        stringBuilder1.append(this.file);
        stringBuilder1.append(" (");
        stringBuilder1.append(this.type);
        stringBuilder1.append(")");
        throw new GdxRuntimeException(stringBuilder1.toString(), exception);
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(this.file);
      stringBuilder.append(" (");
      stringBuilder.append(this.type);
      stringBuilder.append(")");
      throw new GdxRuntimeException(stringBuilder.toString(), exception);
    } 
  }
  
  public int readBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
    InputStream inputStream = read();
    int i = 0;
    try {
      while (true) {
        int j = inputStream.read(paramArrayOfByte, paramInt1 + i, paramInt2 - i);
        if (j <= 0) {
          StreamUtils.closeQuietly(inputStream);
          return i - paramInt1;
        } 
        i += j;
      } 
    } catch (IOException paramArrayOfByte) {
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      StringBuilder stringBuilder = new StringBuilder();
      this();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(this);
      this(stringBuilder.toString(), paramArrayOfByte);
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(inputStream);
    throw paramArrayOfByte;
  }
  
  public byte[] readBytes() {
    byte[] arrayOfByte;
    InputStream inputStream = read();
    try {
      arrayOfByte = StreamUtils.copyStreamToByteArray(inputStream, estimateLength());
      StreamUtils.closeQuietly(inputStream);
      return arrayOfByte;
    } catch (IOException null) {
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      StringBuilder stringBuilder = new StringBuilder();
      this();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(this);
      this(stringBuilder.toString(), arrayOfByte);
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(inputStream);
    throw arrayOfByte;
  }
  
  public String readString() { return readString(null); }
  
  public String readString(String paramString) {
    InputStreamReader inputStreamReader2;
    InputStreamReader inputStreamReader1;
    StringBuilder stringBuilder1 = new StringBuilder(estimateLength());
    GdxRuntimeException gdxRuntimeException = null;
    StringBuilder stringBuilder2 = null;
    if (paramString == null) {
      inputStreamReader2 = stringBuilder2;
      InputStreamReader inputStreamReader = gdxRuntimeException;
      try {
        inputStreamReader1 = new InputStreamReader();
        inputStreamReader2 = stringBuilder2;
        inputStreamReader = gdxRuntimeException;
        this(read());
        inputStreamReader2 = inputStreamReader1;
        inputStreamReader = inputStreamReader1;
      } catch (IOException paramString) {
        inputStreamReader2 = inputStreamReader;
        gdxRuntimeException = new GdxRuntimeException();
        inputStreamReader2 = inputStreamReader;
        stringBuilder2 = new StringBuilder();
        inputStreamReader2 = inputStreamReader;
        this();
        inputStreamReader2 = inputStreamReader;
        stringBuilder2.append("Error reading layout file: ");
        inputStreamReader2 = inputStreamReader;
        stringBuilder2.append(this);
        inputStreamReader2 = inputStreamReader;
        this(stringBuilder2.toString(), paramString);
        inputStreamReader2 = inputStreamReader;
        throw gdxRuntimeException;
      } finally {}
    } else {
      StringBuilder stringBuilder = stringBuilder2;
      GdxRuntimeException gdxRuntimeException1 = gdxRuntimeException;
      inputStreamReader1 = new InputStreamReader(read(), paramString);
      inputStreamReader2 = inputStreamReader1;
      InputStreamReader inputStreamReader = inputStreamReader1;
    } 
    StreamUtils.closeQuietly(inputStreamReader2);
    throw inputStreamReader1;
  }
  
  public BufferedReader reader(int paramInt) { return new BufferedReader(new InputStreamReader(read()), paramInt); }
  
  public BufferedReader reader(int paramInt, String paramString) {
    try {
      InputStreamReader inputStreamReader = new InputStreamReader();
      this(read(), paramString);
      return new BufferedReader(inputStreamReader, paramInt);
    } catch (UnsupportedEncodingException unsupportedEncodingException) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(this);
      throw new GdxRuntimeException(stringBuilder.toString(), unsupportedEncodingException);
    } 
  }
  
  public Reader reader() { return new InputStreamReader(read()); }
  
  public Reader reader(String paramString) {
    InputStream inputStream = read();
    try {
      return new InputStreamReader(inputStream, paramString);
    } catch (UnsupportedEncodingException paramString) {
      StreamUtils.closeQuietly(inputStream);
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error reading file: ");
      stringBuilder.append(this);
      throw new GdxRuntimeException(stringBuilder.toString(), paramString);
    } 
  }
  
  public FileHandle sibling(String paramString) {
    if (this.file.getPath().length() != 0)
      return new FileHandle(new File(this.file.getParent(), paramString), this.type); 
    throw new GdxRuntimeException("Cannot get the sibling of the root.");
  }
  
  public String toString() { return this.file.getPath().replace('\\', '/'); }
  
  public Files.FileType type() { return this.type; }
  
  public OutputStream write(boolean paramBoolean) {
    if (this.type != Files.FileType.Classpath) {
      if (this.type != Files.FileType.Internal) {
        parent().mkdirs();
        try {
          return new FileOutputStream(file(), paramBoolean);
        } catch (Exception exception) {
          if (file().isDirectory()) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("Cannot open a stream to a directory: ");
            stringBuilder3.append(this.file);
            stringBuilder3.append(" (");
            stringBuilder3.append(this.type);
            stringBuilder3.append(")");
            throw new GdxRuntimeException(stringBuilder3.toString(), exception);
          } 
          StringBuilder stringBuilder2 = new StringBuilder();
          stringBuilder2.append("Error writing file: ");
          stringBuilder2.append(this.file);
          stringBuilder2.append(" (");
          stringBuilder2.append(this.type);
          stringBuilder2.append(")");
          throw new GdxRuntimeException(stringBuilder2.toString(), exception);
        } 
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot write to an internal file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot write to a classpath file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public OutputStream write(boolean paramBoolean, int paramInt) { return new BufferedOutputStream(write(paramBoolean), paramInt); }
  
  public void write(InputStream paramInputStream, boolean paramBoolean) {
    OutputStream outputStream1 = null;
    OutputStream outputStream2 = null;
    try {
      OutputStream outputStream = write(paramBoolean);
      outputStream2 = outputStream;
      outputStream1 = outputStream;
      StreamUtils.copyStream(paramInputStream, outputStream);
      StreamUtils.closeQuietly(paramInputStream);
      StreamUtils.closeQuietly(outputStream);
      return;
    } catch (Exception exception) {
      outputStream2 = outputStream1;
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      outputStream2 = outputStream1;
      StringBuilder stringBuilder = new StringBuilder();
      outputStream2 = outputStream1;
      this();
      outputStream2 = outputStream1;
      stringBuilder.append("Error stream writing to file: ");
      outputStream2 = outputStream1;
      stringBuilder.append(this.file);
      outputStream2 = outputStream1;
      stringBuilder.append(" (");
      outputStream2 = outputStream1;
      stringBuilder.append(this.type);
      outputStream2 = outputStream1;
      stringBuilder.append(")");
      outputStream2 = outputStream1;
      this(stringBuilder.toString(), exception);
      outputStream2 = outputStream1;
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(paramInputStream);
    StreamUtils.closeQuietly(outputStream2);
    throw outputStream1;
  }
  
  public void writeBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean paramBoolean) {
    OutputStream outputStream = write(paramBoolean);
    try {
      outputStream.write(paramArrayOfByte, paramInt1, paramInt2);
      StreamUtils.closeQuietly(outputStream);
      return;
    } catch (IOException iOException) {
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      StringBuilder stringBuilder = new StringBuilder();
      this();
      stringBuilder.append("Error writing file: ");
      stringBuilder.append(this.file);
      stringBuilder.append(" (");
      stringBuilder.append(this.type);
      stringBuilder.append(")");
      this(stringBuilder.toString(), iOException);
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(outputStream);
    throw paramArrayOfByte;
  }
  
  public void writeBytes(byte[] paramArrayOfByte, boolean paramBoolean) {
    OutputStream outputStream = write(paramBoolean);
    try {
      outputStream.write(paramArrayOfByte);
      StreamUtils.closeQuietly(outputStream);
      return;
    } catch (IOException iOException) {
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      StringBuilder stringBuilder = new StringBuilder();
      this();
      stringBuilder.append("Error writing file: ");
      stringBuilder.append(this.file);
      stringBuilder.append(" (");
      stringBuilder.append(this.type);
      stringBuilder.append(")");
      this(stringBuilder.toString(), iOException);
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(outputStream);
    throw paramArrayOfByte;
  }
  
  public void writeString(String paramString, boolean paramBoolean) { writeString(paramString, paramBoolean, null); }
  
  public void writeString(String paramString1, boolean paramBoolean, String paramString2) {
    Writer writer1 = null;
    Writer writer2 = null;
    try {
      Writer writer = writer(paramBoolean, paramString2);
      writer2 = writer;
      writer1 = writer;
      writer.write(paramString1);
      StreamUtils.closeQuietly(writer);
      return;
    } catch (Exception exception) {
      writer2 = writer1;
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      writer2 = writer1;
      StringBuilder stringBuilder = new StringBuilder();
      writer2 = writer1;
      this();
      writer2 = writer1;
      stringBuilder.append("Error writing file: ");
      writer2 = writer1;
      stringBuilder.append(this.file);
      writer2 = writer1;
      stringBuilder.append(" (");
      writer2 = writer1;
      stringBuilder.append(this.type);
      writer2 = writer1;
      stringBuilder.append(")");
      writer2 = writer1;
      this(stringBuilder.toString(), exception);
      writer2 = writer1;
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(writer2);
    throw paramString1;
  }
  
  public Writer writer(boolean paramBoolean) { return writer(paramBoolean, null); }
  
  public Writer writer(boolean paramBoolean, String paramString) {
    if (this.type != Files.FileType.Classpath) {
      if (this.type != Files.FileType.Internal) {
        parent().mkdirs();
        try {
          FileOutputStream fileOutputStream = new FileOutputStream();
          this(file(), paramBoolean);
          return (paramString == null) ? new OutputStreamWriter(fileOutputStream) : new OutputStreamWriter(fileOutputStream, paramString);
        } catch (IOException paramString) {
          if (file().isDirectory()) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("Cannot open a stream to a directory: ");
            stringBuilder3.append(this.file);
            stringBuilder3.append(" (");
            stringBuilder3.append(this.type);
            stringBuilder3.append(")");
            throw new GdxRuntimeException(stringBuilder3.toString(), paramString);
          } 
          StringBuilder stringBuilder2 = new StringBuilder();
          stringBuilder2.append("Error writing file: ");
          stringBuilder2.append(this.file);
          stringBuilder2.append(" (");
          stringBuilder2.append(this.type);
          stringBuilder2.append(")");
          throw new GdxRuntimeException(stringBuilder2.toString(), paramString);
        } 
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("Cannot write to an internal file: ");
      stringBuilder1.append(this.file);
      throw new GdxRuntimeException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Cannot write to a classpath file: ");
    stringBuilder.append(this.file);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/files/FileHandle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */