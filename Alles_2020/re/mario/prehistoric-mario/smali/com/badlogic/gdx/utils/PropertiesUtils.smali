.class public final Lcom/badlogic/gdx/utils/PropertiesUtils;
.super Ljava/lang/Object;
.source "PropertiesUtils.java"


# static fields
.field private static final CONTINUE:I = 0x3

.field private static final IGNORE:I = 0x5

.field private static final KEY_DONE:I = 0x4

.field private static final LINE_SEPARATOR:Ljava/lang/String; = "\n"

.field private static final NONE:I = 0x0

.field private static final SLASH:I = 0x1

.field private static final UNICODE:I = 0x2


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static dumpString(Lcom/badlogic/gdx/utils/StringBuilder;Ljava/lang/String;ZZ)V
    .locals 8

    .line 256
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_e

    .line 258
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    const/16 v5, 0x3d

    if-le v3, v5, :cond_1

    const/16 v6, 0x7f

    if-ge v3, v6, :cond_1

    if-ne v3, v4, :cond_0

    const-string v3, "\\\\"

    goto :goto_1

    .line 261
    :cond_0
    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    :goto_1
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto/16 :goto_6

    :cond_1
    const/16 v6, 0x9

    if-eq v3, v6, :cond_d

    const/16 v6, 0xa

    if-eq v3, v6, :cond_c

    const/16 v6, 0xc

    if-eq v3, v6, :cond_b

    const/16 v6, 0xd

    if-eq v3, v6, :cond_a

    const/16 v6, 0x20

    if-eq v3, v6, :cond_7

    const/16 v7, 0x21

    if-eq v3, v7, :cond_6

    const/16 v7, 0x23

    if-eq v3, v7, :cond_6

    const/16 v7, 0x3a

    if-eq v3, v7, :cond_6

    if-eq v3, v5, :cond_6

    if-lt v3, v6, :cond_3

    const/16 v4, 0x7e

    if-le v3, v4, :cond_2

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v4, 0x1

    :goto_3
    and-int/2addr v4, p3

    if-eqz v4, :cond_5

    .line 292
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\u"

    .line 293
    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v4, 0x0

    .line 294
    :goto_4
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    rsub-int/lit8 v5, v5, 0x4

    if-ge v4, v5, :cond_4

    const/16 v5, 0x30

    .line 295
    invoke-virtual {p0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 297
    :cond_4
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    .line 299
    :cond_5
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    .line 288
    :cond_6
    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    :cond_7
    if-eqz v2, :cond_9

    if-eqz p2, :cond_8

    goto :goto_5

    .line 269
    :cond_8
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    :cond_9
    :goto_5
    const-string v3, "\\ "

    .line 267
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    :cond_a
    const-string v3, "\\r"

    .line 276
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    :cond_b
    const-string v3, "\\f"

    .line 282
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    :cond_c
    const-string v3, "\\n"

    .line 273
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_6

    :cond_d
    const-string v3, "\\t"

    .line 279
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_e
    return-void
.end method

.method public static load(Lcom/badlogic/gdx/utils/ObjectMap;Ljava/io/Reader;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/Reader;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v0, :cond_2c

    if-eqz v1, :cond_2b

    const/16 v2, 0x28

    .line 57
    new-array v2, v2, [C

    .line 61
    new-instance v3, Ljava/io/BufferedReader;

    invoke-direct {v3, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const/4 v4, 0x2

    const/4 v6, 0x4

    const/4 v7, 0x1

    const/4 v8, -0x1

    const/4 v9, 0x0

    move-object v10, v2

    const/4 v2, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_0
    const/4 v14, -0x1

    const/4 v15, 0x1

    .line 64
    :goto_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->read()I

    move-result v5

    if-ne v5, v8, :cond_5

    if-ne v11, v4, :cond_1

    if-le v12, v6, :cond_0

    goto :goto_2

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid Unicode sequence: expected format \\uxxxx"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_2
    if-ne v14, v8, :cond_2

    if-lez v2, :cond_2

    move v14, v2

    :cond_2
    if-ltz v14, :cond_4

    .line 204
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v10, v9, v2}, Ljava/lang/String;-><init>([CII)V

    .line 205
    invoke-virtual {v1, v9, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 206
    invoke-virtual {v1, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    if-ne v11, v7, :cond_3

    .line 208
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\u0000"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 210
    :cond_3
    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void

    :cond_5
    int-to-char v5, v5

    .line 70
    array-length v1, v10

    if-ne v2, v1, :cond_6

    .line 71
    array-length v1, v10

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    .line 72
    invoke-static {v10, v9, v1, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v10, v1

    :cond_6
    const/16 v1, 0xa

    if-ne v11, v4, :cond_b

    const/16 v4, 0x10

    .line 76
    invoke-static {v5, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    if-ltz v4, :cond_7

    shl-int/lit8 v13, v13, 0x4

    add-int/2addr v13, v4

    add-int/lit8 v12, v12, 0x1

    if-ge v12, v6, :cond_8

    const/4 v4, 0x2

    goto :goto_1

    :cond_7
    if-le v12, v6, :cond_a

    :cond_8
    add-int/lit8 v4, v2, 0x1

    int-to-char v11, v13

    .line 86
    aput-char v11, v10, v2

    if-eq v5, v1, :cond_9

    move v2, v4

    const/4 v4, 0x2

    goto/16 :goto_7

    :cond_9
    move v2, v4

    const/4 v11, 0x0

    goto :goto_3

    .line 83
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid Unicode sequence: illegal character"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    :goto_3
    const/16 v4, 0xd

    if-ne v11, v7, :cond_15

    if-eq v5, v1, :cond_14

    if-eq v5, v4, :cond_13

    const/16 v11, 0x62

    if-eq v5, v11, :cond_11

    const/16 v11, 0x66

    if-eq v5, v11, :cond_10

    const/16 v11, 0x6e

    if-eq v5, v11, :cond_f

    const/16 v1, 0x72

    if-eq v5, v1, :cond_e

    const/16 v1, 0x74

    if-eq v5, v1, :cond_d

    const/16 v1, 0x75

    if-eq v5, v1, :cond_c

    goto :goto_4

    :cond_c
    const/4 v4, 0x2

    const/4 v11, 0x2

    const/4 v12, 0x0

    const/4 v13, 0x0

    goto/16 :goto_1

    :cond_d
    const/16 v5, 0x9

    goto :goto_4

    :cond_e
    const/16 v5, 0xd

    goto :goto_4

    :cond_f
    const/16 v5, 0xa

    goto :goto_4

    :cond_10
    const/16 v5, 0xc

    goto :goto_4

    :cond_11
    const/16 v5, 0x8

    :goto_4
    const/4 v1, 0x5

    :cond_12
    :goto_5
    const/4 v11, 0x0

    goto/16 :goto_b

    :cond_13
    const/4 v4, 0x2

    const/4 v11, 0x3

    goto/16 :goto_1

    :cond_14
    const/4 v4, 0x2

    :goto_6
    const/4 v11, 0x5

    goto/16 :goto_1

    :cond_15
    if-eq v5, v1, :cond_26

    if-eq v5, v4, :cond_25

    const/16 v7, 0x21

    if-eq v5, v7, :cond_19

    const/16 v7, 0x23

    if-eq v5, v7, :cond_19

    const/16 v1, 0x3a

    if-eq v5, v1, :cond_18

    const/16 v1, 0x3d

    if-eq v5, v1, :cond_18

    const/16 v1, 0x5c

    if-eq v5, v1, :cond_16

    goto :goto_9

    :cond_16
    if-ne v11, v6, :cond_17

    move v14, v2

    :cond_17
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v11, 0x1

    goto/16 :goto_1

    :cond_18
    if-ne v14, v8, :cond_1c

    move v14, v2

    const/4 v4, 0x2

    const/4 v7, 0x1

    :goto_7
    const/4 v11, 0x0

    goto/16 :goto_1

    :cond_19
    if-eqz v15, :cond_1c

    .line 126
    :cond_1a
    invoke-virtual {v3}, Ljava/io/BufferedReader;->read()I

    move-result v5

    if-ne v5, v8, :cond_1b

    goto :goto_8

    :cond_1b
    int-to-char v5, v5

    if-eq v5, v4, :cond_20

    if-ne v5, v1, :cond_1a

    :goto_8
    goto :goto_a

    .line 173
    :cond_1c
    :goto_9
    invoke-static {v5}, Ljava/lang/Character;->isSpace(C)Z

    move-result v1

    if-eqz v1, :cond_21

    const/4 v1, 0x3

    if-ne v11, v1, :cond_1d

    const/4 v11, 0x5

    :cond_1d
    if-eqz v2, :cond_1f

    if-eq v2, v14, :cond_1f

    const/4 v1, 0x5

    if-ne v11, v1, :cond_1e

    goto :goto_a

    :cond_1e
    if-ne v14, v8, :cond_22

    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v11, 0x4

    goto/16 :goto_1

    :cond_1f
    const/4 v1, 0x5

    :cond_20
    :goto_a
    const/4 v4, 0x2

    const/4 v7, 0x1

    goto/16 :goto_1

    :cond_21
    const/4 v1, 0x5

    :cond_22
    if-eq v11, v1, :cond_12

    const/4 v4, 0x3

    if-ne v11, v4, :cond_23

    goto :goto_5

    :cond_23
    :goto_b
    if-ne v11, v6, :cond_24

    move v14, v2

    const/4 v11, 0x0

    :cond_24
    add-int/lit8 v4, v2, 0x1

    .line 195
    aput-char v5, v10, v2

    move v2, v4

    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v15, 0x0

    goto/16 :goto_1

    :cond_25
    const/4 v1, 0x5

    const/4 v4, 0x3

    goto :goto_c

    :cond_26
    const/4 v1, 0x5

    const/4 v4, 0x3

    if-ne v11, v4, :cond_27

    const/4 v4, 0x2

    const/4 v7, 0x1

    goto :goto_6

    :cond_27
    :goto_c
    if-gtz v2, :cond_28

    if-nez v2, :cond_2a

    if-nez v14, :cond_2a

    :cond_28
    if-ne v14, v8, :cond_29

    move v14, v2

    .line 151
    :cond_29
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v10, v9, v2}, Ljava/lang/String;-><init>([CII)V

    .line 152
    invoke-virtual {v5, v9, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v2, v5}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2a
    const/4 v2, 0x0

    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 55
    :cond_2b
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Reader cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_2c
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "ObjectMap cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_e

    :goto_d
    throw v0

    :goto_e
    goto :goto_d
.end method

.method public static store(Lcom/badlogic/gdx/utils/ObjectMap;Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/Writer;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 231
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/utils/PropertiesUtils;->storeImpl(Lcom/badlogic/gdx/utils/ObjectMap;Ljava/io/Writer;Ljava/lang/String;Z)V

    return-void
.end method

.method private static storeImpl(Lcom/badlogic/gdx/utils/ObjectMap;Ljava/io/Writer;Ljava/lang/String;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/Writer;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 237
    invoke-static {p1, p2}, Lcom/badlogic/gdx/utils/PropertiesUtils;->writeComment(Ljava/io/Writer;Ljava/lang/String;)V

    :cond_0
    const-string p2, "#"

    .line 239
    invoke-virtual {p1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 240
    new-instance p2, Ljava/util/Date;

    invoke-direct {p2}, Ljava/util/Date;-><init>()V

    invoke-virtual {p2}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string p2, "\n"

    .line 241
    invoke-virtual {p1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 243
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    .line 244
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap;->entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object p0

    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    .line 245
    iget-object v2, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, p3}, Lcom/badlogic/gdx/utils/PropertiesUtils;->dumpString(Lcom/badlogic/gdx/utils/StringBuilder;Ljava/lang/String;ZZ)V

    const/16 v2, 0x3d

    .line 246
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 247
    iget-object v1, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, p3}, Lcom/badlogic/gdx/utils/PropertiesUtils;->dumpString(Lcom/badlogic/gdx/utils/StringBuilder;Ljava/lang/String;ZZ)V

    .line 248
    invoke-virtual {p1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 249
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 250
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->setLength(I)V

    goto :goto_0

    .line 252
    :cond_1
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    return-void
.end method

.method private static writeComment(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "#"

    .line 307
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 308
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const-string v5, "\n"

    if-ge v3, v1, :cond_8

    .line 312
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0xd

    const/16 v8, 0xa

    const/16 v9, 0xff

    if-gt v6, v9, :cond_0

    if-eq v6, v8, :cond_0

    if-ne v6, v7, :cond_7

    :cond_0
    if-eq v4, v3, :cond_1

    .line 314
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    :cond_1
    if-le v6, v9, :cond_3

    .line 316
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\u"

    .line 317
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/4 v5, 0x0

    .line 318
    :goto_1
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    rsub-int/lit8 v6, v6, 0x4

    if-ge v5, v6, :cond_2

    const/16 v6, 0x30

    .line 319
    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 321
    :cond_2
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_2

    .line 323
    :cond_3
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    if-ne v6, v7, :cond_4

    add-int/lit8 v4, v1, -0x1

    if-eq v3, v4, :cond_4

    add-int/lit8 v4, v3, 0x1

    .line 324
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_4

    move v3, v4

    :cond_4
    add-int/lit8 v4, v1, -0x1

    if-eq v3, v4, :cond_5

    add-int/lit8 v4, v3, 0x1

    .line 327
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x23

    if-eq v5, v6, :cond_6

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x21

    if-eq v4, v5, :cond_6

    .line 328
    :cond_5
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    :cond_6
    :goto_2
    add-int/lit8 v4, v3, 0x1

    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_8
    if-eq v4, v3, :cond_9

    .line 334
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 335
    :cond_9
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-void
.end method
