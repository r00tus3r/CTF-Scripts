.class Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;
.super Ljava/io/DataOutputStream;
.source "PixmapIO.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/PixmapIO$PNG;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ChunkBuffer"
.end annotation


# instance fields
.field final buffer:Ljava/io/ByteArrayOutputStream;

.field final crc:Ljava/util/zip/CRC32;


# direct methods
.method constructor <init>(I)V
    .locals 1

    .line 333
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    new-instance p1, Ljava/util/zip/CRC32;

    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;-><init>(Ljava/io/ByteArrayOutputStream;Ljava/util/zip/CRC32;)V

    return-void
.end method

.method private constructor <init>(Ljava/io/ByteArrayOutputStream;Ljava/util/zip/CRC32;)V
    .locals 1

    .line 337
    new-instance v0, Ljava/util/zip/CheckedOutputStream;

    invoke-direct {v0, p1, p2}, Ljava/util/zip/CheckedOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Checksum;)V

    invoke-direct {p0, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 338
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 339
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->crc:Ljava/util/zip/CRC32;

    return-void
.end method


# virtual methods
.method public endChunk(Ljava/io/DataOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 343
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->flush()V

    .line 344
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x4

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 345
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 346
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    long-to-int v1, v0

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 347
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 348
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {p1}, Ljava/util/zip/CRC32;->reset()V

    return-void
.end method
