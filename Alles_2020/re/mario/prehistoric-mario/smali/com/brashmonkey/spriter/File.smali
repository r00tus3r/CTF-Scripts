.class public Lcom/brashmonkey/spriter/File;
.super Ljava/lang/Object;
.source "File.java"


# instance fields
.field public final id:I

.field public final name:Ljava/lang/String;

.field public final pivot:Lcom/brashmonkey/spriter/Point;

.field public final size:Lcom/brashmonkey/spriter/Dimension;


# direct methods
.method constructor <init>(ILjava/lang/String;Lcom/brashmonkey/spriter/Dimension;Lcom/brashmonkey/spriter/Point;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/brashmonkey/spriter/File;->id:I

    .line 19
    iput-object p2, p0, Lcom/brashmonkey/spriter/File;->name:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    .line 21
    iput-object p4, p0, Lcom/brashmonkey/spriter/File;->pivot:Lcom/brashmonkey/spriter/Point;

    return-void
.end method


# virtual methods
.method public isSprite()Z
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/brashmonkey/spriter/File;->pivot:Lcom/brashmonkey/spriter/Point;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/File;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/File;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", pivot: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/File;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
