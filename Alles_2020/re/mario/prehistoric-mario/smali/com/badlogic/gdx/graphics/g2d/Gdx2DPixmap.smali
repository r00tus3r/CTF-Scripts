.class public Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;
.super Ljava/lang/Object;
.source "Gdx2DPixmap.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# static fields
.field public static final GDX2D_BLEND_NONE:I = 0x0

.field public static final GDX2D_BLEND_SRC_OVER:I = 0x1

.field public static final GDX2D_FORMAT_ALPHA:I = 0x1

.field public static final GDX2D_FORMAT_LUMINANCE_ALPHA:I = 0x2

.field public static final GDX2D_FORMAT_RGB565:I = 0x5

.field public static final GDX2D_FORMAT_RGB888:I = 0x3

.field public static final GDX2D_FORMAT_RGBA4444:I = 0x6

.field public static final GDX2D_FORMAT_RGBA8888:I = 0x4

.field public static final GDX2D_SCALE_LINEAR:I = 0x1

.field public static final GDX2D_SCALE_NEAREST:I


# instance fields
.field basePtr:J

.field format:I

.field height:I

.field nativeData:[J

.field pixelPtr:Ljava/nio/ByteBuffer;

.field width:I


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/badlogic/gdx/utils/GdxRuntimeException;
        }
    .end annotation

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 81
    new-array v0, v0, [J

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    invoke-static {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->newPixmap([JIII)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    if-eqz p1, :cond_0

    .line 125
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    const/4 p2, 0x0

    aget-wide p2, p1, p2

    iput-wide p2, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    const/4 p2, 0x1

    .line 126
    aget-wide p2, p1, p2

    long-to-int p3, p2

    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    const/4 p2, 0x2

    .line 127
    aget-wide p2, p1, p2

    long-to-int p3, p2

    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    const/4 p2, 0x3

    .line 128
    aget-wide p2, p1, p2

    long-to-int p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    return-void

    .line 123
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Error loading pixmap."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 81
    new-array v0, v0, [J

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    .line 98
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x400

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 99
    new-array v1, v1, [B

    .line 102
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-eq v2, v3, :cond_0

    .line 103
    invoke-virtual {v0, v1, v4, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 107
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    array-length v1, p1

    invoke-static {v0, p1, v4, v1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->load([J[BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    .line 108
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    if-eqz p1, :cond_2

    .line 110
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    aget-wide v0, p1, v4

    iput-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    const/4 v0, 0x1

    .line 111
    aget-wide v0, p1, v0

    long-to-int v1, v0

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    const/4 v0, 0x2

    .line 112
    aget-wide v0, p1, v0

    long-to-int v1, v0

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    const/4 v0, 0x3

    .line 113
    aget-wide v0, p1, v0

    long-to-int p1, v0

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    if-eqz p2, :cond_1

    .line 115
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    if-eq p2, p1, :cond_1

    .line 116
    invoke-direct {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->convert(I)V

    :cond_1
    return-void

    .line 108
    :cond_2
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Error loading pixmap: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getFailureReason()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;[J)V
    .locals 2

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 81
    new-array v0, v0, [J

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    .line 132
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    const/4 p1, 0x0

    .line 133
    aget-wide v0, p2, p1

    iput-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    const/4 p1, 0x1

    .line 134
    aget-wide v0, p2, p1

    long-to-int p1, v0

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    const/4 p1, 0x2

    .line 135
    aget-wide v0, p2, p1

    long-to-int p1, v0

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    const/4 p1, 0x3

    .line 136
    aget-wide p1, p2, p1

    long-to-int p2, p1

    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    return-void
.end method

.method public constructor <init>([BIII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 81
    new-array v0, v0, [J

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    invoke-static {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->load([J[BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    if-eqz p1, :cond_1

    .line 87
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    const/4 p2, 0x0

    aget-wide p2, p1, p2

    iput-wide p2, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    const/4 p2, 0x1

    .line 88
    aget-wide p2, p1, p2

    long-to-int p3, p2

    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    const/4 p2, 0x2

    .line 89
    aget-wide p2, p1, p2

    long-to-int p3, p2

    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    const/4 p2, 0x3

    .line 90
    aget-wide p2, p1, p2

    long-to-int p1, p2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    if-eqz p4, :cond_0

    .line 92
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    if-eq p4, p1, :cond_0

    .line 93
    invoke-direct {p0, p4}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->convert(I)V

    :cond_0
    return-void

    .line 85
    :cond_1
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Error loading pixmap: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getFailureReason()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static native clear(JI)V
.end method

.method private convert(I)V
    .locals 9

    .line 140
    new-instance v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    invoke-direct {v8, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;-><init>(III)V

    const/4 p1, 0x0

    .line 141
    invoke-virtual {v8, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setBlend(I)V

    .line 142
    iget v6, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    iget v7, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, v8

    move-object v1, p0

    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;IIIIII)V

    .line 143
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->dispose()V

    .line 144
    iget-wide v0, v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    iput-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    .line 145
    iget p1, v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    .line 146
    iget p1, v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    .line 147
    iget-object p1, v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->nativeData:[J

    .line 148
    iget-object p1, v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    .line 149
    iget p1, v8, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    return-void
.end method

.method private static native drawCircle(JIIII)V
.end method

.method private static native drawLine(JIIIII)V
.end method

.method private static native drawPixmap(JJIIIIIIII)V
.end method

.method private static native drawRect(JIIIII)V
.end method

.method private static native fillCircle(JIIII)V
.end method

.method private static native fillRect(JIIIII)V
.end method

.method private static native fillTriangle(JIIIIIII)V
.end method

.method private static native free(J)V
.end method

.method public static native getFailureReason()Ljava/lang/String;
.end method

.method private static native getPixel(JII)I
.end method

.method private static native load([J[BII)Ljava/nio/ByteBuffer;
.end method

.method public static newPixmap(III)Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;
    .locals 1

    .line 220
    :try_start_0
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-direct {v0, p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;-><init>(III)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static newPixmap(Ljava/io/InputStream;I)Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;
    .locals 1

    .line 212
    :try_start_0
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-direct {v0, p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static native newPixmap([JIII)Ljava/nio/ByteBuffer;
.end method

.method private static native setBlend(JI)V
.end method

.method private static native setPixel(JIII)V
.end method

.method private static native setScale(JI)V
.end method

.method public static toGlFormat(I)I
    .locals 3

    packed-switch p0, :pswitch_data_0

    .line 56
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const/16 p0, 0x1908

    return p0

    :pswitch_1
    const/16 p0, 0x1907

    return p0

    :pswitch_2
    const/16 p0, 0x190a

    return p0

    :pswitch_3
    const/16 p0, 0x1906

    return p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static toGlType(I)I
    .locals 3

    packed-switch p0, :pswitch_data_0

    .line 72
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const p0, 0x8033

    return p0

    :pswitch_1
    const p0, 0x8363

    return p0

    :pswitch_2
    const/16 p0, 0x1401

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public clear(I)V
    .locals 2

    .line 158
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    invoke-static {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->clear(JI)V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 154
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->free(J)V

    return-void
.end method

.method public drawCircle(IIII)V
    .locals 6

    .line 178
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawCircle(JIIII)V

    return-void
.end method

.method public drawLine(IIIII)V
    .locals 7

    .line 170
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawLine(JIIIII)V

    return-void
.end method

.method public drawPixmap(Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;IIIIII)V
    .locals 13

    move-object v0, p1

    .line 194
    iget-wide v0, v0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move-object v12, p0

    iget-wide v2, v12, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, p6

    move/from16 v11, p7

    invoke-static/range {v0 .. v11}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawPixmap(JJIIIIIIII)V

    return-void
.end method

.method public drawPixmap(Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;IIIIIIII)V
    .locals 13

    move-object v0, p1

    .line 199
    iget-wide v0, v0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move-object v12, p0

    iget-wide v2, v12, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-static/range {v0 .. v11}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawPixmap(JJIIIIIIII)V

    return-void
.end method

.method public drawRect(IIIII)V
    .locals 7

    .line 174
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawRect(JIIIII)V

    return-void
.end method

.method public fillCircle(IIII)V
    .locals 6

    .line 186
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->fillCircle(JIIII)V

    return-void
.end method

.method public fillRect(IIIII)V
    .locals 7

    .line 182
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->fillRect(JIIIII)V

    return-void
.end method

.method public fillTriangle(IIIIIII)V
    .locals 10

    move-object v0, p0

    .line 190
    iget-wide v1, v0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-static/range {v1 .. v9}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->fillTriangle(JIIIIIII)V

    return-void
.end method

.method public getFormat()I
    .locals 1

    .line 239
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    return v0
.end method

.method public getFormatString()Ljava/lang/String;
    .locals 1

    .line 255
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "unknown"

    return-object v0

    :pswitch_0
    const-string v0, "rgba4444"

    return-object v0

    :pswitch_1
    const-string v0, "rgb565"

    return-object v0

    :pswitch_2
    const-string v0, "rgba8888"

    return-object v0

    :pswitch_3
    const-string v0, "rgb888"

    return-object v0

    :pswitch_4
    const-string v0, "luminance alpha"

    return-object v0

    :pswitch_5
    const-string v0, "alpha"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getGLFormat()I
    .locals 1

    .line 247
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getGLInternalFormat()I

    move-result v0

    return v0
.end method

.method public getGLInternalFormat()I
    .locals 1

    .line 243
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->toGlFormat(I)I

    move-result v0

    return v0
.end method

.method public getGLType()I
    .locals 1

    .line 251
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->format:I

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->toGlType(I)I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 231
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->height:I

    return v0
.end method

.method public getPixel(II)I
    .locals 2

    .line 166
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    invoke-static {v0, v1, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getPixel(JII)I

    move-result p1

    return p1
.end method

.method public getPixels()Ljava/nio/ByteBuffer;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->pixelPtr:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 235
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->width:I

    return v0
.end method

.method public setBlend(I)V
    .locals 2

    .line 203
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    invoke-static {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setBlend(JI)V

    return-void
.end method

.method public setPixel(III)V
    .locals 2

    .line 162
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setPixel(JIII)V

    return-void
.end method

.method public setScale(I)V
    .locals 2

    .line 207
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->basePtr:J

    invoke-static {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setScale(JI)V

    return-void
.end method
