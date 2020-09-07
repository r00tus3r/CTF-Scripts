.class public Lcom/badlogic/gdx/utils/StringBuilder;
.super Ljava/lang/Object;
.source "StringBuilder.java"

# interfaces
.implements Ljava/lang/Appendable;
.implements Ljava/lang/CharSequence;


# static fields
.field static final INITIAL_CAPACITY:I = 0x10

.field private static final digits:[C


# instance fields
.field public chars:[C

.field public length:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xa

    .line 33
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 62
    new-array v0, v0, [C

    iput-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_0

    .line 74
    new-array p1, p1, [C

    iput-object p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    return-void

    .line 72
    :cond_0
    new-instance p1, Ljava/lang/NegativeArraySizeException;

    invoke-direct {p1}, Ljava/lang/NegativeArraySizeException;-><init>()V

    throw p1
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/StringBuilder;)V
    .locals 3

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iget v0, p1, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    iput v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    .line 88
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v1, v0, 0x10

    new-array v1, v1, [C

    iput-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    .line 89
    iget-object p1, p1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0

    .line 83
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    .line 99
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v1, v0, 0x10

    new-array v1, v1, [C

    iput-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    .line 100
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    return-void
.end method

.method private enlargeBuffer(I)V
    .locals 3

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v0

    shr-int/lit8 v1, v1, 0x1

    array-length v0, v0

    add-int/2addr v1, v0

    add-int/lit8 v0, v1, 0x2

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move p1, v0

    .line 105
    :goto_0
    new-array p1, p1, [C

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    iput-object p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    return-void
.end method

.method private move(II)V
    .locals 3

    .line 329
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v0

    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr v1, v2

    if-lt v1, p1, :cond_0

    add-int/2addr p1, p2

    sub-int/2addr v2, p2

    .line 330
    invoke-static {v0, p2, v0, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    :cond_0
    add-int/2addr v2, p1

    .line 333
    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    if-le v2, v0, :cond_1

    move v0, v2

    .line 335
    :cond_1
    new-array v0, v0, [C

    .line 336
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v2, 0x0

    invoke-static {v1, v2, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 338
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int/2addr p1, p2

    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr v2, p2

    invoke-static {v1, p2, v0, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 339
    iput-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    return-void
.end method

.method public static numChars(II)I
    .locals 1

    if-gez p0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 38
    :goto_0
    div-int/2addr p0, p1

    if-eqz p0, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public static numChars(JI)I
    .locals 5

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gez v2, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    :goto_0
    int-to-long v3, p2

    .line 46
    div-long/2addr p0, v3

    cmp-long v3, p0, v0

    if-eqz v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method


# virtual methods
.method public append(C)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 753
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    return-object p0
.end method

.method public append(D)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 894
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-object p0
.end method

.method public append(F)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 883
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-object p0
.end method

.method public append(I)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 1

    const/4 v0, 0x0

    .line 764
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(II)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(II)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 1

    const/16 v0, 0x30

    .line 775
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(IIC)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(IIC)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 6

    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_0

    const-string p1, "-2147483648"

    .line 788
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-object p0

    :cond_0
    if-gez p1, :cond_1

    const/16 v0, 0x2d

    .line 792
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    neg-int p1, p1

    :cond_1
    const/4 v0, 0x1

    const/16 v1, 0xa

    if-le p2, v0, :cond_2

    .line 796
    invoke-static {p1, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->numChars(II)I

    move-result v0

    sub-int/2addr p2, v0

    :goto_0
    if-lez p2, :cond_2

    .line 797
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_2
    const/16 p2, 0x2710

    if-lt p1, p2, :cond_8

    const p3, 0x3b9aca00

    if-lt p1, p3, :cond_3

    .line 800
    sget-object v0, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    int-to-long v2, p1

    const-wide v4, 0x2540be400L

    rem-long/2addr v2, v4

    const-wide/32 v4, 0x3b9aca00

    div-long/2addr v2, v4

    long-to-int v3, v2

    aget-char v0, v0, v3

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_3
    const v0, 0x5f5e100

    if-lt p1, v0, :cond_4

    .line 801
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int p3, p1, p3

    div-int/2addr p3, v0

    aget-char p3, v2, p3

    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_4
    const p3, 0x989680

    if-lt p1, p3, :cond_5

    .line 802
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int v0, p1, v0

    div-int/2addr v0, p3

    aget-char v0, v2, v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_5
    const v0, 0xf4240

    if-lt p1, v0, :cond_6

    .line 803
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int p3, p1, p3

    div-int/2addr p3, v0

    aget-char p3, v2, p3

    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_6
    const p3, 0x186a0

    if-lt p1, p3, :cond_7

    .line 804
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int v0, p1, v0

    div-int/2addr v0, p3

    aget-char v0, v2, v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    .line 805
    :cond_7
    sget-object v0, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int p3, p1, p3

    div-int/2addr p3, p2

    aget-char p2, v0, p3

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_8
    const/16 p2, 0x3e8

    if-lt p1, p2, :cond_9

    .line 807
    sget-object p3, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int/lit16 v0, p1, 0x2710

    div-int/2addr v0, p2

    aget-char p2, p3, v0

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_9
    const/16 p2, 0x64

    if-lt p1, p2, :cond_a

    .line 808
    sget-object p3, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int/lit16 v0, p1, 0x3e8

    div-int/2addr v0, p2

    aget-char p2, p3, v0

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_a
    if-lt p1, v1, :cond_b

    .line 809
    sget-object p2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int/lit8 p3, p1, 0x64

    div-int/2addr p3, v1

    aget-char p2, p2, p3

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    .line 810
    :cond_b
    sget-object p2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-int/2addr p1, v1

    aget-char p1, p2, p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    return-object p0
.end method

.method public append(J)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 1

    const/4 v0, 0x0

    .line 820
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(JI)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(JI)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 1

    const/16 v0, 0x30

    .line 830
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(JIC)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(JIC)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 5

    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    const-string p1, "-9223372036854775808"

    .line 842
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-object p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    const/16 v0, 0x2d

    .line 846
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    neg-long p1, p1

    :cond_1
    const/4 v0, 0x1

    if-le p3, v0, :cond_2

    const/16 v0, 0xa

    .line 850
    invoke-static {p1, p2, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->numChars(JI)I

    move-result v0

    sub-int/2addr p3, v0

    :goto_0
    if-lez p3, :cond_2

    .line 851
    invoke-virtual {p0, p4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_2
    const-wide/16 p3, 0x2710

    cmp-long v0, p1, p3

    if-ltz v0, :cond_11

    const-wide v0, 0xde0b6b3a7640000L

    cmp-long v2, p1, v0

    if-ltz v2, :cond_3

    .line 854
    sget-object v0, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    long-to-double v1, p1

    const-wide v3, 0x43e158e460913d00L    # 1.0E19

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    rem-double/2addr v1, v3

    const-wide v3, 0x43abc16d674ec800L    # 1.0E18

    div-double/2addr v1, v3

    double-to-int v1, v1

    aget-char v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_3
    const-wide v0, 0x16345785d8a0000L

    cmp-long v2, p1, v0

    if-ltz v2, :cond_4

    .line 855
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    const-wide v3, 0xde0b6b3a7640000L

    rem-long v3, p1, v3

    div-long/2addr v3, v0

    long-to-int v4, v3

    aget-char v2, v2, v4

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_4
    const-wide v2, 0x2386f26fc10000L

    cmp-long v4, p1, v2

    if-ltz v4, :cond_5

    .line 856
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    div-long/2addr v0, v2

    long-to-int v1, v0

    aget-char v0, v4, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_5
    const-wide v0, 0x38d7ea4c68000L

    cmp-long v4, p1, v0

    if-ltz v4, :cond_6

    .line 857
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v2, p1, v2

    div-long/2addr v2, v0

    long-to-int v3, v2

    aget-char v2, v4, v3

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_6
    const-wide v2, 0x5af3107a4000L

    cmp-long v4, p1, v2

    if-ltz v4, :cond_7

    .line 858
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    div-long/2addr v0, v2

    long-to-int v1, v0

    aget-char v0, v4, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_7
    const-wide v0, 0x9184e72a000L

    cmp-long v4, p1, v0

    if-ltz v4, :cond_8

    .line 859
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v2, p1, v2

    div-long/2addr v2, v0

    long-to-int v3, v2

    aget-char v2, v4, v3

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_8
    const-wide v2, 0xe8d4a51000L

    cmp-long v4, p1, v2

    if-ltz v4, :cond_9

    .line 860
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    div-long/2addr v0, v2

    long-to-int v1, v0

    aget-char v0, v4, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_9
    const-wide v0, 0x174876e800L

    cmp-long v4, p1, v0

    if-ltz v4, :cond_a

    .line 861
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v2, p1, v2

    div-long/2addr v2, v0

    long-to-int v3, v2

    aget-char v2, v4, v3

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_a
    const-wide v2, 0x2540be400L

    cmp-long v4, p1, v2

    if-ltz v4, :cond_b

    .line 862
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    div-long/2addr v0, v2

    long-to-int v1, v0

    aget-char v0, v4, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_b
    const-wide/32 v0, 0x3b9aca00

    cmp-long v4, p1, v0

    if-ltz v4, :cond_c

    .line 863
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v2, p1, v2

    div-long/2addr v2, v0

    long-to-int v3, v2

    aget-char v2, v4, v3

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_c
    const-wide/32 v2, 0x5f5e100

    cmp-long v4, p1, v2

    if-ltz v4, :cond_d

    .line 864
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    div-long/2addr v0, v2

    long-to-int v1, v0

    aget-char v0, v4, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_d
    const-wide/32 v0, 0x989680

    cmp-long v4, p1, v0

    if-ltz v4, :cond_e

    .line 865
    sget-object v4, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v2, p1, v2

    div-long/2addr v2, v0

    long-to-int v3, v2

    aget-char v2, v4, v3

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_e
    const-wide/32 v2, 0xf4240

    cmp-long v4, p1, v2

    if-ltz v4, :cond_f

    .line 866
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    const-wide/32 v3, 0xf4240

    div-long/2addr v0, v3

    long-to-int v1, v0

    aget-char v0, v2, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_f
    const-wide/32 v0, 0x186a0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_10

    .line 867
    sget-object v0, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    const-wide/32 v1, 0xf4240

    rem-long v1, p1, v1

    const-wide/32 v3, 0x186a0

    div-long/2addr v1, v3

    long-to-int v2, v1

    aget-char v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    .line 868
    :cond_10
    sget-object v0, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    const-wide/32 v1, 0x186a0

    rem-long v1, p1, v1

    div-long/2addr v1, p3

    long-to-int v2, v1

    aget-char v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_11
    const-wide/16 v0, 0x3e8

    cmp-long v2, p1, v0

    if-ltz v2, :cond_12

    .line 870
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long p3, p1, p3

    div-long/2addr p3, v0

    long-to-int p4, p3

    aget-char p3, v2, p4

    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_12
    const-wide/16 p3, 0x64

    cmp-long v2, p1, p3

    if-ltz v2, :cond_13

    .line 871
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long v0, p1, v0

    div-long/2addr v0, p3

    long-to-int v1, v0

    aget-char v0, v2, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    :cond_13
    const-wide/16 v0, 0xa

    cmp-long v2, p1, v0

    if-ltz v2, :cond_14

    .line 872
    sget-object v2, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long p3, p1, p3

    div-long/2addr p3, v0

    long-to-int p4, p3

    aget-char p3, v2, p4

    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    .line 873
    :cond_14
    sget-object p3, Lcom/badlogic/gdx/utils/StringBuilder;->digits:[C

    rem-long/2addr p1, v0

    long-to-int p2, p1

    aget-char p1, p3, p2

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    return-object p0
.end method

.method public append(Lcom/badlogic/gdx/utils/StringBuilder;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 2

    if-nez p1, :cond_0

    .line 977
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/StringBuilder;->appendNull()V

    goto :goto_0

    .line 979
    :cond_0
    iget-object v0, p1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v1, 0x0

    iget p1, p1, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0([CII)V

    :goto_0
    return-object p0
.end method

.method public append(Lcom/badlogic/gdx/utils/StringBuilder;II)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    if-nez p1, :cond_0

    .line 999
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/StringBuilder;->appendNull()V

    goto :goto_0

    .line 1001
    :cond_0
    iget-object p1, p1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0([CII)V

    :goto_0
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 2

    if-nez p1, :cond_0

    .line 965
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/StringBuilder;->appendNull()V

    goto :goto_0

    .line 966
    :cond_0
    instance-of v0, p1, Lcom/badlogic/gdx/utils/StringBuilder;

    if-eqz v0, :cond_1

    .line 967
    check-cast p1, Lcom/badlogic/gdx/utils/StringBuilder;

    .line 968
    iget-object v0, p1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v1, 0x0

    iget p1, p1, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0([CII)V

    goto :goto_0

    .line 970
    :cond_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    :goto_0
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 993
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/CharSequence;II)V

    return-object p0
.end method

.method public append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    if-nez p1, :cond_0

    .line 906
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/StringBuilder;->appendNull()V

    goto :goto_0

    .line 908
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    :goto_0
    return-object p0
.end method

.method public append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 918
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-object p0
.end method

.method public append(Z)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    if-eqz p1, :cond_0

    const-string p1, "true"

    goto :goto_0

    :cond_0
    const-string p1, "false"

    .line 742
    :goto_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-object p0
.end method

.method public append([C)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 940
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0([C)V

    return-object p0
.end method

.method public append([CII)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 954
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append0([CII)V

    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/CharSequence;)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/CharSequence;II)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object p1

    return-object p1
.end method

.method final append0(C)V
    .locals 3

    .line 148
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 149
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    aput-char p1, v0, v1

    return-void
.end method

.method final append0(Ljava/lang/CharSequence;II)V
    .locals 1

    if-nez p1, :cond_0

    const-string p1, "null"

    :cond_0
    if-ltz p2, :cond_1

    if-ltz p3, :cond_1

    if-gt p2, p3, :cond_1

    .line 172
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-gt p3, v0, :cond_1

    .line 176
    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    return-void

    .line 173
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method final append0(Ljava/lang/String;)V
    .locals 5

    if-nez p1, :cond_0

    .line 156
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/StringBuilder;->appendNull()V

    return-void

    .line 159
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 160
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/2addr v1, v0

    .line 161
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v2, v2

    if-le v1, v2, :cond_1

    .line 162
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    :cond_1
    const/4 v2, 0x0

    .line 164
    iget-object v3, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v4, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    invoke-virtual {p1, v2, v0, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 165
    iput v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void
.end method

.method final append0([C)V
    .locals 5

    .line 122
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    array-length v1, p1

    add-int/2addr v0, v1

    .line 123
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v1

    if-le v0, v1, :cond_0

    .line 124
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    :cond_0
    const/4 v1, 0x0

    .line 126
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v3, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    array-length v4, p1

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    iput v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void
.end method

.method final append0([CII)V
    .locals 3

    .line 132
    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p2, :cond_2

    if-ltz p3, :cond_1

    .line 135
    array-length v0, p1

    sub-int/2addr v0, p2

    if-lt v0, p3, :cond_1

    .line 139
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/2addr v0, p3

    .line 140
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v1

    if-le v0, v1, :cond_0

    .line 141
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    .line 143
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    iput v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void

    .line 136
    :cond_1
    new-instance p1, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Length out of bounds: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 133
    :cond_2
    new-instance p1, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Offset out of bounds: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public appendCodePoint(I)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1012
    invoke-static {p1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0([C)V

    return-object p0
.end method

.method public appendLine(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 928
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(Ljava/lang/String;)V

    const/16 p1, 0xa

    .line 929
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append0(C)V

    return-object p0
.end method

.method final appendNull()V
    .locals 4

    .line 111
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v0, v0, 0x4

    .line 112
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v1

    if-le v0, v1, :cond_0

    .line 113
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/16 v2, 0x6e

    aput-char v2, v0, v1

    .line 116
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/16 v2, 0x75

    aput-char v2, v0, v1

    .line 117
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/16 v2, 0x6c

    aput-char v2, v0, v1

    .line 118
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    aput-char v2, v0, v1

    return-void
.end method

.method public capacity()I
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v0, v0

    return v0
.end method

.method public charAt(I)C
    .locals 1

    if-ltz p1, :cond_0

    .line 194
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-ge p1, v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aget-char p1, v0, p1

    return p1

    .line 195
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 1041
    iput v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void
.end method

.method public codePointAt(I)I
    .locals 2

    if-ltz p1, :cond_0

    .line 683
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-ge p1, v0, :cond_0

    .line 686
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-static {v1, p1, v0}, Ljava/lang/Character;->codePointAt([CII)I

    move-result p1

    return p1

    .line 684
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public codePointBefore(I)I
    .locals 1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 698
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_0

    .line 701
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-static {v0, p1}, Ljava/lang/Character;->codePointBefore([CI)I

    move-result p1

    return p1

    .line 699
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public codePointCount(II)I
    .locals 1

    if-ltz p1, :cond_0

    .line 715
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p2, v0, :cond_0

    if-gt p1, p2, :cond_0

    .line 718
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    sub-int/2addr p2, p1

    invoke-static {v0, p1, p2}, Ljava/lang/Character;->codePointCount([CII)I

    move-result p1

    return p1

    .line 716
    :cond_0
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    .line 598
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public containsIgnoreCase(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    .line 602
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->indexOfIgnoreCase(Ljava/lang/String;I)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public delete(II)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1024
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->delete0(II)V

    return-object p0
.end method

.method final delete0(II)V
    .locals 2

    if-ltz p1, :cond_3

    .line 202
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-le p2, v0, :cond_0

    move p2, v0

    :cond_0
    if-ne p2, p1, :cond_1

    return-void

    :cond_1
    if-le p2, p1, :cond_3

    .line 209
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr v0, p2

    if-ltz v0, :cond_2

    .line 210
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-static {v1, p2, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr p2, p1

    sub-int/2addr v0, p2

    iput v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void

    .line 215
    :cond_3
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public deleteCharAt(I)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1035
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->deleteCharAt0(I)V

    return-object p0
.end method

.method final deleteCharAt0(I)V
    .locals 3

    if-ltz p1, :cond_1

    .line 219
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-ge p1, v0, :cond_1

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    if-lez v0, :cond_0

    .line 224
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int/lit8 v2, p1, 0x1

    invoke-static {v1, v2, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 226
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void

    .line 220
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public ensureCapacity(I)V
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v0

    if-le p1, v1, :cond_1

    .line 237
    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    if-le v0, p1, :cond_0

    move p1, v0

    .line 238
    :cond_0
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    :cond_1
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 1268
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 1269
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/utils/StringBuilder;

    .line 1270
    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    .line 1271
    iget v3, p1, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-eq v2, v3, :cond_3

    return v1

    .line 1272
    :cond_3
    iget-object v3, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget-object p1, p1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_5

    .line 1274
    aget-char v5, v3, v4

    aget-char v6, p1, v4

    if-eq v5, v6, :cond_4

    return v1

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    return v0
.end method

.method public equalsIgnoreCase(Lcom/badlogic/gdx/utils/StringBuilder;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 1282
    :cond_1
    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    .line 1283
    iget v3, p1, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-eq v2, v3, :cond_2

    return v1

    .line 1284
    :cond_2
    iget-object v3, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget-object p1, p1, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_4

    .line 1286
    aget-char v5, v3, v4

    .line 1287
    aget-char v6, p1, v4

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v6

    if-eq v5, v6, :cond_3

    .line 1288
    invoke-static {v6}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    if-eq v5, v6, :cond_3

    return v1

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    return v0
.end method

.method public equalsIgnoreCase(Ljava/lang/String;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1296
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    .line 1297
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v1, v2, :cond_1

    return v0

    .line 1298
    :cond_1
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    .line 1300
    aget-char v4, v2, v3

    .line 1301
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    if-eq v4, v5, :cond_2

    .line 1302
    invoke-static {v5}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v5

    if-eq v4, v5, :cond_2

    return v0

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public getChars(II[CI)V
    .locals 1

    .line 252
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_0

    if-gt p2, v0, :cond_0

    if-gt p1, p2, :cond_0

    .line 255
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    sub-int/2addr p2, p1

    invoke-static {v0, p1, p3, p4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    .line 253
    :cond_0
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method final getValue()[C
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 1260
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/lit8 v0, v0, 0x1f

    mul-int/lit8 v0, v0, 0x1f

    .line 1261
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([C)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public indexOf(Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 526
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public indexOf(Ljava/lang/String;I)I
    .locals 10

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 541
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 542
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-lt p2, p1, :cond_1

    if-nez p2, :cond_2

    :cond_1
    move p1, p2

    :cond_2
    return p1

    .line 543
    :cond_3
    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr v2, v1

    const/4 v3, -0x1

    if-le p2, v2, :cond_4

    return v3

    .line 545
    :cond_4
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    :goto_0
    const/4 v5, 0x1

    if-gt p2, v2, :cond_6

    .line 550
    iget-object v6, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aget-char v6, v6, p2

    if-ne v6, v4, :cond_5

    const/4 v6, 0x1

    goto :goto_1

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_6
    const/4 v6, 0x0

    :goto_1
    if-nez v6, :cond_7

    return v3

    :cond_7
    move v7, p2

    const/4 v6, 0x0

    :goto_2
    add-int/2addr v6, v5

    if-ge v6, v1, :cond_8

    .line 557
    iget-object v8, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int/2addr v7, v5

    aget-char v8, v8, v7

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v8, v9, :cond_8

    goto :goto_2

    :cond_8
    if-ne v6, v1, :cond_5

    return p2
.end method

.method public indexOfIgnoreCase(Ljava/lang/String;I)I
    .locals 11

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 569
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 570
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-lt p2, p1, :cond_1

    if-nez p2, :cond_2

    :cond_1
    move p1, p2

    :cond_2
    return p1

    .line 571
    :cond_3
    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr v2, v1

    const/4 v3, -0x1

    if-le p2, v2, :cond_4

    return v3

    .line 573
    :cond_4
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 574
    invoke-static {v4}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v5

    :goto_0
    const/4 v6, 0x1

    if-gt p2, v2, :cond_7

    .line 579
    iget-object v7, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aget-char v7, v7, p2

    if-eq v7, v4, :cond_6

    if-ne v7, v5, :cond_5

    goto :goto_1

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_6
    :goto_1
    const/4 v7, 0x1

    goto :goto_2

    :cond_7
    const/4 v7, 0x0

    :goto_2
    if-nez v7, :cond_8

    return v3

    :cond_8
    move v8, p2

    const/4 v7, 0x0

    :cond_9
    add-int/2addr v7, v6

    if-ge v7, v1, :cond_a

    .line 588
    iget-object v9, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int/2addr v8, v6

    aget-char v9, v9, v8

    .line 589
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v10

    if-eq v9, v10, :cond_9

    .line 590
    invoke-static {v10}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v10

    if-eq v9, v10, :cond_9

    :cond_a
    if-ne v7, v1, :cond_5

    return p2
.end method

.method public insert(IC)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1066
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(IC)V

    return-object p0
.end method

.method public insert(ID)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1118
    invoke-static {p2, p3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(IF)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1105
    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(II)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1079
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(IJ)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1092
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(ILjava/lang/CharSequence;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    if-nez p2, :cond_0

    const-string p2, "null"

    goto :goto_0

    .line 1186
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(ILjava/lang/CharSequence;II)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1203
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/CharSequence;II)V

    return-object p0
.end method

.method public insert(ILjava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    if-nez p2, :cond_0

    const-string p2, "null"

    goto :goto_0

    .line 1131
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(ILjava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1143
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(IZ)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    if-eqz p2, :cond_0

    const-string p2, "true"

    goto :goto_0

    :cond_0
    const-string p2, "false"

    .line 1053
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-object p0
.end method

.method public insert(I[C)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1156
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(I[C)V

    return-object p0
.end method

.method public insert(I[CII)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1172
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(I[CII)V

    return-object p0
.end method

.method final insert0(IC)V
    .locals 2

    if-ltz p1, :cond_0

    .line 286
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    .line 290
    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->move(II)V

    .line 291
    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aput-char p2, v1, p1

    .line 292
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void

    .line 288
    :cond_0
    new-instance p2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p2, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw p2
.end method

.method final insert0(ILjava/lang/CharSequence;II)V
    .locals 1

    if-nez p2, :cond_0

    const-string p2, "null"

    :cond_0
    if-ltz p1, :cond_1

    .line 315
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_1

    if-ltz p3, :cond_1

    if-ltz p4, :cond_1

    if-gt p3, p4, :cond_1

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-gt p4, v0, :cond_1

    .line 318
    invoke-interface {p2, p3, p4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-void

    .line 316
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method final insert0(ILjava/lang/String;)V
    .locals 3

    if-ltz p1, :cond_2

    .line 296
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_2

    if-nez p2, :cond_0

    const-string p2, "null"

    .line 300
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 302
    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->move(II)V

    const/4 v1, 0x0

    .line 303
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-virtual {p2, v1, v0, v2, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 304
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    :cond_1
    return-void

    .line 307
    :cond_2
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw p2
.end method

.method final insert0(I[C)V
    .locals 2

    if-ltz p1, :cond_1

    .line 259
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_1

    .line 262
    array-length v0, p2

    if-eqz v0, :cond_0

    .line 263
    array-length v0, p2

    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->move(II)V

    const/4 v0, 0x0

    .line 264
    array-length v1, p2

    invoke-static {p2, v0, p2, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 265
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    array-length p2, p2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    :cond_0
    return-void

    .line 260
    :cond_1
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw p2
.end method

.method final insert0(I[CII)V
    .locals 2

    if-ltz p1, :cond_2

    if-gt p1, p4, :cond_2

    if-ltz p3, :cond_1

    if-ltz p4, :cond_1

    .line 272
    array-length v0, p2

    sub-int/2addr v0, p3

    if-gt p4, v0, :cond_1

    if-eqz p4, :cond_0

    .line 274
    invoke-direct {p0, p4, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->move(II)V

    .line 275
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 276
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    add-int/2addr p1, p4

    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    :cond_0
    return-void

    .line 280
    :cond_1
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "offset "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", length "

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", char[].length "

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p2, p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 282
    :cond_2
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw p2
.end method

.method public lastIndexOf(Ljava/lang/String;)I
    .locals 1

    .line 614
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->lastIndexOf(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public lastIndexOf(Ljava/lang/String;I)I
    .locals 9

    .line 627
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 628
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/4 v2, -0x1

    if-gt v0, v1, :cond_8

    if-ltz p2, :cond_8

    if-lez v0, :cond_6

    sub-int v3, v1, v0

    if-le p2, v3, :cond_0

    sub-int p2, v1, v0

    :cond_0
    const/4 v3, 0x0

    .line 634
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    :goto_0
    const/4 v1, 0x1

    if-ltz p2, :cond_2

    .line 639
    iget-object v5, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aget-char v5, v5, p2

    if-ne v5, v4, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    :goto_1
    if-nez v5, :cond_3

    return v2

    :cond_3
    move v6, p2

    const/4 v5, 0x0

    :goto_2
    add-int/2addr v5, v1

    if-ge v5, v0, :cond_4

    .line 648
    iget-object v7, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int/2addr v6, v1

    aget-char v7, v7, v6

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v7, v8, :cond_4

    goto :goto_2

    :cond_4
    if-ne v5, v0, :cond_5

    return p2

    :cond_5
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_6
    if-ge p2, v1, :cond_7

    goto :goto_3

    :cond_7
    move p2, v1

    :goto_3
    return p2

    :cond_8
    return v2
.end method

.method public length()I
    .locals 1

    .line 325
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return v0
.end method

.method public offsetByCodePoints(II)I
    .locals 3

    .line 732
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, p1, p2}, Ljava/lang/Character;->offsetByCodePoints([CIIII)I

    move-result p1

    return p1
.end method

.method public replace(CLjava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 3

    .line 1236
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 1240
    :goto_0
    iget v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-ne v1, v2, :cond_0

    return-object p0

    .line 1241
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aget-char v2, v2, v1

    if-ne v2, p1, :cond_1

    add-int/lit8 v2, v1, 0x1

    .line 1244
    invoke-virtual {p0, v1, v2, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->replace0(IILjava/lang/String;)V

    add-int/2addr v1, v0

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public replace(IILjava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1217
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->replace0(IILjava/lang/String;)V

    return-object p0
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 4

    .line 1223
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    .line 1226
    :goto_0
    invoke-virtual {p0, p1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    return-object p0

    :cond_0
    add-int v3, v2, v0

    .line 1228
    invoke-virtual {p0, v2, v3, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->replace0(IILjava/lang/String;)V

    add-int/2addr v2, v1

    goto :goto_0
.end method

.method final replace0(IILjava/lang/String;)V
    .locals 5

    if-ltz p1, :cond_5

    .line 344
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-le p2, v0, :cond_0

    move p2, v0

    :cond_0
    if-le p2, p1, :cond_3

    .line 348
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v1, p2, p1

    sub-int/2addr v1, v0

    if-lez v1, :cond_1

    .line 352
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int v3, p1, v0

    iget v4, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr v4, p2

    invoke-static {v2, p2, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_1
    if-gez v1, :cond_2

    neg-int v2, v1

    .line 355
    invoke-direct {p0, v2, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->move(II)V

    :cond_2
    :goto_0
    const/4 p2, 0x0

    .line 357
    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    invoke-virtual {p3, p2, v0, v2, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 358
    iget p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void

    :cond_3
    if-ne p1, p2, :cond_5

    if-eqz p3, :cond_4

    .line 365
    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/utils/StringBuilder;->insert0(ILjava/lang/String;)V

    return-void

    .line 363
    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1

    .line 369
    :cond_5
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public reverse()Lcom/badlogic/gdx/utils/StringBuilder;
    .locals 0

    .line 1253
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/StringBuilder;->reverse0()V

    return-object p0
.end method

.method final reverse0()V
    .locals 16

    move-object/from16 v0, p0

    .line 373
    iget v1, v0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    return-void

    :cond_0
    add-int/lit8 v3, v1, -0x1

    .line 377
    iget-object v4, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v5, 0x0

    aget-char v6, v4, v5

    .line 378
    aget-char v4, v4, v3

    .line 380
    div-int/2addr v1, v2

    move v9, v4

    move v8, v6

    const/4 v6, 0x1

    const/4 v7, 0x1

    move v4, v3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_7

    .line 381
    iget-object v10, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    add-int/lit8 v11, v3, 0x1

    aget-char v12, v10, v11

    add-int/lit8 v13, v4, -0x1

    .line 382
    aget-char v10, v10, v13

    const v14, 0xdbff

    const v15, 0xd800

    const v5, 0xdfff

    const v2, 0xdc00

    if-eqz v6, :cond_1

    if-lt v12, v2, :cond_1

    if-gt v12, v5, :cond_1

    if-lt v8, v15, :cond_1

    if-gt v8, v14, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_2

    .line 385
    iget v5, v0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    const/4 v2, 0x3

    if-ge v5, v2, :cond_2

    return-void

    :cond_2
    if-eqz v7, :cond_3

    if-lt v10, v15, :cond_3

    if-gt v10, v14, :cond_3

    const v2, 0xdc00

    if-lt v9, v2, :cond_3

    const v2, 0xdfff

    if-gt v9, v2, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    if-ne v6, v2, :cond_5

    if-eqz v6, :cond_4

    .line 393
    iget-object v2, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aput-char v12, v2, v4

    .line 394
    aput-char v8, v2, v13

    .line 395
    aput-char v10, v2, v3

    .line 396
    aput-char v9, v2, v11

    add-int/lit8 v3, v3, 0x2

    .line 397
    aget-char v3, v2, v3

    add-int/lit8 v5, v4, -0x2

    .line 398
    aget-char v2, v2, v5

    add-int/lit8 v4, v4, -0x1

    move v9, v2

    move v8, v3

    move v3, v11

    goto :goto_3

    .line 403
    :cond_4
    iget-object v2, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aput-char v8, v2, v4

    .line 404
    aput-char v9, v2, v3

    move v9, v10

    move v8, v12

    :goto_3
    const/4 v2, 0x1

    const/4 v6, 0x1

    goto :goto_4

    :cond_5
    if-eqz v6, :cond_6

    .line 411
    iget-object v2, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aput-char v12, v2, v4

    .line 412
    aput-char v9, v2, v3

    move v9, v10

    const/4 v2, 0x1

    const/4 v6, 0x0

    :goto_4
    const/4 v7, 0x1

    goto :goto_5

    .line 417
    :cond_6
    iget-object v2, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aput-char v8, v2, v4

    .line 418
    aput-char v10, v2, v3

    move v8, v12

    const/4 v2, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    :goto_5
    add-int/2addr v3, v2

    add-int/lit8 v4, v4, -0x1

    const/4 v5, 0x0

    goto/16 :goto_0

    :cond_7
    const/4 v2, 0x1

    .line 424
    iget v1, v0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_a

    if-eqz v6, :cond_8

    if-nez v7, :cond_a

    .line 425
    :cond_8
    iget-object v1, v0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    if-eqz v6, :cond_9

    move v8, v9

    :cond_9
    aput-char v8, v1, v4

    :cond_a
    return-void
.end method

.method public setCharAt(IC)V
    .locals 1

    if-ltz p1, :cond_0

    .line 435
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-ge p1, v0, :cond_0

    .line 438
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    aput-char p2, v0, p1

    return-void

    .line 436
    :cond_0
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw p2
.end method

.method public setLength(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 451
    iget-object v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v1, v0

    if-le p1, v1, :cond_0

    .line 452
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->enlargeBuffer(I)V

    goto :goto_0

    .line 454
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-ge v1, p1, :cond_1

    const/4 v2, 0x0

    .line 455
    invoke-static {v0, v1, p1, v2}, Ljava/util/Arrays;->fill([CIIC)V

    .line 458
    :cond_1
    :goto_0
    iput p1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    return-void

    .line 449
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 0

    .line 515
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public substring(I)Ljava/lang/String;
    .locals 3

    if-ltz p1, :cond_1

    .line 467
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p1, v0, :cond_1

    if-ne p1, v0, :cond_0

    const-string p1, ""

    return-object p1

    .line 473
    :cond_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    sub-int/2addr v0, p1

    invoke-direct {v1, v2, p1, v0}, Ljava/lang/String;-><init>([CII)V

    return-object v1

    .line 475
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public substring(II)Ljava/lang/String;
    .locals 2

    if-ltz p1, :cond_1

    if-gt p1, p2, :cond_1

    .line 486
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-gt p2, v0, :cond_1

    if-ne p1, p2, :cond_0

    const-string p1, ""

    return-object p1

    .line 492
    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    sub-int/2addr p2, p1

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 494
    :cond_1
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 502
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 503
    :cond_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v0}, Ljava/lang/String;-><init>([CII)V

    return-object v1
.end method

.method public trimToSize()V
    .locals 4

    .line 667
    iget v0, p0, Lcom/badlogic/gdx/utils/StringBuilder;->length:I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 668
    new-array v2, v0, [C

    const/4 v3, 0x0

    .line 669
    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 670
    iput-object v2, p0, Lcom/badlogic/gdx/utils/StringBuilder;->chars:[C

    :cond_0
    return-void
.end method
