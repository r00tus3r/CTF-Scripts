.class Lcom/uwsoft/editor/renderer/data/ProjectInfoVO$1;
.super Ljava/lang/Object;
.source "ProjectInfoVO.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->addNewMesh(Lcom/uwsoft/editor/renderer/data/MeshVO;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;


# direct methods
.method constructor <init>(Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO$1;->this$0:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 41
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO$1;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 44
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result p1

    return p1
.end method
