.class public Lcom/alles/platformer/RC4;
.super Ljava/lang/Object;
.source "RC4.java"


# instance fields
.field private final S:[B

.field private final T:[B

.field private final keylen:I


# direct methods
.method public constructor <init>([B)V
    .locals 5

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    .line 4
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/alles/platformer/RC4;->S:[B

    .line 5
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/alles/platformer/RC4;->T:[B

    .line 9
    array-length v1, p1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_2

    array-length v1, p1

    if-gt v1, v0, :cond_2

    .line 13
    array-length v1, p1

    iput v1, p0, Lcom/alles/platformer/RC4;->keylen:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 15
    iget-object v3, p0, Lcom/alles/platformer/RC4;->S:[B

    int-to-byte v4, v2

    aput-byte v4, v3, v2

    .line 16
    iget-object v3, p0, Lcom/alles/platformer/RC4;->T:[B

    iget v4, p0, Lcom/alles/platformer/RC4;->keylen:I

    rem-int v4, v2, v4

    aget-byte v4, p1, v4

    aput-byte v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_1
    if-ge v1, v0, :cond_1

    .line 21
    iget-object v2, p0, Lcom/alles/platformer/RC4;->S:[B

    aget-byte v3, v2, v1

    add-int/2addr p1, v3

    iget-object v3, p0, Lcom/alles/platformer/RC4;->T:[B

    aget-byte v3, v3, v1

    add-int/2addr p1, v3

    and-int/lit16 p1, p1, 0xff

    .line 22
    aget-byte v3, v2, p1

    .line 23
    aget-byte v4, v2, v1

    aput-byte v4, v2, p1

    .line 24
    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-void

    .line 10
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "key must be between 1 and 256 bytes"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method public decrypt([B)[B
    .locals 0

    .line 47
    invoke-virtual {p0, p1}, Lcom/alles/platformer/RC4;->encrypt([B)[B

    move-result-object p1

    return-object p1
.end method

.method public encrypt([B)[B
    .locals 7

    .line 30
    array-length v0, p1

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 33
    :goto_0
    array-length v4, p1

    if-ge v1, v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    and-int/lit16 v2, v2, 0xff

    .line 35
    iget-object v4, p0, Lcom/alles/platformer/RC4;->S:[B

    aget-byte v5, v4, v2

    add-int/2addr v3, v5

    and-int/lit16 v3, v3, 0xff

    .line 36
    aget-byte v5, v4, v3

    .line 37
    aget-byte v6, v4, v2

    aput-byte v6, v4, v3

    .line 38
    aput-byte v5, v4, v2

    .line 39
    aget-byte v5, v4, v2

    aget-byte v6, v4, v3

    add-int/2addr v5, v6

    and-int/lit16 v5, v5, 0xff

    .line 40
    aget-byte v4, v4, v5

    .line 41
    aget-byte v5, p1, v1

    xor-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method
