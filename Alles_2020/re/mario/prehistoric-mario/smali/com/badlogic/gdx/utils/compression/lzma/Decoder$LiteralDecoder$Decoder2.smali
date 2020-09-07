.class Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;
.super Ljava/lang/Object;
.source "Decoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Decoder2"
.end annotation


# instance fields
.field m_Decoders:[S

.field final synthetic this$1:Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->this$1:Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x300

    .line 61
    new-array p1, p1, [S

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->m_Decoders:[S

    return-void
.end method


# virtual methods
.method public DecodeNormal(Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;)B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    :cond_0
    shl-int/lit8 v1, v0, 0x1

    .line 70
    iget-object v2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->m_Decoders:[S

    invoke-virtual {p1, v2, v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->DecodeBit([SI)I

    move-result v0

    or-int/2addr v0, v1

    const/16 v1, 0x100

    if-lt v0, v1, :cond_0

    int-to-byte p1, v0

    return p1
.end method

.method public DecodeWithMatchByte(Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;B)B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x1

    :cond_0
    shr-int/lit8 v2, p2, 0x7

    and-int/2addr v2, v0

    shl-int/2addr p2, v0

    int-to-byte p2, p2

    .line 81
    iget-object v3, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->m_Decoders:[S

    add-int/lit8 v4, v2, 0x1

    shl-int/lit8 v4, v4, 0x8

    add-int/2addr v4, v1

    invoke-virtual {p1, v3, v4}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->DecodeBit([SI)I

    move-result v3

    shl-int/2addr v1, v0

    or-int/2addr v1, v3

    const/16 v4, 0x100

    if-eq v2, v3, :cond_1

    :goto_0
    if-ge v1, v4, :cond_2

    shl-int/lit8 p2, v1, 0x1

    .line 85
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->m_Decoders:[S

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->DecodeBit([SI)I

    move-result v0

    or-int v1, p2, v0

    goto :goto_0

    :cond_1
    if-lt v1, v4, :cond_0

    :cond_2
    int-to-byte p1, v1

    return p1
.end method

.method public Init()V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->m_Decoders:[S

    invoke-static {v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->InitBitModels([S)V

    return-void
.end method
