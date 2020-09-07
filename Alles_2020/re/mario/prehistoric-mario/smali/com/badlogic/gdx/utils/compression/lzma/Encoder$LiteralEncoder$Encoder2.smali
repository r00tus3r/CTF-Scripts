.class Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;
.super Ljava/lang/Object;
.source "Encoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Encoder2"
.end annotation


# instance fields
.field m_Encoders:[S

.field final synthetic this$1:Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->this$1:Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x300

    .line 72
    new-array p1, p1, [S

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->m_Encoders:[S

    return-void
.end method


# virtual methods
.method public Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;B)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x7

    const/4 v2, 0x1

    :goto_0
    if-ltz v1, :cond_0

    shr-int v3, p2, v1

    and-int/2addr v3, v0

    .line 82
    iget-object v4, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->m_Encoders:[S

    invoke-virtual {p1, v4, v2, v3}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Encode([SII)V

    shl-int/2addr v2, v0

    or-int/2addr v2, v3

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public EncodeMatched(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;BB)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x7

    const/4 v2, 0x1

    const/4 v3, 0x1

    :goto_0
    if-ltz v1, :cond_2

    shr-int v4, p3, v1

    and-int/2addr v4, v0

    if-eqz v3, :cond_1

    shr-int v3, p2, v1

    and-int/2addr v3, v0

    add-int/lit8 v5, v3, 0x1

    shl-int/lit8 v5, v5, 0x8

    add-int/2addr v5, v2

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    move v5, v2

    .line 99
    :goto_1
    iget-object v6, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->m_Encoders:[S

    invoke-virtual {p1, v6, v5, v4}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Encode([SII)V

    shl-int/lit8 v2, v2, 0x1

    or-int/2addr v2, v4

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public GetPrice(ZBB)I
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x7

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    :goto_0
    if-ltz v2, :cond_2

    shr-int v3, p2, v2

    and-int/2addr v3, v0

    shr-int v4, p3, v2

    and-int/2addr v4, v0

    .line 112
    iget-object v5, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->m_Encoders:[S

    add-int/lit8 v6, v3, 0x1

    shl-int/lit8 v6, v6, 0x8

    add-int/2addr v6, p1

    aget-short v5, v5, v6

    invoke-static {v5, v4}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->GetPrice(II)I

    move-result v5

    add-int/2addr v1, v5

    shl-int/lit8 p1, p1, 0x1

    or-int/2addr p1, v4

    if-eq v3, v4, :cond_0

    goto :goto_2

    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :cond_2
    :goto_1
    if-ltz v2, :cond_3

    shr-int p2, p3, v2

    and-int/2addr p2, v0

    .line 123
    iget-object v3, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->m_Encoders:[S

    aget-short v3, v3, p1

    invoke-static {v3, p2}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->GetPrice(II)I

    move-result v3

    add-int/2addr v1, v3

    shl-int/2addr p1, v0

    or-int/2addr p1, p2

    :goto_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_3
    return v1
.end method

.method public Init()V
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LiteralEncoder$Encoder2;->m_Encoders:[S

    invoke-static {v0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->InitBitModels([S)V

    return-void
.end method
