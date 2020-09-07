.class public Lcom/badlogic/gdx/utils/JsonWriter;
.super Ljava/io/Writer;
.source "JsonWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/JsonWriter$OutputType;,
        Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;
    }
.end annotation


# instance fields
.field private current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

.field private named:Z

.field private outputType:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

.field private quoteLongValues:Z

.field private final stack:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;",
            ">;"
        }
    .end annotation
.end field

.field final writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 29
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    .line 32
    sget-object v0, Lcom/badlogic/gdx/utils/JsonWriter$OutputType;->json:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->outputType:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->quoteLongValues:Z

    .line 36
    iput-object p1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    return-void
.end method

.method private requireCommaOrName()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    if-nez v0, :cond_0

    return-void

    .line 101
    :cond_0
    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->array:Z

    if-eqz v0, :cond_2

    .line 102
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->needsComma:Z

    if-nez v0, :cond_1

    .line 103
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->needsComma:Z

    goto :goto_0

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    goto :goto_0

    .line 107
    :cond_2
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->named:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    .line 108
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->named:Z

    :goto_0
    return-void

    .line 107
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Name must be set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public array()Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/JsonWriter;->requireCommaOrName()V

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    new-instance v1, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;-><init>(Lcom/badlogic/gdx/utils/JsonWriter;Z)V

    iput-object v1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public array(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/JsonWriter;->name(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/JsonWriter;->array()Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    return-object p1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_0

    .line 146
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/JsonWriter;->pop()Lcom/badlogic/gdx/utils/JsonWriter;

    goto :goto_0

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    return-void
.end method

.method public getWriter()Ljava/io/Writer;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method public json(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/JsonWriter;->requireCommaOrName()V

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-object p0
.end method

.method public json(Ljava/lang/String;Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/JsonWriter;->name(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/JsonWriter;->json(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    return-object p1
.end method

.method public name(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    if-eqz v0, :cond_1

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->array:Z

    if-nez v0, :cond_1

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->needsComma:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->needsComma:Z

    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(I)V

    .line 60
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    iget-object v2, p0, Lcom/badlogic/gdx/utils/JsonWriter;->outputType:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/utils/JsonWriter$OutputType;->quoteName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 61
    iget-object p1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 62
    iput-boolean v1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->named:Z

    return-object p0

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Current item must be an object."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public object()Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/JsonWriter;->requireCommaOrName()V

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    new-instance v1, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;-><init>(Lcom/badlogic/gdx/utils/JsonWriter;Z)V

    iput-object v1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public object(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/JsonWriter;->name(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/JsonWriter;->object()Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    return-object p1
.end method

.method public pop()Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->named:Z

    if-nez v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;->close()V

    .line 132
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->stack:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    :goto_0
    iput-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->current:Lcom/badlogic/gdx/utils/JsonWriter$JsonObject;

    return-object p0

    .line 130
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expected an object, array, or value since a name was set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/JsonWriter;->name(Ljava/lang/String;)Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/JsonWriter;->value(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/JsonWriter;

    move-result-object p1

    return-object p1
.end method

.method public setOutputType(Lcom/badlogic/gdx/utils/JsonWriter$OutputType;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->outputType:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    return-void
.end method

.method public setQuoteLongValues(Z)V
    .locals 0

    .line 51
    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->quoteLongValues:Z

    return-void
.end method

.method public value(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/JsonWriter;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->quoteLongValues:Z

    if-eqz v0, :cond_1

    instance-of v0, p1, Ljava/lang/Long;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/lang/Double;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/math/BigDecimal;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/math/BigInteger;

    if-eqz v0, :cond_1

    .line 81
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 82
    :cond_1
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 83
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    .line 84
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    .line 85
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    long-to-double v5, v1

    cmpl-double v0, v3, v5

    if-nez v0, :cond_2

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 87
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/JsonWriter;->requireCommaOrName()V

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/JsonWriter;->outputType:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/JsonWriter$OutputType;->quoteValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-object p0
.end method

.method public write([CII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    return-void
.end method
