.class public Lcom/brashmonkey/spriter/Entity$CharacterMap;
.super Ljava/util/HashMap;
.source "Entity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Entity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CharacterMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Lcom/brashmonkey/spriter/FileReference;",
        "Lcom/brashmonkey/spriter/FileReference;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x54234f0f3860f7abL


# instance fields
.field public final id:I

.field public final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 210
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 211
    iput p1, p0, Lcom/brashmonkey/spriter/Entity$CharacterMap;->id:I

    .line 212
    iput-object p2, p0, Lcom/brashmonkey/spriter/Entity$CharacterMap;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public get(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/FileReference;
    .locals 1

    .line 221
    invoke-super {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    .line 222
    :cond_0
    invoke-super {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/FileReference;

    return-object p1
.end method
