.class public Lcom/badlogic/gdx/utils/DataInput;
.super Ljava/io/DataInputStream;
.source "DataInput.java"


# instance fields
.field private chars:[C


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 p1, 0x20

    .line 26
    new-array p1, p1, [C

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DataInput;->chars:[C

    return-void
.end method

.method private readUtf8_slow(III)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/utils/DataInput;->chars:[C

    :goto_0
    shr-int/lit8 v1, p3, 0x4

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    :pswitch_1
    and-int/lit8 p3, p3, 0xf

    shl-int/lit8 p3, p3, 0xc

    .line 100
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v1

    and-int/lit8 v1, v1, 0x3f

    shl-int/lit8 v1, v1, 0x6

    or-int/2addr p3, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v1

    and-int/lit8 v1, v1, 0x3f

    or-int/2addr p3, v1

    int-to-char p3, p3

    aput-char p3, v0, p2

    goto :goto_1

    :pswitch_2
    and-int/lit8 p3, p3, 0x1f

    shl-int/lit8 p3, p3, 0x6

    .line 97
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v1

    and-int/lit8 v1, v1, 0x3f

    or-int/2addr p3, v1

    int-to-char p3, p3

    aput-char p3, v0, p2

    goto :goto_1

    :pswitch_3
    int-to-char p3, p3

    .line 93
    aput-char p3, v0, p2

    :goto_1
    add-int/lit8 p2, p2, 0x1

    if-lt p2, p1, :cond_0

    return-void

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result p3

    and-int/lit16 p3, p3, 0xff

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public readInt(Z)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v0

    and-int/lit8 v1, v0, 0x7f

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    .line 37
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v0

    and-int/lit8 v2, v0, 0x7f

    shl-int/lit8 v2, v2, 0x7

    or-int/2addr v1, v2

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    .line 40
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v0

    and-int/lit8 v2, v0, 0x7f

    shl-int/lit8 v2, v2, 0xe

    or-int/2addr v1, v2

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v0

    and-int/lit8 v2, v0, 0x7f

    shl-int/lit8 v2, v2, 0x15

    or-int/2addr v1, v2

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v0

    and-int/lit8 v0, v0, 0x7f

    shl-int/lit8 v0, v0, 0x1c

    or-int/2addr v1, v0

    :cond_0
    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    ushr-int/lit8 p1, v1, 0x1

    and-int/lit8 v0, v1, 0x1

    neg-int v0, v0

    xor-int v1, p1, v0

    :goto_0
    return v1
.end method

.method public readString()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 58
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/DataInput;->readInt(Z)I

    move-result v1

    if-eqz v1, :cond_5

    if-eq v1, v0, :cond_4

    add-int/lit8 v1, v1, -0x1

    .line 66
    iget-object v0, p0, Lcom/badlogic/gdx/utils/DataInput;->chars:[C

    array-length v0, v0

    if-ge v0, v1, :cond_0

    new-array v0, v1, [C

    iput-object v0, p0, Lcom/badlogic/gdx/utils/DataInput;->chars:[C

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/DataInput;->chars:[C

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    .line 72
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DataInput;->read()I

    move-result v4

    const/16 v5, 0x7f

    if-le v4, v5, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v5, v3, 0x1

    int-to-char v6, v4

    .line 74
    aput-char v6, v0, v3

    move v3, v5

    goto :goto_0

    :cond_2
    :goto_1
    if-ge v3, v1, :cond_3

    .line 77
    invoke-direct {p0, v1, v3, v4}, Lcom/badlogic/gdx/utils/DataInput;->readUtf8_slow(III)V

    .line 78
    :cond_3
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0, v2, v1}, Ljava/lang/String;-><init>([CII)V

    return-object v3

    :cond_4
    const-string v0, ""

    return-object v0

    :cond_5
    const/4 v0, 0x0

    return-object v0
.end method
