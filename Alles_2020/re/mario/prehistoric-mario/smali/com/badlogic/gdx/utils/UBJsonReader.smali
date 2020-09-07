.class public Lcom/badlogic/gdx/utils/UBJsonReader;
.super Ljava/lang/Object;
.source "UBJsonReader.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/BaseJsonReader;


# instance fields
.field public oldFormat:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/UBJsonReader;->oldFormat:Z

    return-void
.end method


# virtual methods
.method public parse(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 4

    const/16 v0, 0x2000

    .line 54
    :try_start_0
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/files/FileHandle;->read(I)Ljava/io/BufferedInputStream;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/UBJsonReader;->parse(Ljava/io/InputStream;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 56
    new-instance v1, Lcom/badlogic/gdx/utils/SerializationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error parsing file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lcom/badlogic/gdx/utils/SerializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public parse(Ljava/io/DataInputStream;)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    :try_start_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/UBJsonReader;->parse(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    invoke-static {p1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {p1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0
.end method

.method protected parse(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x5b

    if-ne p2, v0, :cond_0

    .line 70
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseArray(Ljava/io/DataInputStream;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p1

    return-object p1

    :cond_0
    const/16 v0, 0x7b

    if-ne p2, v0, :cond_1

    .line 72
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseObject(Ljava/io/DataInputStream;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 v0, 0x5a

    if-ne p2, v0, :cond_2

    .line 74
    new-instance p1, Lcom/badlogic/gdx/utils/JsonValue;

    sget-object p2, Lcom/badlogic/gdx/utils/JsonValue$ValueType;->nullValue:Lcom/badlogic/gdx/utils/JsonValue$ValueType;

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Lcom/badlogic/gdx/utils/JsonValue$ValueType;)V

    return-object p1

    :cond_2
    const/16 v0, 0x54

    if-ne p2, v0, :cond_3

    .line 76
    new-instance p1, Lcom/badlogic/gdx/utils/JsonValue;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Z)V

    return-object p1

    :cond_3
    const/16 v0, 0x46

    if-ne p2, v0, :cond_4

    .line 78
    new-instance p1, Lcom/badlogic/gdx/utils/JsonValue;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Z)V

    return-object p1

    :cond_4
    const/16 v0, 0x42

    if-ne p2, v0, :cond_5

    .line 80
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUChar(Ljava/io/DataInputStream;)S

    move-result p1

    int-to-long v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    :cond_5
    const/16 v0, 0x55

    if-ne p2, v0, :cond_6

    .line 82
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUChar(Ljava/io/DataInputStream;)S

    move-result p1

    int-to-long v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    :cond_6
    const/16 v0, 0x69

    if-ne p2, v0, :cond_8

    .line 84
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/UBJsonReader;->oldFormat:Z

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    goto :goto_0

    :cond_7
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result p1

    :goto_0
    int-to-long v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    :cond_8
    const/16 v0, 0x49

    if-ne p2, v0, :cond_a

    .line 86
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/UBJsonReader;->oldFormat:Z

    if-eqz v0, :cond_9

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result p1

    goto :goto_1

    :cond_9
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    :goto_1
    int-to-long v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    :cond_a
    const/16 v0, 0x6c

    if-ne p2, v0, :cond_b

    .line 88
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result p1

    int-to-long v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    :cond_b
    const/16 v0, 0x4c

    if-ne p2, v0, :cond_c

    .line 90
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    :cond_c
    const/16 v0, 0x64

    if-ne p2, v0, :cond_d

    .line 92
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result p1

    float-to-double v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(D)V

    return-object p2

    :cond_d
    const/16 v0, 0x44

    if-ne p2, v0, :cond_e

    .line 94
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v0

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(D)V

    return-object p2

    :cond_e
    const/16 v0, 0x73

    if-eq p2, v0, :cond_13

    const/16 v0, 0x53

    if-ne p2, v0, :cond_f

    goto :goto_3

    :cond_f
    const/16 v0, 0x61

    if-eq p2, v0, :cond_12

    const/16 v0, 0x41

    if-ne p2, v0, :cond_10

    goto :goto_2

    :cond_10
    const/16 v0, 0x43

    if-ne p2, v0, :cond_11

    .line 100
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readChar()C

    move-result p1

    int-to-long v0, p1

    invoke-direct {p2, v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(J)V

    return-object p2

    .line 102
    :cond_11
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Unrecognized data type"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 98
    :cond_12
    :goto_2
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseData(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p1

    return-object p1

    .line 96
    :cond_13
    :goto_3
    new-instance v0, Lcom/badlogic/gdx/utils/JsonValue;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseString(Ljava/io/DataInputStream;B)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 2

    const/4 v0, 0x0

    .line 42
    :try_start_0
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 43
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/UBJsonReader;->parse(Ljava/io/DataInputStream;)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 45
    :goto_0
    :try_start_2
    new-instance v1, Lcom/badlogic/gdx/utils/SerializationException;

    invoke-direct {v1, p1}, Lcom/badlogic/gdx/utils/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 47
    :goto_1
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p1
.end method

.method protected parseArray(Ljava/io/DataInputStream;)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    new-instance v0, Lcom/badlogic/gdx/utils/JsonValue;

    sget-object v1, Lcom/badlogic/gdx/utils/JsonValue$ValueType;->array:Lcom/badlogic/gdx/utils/JsonValue$ValueType;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Lcom/badlogic/gdx/utils/JsonValue$ValueType;)V

    .line 107
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x24

    if-ne v1, v3, :cond_0

    .line 110
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    .line 111
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v3

    move v13, v3

    move v3, v1

    move v1, v13

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0x23

    const-wide/16 v5, -0x1

    const-wide/16 v7, 0x0

    if-ne v1, v4, :cond_4

    .line 115
    invoke-virtual {p0, p1, v2, v5, v6}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseSize(Ljava/io/DataInputStream;ZJ)J

    move-result-wide v5

    cmp-long v1, v5, v7

    if-ltz v1, :cond_3

    cmp-long v1, v5, v7

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    if-nez v3, :cond_2

    .line 118
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    goto :goto_1

    :cond_2
    move v1, v3

    goto :goto_1

    .line 116
    :cond_3
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Unrecognized data type"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    :goto_1
    const/4 v2, 0x0

    move-wide v9, v7

    .line 122
    :goto_2
    invoke-virtual {p1}, Ljava/io/DataInputStream;->available()I

    move-result v4

    if-lez v4, :cond_8

    const/16 v4, 0x5d

    if-eq v1, v4, :cond_8

    .line 123
    invoke-virtual {p0, p1, v1}, Lcom/badlogic/gdx/utils/UBJsonReader;->parse(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v1

    .line 124
    iput-object v0, v1, Lcom/badlogic/gdx/utils/JsonValue;->parent:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v4, 0x1

    if-eqz v2, :cond_5

    .line 126
    iput-object v2, v1, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    .line 127
    iput-object v1, v2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    .line 128
    iget v2, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    add-int/2addr v2, v4

    iput v2, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    goto :goto_3

    .line 130
    :cond_5
    iput-object v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    .line 131
    iput v4, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    :goto_3
    cmp-long v2, v5, v7

    if-lez v2, :cond_6

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    cmp-long v2, v9, v5

    if-ltz v2, :cond_6

    goto :goto_5

    :cond_6
    if-nez v3, :cond_7

    .line 135
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v2

    goto :goto_4

    :cond_7
    move v2, v3

    :goto_4
    move v13, v2

    move-object v2, v1

    move v1, v13

    goto :goto_2

    :cond_8
    :goto_5
    return-object v0
.end method

.method protected parseData(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    const/16 v1, 0x41

    if-ne p2, v1, :cond_0

    .line 181
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUInt(Ljava/io/DataInputStream;)J

    move-result-wide v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUChar(Ljava/io/DataInputStream;)S

    move-result p2

    int-to-long v1, p2

    .line 182
    :goto_0
    new-instance p2, Lcom/badlogic/gdx/utils/JsonValue;

    sget-object v3, Lcom/badlogic/gdx/utils/JsonValue$ValueType;->array:Lcom/badlogic/gdx/utils/JsonValue$ValueType;

    invoke-direct {p2, v3}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Lcom/badlogic/gdx/utils/JsonValue$ValueType;)V

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    :goto_1
    cmp-long v6, v4, v1

    if-gez v6, :cond_2

    .line 185
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/utils/UBJsonReader;->parse(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v6

    .line 186
    iput-object p2, v6, Lcom/badlogic/gdx/utils/JsonValue;->parent:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v7, 0x1

    if-eqz v3, :cond_1

    .line 188
    iput-object v6, v3, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    .line 189
    iget v3, p2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    add-int/2addr v3, v7

    iput v3, p2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    goto :goto_2

    .line 191
    :cond_1
    iput-object v6, p2, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    .line 192
    iput v7, p2, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    :goto_2
    const-wide/16 v7, 0x1

    add-long/2addr v4, v7

    move-object v3, v6

    goto :goto_1

    :cond_2
    return-object p2
.end method

.method protected parseObject(Ljava/io/DataInputStream;)Lcom/badlogic/gdx/utils/JsonValue;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    new-instance v0, Lcom/badlogic/gdx/utils/JsonValue;

    sget-object v1, Lcom/badlogic/gdx/utils/JsonValue$ValueType;->object:Lcom/badlogic/gdx/utils/JsonValue$ValueType;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/JsonValue;-><init>(Lcom/badlogic/gdx/utils/JsonValue$ValueType;)V

    .line 142
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x24

    if-ne v1, v3, :cond_0

    .line 145
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    .line 146
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v3

    move v12, v3

    move v3, v1

    move v1, v12

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0x23

    const-wide/16 v5, -0x1

    const-wide/16 v7, 0x0

    if-ne v1, v4, :cond_3

    .line 150
    invoke-virtual {p0, p1, v2, v5, v6}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseSize(Ljava/io/DataInputStream;ZJ)J

    move-result-wide v5

    cmp-long v1, v5, v7

    if-ltz v1, :cond_2

    cmp-long v1, v5, v7

    if-nez v1, :cond_1

    return-object v0

    .line 153
    :cond_1
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    goto :goto_1

    .line 151
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Unrecognized data type"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_1
    const/4 v2, 0x0

    move-wide v9, v7

    .line 157
    :goto_2
    invoke-virtual {p1}, Ljava/io/DataInputStream;->available()I

    move-result v4

    if-lez v4, :cond_7

    const/16 v4, 0x7d

    if-eq v1, v4, :cond_7

    const/4 v4, 0x1

    .line 158
    invoke-virtual {p0, p1, v4, v1}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseString(Ljava/io/DataInputStream;ZB)Ljava/lang/String;

    move-result-object v1

    if-nez v3, :cond_4

    .line 159
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v11

    goto :goto_3

    :cond_4
    move v11, v3

    :goto_3
    invoke-virtual {p0, p1, v11}, Lcom/badlogic/gdx/utils/UBJsonReader;->parse(Ljava/io/DataInputStream;B)Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v11

    .line 160
    invoke-virtual {v11, v1}, Lcom/badlogic/gdx/utils/JsonValue;->setName(Ljava/lang/String;)V

    .line 161
    iput-object v0, v11, Lcom/badlogic/gdx/utils/JsonValue;->parent:Lcom/badlogic/gdx/utils/JsonValue;

    if-eqz v2, :cond_5

    .line 163
    iput-object v2, v11, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    .line 164
    iput-object v11, v2, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    .line 165
    iget v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    add-int/2addr v1, v4

    iput v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    goto :goto_4

    .line 167
    :cond_5
    iput-object v11, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    .line 168
    iput v4, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    :goto_4
    cmp-long v1, v5, v7

    if-lez v1, :cond_6

    const-wide/16 v1, 0x1

    add-long/2addr v9, v1

    cmp-long v1, v9, v5

    if-ltz v1, :cond_6

    goto :goto_5

    .line 172
    :cond_6
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    move-object v2, v11

    goto :goto_2

    :cond_7
    :goto_5
    return-object v0
.end method

.method protected parseSize(Ljava/io/DataInputStream;BZJ)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x69

    if-ne p2, v0, :cond_0

    .line 220
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUChar(Ljava/io/DataInputStream;)S

    move-result p1

    :goto_0
    int-to-long p1, p1

    return-wide p1

    :cond_0
    const/16 v0, 0x49

    if-ne p2, v0, :cond_1

    .line 221
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUShort(Ljava/io/DataInputStream;)I

    move-result p1

    goto :goto_0

    :cond_1
    const/16 v0, 0x6c

    if-ne p2, v0, :cond_2

    .line 222
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUInt(Ljava/io/DataInputStream;)J

    move-result-wide p1

    return-wide p1

    :cond_2
    const/16 v0, 0x4c

    if-ne p2, v0, :cond_3

    .line 223
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide p1

    return-wide p1

    :cond_3
    if-eqz p3, :cond_4

    int-to-short p2, p2

    and-int/lit16 p2, p2, 0xff

    int-to-long p2, p2

    const/16 p4, 0x18

    shl-long/2addr p2, p4

    .line 226
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result p4

    int-to-short p4, p4

    and-int/lit16 p4, p4, 0xff

    int-to-long p4, p4

    const/16 v0, 0x10

    shl-long/2addr p4, v0

    or-long/2addr p2, p4

    .line 227
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result p4

    int-to-short p4, p4

    and-int/lit16 p4, p4, 0xff

    int-to-long p4, p4

    const/16 v0, 0x8

    shl-long/2addr p4, v0

    or-long/2addr p2, p4

    .line 228
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result p1

    int-to-short p1, p1

    and-int/lit16 p1, p1, 0xff

    int-to-long p4, p1

    or-long/2addr p2, p4

    return-wide p2

    :cond_4
    return-wide p4
.end method

.method protected parseSize(Ljava/io/DataInputStream;ZJ)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v2

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseSize(Ljava/io/DataInputStream;BZJ)J

    move-result-wide p1

    return-wide p1
.end method

.method protected parseString(Ljava/io/DataInputStream;B)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 200
    invoke-virtual {p0, p1, v0, p2}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseString(Ljava/io/DataInputStream;ZB)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected parseString(Ljava/io/DataInputStream;ZB)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    const/16 v2, 0x53

    if-ne p3, v2, :cond_0

    const/4 p2, 0x1

    .line 206
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseSize(Ljava/io/DataInputStream;ZJ)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const/16 v2, 0x73

    if-ne p3, v2, :cond_1

    .line 208
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readUChar(Ljava/io/DataInputStream;)S

    move-result p2

    int-to-long v0, p2

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    const/4 v5, 0x0

    const-wide/16 v6, -0x1

    move-object v2, p0

    move-object v3, p1

    move v4, p3

    .line 209
    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/utils/UBJsonReader;->parseSize(Ljava/io/DataInputStream;BZJ)J

    move-result-wide v0

    :cond_2
    :goto_0
    const-wide/16 p2, 0x0

    cmp-long v2, v0, p2

    if-ltz v2, :cond_4

    cmp-long v2, v0, p2

    if-lez v2, :cond_3

    .line 211
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/utils/UBJsonReader;->readString(Ljava/io/DataInputStream;J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    const-string p1, ""

    :goto_1
    return-object p1

    .line 210
    :cond_4
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Unrecognized data type, string expected"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected readString(Ljava/io/DataInputStream;J)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    long-to-int p3, p2

    .line 247
    new-array p2, p3, [B

    .line 248
    invoke-virtual {p1, p2}, Ljava/io/DataInputStream;->readFully([B)V

    .line 249
    new-instance p1, Ljava/lang/String;

    const-string p3, "UTF-8"

    invoke-direct {p1, p2, p3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p1
.end method

.method protected readUChar(Ljava/io/DataInputStream;)S
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result p1

    int-to-short p1, p1

    and-int/lit16 p1, p1, 0xff

    int-to-short p1, p1

    return p1
.end method

.method protected readUInt(Ljava/io/DataInputStream;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result p1

    int-to-long v0, p1

    const-wide/16 v2, -0x1

    and-long/2addr v0, v2

    return-wide v0
.end method

.method protected readUShort(Ljava/io/DataInputStream;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 239
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    const v0, 0xffff

    and-int/2addr p1, v0

    return p1
.end method
