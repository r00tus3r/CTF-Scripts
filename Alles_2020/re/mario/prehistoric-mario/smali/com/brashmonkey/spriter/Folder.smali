.class public Lcom/brashmonkey/spriter/Folder;
.super Ljava/lang/Object;
.source "Folder.java"


# instance fields
.field private filePointer:I

.field final files:[Lcom/brashmonkey/spriter/File;

.field public final id:I

.field public final name:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;I)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/brashmonkey/spriter/Folder;->filePointer:I

    .line 19
    iput p1, p0, Lcom/brashmonkey/spriter/Folder;->id:I

    .line 20
    iput-object p2, p0, Lcom/brashmonkey/spriter/Folder;->name:Ljava/lang/String;

    .line 21
    new-array p1, p3, [Lcom/brashmonkey/spriter/File;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Folder;->files:[Lcom/brashmonkey/spriter/File;

    return-void
.end method


# virtual methods
.method addFile(Lcom/brashmonkey/spriter/File;)V
    .locals 3

    .line 29
    iget-object v0, p0, Lcom/brashmonkey/spriter/Folder;->files:[Lcom/brashmonkey/spriter/File;

    iget v1, p0, Lcom/brashmonkey/spriter/Folder;->filePointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Folder;->filePointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public getFile(I)Lcom/brashmonkey/spriter/File;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/brashmonkey/spriter/Folder;->files:[Lcom/brashmonkey/spriter/File;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getFile(Ljava/lang/String;)Lcom/brashmonkey/spriter/File;
    .locals 0

    .line 47
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Folder;->getFileIndex(Ljava/lang/String;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 48
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Folder;->getFile(I)Lcom/brashmonkey/spriter/File;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getFileIndex(Ljava/lang/String;)I
    .locals 5

    .line 58
    iget-object v0, p0, Lcom/brashmonkey/spriter/Folder;->files:[Lcom/brashmonkey/spriter/File;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 59
    iget-object v4, v3, Lcom/brashmonkey/spriter/File;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget p1, v3, Lcom/brashmonkey/spriter/File;->id:I

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Folder;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Folder;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/brashmonkey/spriter/Folder;->files:[Lcom/brashmonkey/spriter/File;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 66
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

    .line 67
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
