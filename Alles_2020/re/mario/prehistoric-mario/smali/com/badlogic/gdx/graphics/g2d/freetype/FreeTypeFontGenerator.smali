.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;
.super Ljava/lang/Object;
.source "FreeTypeFontGenerator.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;,
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;
    }
.end annotation


# static fields
.field public static final DEFAULT_CHARS:Ljava/lang/String; = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?\'.,;:()[]{}<>|/@\\^$-%+=#_&~*\u007f\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f\u00a0\u00a1\u00a2\u00a3\u00a4\u00a5\u00a6\u00a7\u00a8\u00a9\u00aa\u00ab\u00ac\u00ad\u00ae\u00af\u00b0\u00b1\u00b2\u00b3\u00b4\u00b5\u00b6\u00b7\u00b8\u00b9\u00ba\u00bb\u00bc\u00bd\u00be\u00bf\u00c0\u00c1\u00c2\u00c3\u00c4\u00c5\u00c6\u00c7\u00c8\u00c9\u00ca\u00cb\u00cc\u00cd\u00ce\u00cf\u00d0\u00d1\u00d2\u00d3\u00d4\u00d5\u00d6\u00d7\u00d8\u00d9\u00da\u00db\u00dc\u00dd\u00de\u00df\u00e0\u00e1\u00e2\u00e3\u00e4\u00e5\u00e6\u00e7\u00e8\u00e9\u00ea\u00eb\u00ec\u00ed\u00ee\u00ef\u00f0\u00f1\u00f2\u00f3\u00f4\u00f5\u00f6\u00f7\u00f8\u00f9\u00fa\u00fb\u00fc\u00fd\u00fe\u00ff"

.field public static final NO_MAXIMUM:I = -0x1

.field private static maxTextureSize:I = 0x400


# instance fields
.field bitmapped:Z

.field final face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

.field final library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

.field final name:Ljava/lang/String;

.field private pixelHeight:I

.field private pixelWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 5

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 81
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    .line 88
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->pathWithoutExtension()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->name:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->length()J

    move-result-wide v1

    long-to-int v2, v1

    .line 91
    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->initFreeType()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    .line 92
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    if-eqz v1, :cond_4

    .line 95
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->read()Ljava/io/InputStream;

    move-result-object v1

    if-nez v2, :cond_1

    if-lez v2, :cond_0

    int-to-float v2, v2

    const/high16 v3, 0x3fc00000    # 1.5f

    mul-float v2, v2, v3

    float-to-int v2, v2

    goto :goto_0

    :cond_0
    const/16 v2, 0x4000

    .line 99
    :goto_0
    :try_start_0
    invoke-static {v1, v2}, Lcom/badlogic/gdx/utils/StreamUtils;->copyStreamToByteArray(Ljava/io/InputStream;I)[B

    move-result-object v2

    .line 100
    array-length v3, v2

    invoke-static {v3}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 101
    array-length v4, v2

    invoke-static {v2, v0, v3, v4}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([BILjava/nio/Buffer;I)V

    goto :goto_1

    .line 104
    :cond_1
    invoke-static {v2}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 105
    invoke-static {v1, v3}, Lcom/badlogic/gdx/utils/StreamUtils;->copyStream(Ljava/io/InputStream;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :goto_1
    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 113
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    invoke-virtual {v1, v3, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->newMemoryFace(Ljava/nio/ByteBuffer;I)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    .line 114
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    if-eqz v1, :cond_3

    .line 116
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->checkForBitmapFont()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    const/16 p1, 0xf

    .line 117
    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->setPixelSizes(II)V

    return-void

    .line 114
    :cond_3
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Couldn\'t create face for font: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    .line 108
    :try_start_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    :goto_2
    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p1

    .line 92
    :cond_4
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Couldn\'t initialize FreeType"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private checkForBitmapFont()Z
    .locals 3

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getFaceFlags()I

    move-result v0

    sget v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_FIXED_SIZES:I

    and-int/2addr v0, v1

    sget v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_FIXED_SIZES:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getFaceFlags()I

    move-result v0

    sget v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_HORIZONTAL:I

    and-int/2addr v0, v1

    sget v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_FACE_FLAG_HORIZONTAL:I

    if-ne v0, v1, :cond_0

    .line 123
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    const/16 v1, 0x20

    sget v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getFormat()I

    move-result v0

    const v1, 0x62697473

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 126
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    .line 130
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    return v0
.end method

.method public static getMaxTextureSize()I
    .locals 1

    .line 578
    sget v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->maxTextureSize:I

    return v0
.end method

.method public static setMaxTextureSize(I)V
    .locals 0

    .line 572
    sput p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->maxTextureSize:I

    return-void
.end method


# virtual methods
.method createGlyph(CLcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;FLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p5

    move-object/from16 v5, p6

    .line 449
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v6, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(I)I

    move-result v6

    const/4 v8, 0x0

    if-nez v6, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    if-eqz v6, :cond_1

    .line 451
    invoke-virtual {v2, v8}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->getGlyph(C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move-result-object v9

    if-eqz v9, :cond_1

    return-object v9

    .line 455
    :cond_1
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    sget v10, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v9, v1, v10}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v9

    const/4 v10, 0x0

    const-string v11, "\'"

    const-string v12, "FreeTypeFontGenerator"

    if-nez v9, :cond_2

    .line 456
    sget-object v2, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t load char \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v12, v1}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    return-object v10

    .line 459
    :cond_2
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v9

    .line 460
    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;

    move-result-object v13

    .line 462
    :try_start_0
    sget v14, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_NORMAL:I

    invoke-virtual {v13, v14}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->toBitmap(I)V
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/GdxRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 468
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getBitmap()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

    move-result-object v10

    .line 469
    sget-object v11, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    iget-object v12, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v10, v11, v12}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPixmap(Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object v11

    .line 471
    iget v12, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderWidth:F

    const/4 v14, 0x0

    cmpl-float v12, v12, v14

    if-gtz v12, :cond_3

    iget v12, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetX:I

    if-nez v12, :cond_3

    iget v12, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetY:I

    if-eqz v12, :cond_6

    .line 475
    :cond_3
    iget v12, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderWidth:F

    cmpl-float v12, v12, v14

    if-lez v12, :cond_4

    .line 477
    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;

    move-result-object v12

    move-object/from16 v14, p4

    .line 478
    invoke-virtual {v12, v14, v8}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->strokeBorder(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;Z)V

    .line 479
    sget v14, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_NORMAL:I

    invoke-virtual {v12, v14}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->toBitmap(I)V

    .line 480
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getBitmap()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

    move-result-object v14

    .line 483
    sget-object v15, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    iget-object v7, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v14, v15, v7}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPixmap(Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object v7

    .line 485
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getLeft()I

    move-result v15

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getLeft()I

    move-result v16

    sub-int v15, v15, v16

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getTop()I

    move-result v16

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getTop()I

    move-result v17

    sub-int v8, v16, v17

    neg-int v8, v8

    invoke-virtual {v7, v11, v15, v8}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;II)V

    .line 487
    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    .line 488
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->dispose()V

    move-object v11, v7

    move-object v13, v12

    goto :goto_1

    :cond_4
    move-object v14, v10

    .line 492
    :goto_1
    iget v7, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetX:I

    if-nez v7, :cond_5

    iget v7, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetY:I

    if-eqz v7, :cond_6

    .line 494
    :cond_5
    sget-object v7, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    iget-object v8, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v14, v7, v8}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPixmap(Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object v7

    .line 496
    new-instance v8, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual {v7}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v12

    iget v14, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetX:I

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v14

    add-int/2addr v12, v14

    invoke-virtual {v7}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v14

    iget v15, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetY:I

    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    move-result v15

    add-int/2addr v14, v15

    sget-object v15, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-direct {v8, v12, v14, v15}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 498
    invoke-static {}, Lcom/badlogic/gdx/graphics/Pixmap;->getBlending()Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    move-result-object v12

    .line 499
    sget-object v14, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->None:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    invoke-static {v14}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    .line 500
    iget v14, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetX:I

    const/4 v15, 0x0

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v14

    move-object/from16 p4, v13

    iget v13, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetY:I

    invoke-static {v13, v15}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-virtual {v8, v7, v14, v13}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;II)V

    .line 501
    invoke-static {v12}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    .line 503
    iget v7, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetX:I

    neg-int v7, v7

    invoke-static {v7, v15}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget v12, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->shadowOffsetY:I

    neg-int v12, v12

    invoke-static {v12, v15}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {v8, v11, v7, v12}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;II)V

    .line 504
    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    move-object/from16 v13, p4

    move-object v11, v8

    .line 509
    :cond_6
    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;

    move-result-object v7

    .line 510
    new-instance v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    invoke-direct {v8}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;-><init>()V

    .line 511
    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    .line 512
    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v1

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    .line 513
    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v1

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->height:I

    .line 514
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getLeft()I

    move-result v1

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    .line 515
    iget-boolean v1, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->flip:Z

    if-eqz v1, :cond_7

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getTop()I

    move-result v1

    neg-int v1, v1

    float-to-int v4, v4

    add-int/2addr v1, v4

    goto :goto_2

    :cond_7
    iget v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->height:I

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->getTop()I

    move-result v9

    sub-int/2addr v1, v9

    neg-int v1, v1

    float-to-int v4, v4

    sub-int/2addr v1, v4

    :goto_2
    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->yoffset:I

    .line 516
    invoke-virtual {v7}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;->getHoriAdvance()I

    move-result v1

    invoke-static {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v1

    iget v4, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderWidth:F

    float-to-int v4, v4

    add-int/2addr v1, v4

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xadvance:I

    .line 518
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    if-eqz v1, :cond_a

    .line 519
    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->CLEAR:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v11, v1}, Lcom/badlogic/gdx/graphics/Pixmap;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 520
    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Pixmap;->fill()V

    .line 521
    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 522
    sget-object v4, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result v4

    .line 523
    sget-object v7, Lcom/badlogic/gdx/graphics/Color;->CLEAR:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v7}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result v7

    const/4 v9, 0x0

    .line 524
    :goto_3
    iget v12, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->height:I

    if-ge v9, v12, :cond_a

    .line 525
    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPitch()I

    move-result v12

    mul-int v12, v12, v9

    const/4 v14, 0x0

    .line 526
    :goto_4
    iget v15, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    add-int/2addr v15, v0

    if-ge v14, v15, :cond_9

    .line 527
    div-int/lit8 v0, v14, 0x8

    add-int/2addr v0, v12

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    rem-int/lit8 v15, v14, 0x8

    rsub-int/lit8 v15, v15, 0x7

    ushr-int/2addr v0, v15

    const/4 v15, 0x1

    and-int/2addr v0, v15

    if-ne v0, v15, :cond_8

    move v0, v4

    goto :goto_5

    :cond_8
    move v0, v7

    .line 528
    :goto_5
    invoke-virtual {v11, v14, v9, v0}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixel(III)V

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    goto :goto_4

    :cond_9
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    goto :goto_3

    .line 534
    :cond_a
    invoke-virtual {v5, v11}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pack(Lcom/badlogic/gdx/graphics/Pixmap;)Lcom/badlogic/gdx/math/Rectangle;

    move-result-object v0

    .line 536
    invoke-virtual/range {p6 .. p6}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->getPages()Lcom/badlogic/gdx/utils/Array;

    move-result-object v1

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v4, 0x1

    sub-int/2addr v1, v4

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->page:I

    .line 537
    iget v1, v0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    float-to-int v1, v1

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->srcX:I

    .line 538
    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    float-to-int v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->srcY:I

    .line 541
    iget-boolean v0, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->incremental:Z

    if-eqz v0, :cond_b

    iget-object v0, v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    if-eqz v0, :cond_b

    iget-object v0, v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    iget v1, v8, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->page:I

    if-gt v0, v1, :cond_b

    .line 542
    iget-object v0, v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-object v4, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-boolean v3, v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->genMipMaps:Z

    invoke-virtual {v5, v0, v1, v4, v3}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->updateTextureRegions(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V

    .line 544
    :cond_b
    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    .line 545
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->dispose()V

    if-eqz v6, :cond_c

    const/4 v0, 0x0

    .line 547
    invoke-virtual {v2, v0, v8}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->setGlyph(ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V

    :cond_c
    return-object v8

    .line 464
    :catch_0
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Glyph;->dispose()V

    .line 465
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t render char \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    return-object v10
.end method

.method public dispose()V
    .locals 1

    .line 555
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->dispose()V

    .line 556
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->dispose()V

    return-void
.end method

.method public generateData(I)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;
    .locals 3

    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?\'.,;:()[]{}<>|/@\\^$-%+=#_&~*\u007f\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f\u00a0\u00a1\u00a2\u00a3\u00a4\u00a5\u00a6\u00a7\u00a8\u00a9\u00aa\u00ab\u00ac\u00ad\u00ae\u00af\u00b0\u00b1\u00b2\u00b3\u00b4\u00b5\u00b6\u00b7\u00b8\u00b9\u00ba\u00bb\u00bc\u00bd\u00be\u00bf\u00c0\u00c1\u00c2\u00c3\u00c4\u00c5\u00c6\u00c7\u00c8\u00c9\u00ca\u00cb\u00cc\u00cd\u00ce\u00cf\u00d0\u00d1\u00d2\u00d3\u00d4\u00d5\u00d6\u00d7\u00d8\u00d9\u00da\u00db\u00dc\u00dd\u00de\u00df\u00e0\u00e1\u00e2\u00e3\u00e4\u00e5\u00e6\u00e7\u00e8\u00e9\u00ea\u00eb\u00ec\u00ed\u00ee\u00ef\u00f0\u00f1\u00f2\u00f3\u00f4\u00f5\u00f6\u00f7\u00f8\u00f9\u00fa\u00fb\u00fc\u00fd\u00fe\u00ff"

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 269
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateData(ILjava/lang/String;ZLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    move-result-object p1

    return-object p1
.end method

.method public generateData(ILjava/lang/String;Z)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;
    .locals 1

    const/4 v0, 0x0

    .line 279
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateData(ILjava/lang/String;ZLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    move-result-object p1

    return-object p1
.end method

.method public generateData(ILjava/lang/String;ZLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;
    .locals 1

    .line 290
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;-><init>()V

    .line 291
    iput p1, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->size:I

    .line 292
    iput-object p2, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->characters:Ljava/lang/String;

    .line 293
    iput-boolean p3, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->flip:Z

    .line 294
    iput-object p4, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    .line 295
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateData(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    move-result-object p1

    return-object p1
.end method

.method public generateData(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;
    .locals 1

    .line 299
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateData(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    move-result-object p1

    return-object p1
.end method

.method public generateData(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;
    .locals 21

    move-object/from16 v7, p0

    move-object/from16 v8, p2

    if-nez p1, :cond_0

    .line 312
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;-><init>()V

    move-object v9, v0

    goto :goto_0

    :cond_0
    move-object/from16 v9, p1

    .line 313
    :goto_0
    iget-object v10, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->characters:Ljava/lang/String;

    .line 314
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    .line 315
    iget-boolean v12, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->incremental:Z

    .line 317
    iget v0, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->size:I

    const/4 v13, 0x0

    invoke-virtual {v7, v13, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->setPixelSizes(II)V

    .line 320
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getSize()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;

    move-result-object v0

    .line 321
    iget-boolean v1, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->flip:Z

    iput-boolean v1, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->flipped:Z

    .line 322
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getAscender()I

    move-result v1

    invoke-static {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v1

    int-to-float v1, v1

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    .line 323
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getDescender()I

    move-result v1

    invoke-static {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v1

    int-to-float v1, v1

    iput v1, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->descent:F

    .line 324
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getHeight()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    .line 325
    iget v14, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    .line 328
    iget-boolean v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    const/4 v1, 0x0

    const/16 v2, 0x20

    if-eqz v0, :cond_3

    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_3

    const/16 v0, 0x20

    .line 329
    :goto_1
    iget-object v3, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getNumGlyphs()I

    move-result v3

    add-int/2addr v3, v2

    if-ge v0, v3, :cond_3

    .line 330
    iget-object v3, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    sget v4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v3, v0, v4}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 331
    iget-object v3, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;->getHeight()I

    move-result v3

    invoke-static {v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v3

    int-to-float v3, v3

    .line 332
    iget v4, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    cmpl-float v4, v3, v4

    if-lez v4, :cond_1

    goto :goto_2

    :cond_1
    iget v3, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    :goto_2
    iput v3, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 338
    :cond_3
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    sget v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v0, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 339
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;->getHoriAdvance()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->spaceWidth:F

    goto :goto_3

    .line 341
    :cond_4
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getMaxAdvanceWidth()I

    move-result v0

    int-to-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->spaceWidth:F

    .line 343
    :goto_3
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;-><init>()V

    .line 344
    iget v3, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->spaceWidth:F

    float-to-int v3, v3

    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xadvance:I

    .line 345
    iput v2, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    .line 346
    invoke-virtual {v8, v2, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->setGlyph(ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V

    .line 349
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->xChars:[C

    array-length v2, v0

    const/4 v3, 0x0

    :goto_4
    if-ge v3, v2, :cond_6

    aget-char v4, v0, v3

    .line 350
    iget-object v5, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    sget v6, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v5, v4, v6}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v4

    if-nez v4, :cond_5

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 351
    :cond_5
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;->getHeight()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->xHeight:F

    .line 354
    :cond_6
    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->xHeight:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1d

    .line 355
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->capChars:[C

    array-length v2, v0

    const/4 v3, 0x0

    :goto_5
    if-ge v3, v2, :cond_8

    aget-char v4, v0, v3

    .line 356
    iget-object v5, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    sget v6, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v5, v4, v6}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v4

    if-nez v4, :cond_7

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 357
    :cond_7
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;->getHeight()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->capHeight:F

    .line 362
    :cond_8
    iget-boolean v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    if-nez v0, :cond_a

    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->capHeight:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_9

    goto :goto_6

    :cond_9
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "No cap character found in font"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 363
    :cond_a
    :goto_6
    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    iget v2, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->capHeight:F

    sub-float/2addr v0, v2

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    .line 364
    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    neg-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->down:F

    .line 365
    iget-boolean v0, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->flip:Z

    if-eqz v0, :cond_b

    .line 366
    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    neg-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->ascent:F

    .line 367
    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->down:F

    neg-float v0, v0

    iput v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->down:F

    .line 372
    :cond_b
    iget-object v0, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-nez v0, :cond_e

    if-eqz v12, :cond_c

    .line 378
    sget v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->maxTextureSize:I

    goto :goto_7

    .line 380
    :cond_c
    iget v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->lineHeight:F

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    mul-int v0, v0, v0

    mul-int v0, v0, v11

    int-to-double v2, v0

    .line 381
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-int v0, v2

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result v0

    .line 382
    sget v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->maxTextureSize:I

    if-lez v2, :cond_d

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_d
    :goto_7
    move/from16 v17, v0

    .line 385
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    sget-object v18, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    const/16 v19, 0x2

    const/16 v20, 0x0

    move-object v15, v0

    move/from16 v16, v17

    invoke-direct/range {v15 .. v20}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;IZ)V

    const/4 v2, 0x1

    const/16 v16, 0x1

    goto :goto_8

    :cond_e
    move-object v15, v0

    const/16 v16, 0x0

    :goto_8
    const/4 v0, 0x0

    .line 389
    iget v2, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderWidth:F

    cmpl-float v1, v2, v1

    if-lez v1, :cond_11

    .line 390
    iget-object v0, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->library:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Library;->createStroker()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;

    move-result-object v0

    .line 391
    iget v1, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderWidth:F

    const/high16 v2, 0x42800000    # 64.0f

    mul-float v1, v1, v2

    float-to-int v1, v1

    iget-boolean v2, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderStraight:Z

    if-eqz v2, :cond_f

    sget v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINECAP_BUTT:I

    goto :goto_9

    :cond_f
    sget v2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINECAP_ROUND:I

    :goto_9
    iget-boolean v3, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->borderStraight:Z

    if-eqz v3, :cond_10

    sget v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_MITER_FIXED:I

    goto :goto_a

    :cond_10
    sget v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_STROKER_LINEJOIN_ROUND:I

    :goto_a
    invoke-virtual {v0, v1, v2, v3, v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->set(IIII)V

    :cond_11
    move-object v6, v0

    if-eqz v12, :cond_12

    .line 397
    iput-object v7, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->generator:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    .line 398
    iput-object v9, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->parameter:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    .line 399
    iput-object v6, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->stroker:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;

    .line 400
    iput-object v15, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    .line 401
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v1, v11, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->glyphs:Lcom/badlogic/gdx/utils/Array;

    :cond_12
    const/4 v5, 0x0

    :goto_b
    if-ge v5, v11, :cond_14

    .line 405
    invoke-virtual {v10, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    move-object/from16 v0, p0

    move v1, v4

    move-object/from16 v2, p2

    move-object v3, v9

    move v13, v4

    move-object v4, v6

    move/from16 v17, v5

    move v5, v14

    move-object/from16 v18, v6

    move-object v6, v15

    .line 406
    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->createGlyph(CLcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;FLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 408
    invoke-virtual {v8, v13, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->setGlyph(ILcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;)V

    if-eqz v12, :cond_13

    .line 409
    iget-object v1, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->glyphs:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_13
    add-int/lit8 v5, v17, 0x1

    move-object/from16 v6, v18

    const/4 v13, 0x0

    goto :goto_b

    :cond_14
    move-object/from16 v18, v6

    if-eqz v18, :cond_15

    if-nez v12, :cond_15

    .line 413
    invoke-virtual/range {v18 .. v18}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->dispose()V

    .line 416
    :cond_15
    iget-boolean v0, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->kerning:Z

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    :goto_c
    if-ge v0, v11, :cond_1b

    .line 418
    invoke-virtual {v10, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 419
    invoke-virtual {v8, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->getGlyph(C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move-result-object v2

    if-nez v2, :cond_17

    :cond_16
    const/4 v14, 0x0

    goto :goto_f

    .line 421
    :cond_17
    iget-object v3, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(I)I

    move-result v3

    move v4, v0

    :goto_d
    if-ge v4, v11, :cond_16

    .line 423
    invoke-virtual {v10, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 424
    invoke-virtual {v8, v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->getGlyph(C)Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    move-result-object v6

    if-nez v6, :cond_18

    const/4 v14, 0x0

    goto :goto_e

    .line 426
    :cond_18
    iget-object v12, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v12, v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(I)I

    move-result v12

    .line 428
    iget-object v13, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    const/4 v14, 0x0

    invoke-virtual {v13, v3, v12, v14}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getKerning(III)I

    move-result v13

    if-eqz v13, :cond_19

    .line 429
    invoke-static {v13}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v13

    invoke-virtual {v2, v5, v13}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->setKerning(II)V

    .line 431
    :cond_19
    iget-object v5, v7, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v5, v12, v3, v14}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getKerning(III)I

    move-result v5

    if-eqz v5, :cond_1a

    .line 432
    invoke-static {v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v5

    invoke-virtual {v6, v1, v5}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->setKerning(II)V

    :cond_1a
    :goto_e
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :goto_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_1b
    if-eqz v16, :cond_1c

    .line 439
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    .line 440
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-object v2, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-boolean v3, v9, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->genMipMaps:Z

    invoke-virtual {v15, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->updateTextureRegions(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V

    :cond_1c
    return-object v8

    .line 354
    :cond_1d
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "No x-height character found in font"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_11

    :goto_10
    throw v0

    :goto_11
    goto :goto_10
.end method

.method public generateFont(I)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 2

    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?\'.,;:()[]{}<>|/@\\^$-%+=#_&~*\u007f\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f\u00a0\u00a1\u00a2\u00a3\u00a4\u00a5\u00a6\u00a7\u00a8\u00a9\u00aa\u00ab\u00ac\u00ad\u00ae\u00af\u00b0\u00b1\u00b2\u00b3\u00b4\u00b5\u00b6\u00b7\u00b8\u00b9\u00ba\u00bb\u00bc\u00bd\u00be\u00bf\u00c0\u00c1\u00c2\u00c3\u00c4\u00c5\u00c6\u00c7\u00c8\u00c9\u00ca\u00cb\u00cc\u00cd\u00ce\u00cf\u00d0\u00d1\u00d2\u00d3\u00d4\u00d5\u00d6\u00d7\u00d8\u00d9\u00da\u00db\u00dc\u00dd\u00de\u00df\u00e0\u00e1\u00e2\u00e3\u00e4\u00e5\u00e6\u00e7\u00e8\u00e9\u00ea\u00eb\u00ec\u00ed\u00ee\u00ef\u00f0\u00f1\u00f2\u00f3\u00f4\u00f5\u00f6\u00f7\u00f8\u00f9\u00fa\u00fb\u00fc\u00fd\u00fe\u00ff"

    const/4 v1, 0x0

    .line 152
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateFont(ILjava/lang/String;Z)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p1

    return-object p1
.end method

.method public generateFont(ILjava/lang/String;Z)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 1

    const/4 v0, 0x0

    .line 141
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateData(ILjava/lang/String;ZLcom/badlogic/gdx/graphics/g2d/PixmapPacker;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    move-result-object p1

    .line 142
    new-instance p2, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    const/4 v0, 0x0

    invoke-direct {p2, p1, p3, v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/utils/Array;Z)V

    const/4 p1, 0x1

    .line 143
    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->setOwnsTexture(Z)V

    return-object p2
.end method

.method public generateFont(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 1

    .line 156
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateFont(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p1

    return-object p1
.end method

.method public generateFont(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 5

    .line 163
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateData(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;

    .line 164
    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-eqz v0, :cond_0

    .line 165
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    .line 166
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-object v3, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-boolean v4, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->genMipMaps:Z

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->updateTextureRegions(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)V

    .line 168
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    iget-object v1, p2, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeBitmapFontData;->regions:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x0

    invoke-direct {v0, p2, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/utils/Array;Z)V

    .line 169
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-nez p1, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->setOwnsTexture(Z)V

    return-object v0
.end method

.method public generateGlyphAndBitmap(IIZ)Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;
    .locals 6

    const/4 v0, 0x0

    .line 215
    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->setPixelSizes(II)V

    .line 217
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getSize()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;

    move-result-object p2

    .line 218
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getAscender()I

    move-result p2

    invoke-static {p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result p2

    .line 222
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getCharIndex(I)I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 227
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    sget v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_LOAD_DEFAULT:I

    invoke-virtual {v1, p1, v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->loadChar(II)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 231
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getGlyph()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;

    move-result-object v1

    .line 235
    iget-boolean v3, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    if-eqz v3, :cond_1

    .line 236
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getBitmap()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

    move-result-object v2

    goto :goto_0

    .line 237
    :cond_1
    sget v3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->FT_RENDER_MODE_LIGHT:I

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->renderGlyph(I)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    .line 240
    :cond_2
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getBitmap()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

    move-result-object v2

    .line 243
    :goto_0
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;

    move-result-object v3

    .line 245
    new-instance v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    invoke-direct {v4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;-><init>()V

    if-eqz v2, :cond_3

    .line 247
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getWidth()I

    move-result v5

    iput v5, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    .line 248
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getRows()I

    move-result v5

    iput v5, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->height:I

    goto :goto_1

    .line 250
    :cond_3
    iput v0, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->width:I

    .line 251
    iput v0, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->height:I

    .line 253
    :goto_1
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getBitmapLeft()I

    move-result v5

    iput v5, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xoffset:I

    if-eqz p3, :cond_4

    .line 254
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getBitmapTop()I

    move-result p3

    neg-int p3, p3

    add-int/2addr p3, p2

    goto :goto_2

    :cond_4
    iget p3, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->height:I

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphSlot;->getBitmapTop()I

    move-result v1

    sub-int/2addr p3, v1

    neg-int p3, p3

    sub-int/2addr p3, p2

    :goto_2
    iput p3, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->yoffset:I

    .line 255
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$GlyphMetrics;->getHoriAdvance()I

    move-result p2

    invoke-static {p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result p2

    iput p2, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->xadvance:I

    .line 256
    iput v0, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->srcX:I

    .line 257
    iput v0, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->srcY:I

    .line 258
    iput p1, v4, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;->id:I

    .line 260
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;-><init>(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;)V

    .line 261
    iput-object v4, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;->glyph:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

    .line 262
    iput-object v2, p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;->bitmap:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

    return-object p1

    .line 228
    :cond_5
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Unable to load character!"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public scaleForPixelHeight(I)I
    .locals 2

    const/4 v0, 0x0

    .line 176
    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->setPixelSizes(II)V

    .line 177
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getSize()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;

    move-result-object v0

    .line 178
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getAscender()I

    move-result v1

    invoke-static {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v1

    .line 179
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getDescender()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v0

    mul-int p1, p1, p1

    sub-int/2addr v1, v0

    .line 180
    div-int/2addr p1, v1

    return p1
.end method

.method public scaleForPixelWidth(II)I
    .locals 3

    .line 188
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->getSize()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;->getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;

    move-result-object v0

    .line 189
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getMaxAdvance()I

    move-result v1

    invoke-static {v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v1

    .line 190
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getAscender()I

    move-result v2

    invoke-static {v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v2

    .line 191
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getDescender()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;->toInt(I)I

    move-result v0

    sub-int/2addr v2, v0

    mul-int v2, v2, p1

    mul-int v1, v1, p2

    .line 193
    div-int/2addr v2, v1

    const/4 p1, 0x0

    .line 194
    invoke-virtual {p0, p1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->setPixelSizes(II)V

    return v2
.end method

.method public scaleToFitSquare(III)I
    .locals 0

    .line 204
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->scaleForPixelHeight(I)I

    move-result p2

    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->scaleForPixelWidth(II)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    return p1
.end method

.method setPixelSizes(II)V
    .locals 1

    .line 303
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->pixelWidth:I

    .line 304
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->pixelHeight:I

    .line 305
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->bitmapped:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->face:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Face;->setPixelSizes(II)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 306
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Couldn\'t set size for font"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    return-void
.end method
