.class Lcom/badlogic/gdx/utils/TextFormatter;
.super Ljava/lang/Object;
.source "TextFormatter.java"


# instance fields
.field private buffer:Lcom/badlogic/gdx/utils/StringBuilder;

.field private messageFormat:Ljava/text/MessageFormat;


# direct methods
.method public constructor <init>(Ljava/util/Locale;Z)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    if-eqz p2, :cond_0

    .line 32
    new-instance p2, Ljava/text/MessageFormat;

    const-string v0, ""

    invoke-direct {p2, v0, p1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object p2, p0, Lcom/badlogic/gdx/utils/TextFormatter;->messageFormat:Ljava/text/MessageFormat;

    :cond_0
    return-void
.end method

.method private replaceEscapeChars(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->setLength(I)V

    .line 75
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_6

    .line 77
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x27

    const/4 v5, 0x1

    if-ne v3, v4, :cond_0

    .line 80
    iget-object v2, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    const-string v3, "\'\'"

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    goto :goto_2

    :cond_0
    const/16 v6, 0x7b

    if-ne v3, v6, :cond_5

    add-int/lit8 v3, v1, 0x1

    :goto_1
    if-ge v3, v0, :cond_1

    .line 83
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v6, :cond_1

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    sub-int v1, v3, v1

    .line 85
    div-int/lit8 v7, v1, 0x2

    if-lez v7, :cond_3

    .line 88
    iget-object v2, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 90
    :cond_2
    iget-object v2, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v2, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v7, v7, -0x1

    if-gtz v7, :cond_2

    .line 92
    iget-object v2, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    .line 94
    :cond_3
    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v1, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_4
    add-int/lit8 v1, v3, -0x1

    goto :goto_2

    .line 97
    :cond_5
    iget-object v4, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_2
    add-int/2addr v1, v5

    goto :goto_0

    :cond_6
    if-eqz v2, :cond_7

    .line 100
    iget-object p1, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_7
    return-object p1
.end method

.method private varargs simpleFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 10

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->setLength(I)V

    .line 119
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x0

    :goto_0
    if-ge v3, v0, :cond_8

    .line 121
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x7b

    const/4 v8, 0x1

    if-gez v4, :cond_2

    if-ne v6, v7, :cond_1

    add-int/lit8 v5, v3, 0x1

    if-ge v5, v0, :cond_0

    .line 125
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v7, :cond_0

    .line 126
    iget-object v3, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v3, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    move v3, v5

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    const/4 v5, 0x1

    goto :goto_3

    .line 132
    :cond_1
    iget-object v7, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_3

    :cond_2
    const/16 v9, 0x7d

    if-ne v6, v9, :cond_6

    .line 136
    array-length v6, p2

    if-ge v4, v6, :cond_5

    add-int/lit8 v6, v3, -0x1

    .line 138
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v7, :cond_4

    .line 140
    aget-object v6, p2, v4

    if-nez v6, :cond_3

    .line 141
    iget-object v4, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    const-string v6, "null"

    invoke-virtual {v4, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_2

    .line 143
    :cond_3
    iget-object v6, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    aget-object v4, p2, v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_2
    const/4 v4, -0x1

    goto :goto_3

    .line 139
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Missing argument index after a left curly brace"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 137
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Argument index out of bounds: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    const/16 v7, 0x30

    if-lt v6, v7, :cond_7

    const/16 v7, 0x39

    if-gt v6, v7, :cond_7

    mul-int/lit8 v4, v4, 0xa

    add-int/lit8 v6, v6, -0x30

    add-int/2addr v4, v6

    :goto_3
    add-int/2addr v3, v8

    goto :goto_0

    .line 147
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unexpected \'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "\' while parsing argument index"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    if-gez v4, :cond_a

    if-eqz v5, :cond_9

    .line 154
    iget-object p1, p0, Lcom/badlogic/gdx/utils/TextFormatter;->buffer:Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_9
    return-object p1

    .line 152
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Unmatched braces in the pattern."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method


# virtual methods
.method public varargs format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/utils/TextFormatter;->messageFormat:Ljava/text/MessageFormat;

    if-eqz v0, :cond_0

    .line 61
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/TextFormatter;->replaceEscapeChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/text/MessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 62
    iget-object p1, p0, Lcom/badlogic/gdx/utils/TextFormatter;->messageFormat:Ljava/text/MessageFormat;

    invoke-virtual {p1, p2}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 64
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/TextFormatter;->simpleFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
