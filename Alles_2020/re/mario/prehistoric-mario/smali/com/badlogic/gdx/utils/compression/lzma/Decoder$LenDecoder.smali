.class Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/compression/lzma/Decoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LenDecoder"
.end annotation


# instance fields
.field m_Choice:[S

.field m_HighCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

.field m_LowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

.field m_MidCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

.field m_NumPosStates:I

.field final synthetic this$0:Lcom/badlogic/gdx/utils/compression/lzma/Decoder;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/compression/lzma/Decoder;)V
    .locals 1

    .line 25
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->this$0:Lcom/badlogic/gdx/utils/compression/lzma/Decoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x2

    .line 26
    new-array p1, p1, [S

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_Choice:[S

    const/16 p1, 0x10

    .line 27
    new-array v0, p1, [Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_LowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    .line 28
    new-array p1, p1, [Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_MidCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    .line 29
    new-instance p1, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    const/16 v0, 0x8

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_HighCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    const/4 p1, 0x0

    .line 30
    iput p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_NumPosStates:I

    return-void
.end method


# virtual methods
.method public Create(I)V
    .locals 4

    .line 33
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_NumPosStates:I

    if-ge v0, p1, :cond_0

    .line 34
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_LowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    new-instance v2, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;-><init>(I)V

    aput-object v2, v1, v0

    .line 35
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_MidCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    iget v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_NumPosStates:I

    new-instance v2, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;-><init>(I)V

    aput-object v2, v0, v1

    .line 33
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_NumPosStates:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_NumPosStates:I

    goto :goto_0

    :cond_0
    return-void
.end method

.method public Decode(Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_Choice:[S

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->DecodeBit([SI)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_LowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    aget-object p2, v0, p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;->Decode(Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;)I

    move-result p1

    return p1

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_Choice:[S

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->DecodeBit([SI)I

    move-result v0

    if-nez v0, :cond_1

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_MidCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    aget-object p2, v0, p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;->Decode(Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;)I

    move-result p1

    goto :goto_0

    .line 54
    :cond_1
    iget-object p2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_HighCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;->Decode(Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;)I

    move-result p1

    add-int/lit8 p1, p1, 0x8

    :goto_0
    add-int/lit8 p1, p1, 0x8

    return p1
.end method

.method public Init()V
    .locals 2

    .line 40
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_Choice:[S

    invoke-static {v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->InitBitModels([S)V

    const/4 v0, 0x0

    .line 41
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_NumPosStates:I

    if-ge v0, v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_LowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;->Init()V

    .line 43
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_MidCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;->Init()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Decoder$LenDecoder;->m_HighCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeDecoder;->Init()V

    return-void
.end method
