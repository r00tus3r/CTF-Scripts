.class Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/compression/lzma/Decoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LiteralDecoder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;
    }
.end annotation


# instance fields
.field m_Coders:[Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

.field m_NumPosBits:I

.field m_NumPrevBits:I

.field m_PosMask:I

.field final synthetic this$0:Lcom/badlogic/gdx/utils/compression/lzma/Decoder;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/compression/lzma/Decoder;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->this$0:Lcom/badlogic/gdx/utils/compression/lzma/Decoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Create(II)V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_Coders:[Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPrevBits:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPosBits:I

    if-ne v0, p1, :cond_0

    return-void

    .line 100
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPosBits:I

    const/4 v0, 0x1

    shl-int p1, v0, p1

    sub-int/2addr p1, v0

    .line 101
    iput p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_PosMask:I

    .line 102
    iput p2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPrevBits:I

    .line 103
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPrevBits:I

    iget p2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPosBits:I

    add-int/2addr p1, p2

    shl-int p1, v0, p1

    .line 104
    new-array p2, p1, [Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    iput-object p2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_Coders:[Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_1

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_Coders:[Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    new-instance v1, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;-><init>(Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;)V

    aput-object v1, v0, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method GetDecoder(IB)Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_Coders:[Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    iget v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_PosMask:I

    and-int/2addr p1, v1

    iget v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPrevBits:I

    shl-int/2addr p1, v1

    and-int/lit16 p2, p2, 0xff

    rsub-int/lit8 v1, v1, 0x8

    ushr-int/2addr p2, v1

    add-int/2addr p1, p2

    aget-object p1, v0, p1

    return-object p1
.end method

.method public Init()V
    .locals 3

    .line 110
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPrevBits:I

    iget v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_NumPosBits:I

    add-int/2addr v0, v1

    const/4 v1, 0x1

    shl-int v0, v1, v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 112
    iget-object v2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder;->m_Coders:[Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LiteralDecoder$Decoder2;->Init()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
