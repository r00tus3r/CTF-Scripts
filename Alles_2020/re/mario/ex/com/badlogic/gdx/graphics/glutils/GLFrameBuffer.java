package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public abstract class GLFrameBuffer<T extends GLTexture> extends Object implements Disposable {
  protected static final int GL_DEPTH24_STENCIL8_OES = 35056;
  
  protected static final Map<Application, Array<GLFrameBuffer>> buffers = new HashMap();
  
  protected static int defaultFramebufferHandle;
  
  protected static boolean defaultFramebufferHandleInitialized = false;
  
  protected GLFrameBufferBuilder<? extends GLFrameBuffer<T>> bufferBuilder;
  
  protected int depthStencilPackedBufferHandle;
  
  protected int depthbufferHandle;
  
  protected int framebufferHandle;
  
  protected boolean hasDepthStencilPackedBuffer;
  
  protected boolean isMRT;
  
  protected int stencilbufferHandle;
  
  protected Array<T> textureAttachments = new Array();
  
  GLFrameBuffer() {}
  
  protected GLFrameBuffer(GLFrameBufferBuilder<? extends GLFrameBuffer<T>> paramGLFrameBufferBuilder) {
    this.bufferBuilder = paramGLFrameBufferBuilder;
    build();
  }
  
  private static void addManagedFrameBuffer(Application paramApplication, GLFrameBuffer paramGLFrameBuffer) {
    Array array1 = (Array)buffers.get(paramApplication);
    Array array2 = array1;
    if (array1 == null)
      array2 = new Array(); 
    array2.add(paramGLFrameBuffer);
    buffers.put(paramApplication, array2);
  }
  
  private void checkValidBuilder() {
    if (!Gdx.graphics.isGL30Available())
      if (!this.bufferBuilder.hasPackedStencilDepthRenderBuffer) {
        if (this.bufferBuilder.textureAttachmentSpecs.size <= 1) {
          for (FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec : this.bufferBuilder.textureAttachmentSpecs) {
            if (!frameBufferTextureAttachmentSpec.isDepth) {
              if (!frameBufferTextureAttachmentSpec.isStencil) {
                if (!frameBufferTextureAttachmentSpec.isFloat || Gdx.graphics.supportsExtension("OES_texture_float"))
                  continue; 
                throw new GdxRuntimeException("Float texture FrameBuffer Attachment not available on GLES 2.0");
              } 
              throw new GdxRuntimeException("Stencil texture FrameBuffer Attachment not available on GLES 2.0");
            } 
            throw new GdxRuntimeException("Depth texture FrameBuffer Attachment not available on GLES 2.0");
          } 
        } else {
          throw new GdxRuntimeException("Multiple render targets not available on GLES 2.0");
        } 
      } else {
        throw new GdxRuntimeException("Packed Stencil/Render render buffers are not available on GLES 2.0");
      }  
  }
  
  public static void clearAllFrameBuffers(Application paramApplication) { buffers.remove(paramApplication); }
  
  public static String getManagedStatus() { return getManagedStatus(new StringBuilder()).toString(); }
  
  public static StringBuilder getManagedStatus(StringBuilder paramStringBuilder) {
    paramStringBuilder.append("Managed buffers/app: { ");
    for (Application application : buffers.keySet()) {
      paramStringBuilder.append(((Array)buffers.get(application)).size);
      paramStringBuilder.append(" ");
    } 
    paramStringBuilder.append("}");
    return paramStringBuilder;
  }
  
  public static void invalidateAllFrameBuffers(Application paramApplication) {
    if (Gdx.gl20 == null)
      return; 
    Array array = (Array)buffers.get(paramApplication);
    if (array == null)
      return; 
    for (byte b = 0; b < array.size; b++)
      ((GLFrameBuffer)array.get(b)).build(); 
  }
  
  public static void unbind() { Gdx.gl20.glBindFramebuffer(36160, defaultFramebufferHandle); }
  
  protected abstract void attachFrameBufferColorTexture(T paramT);
  
  public void begin() {
    bind();
    setFrameBufferViewport();
  }
  
  public void bind() { Gdx.gl20.glBindFramebuffer(36160, this.framebufferHandle); }
  
  protected void build() { // Byte code:
    //   0: getstatic com/badlogic/gdx/Gdx.gl20 : Lcom/badlogic/gdx/graphics/GL20;
    //   3: astore_1
    //   4: aload_0
    //   5: invokespecial checkValidBuilder : ()V
    //   8: getstatic com/badlogic/gdx/graphics/glutils/GLFrameBuffer.defaultFramebufferHandleInitialized : Z
    //   11: ifne -> 72
    //   14: iconst_1
    //   15: putstatic com/badlogic/gdx/graphics/glutils/GLFrameBuffer.defaultFramebufferHandleInitialized : Z
    //   18: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   21: invokeinterface getType : ()Lcom/badlogic/gdx/Application$ApplicationType;
    //   26: getstatic com/badlogic/gdx/Application$ApplicationType.iOS : Lcom/badlogic/gdx/Application$ApplicationType;
    //   29: if_acmpne -> 68
    //   32: bipush #64
    //   34: invokestatic allocateDirect : (I)Ljava/nio/ByteBuffer;
    //   37: invokestatic nativeOrder : ()Ljava/nio/ByteOrder;
    //   40: invokevirtual order : (Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;
    //   43: invokevirtual asIntBuffer : ()Ljava/nio/IntBuffer;
    //   46: astore_2
    //   47: aload_1
    //   48: ldc_w 36006
    //   51: aload_2
    //   52: invokeinterface glGetIntegerv : (ILjava/nio/IntBuffer;)V
    //   57: aload_2
    //   58: iconst_0
    //   59: invokevirtual get : (I)I
    //   62: putstatic com/badlogic/gdx/graphics/glutils/GLFrameBuffer.defaultFramebufferHandle : I
    //   65: goto -> 72
    //   68: iconst_0
    //   69: putstatic com/badlogic/gdx/graphics/glutils/GLFrameBuffer.defaultFramebufferHandle : I
    //   72: aload_0
    //   73: aload_1
    //   74: invokeinterface glGenFramebuffer : ()I
    //   79: putfield framebufferHandle : I
    //   82: aload_1
    //   83: ldc 36160
    //   85: aload_0
    //   86: getfield framebufferHandle : I
    //   89: invokeinterface glBindFramebuffer : (II)V
    //   94: aload_0
    //   95: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   98: getfield width : I
    //   101: istore_3
    //   102: aload_0
    //   103: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   106: getfield height : I
    //   109: istore #4
    //   111: aload_0
    //   112: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   115: getfield hasDepthRenderBuffer : Z
    //   118: ifeq -> 166
    //   121: aload_0
    //   122: aload_1
    //   123: invokeinterface glGenRenderbuffer : ()I
    //   128: putfield depthbufferHandle : I
    //   131: aload_1
    //   132: ldc_w 36161
    //   135: aload_0
    //   136: getfield depthbufferHandle : I
    //   139: invokeinterface glBindRenderbuffer : (II)V
    //   144: aload_1
    //   145: ldc_w 36161
    //   148: aload_0
    //   149: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   152: getfield depthRenderBufferSpec : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;
    //   155: getfield internalFormat : I
    //   158: iload_3
    //   159: iload #4
    //   161: invokeinterface glRenderbufferStorage : (IIII)V
    //   166: aload_0
    //   167: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   170: getfield hasStencilRenderBuffer : Z
    //   173: ifeq -> 221
    //   176: aload_0
    //   177: aload_1
    //   178: invokeinterface glGenRenderbuffer : ()I
    //   183: putfield stencilbufferHandle : I
    //   186: aload_1
    //   187: ldc_w 36161
    //   190: aload_0
    //   191: getfield stencilbufferHandle : I
    //   194: invokeinterface glBindRenderbuffer : (II)V
    //   199: aload_1
    //   200: ldc_w 36161
    //   203: aload_0
    //   204: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   207: getfield stencilRenderBufferSpec : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;
    //   210: getfield internalFormat : I
    //   213: iload_3
    //   214: iload #4
    //   216: invokeinterface glRenderbufferStorage : (IIII)V
    //   221: aload_0
    //   222: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   225: getfield hasPackedStencilDepthRenderBuffer : Z
    //   228: ifeq -> 276
    //   231: aload_0
    //   232: aload_1
    //   233: invokeinterface glGenRenderbuffer : ()I
    //   238: putfield depthStencilPackedBufferHandle : I
    //   241: aload_1
    //   242: ldc_w 36161
    //   245: aload_0
    //   246: getfield depthStencilPackedBufferHandle : I
    //   249: invokeinterface glBindRenderbuffer : (II)V
    //   254: aload_1
    //   255: ldc_w 36161
    //   258: aload_0
    //   259: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   262: getfield packedStencilDepthRenderBufferSpec : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferRenderBufferAttachmentSpec;
    //   265: getfield internalFormat : I
    //   268: iload_3
    //   269: iload #4
    //   271: invokeinterface glRenderbufferStorage : (IIII)V
    //   276: aload_0
    //   277: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   280: getfield textureAttachmentSpecs : Lcom/badlogic/gdx/utils/Array;
    //   283: getfield size : I
    //   286: iconst_1
    //   287: if_icmple -> 296
    //   290: iconst_1
    //   291: istore #5
    //   293: goto -> 299
    //   296: iconst_0
    //   297: istore #5
    //   299: aload_0
    //   300: iload #5
    //   302: putfield isMRT : Z
    //   305: aload_0
    //   306: getfield isMRT : Z
    //   309: ifeq -> 463
    //   312: aload_0
    //   313: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   316: getfield textureAttachmentSpecs : Lcom/badlogic/gdx/utils/Array;
    //   319: invokevirtual iterator : ()Ljava/util/Iterator;
    //   322: astore #6
    //   324: iconst_0
    //   325: istore #7
    //   327: aload #6
    //   329: invokeinterface hasNext : ()Z
    //   334: ifeq -> 460
    //   337: aload #6
    //   339: invokeinterface next : ()Ljava/lang/Object;
    //   344: checkcast com/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec
    //   347: astore #8
    //   349: aload_0
    //   350: aload #8
    //   352: invokevirtual createTexture : (Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/GLTexture;
    //   355: astore_2
    //   356: aload_0
    //   357: getfield textureAttachments : Lcom/badlogic/gdx/utils/Array;
    //   360: aload_2
    //   361: invokevirtual add : (Ljava/lang/Object;)V
    //   364: aload #8
    //   366: invokevirtual isColorTexture : ()Z
    //   369: ifeq -> 400
    //   372: aload_1
    //   373: ldc 36160
    //   375: iload #7
    //   377: ldc_w 36064
    //   380: iadd
    //   381: sipush #3553
    //   384: aload_2
    //   385: invokevirtual getTextureObjectHandle : ()I
    //   388: iconst_0
    //   389: invokeinterface glFramebufferTexture2D : (IIIII)V
    //   394: iinc #7, 1
    //   397: goto -> 327
    //   400: aload #8
    //   402: getfield isDepth : Z
    //   405: ifeq -> 430
    //   408: aload_1
    //   409: ldc 36160
    //   411: ldc_w 36096
    //   414: sipush #3553
    //   417: aload_2
    //   418: invokevirtual getTextureObjectHandle : ()I
    //   421: iconst_0
    //   422: invokeinterface glFramebufferTexture2D : (IIIII)V
    //   427: goto -> 327
    //   430: aload #8
    //   432: getfield isStencil : Z
    //   435: ifeq -> 327
    //   438: aload_1
    //   439: ldc 36160
    //   441: ldc_w 36128
    //   444: sipush #3553
    //   447: aload_2
    //   448: invokevirtual getTextureObjectHandle : ()I
    //   451: iconst_0
    //   452: invokeinterface glFramebufferTexture2D : (IIIII)V
    //   457: goto -> 327
    //   460: goto -> 506
    //   463: aload_0
    //   464: aload_0
    //   465: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   468: getfield textureAttachmentSpecs : Lcom/badlogic/gdx/utils/Array;
    //   471: invokevirtual first : ()Ljava/lang/Object;
    //   474: checkcast com/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec
    //   477: invokevirtual createTexture : (Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/GLTexture;
    //   480: astore_2
    //   481: aload_0
    //   482: getfield textureAttachments : Lcom/badlogic/gdx/utils/Array;
    //   485: aload_2
    //   486: invokevirtual add : (Ljava/lang/Object;)V
    //   489: aload_1
    //   490: aload_2
    //   491: getfield glTarget : I
    //   494: aload_2
    //   495: invokevirtual getTextureObjectHandle : ()I
    //   498: invokeinterface glBindTexture : (II)V
    //   503: iconst_0
    //   504: istore #7
    //   506: aload_0
    //   507: getfield isMRT : Z
    //   510: ifeq -> 566
    //   513: iload #7
    //   515: invokestatic newIntBuffer : (I)Ljava/nio/IntBuffer;
    //   518: astore_2
    //   519: iconst_0
    //   520: istore #9
    //   522: iload #9
    //   524: iload #7
    //   526: if_icmpge -> 546
    //   529: aload_2
    //   530: iload #9
    //   532: ldc_w 36064
    //   535: iadd
    //   536: invokevirtual put : (I)Ljava/nio/IntBuffer;
    //   539: pop
    //   540: iinc #9, 1
    //   543: goto -> 522
    //   546: aload_2
    //   547: iconst_0
    //   548: invokevirtual position : (I)Ljava/nio/Buffer;
    //   551: pop
    //   552: getstatic com/badlogic/gdx/Gdx.gl30 : Lcom/badlogic/gdx/graphics/GL30;
    //   555: iload #7
    //   557: aload_2
    //   558: invokeinterface glDrawBuffers : (ILjava/nio/IntBuffer;)V
    //   563: goto -> 580
    //   566: aload_0
    //   567: aload_0
    //   568: getfield textureAttachments : Lcom/badlogic/gdx/utils/Array;
    //   571: invokevirtual first : ()Ljava/lang/Object;
    //   574: checkcast com/badlogic/gdx/graphics/GLTexture
    //   577: invokevirtual attachFrameBufferColorTexture : (Lcom/badlogic/gdx/graphics/GLTexture;)V
    //   580: aload_0
    //   581: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   584: getfield hasDepthRenderBuffer : Z
    //   587: ifeq -> 608
    //   590: aload_1
    //   591: ldc 36160
    //   593: ldc_w 36096
    //   596: ldc_w 36161
    //   599: aload_0
    //   600: getfield depthbufferHandle : I
    //   603: invokeinterface glFramebufferRenderbuffer : (IIII)V
    //   608: aload_0
    //   609: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   612: getfield hasStencilRenderBuffer : Z
    //   615: ifeq -> 636
    //   618: aload_1
    //   619: ldc 36160
    //   621: ldc_w 36128
    //   624: ldc_w 36161
    //   627: aload_0
    //   628: getfield stencilbufferHandle : I
    //   631: invokeinterface glFramebufferRenderbuffer : (IIII)V
    //   636: aload_0
    //   637: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   640: getfield hasPackedStencilDepthRenderBuffer : Z
    //   643: ifeq -> 664
    //   646: aload_1
    //   647: ldc 36160
    //   649: ldc_w 33306
    //   652: ldc_w 36161
    //   655: aload_0
    //   656: getfield depthStencilPackedBufferHandle : I
    //   659: invokeinterface glFramebufferRenderbuffer : (IIII)V
    //   664: aload_1
    //   665: ldc_w 36161
    //   668: iconst_0
    //   669: invokeinterface glBindRenderbuffer : (II)V
    //   674: aload_0
    //   675: getfield textureAttachments : Lcom/badlogic/gdx/utils/Array;
    //   678: invokevirtual iterator : ()Ljava/util/Iterator;
    //   681: astore_2
    //   682: aload_2
    //   683: invokeinterface hasNext : ()Z
    //   688: ifeq -> 713
    //   691: aload_1
    //   692: aload_2
    //   693: invokeinterface next : ()Ljava/lang/Object;
    //   698: checkcast com/badlogic/gdx/graphics/GLTexture
    //   701: getfield glTarget : I
    //   704: iconst_0
    //   705: invokeinterface glBindTexture : (II)V
    //   710: goto -> 682
    //   713: aload_1
    //   714: ldc 36160
    //   716: invokeinterface glCheckFramebufferStatus : (I)I
    //   721: istore #9
    //   723: iload #9
    //   725: istore #7
    //   727: iload #9
    //   729: ldc_w 36061
    //   732: if_icmpne -> 968
    //   735: iload #9
    //   737: istore #7
    //   739: aload_0
    //   740: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   743: getfield hasDepthRenderBuffer : Z
    //   746: ifeq -> 968
    //   749: iload #9
    //   751: istore #7
    //   753: aload_0
    //   754: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   757: getfield hasStencilRenderBuffer : Z
    //   760: ifeq -> 968
    //   763: getstatic com/badlogic/gdx/Gdx.graphics : Lcom/badlogic/gdx/Graphics;
    //   766: ldc_w 'GL_OES_packed_depth_stencil'
    //   769: invokeinterface supportsExtension : (Ljava/lang/String;)Z
    //   774: ifne -> 795
    //   777: iload #9
    //   779: istore #7
    //   781: getstatic com/badlogic/gdx/Gdx.graphics : Lcom/badlogic/gdx/Graphics;
    //   784: ldc_w 'GL_EXT_packed_depth_stencil'
    //   787: invokeinterface supportsExtension : (Ljava/lang/String;)Z
    //   792: ifeq -> 968
    //   795: aload_0
    //   796: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   799: getfield hasDepthRenderBuffer : Z
    //   802: ifeq -> 820
    //   805: aload_1
    //   806: aload_0
    //   807: getfield depthbufferHandle : I
    //   810: invokeinterface glDeleteRenderbuffer : (I)V
    //   815: aload_0
    //   816: iconst_0
    //   817: putfield depthbufferHandle : I
    //   820: aload_0
    //   821: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   824: getfield hasStencilRenderBuffer : Z
    //   827: ifeq -> 845
    //   830: aload_1
    //   831: aload_0
    //   832: getfield stencilbufferHandle : I
    //   835: invokeinterface glDeleteRenderbuffer : (I)V
    //   840: aload_0
    //   841: iconst_0
    //   842: putfield stencilbufferHandle : I
    //   845: aload_0
    //   846: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   849: getfield hasPackedStencilDepthRenderBuffer : Z
    //   852: ifeq -> 870
    //   855: aload_1
    //   856: aload_0
    //   857: getfield depthStencilPackedBufferHandle : I
    //   860: invokeinterface glDeleteRenderbuffer : (I)V
    //   865: aload_0
    //   866: iconst_0
    //   867: putfield depthStencilPackedBufferHandle : I
    //   870: aload_0
    //   871: aload_1
    //   872: invokeinterface glGenRenderbuffer : ()I
    //   877: putfield depthStencilPackedBufferHandle : I
    //   880: aload_0
    //   881: iconst_1
    //   882: putfield hasDepthStencilPackedBuffer : Z
    //   885: aload_1
    //   886: ldc_w 36161
    //   889: aload_0
    //   890: getfield depthStencilPackedBufferHandle : I
    //   893: invokeinterface glBindRenderbuffer : (II)V
    //   898: aload_1
    //   899: ldc_w 36161
    //   902: ldc 35056
    //   904: iload_3
    //   905: iload #4
    //   907: invokeinterface glRenderbufferStorage : (IIII)V
    //   912: aload_1
    //   913: ldc_w 36161
    //   916: iconst_0
    //   917: invokeinterface glBindRenderbuffer : (II)V
    //   922: aload_1
    //   923: ldc 36160
    //   925: ldc_w 36096
    //   928: ldc_w 36161
    //   931: aload_0
    //   932: getfield depthStencilPackedBufferHandle : I
    //   935: invokeinterface glFramebufferRenderbuffer : (IIII)V
    //   940: aload_1
    //   941: ldc 36160
    //   943: ldc_w 36128
    //   946: ldc_w 36161
    //   949: aload_0
    //   950: getfield depthStencilPackedBufferHandle : I
    //   953: invokeinterface glFramebufferRenderbuffer : (IIII)V
    //   958: aload_1
    //   959: ldc 36160
    //   961: invokeinterface glCheckFramebufferStatus : (I)I
    //   966: istore #7
    //   968: aload_1
    //   969: ldc 36160
    //   971: getstatic com/badlogic/gdx/graphics/glutils/GLFrameBuffer.defaultFramebufferHandle : I
    //   974: invokeinterface glBindFramebuffer : (II)V
    //   979: iload #7
    //   981: ldc_w 36053
    //   984: if_icmpeq -> 1201
    //   987: aload_0
    //   988: getfield textureAttachments : Lcom/badlogic/gdx/utils/Array;
    //   991: invokevirtual iterator : ()Ljava/util/Iterator;
    //   994: astore_2
    //   995: aload_2
    //   996: invokeinterface hasNext : ()Z
    //   1001: ifeq -> 1020
    //   1004: aload_0
    //   1005: aload_2
    //   1006: invokeinterface next : ()Ljava/lang/Object;
    //   1011: checkcast com/badlogic/gdx/graphics/GLTexture
    //   1014: invokevirtual disposeColorTexture : (Lcom/badlogic/gdx/graphics/GLTexture;)V
    //   1017: goto -> 995
    //   1020: aload_0
    //   1021: getfield hasDepthStencilPackedBuffer : Z
    //   1024: ifeq -> 1040
    //   1027: aload_1
    //   1028: aload_0
    //   1029: getfield depthStencilPackedBufferHandle : I
    //   1032: invokeinterface glDeleteBuffer : (I)V
    //   1037: goto -> 1080
    //   1040: aload_0
    //   1041: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   1044: getfield hasDepthRenderBuffer : Z
    //   1047: ifeq -> 1060
    //   1050: aload_1
    //   1051: aload_0
    //   1052: getfield depthbufferHandle : I
    //   1055: invokeinterface glDeleteRenderbuffer : (I)V
    //   1060: aload_0
    //   1061: getfield bufferBuilder : Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    //   1064: getfield hasStencilRenderBuffer : Z
    //   1067: ifeq -> 1080
    //   1070: aload_1
    //   1071: aload_0
    //   1072: getfield stencilbufferHandle : I
    //   1075: invokeinterface glDeleteRenderbuffer : (I)V
    //   1080: aload_1
    //   1081: aload_0
    //   1082: getfield framebufferHandle : I
    //   1085: invokeinterface glDeleteFramebuffer : (I)V
    //   1090: iload #7
    //   1092: ldc_w 36054
    //   1095: if_icmpeq -> 1190
    //   1098: iload #7
    //   1100: ldc_w 36057
    //   1103: if_icmpeq -> 1179
    //   1106: iload #7
    //   1108: ldc_w 36055
    //   1111: if_icmpeq -> 1168
    //   1114: iload #7
    //   1116: ldc_w 36061
    //   1119: if_icmpne -> 1133
    //   1122: new java/lang/IllegalStateException
    //   1125: dup
    //   1126: ldc_w 'Frame buffer couldn't be constructed: unsupported combination of formats'
    //   1129: invokespecial <init> : (Ljava/lang/String;)V
    //   1132: athrow
    //   1133: new java/lang/StringBuilder
    //   1136: dup
    //   1137: invokespecial <init> : ()V
    //   1140: astore_1
    //   1141: aload_1
    //   1142: ldc_w 'Frame buffer couldn't be constructed: unknown error '
    //   1145: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1148: pop
    //   1149: aload_1
    //   1150: iload #7
    //   1152: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   1155: pop
    //   1156: new java/lang/IllegalStateException
    //   1159: dup
    //   1160: aload_1
    //   1161: invokevirtual toString : ()Ljava/lang/String;
    //   1164: invokespecial <init> : (Ljava/lang/String;)V
    //   1167: athrow
    //   1168: new java/lang/IllegalStateException
    //   1171: dup
    //   1172: ldc_w 'Frame buffer couldn't be constructed: missing attachment'
    //   1175: invokespecial <init> : (Ljava/lang/String;)V
    //   1178: athrow
    //   1179: new java/lang/IllegalStateException
    //   1182: dup
    //   1183: ldc_w 'Frame buffer couldn't be constructed: incomplete dimensions'
    //   1186: invokespecial <init> : (Ljava/lang/String;)V
    //   1189: athrow
    //   1190: new java/lang/IllegalStateException
    //   1193: dup
    //   1194: ldc_w 'Frame buffer couldn't be constructed: incomplete attachment'
    //   1197: invokespecial <init> : (Ljava/lang/String;)V
    //   1200: athrow
    //   1201: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   1204: aload_0
    //   1205: invokestatic addManagedFrameBuffer : (Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;)V
    //   1208: return }
  
  protected abstract T createTexture(FrameBufferTextureAttachmentSpec paramFrameBufferTextureAttachmentSpec);
  
  public void dispose() {
    GL20 gL20 = Gdx.gl20;
    Iterator iterator = this.textureAttachments.iterator();
    while (iterator.hasNext())
      disposeColorTexture((GLTexture)iterator.next()); 
    if (this.hasDepthStencilPackedBuffer) {
      gL20.glDeleteRenderbuffer(this.depthStencilPackedBufferHandle);
    } else {
      if (this.bufferBuilder.hasDepthRenderBuffer)
        gL20.glDeleteRenderbuffer(this.depthbufferHandle); 
      if (this.bufferBuilder.hasStencilRenderBuffer)
        gL20.glDeleteRenderbuffer(this.stencilbufferHandle); 
    } 
    gL20.glDeleteFramebuffer(this.framebufferHandle);
    if (buffers.get(Gdx.app) != null)
      ((Array)buffers.get(Gdx.app)).removeValue(this, true); 
  }
  
  protected abstract void disposeColorTexture(T paramT);
  
  public void end() { end(0, 0, Gdx.graphics.getBackBufferWidth(), Gdx.graphics.getBackBufferHeight()); }
  
  public void end(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    unbind();
    Gdx.gl20.glViewport(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public T getColorBufferTexture() { return (T)(GLTexture)this.textureAttachments.first(); }
  
  public int getDepthBufferHandle() { return this.depthbufferHandle; }
  
  protected int getDepthStencilPackedBuffer() { return this.depthStencilPackedBufferHandle; }
  
  public int getFramebufferHandle() { return this.framebufferHandle; }
  
  public int getHeight() { return this.bufferBuilder.height; }
  
  public int getStencilBufferHandle() { return this.stencilbufferHandle; }
  
  public Array<T> getTextureAttachments() { return this.textureAttachments; }
  
  public int getWidth() { return this.bufferBuilder.width; }
  
  protected void setFrameBufferViewport() { Gdx.gl20.glViewport(0, 0, this.bufferBuilder.width, this.bufferBuilder.height); }
  
  public static class FloatFrameBufferBuilder extends GLFrameBufferBuilder<FloatFrameBuffer> {
    public FloatFrameBufferBuilder(int param1Int1, int param1Int2) { super(param1Int1, param1Int2); }
    
    public FloatFrameBuffer build() { return new FloatFrameBuffer(this); }
  }
  
  public static class FrameBufferBuilder extends GLFrameBufferBuilder<FrameBuffer> {
    public FrameBufferBuilder(int param1Int1, int param1Int2) { super(param1Int1, param1Int2); }
    
    public FrameBuffer build() { return new FrameBuffer(this); }
  }
  
  public static class FrameBufferCubemapBuilder extends GLFrameBufferBuilder<FrameBufferCubemap> {
    public FrameBufferCubemapBuilder(int param1Int1, int param1Int2) { super(param1Int1, param1Int2); }
    
    public FrameBufferCubemap build() { return new FrameBufferCubemap(this); }
  }
  
  protected static class FrameBufferRenderBufferAttachmentSpec {
    int internalFormat;
    
    public FrameBufferRenderBufferAttachmentSpec(int param1Int) { this.internalFormat = param1Int; }
  }
  
  protected static class FrameBufferTextureAttachmentSpec {
    int format;
    
    int internalFormat;
    
    boolean isDepth;
    
    boolean isFloat;
    
    boolean isGpuOnly;
    
    boolean isStencil;
    
    int type;
    
    public FrameBufferTextureAttachmentSpec(int param1Int1, int param1Int2, int param1Int3) {
      this.internalFormat = param1Int1;
      this.format = param1Int2;
      this.type = param1Int3;
    }
    
    public boolean isColorTexture() {
      boolean bool;
      if (!this.isDepth && !this.isStencil) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
  }
  
  protected static abstract class GLFrameBufferBuilder<U extends GLFrameBuffer<? extends GLTexture>> extends Object {
    protected GLFrameBuffer.FrameBufferRenderBufferAttachmentSpec depthRenderBufferSpec;
    
    protected boolean hasDepthRenderBuffer;
    
    protected boolean hasPackedStencilDepthRenderBuffer;
    
    protected boolean hasStencilRenderBuffer;
    
    protected int height;
    
    protected GLFrameBuffer.FrameBufferRenderBufferAttachmentSpec packedStencilDepthRenderBufferSpec;
    
    protected GLFrameBuffer.FrameBufferRenderBufferAttachmentSpec stencilRenderBufferSpec;
    
    protected Array<GLFrameBuffer.FrameBufferTextureAttachmentSpec> textureAttachmentSpecs = new Array();
    
    protected int width;
    
    public GLFrameBufferBuilder(int param1Int1, int param1Int2) {
      this.width = param1Int1;
      this.height = param1Int2;
    }
    
    public GLFrameBufferBuilder<U> addBasicColorTextureAttachment(Pixmap.Format param1Format) {
      int i = Pixmap.Format.toGlFormat(param1Format);
      return addColorTextureAttachment(i, i, Pixmap.Format.toGlType(param1Format));
    }
    
    public GLFrameBufferBuilder<U> addBasicDepthRenderBuffer() { return addDepthRenderBuffer(33189); }
    
    public GLFrameBufferBuilder<U> addBasicStencilDepthPackedRenderBuffer() { return addStencilDepthPackedRenderBuffer(35056); }
    
    public GLFrameBufferBuilder<U> addBasicStencilRenderBuffer() { return addStencilRenderBuffer(36168); }
    
    public GLFrameBufferBuilder<U> addColorTextureAttachment(int param1Int1, int param1Int2, int param1Int3) {
      this.textureAttachmentSpecs.add(new GLFrameBuffer.FrameBufferTextureAttachmentSpec(param1Int1, param1Int2, param1Int3));
      return this;
    }
    
    public GLFrameBufferBuilder<U> addDepthRenderBuffer(int param1Int) {
      this.depthRenderBufferSpec = new GLFrameBuffer.FrameBufferRenderBufferAttachmentSpec(param1Int);
      this.hasDepthRenderBuffer = true;
      return this;
    }
    
    public GLFrameBufferBuilder<U> addDepthTextureAttachment(int param1Int1, int param1Int2) {
      GLFrameBuffer.FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec = new GLFrameBuffer.FrameBufferTextureAttachmentSpec(param1Int1, 'ᤂ', param1Int2);
      frameBufferTextureAttachmentSpec.isDepth = true;
      this.textureAttachmentSpecs.add(frameBufferTextureAttachmentSpec);
      return this;
    }
    
    public GLFrameBufferBuilder<U> addFloatAttachment(int param1Int1, int param1Int2, int param1Int3, boolean param1Boolean) {
      GLFrameBuffer.FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec = new GLFrameBuffer.FrameBufferTextureAttachmentSpec(param1Int1, param1Int2, param1Int3);
      frameBufferTextureAttachmentSpec.isFloat = true;
      frameBufferTextureAttachmentSpec.isGpuOnly = param1Boolean;
      this.textureAttachmentSpecs.add(frameBufferTextureAttachmentSpec);
      return this;
    }
    
    public GLFrameBufferBuilder<U> addStencilDepthPackedRenderBuffer(int param1Int) {
      this.packedStencilDepthRenderBufferSpec = new GLFrameBuffer.FrameBufferRenderBufferAttachmentSpec(param1Int);
      this.hasPackedStencilDepthRenderBuffer = true;
      return this;
    }
    
    public GLFrameBufferBuilder<U> addStencilRenderBuffer(int param1Int) {
      this.stencilRenderBufferSpec = new GLFrameBuffer.FrameBufferRenderBufferAttachmentSpec(param1Int);
      this.hasStencilRenderBuffer = true;
      return this;
    }
    
    public GLFrameBufferBuilder<U> addStencilTextureAttachment(int param1Int1, int param1Int2) {
      GLFrameBuffer.FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec = new GLFrameBuffer.FrameBufferTextureAttachmentSpec(param1Int1, '贠', param1Int2);
      frameBufferTextureAttachmentSpec.isStencil = true;
      this.textureAttachmentSpecs.add(frameBufferTextureAttachmentSpec);
      return this;
    }
    
    public abstract U build();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/GLFrameBuffer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */