.class public Lcom/badlogic/gdx/utils/Base64Coder$CharMap;
.super Ljava/lang/Object;
.source "Base64Coder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/Base64Coder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CharMap"
.end annotation


# instance fields
.field protected final decodingMap:[B

.field protected final encodingMap:[C


# direct methods
.method public constructor <init>(CC)V
    .locals 6

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x40

    .line 34
    new-array v1, v0, [C

    iput-object v1, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    const/16 v1, 0x80

    .line 35
    new-array v1, v1, [B

    iput-object v1, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->decodingMap:[B

    const/4 v1, 0x0

    const/16 v2, 0x41

    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0x5a

    if-gt v2, v4, :cond_0

    .line 40
    iget-object v4, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    add-int/lit8 v5, v3, 0x1

    aput-char v2, v4, v3

    add-int/lit8 v2, v2, 0x1

    int-to-char v2, v2

    move v3, v5

    goto :goto_0

    :cond_0
    const/16 v2, 0x61

    :goto_1
    const/16 v4, 0x7a

    if-gt v2, v4, :cond_1

    .line 43
    iget-object v4, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    add-int/lit8 v5, v3, 0x1

    aput-char v2, v4, v3

    add-int/lit8 v2, v2, 0x1

    int-to-char v2, v2

    move v3, v5

    goto :goto_1

    :cond_1
    const/16 v2, 0x30

    :goto_2
    const/16 v4, 0x39

    if-gt v2, v4, :cond_2

    .line 46
    iget-object v4, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    add-int/lit8 v5, v3, 0x1

    aput-char v2, v4, v3

    add-int/lit8 v2, v2, 0x1

    int-to-char v2, v2

    move v3, v5

    goto :goto_2

    .line 48
    :cond_2
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    add-int/lit8 v4, v3, 0x1

    aput-char p1, v2, v3

    .line 49
    aput-char p2, v2, v4

    const/4 p1, 0x0

    .line 50
    :goto_3
    iget-object p2, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->decodingMap:[B

    array-length v2, p2

    if-ge p1, v2, :cond_3

    const/4 v2, -0x1

    .line 51
    aput-byte v2, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_3
    :goto_4
    if-ge v1, v0, :cond_4

    .line 54
    iget-object p1, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->decodingMap:[B

    iget-object p2, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    aget-char p2, p2, v1

    int-to-byte v2, v1

    aput-byte v2, p1, p2

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_4
    return-void
.end method


# virtual methods
.method public getDecodingMap()[B
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->decodingMap:[B

    return-object v0
.end method

.method public getEncodingMap()[C
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Base64Coder$CharMap;->encodingMap:[C

    return-object v0
.end method
