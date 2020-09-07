.class Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;
.super Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;
.source "Encoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/compression/lzma/Encoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LenPriceTableEncoder"
.end annotation


# instance fields
.field _counters:[I

.field _prices:[I

.field _tableSize:I

.field final synthetic this$0:Lcom/badlogic/gdx/utils/compression/lzma/Encoder;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/compression/lzma/Encoder;)V
    .locals 0

    .line 219
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->this$0:Lcom/badlogic/gdx/utils/compression/lzma/Encoder;

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;-><init>(Lcom/badlogic/gdx/utils/compression/lzma/Encoder;)V

    const/16 p1, 0x1100

    .line 220
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_prices:[I

    const/16 p1, 0x10

    .line 222
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_counters:[I

    return-void
.end method


# virtual methods
.method public Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    invoke-super {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenEncoder;->Encode(Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;II)V

    .line 245
    iget-object p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_counters:[I

    aget p2, p1, p3

    add-int/lit8 p2, p2, -0x1

    aput p2, p1, p3

    if-nez p2, :cond_0

    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->UpdateTable(I)V

    :cond_0
    return-void
.end method

.method public GetPrice(II)I
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_prices:[I

    mul-int/lit16 p2, p2, 0x110

    add-int/2addr p2, p1

    aget p1, v0, p2

    return p1
.end method

.method public SetTableSize(I)V
    .locals 0

    .line 225
    iput p1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_tableSize:I

    return-void
.end method

.method UpdateTable(I)V
    .locals 3

    .line 233
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_tableSize:I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_prices:[I

    mul-int/lit16 v2, p1, 0x110

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->SetPrices(II[II)V

    .line 234
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_counters:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->_tableSize:I

    aput v1, v0, p1

    return-void
.end method

.method public UpdateTables(I)V
    .locals 1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 239
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/compression/lzma/Encoder$LenPriceTableEncoder;->UpdateTable(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
