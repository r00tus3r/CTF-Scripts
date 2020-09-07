.class Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/compression/lzma/Encoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LenEncoder"
.end annotation


# instance fields
.field _choice:[S

.field _highCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

.field _lowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

.field _midCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

.field final synthetic this$0:Lcom/badlogic/gdx/utils/compression/lzma/Encoder;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/compression/lzma/Encoder;)V
    .locals 4

    .line 163
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->this$0:Lcom/badlogic/gdx/utils/compression/lzma/Encoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x2

    .line 158
    new-array p1, p1, [S

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    const/16 p1, 0x10

    .line 159
    new-array v0, p1, [Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_lowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    .line 160
    new-array v0, p1, [Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_midCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    .line 161
    new-instance v0, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_highCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 165
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_lowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    new-instance v2, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;-><init>(I)V

    aput-object v2, v1, v0

    .line 166
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_midCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    new-instance v2, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;-><init>(I)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;II)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-ge p2, v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    invoke-virtual {p1, v0, v1, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Encode([SII)V

    .line 184
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_lowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    aget-object p3, v0, p3

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;I)V

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, -0x8

    .line 187
    iget-object v2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v1, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Encode([SII)V

    if-ge p2, v0, :cond_1

    .line 189
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    invoke-virtual {p1, v0, v3, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Encode([SII)V

    .line 190
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_midCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    aget-object p3, v0, p3

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;I)V

    goto :goto_0

    .line 192
    :cond_1
    iget-object p3, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    invoke-virtual {p1, p3, v3, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Encode([SII)V

    .line 193
    iget-object p3, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_highCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    sub-int/2addr p2, v0

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;I)V

    :goto_0
    return-void
.end method

.method public Init(I)V
    .locals 2

    .line 171
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    invoke-static {v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->InitBitModels([S)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 174
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_lowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->Init()V

    .line 175
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_midCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->Init()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_highCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->Init()V

    return-void
.end method

.method public SetPrices(II[II)V
    .locals 7

    .line 199
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    const/4 v1, 0x0

    aget-short v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->GetPrice0(I)I

    move-result v0

    .line 200
    iget-object v2, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    aget-short v2, v2, v1

    invoke-static {v2}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->GetPrice1(I)I

    move-result v2

    .line 201
    iget-object v3, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    const/4 v4, 0x1

    aget-short v3, v3, v4

    invoke-static {v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->GetPrice0(I)I

    move-result v3

    add-int/2addr v3, v2

    .line 202
    iget-object v5, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_choice:[S

    aget-short v4, v5, v4

    invoke-static {v4}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->GetPrice1(I)I

    move-result v4

    add-int/2addr v2, v4

    :goto_0
    const/16 v4, 0x8

    if-ge v1, v4, :cond_1

    if-lt v1, p2, :cond_0

    return-void

    :cond_0
    add-int v4, p4, v1

    .line 206
    iget-object v5, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_lowCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    aget-object v5, v5, p1

    invoke-virtual {v5, v1}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->GetPrice(I)I

    move-result v5

    add-int/2addr v5, v0

    aput v5, p3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const/16 v0, 0x10

    if-ge v1, v0, :cond_3

    if-lt v1, p2, :cond_2

    return-void

    :cond_2
    add-int v0, p4, v1

    .line 210
    iget-object v5, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_midCoder:[Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    aget-object v5, v5, p1

    add-int/lit8 v6, v1, -0x8

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->GetPrice(I)I

    move-result v5

    add-int/2addr v5, v3

    aput v5, p3, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-ge v1, p2, :cond_4

    add-int p1, p4, v1

    .line 213
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->_highCoder:Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;

    add-int/lit8 v3, v1, -0x8

    sub-int/2addr v3, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/BitTreeEncoder;->GetPrice(I)I

    move-result v0

    add-int/2addr v0, v2

    aput v0, p3, p1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    return-void
.end method
