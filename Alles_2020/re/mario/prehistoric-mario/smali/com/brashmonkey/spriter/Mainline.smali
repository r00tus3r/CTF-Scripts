.class public Lcom/brashmonkey/spriter/Mainline;
.super Ljava/lang/Object;
.source "Mainline.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Mainline$Key;
    }
.end annotation


# instance fields
.field private keyPointer:I

.field final keys:[Lcom/brashmonkey/spriter/Mainline$Key;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/brashmonkey/spriter/Mainline;->keyPointer:I

    .line 17
    new-array p1, p1, [Lcom/brashmonkey/spriter/Mainline$Key;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    return-void
.end method


# virtual methods
.method public addKey(Lcom/brashmonkey/spriter/Mainline$Key;)V
    .locals 3

    .line 29
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    iget v1, p0, Lcom/brashmonkey/spriter/Mainline;->keyPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Mainline;->keyPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public getKey(I)Lcom/brashmonkey/spriter/Mainline$Key;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getKeyBeforeTime(I)Lcom/brashmonkey/spriter/Mainline$Key;
    .locals 6

    .line 49
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    .line 50
    array-length v3, v0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v0, v1

    .line 51
    iget v5, v4, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    if-gt v5, p1, :cond_0

    add-int/lit8 v1, v1, 0x1

    move-object v2, v4

    goto :goto_0

    :cond_0
    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 23
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 24
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
