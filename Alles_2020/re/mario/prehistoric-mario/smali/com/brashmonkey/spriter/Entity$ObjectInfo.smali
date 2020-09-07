.class public Lcom/brashmonkey/spriter/Entity$ObjectInfo;
.super Ljava/lang/Object;
.source "Entity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Entity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectInfo"
.end annotation


# instance fields
.field public final frames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/FileReference;",
            ">;"
        }
    .end annotation
.end field

.field public final name:Ljava/lang/String;

.field public final size:Lcom/brashmonkey/spriter/Dimension;

.field public final type:Lcom/brashmonkey/spriter/Entity$ObjectType;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Lcom/brashmonkey/spriter/Dimension;)V
    .locals 1

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/brashmonkey/spriter/Entity$ObjectInfo;-><init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Lcom/brashmonkey/spriter/Dimension;Ljava/util/List;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Lcom/brashmonkey/spriter/Dimension;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/brashmonkey/spriter/Entity$ObjectType;",
            "Lcom/brashmonkey/spriter/Dimension;",
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/FileReference;",
            ">;)V"
        }
    .end annotation

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-object p2, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->type:Lcom/brashmonkey/spriter/Entity$ObjectType;

    .line 179
    iput-object p4, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->frames:Ljava/util/List;

    .line 180
    iput-object p1, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->name:Ljava/lang/String;

    .line 181
    iput-object p3, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/brashmonkey/spriter/Entity$ObjectType;",
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/FileReference;",
            ">;)V"
        }
    .end annotation

    .line 189
    new-instance v0, Lcom/brashmonkey/spriter/Dimension;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/brashmonkey/spriter/Dimension;-><init>(FF)V

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/brashmonkey/spriter/Entity$ObjectInfo;-><init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Lcom/brashmonkey/spriter/Dimension;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->type:Lcom/brashmonkey/spriter/Entity$ObjectType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "|frames:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->frames:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
