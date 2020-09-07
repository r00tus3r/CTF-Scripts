.class public Lcom/brashmonkey/spriter/Timeline$Key;
.super Ljava/lang/Object;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Timeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Key"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Timeline$Key$Object;,
        Lcom/brashmonkey/spriter/Timeline$Key$Bone;
    }
.end annotation


# instance fields
.field public active:Z

.field public final curve:Lcom/brashmonkey/spriter/Curve;

.field public final id:I

.field private object:Lcom/brashmonkey/spriter/Timeline$Key$Object;

.field public final spin:I

.field public time:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 78
    invoke-direct {p0, p1, v0}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    const/4 v0, 0x1

    .line 74
    invoke-direct {p0, p1, p2, v0}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(III)V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    .line 70
    new-instance p3, Lcom/brashmonkey/spriter/Curve;

    invoke-direct {p3}, Lcom/brashmonkey/spriter/Curve;-><init>()V

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(IIILcom/brashmonkey/spriter/Curve;)V

    return-void
.end method

.method public constructor <init>(IIILcom/brashmonkey/spriter/Curve;)V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput p1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->id:I

    .line 64
    iput p2, p0, Lcom/brashmonkey/spriter/Timeline$Key;->time:I

    .line 65
    iput p3, p0, Lcom/brashmonkey/spriter/Timeline$Key;->spin:I

    .line 66
    iput-object p4, p0, Lcom/brashmonkey/spriter/Timeline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    return-void
.end method


# virtual methods
.method public object()Lcom/brashmonkey/spriter/Timeline$Key$Object;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline$Key;->object:Lcom/brashmonkey/spriter/Timeline$Key$Object;

    return-object v0
.end method

.method public setObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 83
    iput-object p1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->object:Lcom/brashmonkey/spriter/Timeline$Key$Object;

    return-void

    .line 82
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "object can not be null!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", time: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->time:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", spin: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->spin:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\ncurve: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\nobject:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key;->object:Lcom/brashmonkey/spriter/Timeline$Key$Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
