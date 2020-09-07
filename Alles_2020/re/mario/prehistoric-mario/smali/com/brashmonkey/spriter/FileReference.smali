.class public Lcom/brashmonkey/spriter/FileReference;
.super Ljava/lang/Object;
.source "FileReference.java"


# instance fields
.field public file:I

.field public folder:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/brashmonkey/spriter/FileReference;->set(II)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 24
    instance-of v0, p1, Lcom/brashmonkey/spriter/FileReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 25
    iget v0, p0, Lcom/brashmonkey/spriter/FileReference;->file:I

    check-cast p1, Lcom/brashmonkey/spriter/FileReference;

    iget v2, p1, Lcom/brashmonkey/spriter/FileReference;->file:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget p1, p1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hasFile()Z
    .locals 2

    .line 39
    iget v0, p0, Lcom/brashmonkey/spriter/FileReference;->file:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasFolder()Z
    .locals 2

    .line 43
    iget v0, p0, Lcom/brashmonkey/spriter/FileReference;->folder:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 19
    iget v0, p0, Lcom/brashmonkey/spriter/FileReference;->folder:I

    mul-int/lit16 v0, v0, 0x2710

    iget v1, p0, Lcom/brashmonkey/spriter/FileReference;->file:I

    add-int/2addr v0, v1

    return v0
.end method

.method public set(II)V
    .locals 0

    .line 30
    iput p1, p0, Lcom/brashmonkey/spriter/FileReference;->folder:I

    .line 31
    iput p2, p0, Lcom/brashmonkey/spriter/FileReference;->file:I

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/FileReference;)V
    .locals 1

    .line 35
    iget v0, p1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget p1, p1, Lcom/brashmonkey/spriter/FileReference;->file:I

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/FileReference;->set(II)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[folder: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/FileReference;->folder:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", file: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/FileReference;->file:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
