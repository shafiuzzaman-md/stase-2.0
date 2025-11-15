; ModuleID = './CharConverter.bc'
source_filename = "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/CharConverter/CharConverter.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-gnu"

%struct._EFI_SMM_SYSTEM_TABLE2 = type { %struct.EFI_TABLE_HEADER, i16*, i32, i64 (%struct._EFI_SMM_SYSTEM_TABLE2*, %struct.GUID*, i8*, i64)*, %struct._EFI_MM_CPU_IO_PROTOCOL, i64 (i32, i64, i8**)*, i64 (i8*)*, i64 (i32, i32, i64, i64*)*, i64 (i64, i64)*, i64 (void (i8*)*, i64, i8*)*, i64, i64, i64*, i8**, i64, %struct.EFI_CONFIGURATION_TABLE*, i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8*, %struct.GUID*, i8*)*, i64 (i8*, %struct.GUID*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (i32, %struct.GUID*, i8*, i64*, i8**)*, i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8*, i64*)*, i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)*, i64 (i8*)* }
%struct.EFI_TABLE_HEADER = type { i64, i32, i32, i32, i32 }
%struct.GUID = type { i32, i16, i16, [8 x i8] }
%struct._EFI_MM_CPU_IO_PROTOCOL = type { %struct.EFI_MM_IO_ACCESS, %struct.EFI_MM_IO_ACCESS }
%struct.EFI_MM_IO_ACCESS = type { i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)*, i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)* }
%struct.EFI_CONFIGURATION_TABLE = type { %struct.GUID, i8* }
%struct._NOTIFY_PROTOCOL_READY_PROTOCOL = type { i32 }
%struct.ICONV_T = type { i8*, i8* }
%struct._HEAP_MANAGER_PROTOCOL = type { i64 (i64, i64*)*, i64 (i64, %struct.CHUNK**)*, i64 (i64)*, i64 (...)*, i64 (...)*, i64 (...)*, i64 (i64, %struct.PAGE**)*, i64 (...)*, i64 (...)* }
%struct.CHUNK = type { %struct.CHUNK* }
%struct.PAGE = type { %struct.CHUNK* }
%struct.EFI_SYSTEM_TABLE = type { %struct.EFI_TABLE_HEADER, i16*, i32, i8*, %struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL*, i8*, %struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i8*, %struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, %struct.EFI_RUNTIME_SERVICES*, %struct.EFI_BOOT_SERVICES*, i64, %struct.EFI_CONFIGURATION_TABLE* }
%struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL = type { i64 (%struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL*, i8)*, i64 (%struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL*, %struct.EFI_INPUT_KEY*)*, i8* }
%struct.EFI_INPUT_KEY = type { i16, i16 }
%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL = type { i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i8)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i16*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i16*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64, i64*, i64*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64, i64)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i8)*, %struct.EFI_SIMPLE_TEXT_OUTPUT_MODE* }
%struct.EFI_SIMPLE_TEXT_OUTPUT_MODE = type { i32, i32, i32, i32, i32, i8 }
%struct.EFI_RUNTIME_SERVICES = type { %struct.EFI_TABLE_HEADER, i64 (%struct.EFI_TIME*, %struct.EFI_TIME_CAPABILITIES*)*, i64 (%struct.EFI_TIME*)*, i64 (i8*, i8*, %struct.EFI_TIME*)*, i64 (i8, %struct.EFI_TIME*)*, i64 (i64, i64, i32, %struct.EFI_MEMORY_DESCRIPTOR*)*, i64 (i64, i8**)*, i64 (i16*, %struct.GUID*, i32*, i64*, i8*)*, i64 (i64*, i16*, %struct.GUID*)*, i64 (i16*, %struct.GUID*, i32, i64, i8*)*, i64 (i32*)*, void (i32, i64, i64, i8*)*, i64 (%struct.EFI_CAPSULE_HEADER**, i64, i64)*, i64 (%struct.EFI_CAPSULE_HEADER**, i64, i64*, i32*)*, i64 (i32, i64*, i64*, i64*)* }
%struct.EFI_TIME = type { i16, i8, i8, i8, i8, i8, i8, i32, i16, i8, i8 }
%struct.EFI_TIME_CAPABILITIES = type { i32, i32, i8 }
%struct.EFI_MEMORY_DESCRIPTOR = type { i32, i64, i64, i64, i64 }
%struct.EFI_CAPSULE_HEADER = type { %struct.GUID, i32, i32, i32 }
%struct.EFI_BOOT_SERVICES = type { %struct.EFI_TABLE_HEADER, i64 (i64)*, void (i64)*, i64 (i32, i32, i64, i64*)*, i64 (i64, i64)*, i64 (i64*, %struct.EFI_MEMORY_DESCRIPTOR*, i64*, i64*, i32*)*, i64 (i32, i64, i8**)*, i64 (i8*)*, i64 (i32, i64, void (i8*, i8*)*, i8*, i8**)*, i64 (i8*, i32, i64)*, i64 (i64, i8**, i64*)*, i64 (i8*)*, i64 (i8*)*, i64 (i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8*, %struct.GUID*, i8*, i8*)*, i64 (i8*, %struct.GUID*, i8*)*, i64 (i8*, %struct.GUID*, i8**)*, i8*, i64 (%struct.GUID*, i8*, i8**)*, i64 (i32, %struct.GUID*, i8*, i64*, i8**)*, i64 (%struct.GUID*, %struct.EFI_DEVICE_PATH_PROTOCOL**, i8**)*, i64 (%struct.GUID*, i8*)*, i64 (i8, i8*, %struct.EFI_DEVICE_PATH_PROTOCOL*, i8*, i64, i8**)*, i64 (i8*, i64*, i16**)*, i64 (i8*, i64, i64, i16*)*, i64 (i8*)*, i64 (i8*, i64)*, i64 (i64*)*, i64 (i64)*, i64 (i64, i64, i64, i16*)*, i64 (i8*, i8**, %struct.EFI_DEVICE_PATH_PROTOCOL*, i8)*, i64 (i8*, i8*, i8*)*, i64 (i8*, %struct.GUID*, i8**, i8*, i8*, i32)*, i64 (i8*, %struct.GUID*, i8*, i8*)*, i64 (i8*, %struct.GUID*, %struct.EFI_OPEN_PROTOCOL_INFORMATION_ENTRY**, i64*)*, i64 (i8*, %struct.GUID***, i64*)*, i64 (i32, %struct.GUID*, i8*, i64*, i8***)*, i64 (%struct.GUID*, i8*, i8**)*, i64 (i8**, ...)*, i64 (i8*, ...)*, i64 (i8*, i64, i32*)*, void (i8*, i8*, i64)*, void (i8*, i64, i8)*, i64 (i32, i64, void (i8*, i8*)*, i8*, %struct.GUID*, i8**)* }
%struct.EFI_DEVICE_PATH_PROTOCOL = type { i8, i8, [2 x i8] }
%struct.EFI_OPEN_PROTOCOL_INFORMATION_ENTRY = type { i8*, i8*, i32, i32 }
%struct._CHAR_CONVERTER_PROTOCOL = type { i64 (i8*, i8*, %struct.ICONV_T**)*, i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* }

@.str = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"UTF-16\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"ISO-8859-1\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"IconvOpen Failed\0A\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"...input is too large,UINTN giving up\0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"...input is too large, giving up\0A\00", align 1
@gSmst = external global %struct._EFI_SMM_SYSTEM_TABLE2*, align 8
@gEfiCharConverterProtocolGuid = external global %struct.GUID, align 4
@mCharConverterReady = dso_local global %struct._NOTIFY_PROTOCOL_READY_PROTOCOL zeroinitializer, align 4, !dbg !0
@gEfiCharConverterReadyProtocolGuid = external global %struct.GUID, align 4

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @IconvOpen(i8* noundef %0, i8* noundef %1, %struct.ICONV_T** noundef %2) #0 !dbg !100 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.ICONV_T**, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !116, metadata !DIExpression()), !dbg !117
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !118, metadata !DIExpression()), !dbg !119
  store %struct.ICONV_T** %2, %struct.ICONV_T*** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.ICONV_T*** %7, metadata !120, metadata !DIExpression()), !dbg !121
  %8 = call i8* @AllocateZeroPool(i64 noundef 16) #3, !dbg !122
  %9 = bitcast i8* %8 to %struct.ICONV_T*, !dbg !122
  %10 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !122
  store %struct.ICONV_T* %9, %struct.ICONV_T** %10, align 8, !dbg !122
  %11 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !123
  %12 = load %struct.ICONV_T*, %struct.ICONV_T** %11, align 8, !dbg !123
  %13 = icmp eq %struct.ICONV_T* %12, null, !dbg !123
  br i1 %13, label %14, label %15, !dbg !123

14:                                               ; preds = %3
  store i64 -9223372036854775799, i64* %4, align 8, !dbg !124
  br label %70, !dbg !124

15:                                               ; preds = %3
  %16 = load i8*, i8** %6, align 8, !dbg !127
  %17 = call i64 @AsciiStrSize(i8* noundef %16) #3, !dbg !127
  %18 = call i8* @AllocateZeroPool(i64 noundef %17) #3, !dbg !127
  %19 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !127
  %20 = load %struct.ICONV_T*, %struct.ICONV_T** %19, align 8, !dbg !127
  %21 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %20, i32 0, i32 0, !dbg !127
  store i8* %18, i8** %21, align 8, !dbg !127
  %22 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !128
  %23 = load %struct.ICONV_T*, %struct.ICONV_T** %22, align 8, !dbg !128
  %24 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %23, i32 0, i32 0, !dbg !128
  %25 = load i8*, i8** %24, align 8, !dbg !128
  %26 = icmp eq i8* %25, null, !dbg !128
  br i1 %26, label %27, label %32, !dbg !128

27:                                               ; preds = %15
  %28 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !129
  %29 = load %struct.ICONV_T*, %struct.ICONV_T** %28, align 8, !dbg !129
  %30 = bitcast %struct.ICONV_T* %29 to i8*, !dbg !129
  call void @FreePool(i8* noundef %30) #3, !dbg !129
  %31 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !132
  store %struct.ICONV_T* null, %struct.ICONV_T** %31, align 8, !dbg !132
  store i64 -9223372036854775799, i64* %4, align 8, !dbg !133
  br label %70, !dbg !133

32:                                               ; preds = %15
  %33 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !134
  %34 = load %struct.ICONV_T*, %struct.ICONV_T** %33, align 8, !dbg !134
  %35 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %34, i32 0, i32 0, !dbg !134
  %36 = load i8*, i8** %35, align 8, !dbg !134
  %37 = load i8*, i8** %6, align 8, !dbg !134
  %38 = call i64 @AsciiStrSize(i8* noundef %37) #3, !dbg !134
  %39 = load i8*, i8** %6, align 8, !dbg !134
  %40 = call i64 @AsciiStrCpyS(i8* noundef %36, i64 noundef %38, i8* noundef %39) #3, !dbg !134
  %41 = load i8*, i8** %5, align 8, !dbg !135
  %42 = call i64 @AsciiStrSize(i8* noundef %41) #3, !dbg !135
  %43 = call i8* @AllocateZeroPool(i64 noundef %42) #3, !dbg !135
  %44 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !135
  %45 = load %struct.ICONV_T*, %struct.ICONV_T** %44, align 8, !dbg !135
  %46 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %45, i32 0, i32 1, !dbg !135
  store i8* %43, i8** %46, align 8, !dbg !135
  %47 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !136
  %48 = load %struct.ICONV_T*, %struct.ICONV_T** %47, align 8, !dbg !136
  %49 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %48, i32 0, i32 1, !dbg !136
  %50 = load i8*, i8** %49, align 8, !dbg !136
  %51 = icmp eq i8* %50, null, !dbg !136
  br i1 %51, label %52, label %61, !dbg !136

52:                                               ; preds = %32
  %53 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !137
  %54 = load %struct.ICONV_T*, %struct.ICONV_T** %53, align 8, !dbg !137
  %55 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %54, i32 0, i32 0, !dbg !137
  %56 = load i8*, i8** %55, align 8, !dbg !137
  call void @FreePool(i8* noundef %56) #3, !dbg !137
  %57 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !140
  %58 = load %struct.ICONV_T*, %struct.ICONV_T** %57, align 8, !dbg !140
  %59 = bitcast %struct.ICONV_T* %58 to i8*, !dbg !140
  call void @FreePool(i8* noundef %59) #3, !dbg !140
  %60 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !141
  store %struct.ICONV_T* null, %struct.ICONV_T** %60, align 8, !dbg !141
  store i64 -9223372036854775799, i64* %4, align 8, !dbg !142
  br label %70, !dbg !142

61:                                               ; preds = %32
  %62 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !143
  %63 = load %struct.ICONV_T*, %struct.ICONV_T** %62, align 8, !dbg !143
  %64 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %63, i32 0, i32 1, !dbg !143
  %65 = load i8*, i8** %64, align 8, !dbg !143
  %66 = load i8*, i8** %5, align 8, !dbg !143
  %67 = call i64 @AsciiStrSize(i8* noundef %66) #3, !dbg !143
  %68 = load i8*, i8** %5, align 8, !dbg !143
  %69 = call i64 @AsciiStrCpyS(i8* noundef %65, i64 noundef %67, i8* noundef %68) #3, !dbg !143
  store i64 0, i64* %4, align 8, !dbg !144
  br label %70, !dbg !144

70:                                               ; preds = %61, %52, %27, %14
  %71 = load i64, i64* %4, align 8, !dbg !145
  ret i64 %71, !dbg !145
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8* @AllocateZeroPool(i64 noundef) #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local i64 @AsciiStrSize(i8* noundef) #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local void @FreePool(i8* noundef) #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local i64 @AsciiStrCpyS(i8* noundef, i64 noundef, i8* noundef) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Iconv(%struct.ICONV_T* noundef %0, i8* noundef %1, i64 noundef %2, i8** noundef %3, i64* noundef %4) #0 !dbg !146 {
  %6 = alloca i64, align 8
  %7 = alloca %struct.ICONV_T*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i64*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i8, align 1
  %19 = alloca i8, align 1
  %20 = alloca i16, align 2
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  %23 = alloca i16, align 2
  store %struct.ICONV_T* %0, %struct.ICONV_T** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %7, metadata !151, metadata !DIExpression()), !dbg !152
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !153, metadata !DIExpression()), !dbg !154
  store i64 %2, i64* %9, align 8
  call void @llvm.dbg.declare(metadata i64* %9, metadata !155, metadata !DIExpression()), !dbg !156
  store i8** %3, i8*** %10, align 8
  call void @llvm.dbg.declare(metadata i8*** %10, metadata !157, metadata !DIExpression()), !dbg !158
  store i64* %4, i64** %11, align 8
  call void @llvm.dbg.declare(metadata i64** %11, metadata !159, metadata !DIExpression()), !dbg !160
  %24 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !161
  %25 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %24, i32 0, i32 0, !dbg !161
  %26 = load i8*, i8** %25, align 8, !dbg !161
  %27 = call i64 @AsciiStrCmp(i8* noundef %26, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #3, !dbg !161
  %28 = icmp eq i64 %27, 0, !dbg !161
  br i1 %28, label %29, label %67, !dbg !161

29:                                               ; preds = %5
  %30 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !161
  %31 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %30, i32 0, i32 1, !dbg !161
  %32 = load i8*, i8** %31, align 8, !dbg !161
  %33 = call i64 @AsciiStrCmp(i8* noundef %32, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !161
  %34 = icmp eq i64 %33, 0, !dbg !161
  br i1 %34, label %35, label %67, !dbg !161

35:                                               ; preds = %29
  %36 = load i8**, i8*** %10, align 8, !dbg !162
  %37 = load i8*, i8** %36, align 8, !dbg !162
  %38 = icmp eq i8* %37, null, !dbg !162
  br i1 %38, label %39, label %40, !dbg !162

39:                                               ; preds = %35
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !165
  br label %429, !dbg !165

40:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata i64* %12, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %12, align 8, !dbg !170
  br label %41, !dbg !170

41:                                               ; preds = %59, %40
  %42 = load i64, i64* %12, align 8, !dbg !170
  %43 = load i64, i64* %9, align 8, !dbg !170
  %44 = icmp ult i64 %42, %43, !dbg !170
  br i1 %44, label %45, label %62, !dbg !170

45:                                               ; preds = %41
  %46 = load i8*, i8** %8, align 8, !dbg !171
  %47 = load i64, i64* %12, align 8, !dbg !171
  %48 = getelementptr inbounds i8, i8* %46, i64 %47, !dbg !171
  %49 = load i8, i8* %48, align 1, !dbg !171
  %50 = zext i8 %49 to i16, !dbg !171
  %51 = trunc i16 %50 to i8, !dbg !171
  %52 = load i8**, i8*** %10, align 8, !dbg !171
  %53 = load i8*, i8** %52, align 8, !dbg !171
  %54 = load i64, i64* %12, align 8, !dbg !171
  %55 = getelementptr inbounds i8, i8* %53, i64 %54, !dbg !171
  store i8 %51, i8* %55, align 1, !dbg !171
  %56 = load i64*, i64** %11, align 8, !dbg !174
  %57 = load i64, i64* %56, align 8, !dbg !174
  %58 = add nsw i64 %57, -1, !dbg !174
  store i64 %58, i64* %56, align 8, !dbg !174
  br label %59, !dbg !175

59:                                               ; preds = %45
  %60 = load i64, i64* %12, align 8, !dbg !176
  %61 = add i64 %60, 1, !dbg !176
  store i64 %61, i64* %12, align 8, !dbg !176
  br label %41, !dbg !176, !llvm.loop !177

62:                                               ; preds = %41
  %63 = load i8**, i8*** %10, align 8, !dbg !180
  %64 = load i8*, i8** %63, align 8, !dbg !180
  %65 = load i64, i64* %9, align 8, !dbg !180
  %66 = getelementptr inbounds i8, i8* %64, i64 %65, !dbg !180
  store i8 0, i8* %66, align 1, !dbg !180
  store i64 0, i64* %6, align 8, !dbg !181
  br label %429, !dbg !181

67:                                               ; preds = %29, %5
  %68 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !182
  %69 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %68, i32 0, i32 0, !dbg !182
  %70 = load i8*, i8** %69, align 8, !dbg !182
  %71 = call i64 @AsciiStrCmp(i8* noundef %70, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !182
  %72 = icmp eq i64 %71, 0, !dbg !182
  br i1 %72, label %73, label %127, !dbg !182

73:                                               ; preds = %67
  %74 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !182
  %75 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %74, i32 0, i32 1, !dbg !182
  %76 = load i8*, i8** %75, align 8, !dbg !182
  %77 = call i64 @AsciiStrCmp(i8* noundef %76, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #3, !dbg !182
  %78 = icmp eq i64 %77, 0, !dbg !182
  br i1 %78, label %79, label %127, !dbg !182

79:                                               ; preds = %73
  %80 = load i8**, i8*** %10, align 8, !dbg !183
  %81 = load i8*, i8** %80, align 8, !dbg !183
  %82 = icmp eq i8* %81, null, !dbg !183
  br i1 %82, label %83, label %84, !dbg !183

83:                                               ; preds = %79
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !186
  br label %429, !dbg !186

84:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata i64* %13, metadata !189, metadata !DIExpression()), !dbg !191
  store i64 0, i64* %13, align 8, !dbg !191
  br label %85, !dbg !191

85:                                               ; preds = %118, %84
  %86 = load i64, i64* %13, align 8, !dbg !191
  %87 = load i64, i64* %9, align 8, !dbg !191
  %88 = sdiv i64 %87, 2, !dbg !191
  %89 = icmp ult i64 %86, %88, !dbg !191
  br i1 %89, label %90, label %121, !dbg !191

90:                                               ; preds = %85
  call void @llvm.dbg.declare(metadata i16** %14, metadata !192, metadata !DIExpression()), !dbg !195
  %91 = load i8*, i8** %8, align 8, !dbg !195
  %92 = bitcast i8* %91 to i16*, !dbg !195
  store i16* %92, i16** %14, align 8, !dbg !195
  %93 = load i16*, i16** %14, align 8, !dbg !196
  %94 = load i64, i64* %13, align 8, !dbg !196
  %95 = getelementptr inbounds i16, i16* %93, i64 %94, !dbg !196
  %96 = load i16, i16* %95, align 2, !dbg !196
  %97 = zext i16 %96 to i32, !dbg !196
  %98 = icmp sle i32 %97, 127, !dbg !196
  br i1 %98, label %99, label %109, !dbg !196

99:                                               ; preds = %90
  %100 = load i16*, i16** %14, align 8, !dbg !197
  %101 = load i64, i64* %13, align 8, !dbg !197
  %102 = getelementptr inbounds i16, i16* %100, i64 %101, !dbg !197
  %103 = load i16, i16* %102, align 2, !dbg !197
  %104 = trunc i16 %103 to i8, !dbg !197
  %105 = load i8**, i8*** %10, align 8, !dbg !197
  %106 = load i8*, i8** %105, align 8, !dbg !197
  %107 = load i64, i64* %13, align 8, !dbg !197
  %108 = getelementptr inbounds i8, i8* %106, i64 %107, !dbg !197
  store i8 %104, i8* %108, align 1, !dbg !197
  br label %114, !dbg !200

109:                                              ; preds = %90
  %110 = load i8**, i8*** %10, align 8, !dbg !201
  %111 = load i8*, i8** %110, align 8, !dbg !201
  %112 = load i64, i64* %13, align 8, !dbg !201
  %113 = getelementptr inbounds i8, i8* %111, i64 %112, !dbg !201
  store i8 63, i8* %113, align 1, !dbg !201
  br label %114, !dbg !203

114:                                              ; preds = %109, %99
  %115 = load i64*, i64** %11, align 8, !dbg !204
  %116 = load i64, i64* %115, align 8, !dbg !204
  %117 = add nsw i64 %116, -1, !dbg !204
  store i64 %117, i64* %115, align 8, !dbg !204
  br label %118, !dbg !205

118:                                              ; preds = %114
  %119 = load i64, i64* %13, align 8, !dbg !206
  %120 = add i64 %119, 1, !dbg !206
  store i64 %120, i64* %13, align 8, !dbg !206
  br label %85, !dbg !206, !llvm.loop !207

121:                                              ; preds = %85
  %122 = load i8**, i8*** %10, align 8, !dbg !209
  %123 = load i8*, i8** %122, align 8, !dbg !209
  %124 = load i64, i64* %9, align 8, !dbg !209
  %125 = sdiv i64 %124, 2, !dbg !209
  %126 = getelementptr inbounds i8, i8* %123, i64 %125, !dbg !209
  store i8 0, i8* %126, align 1, !dbg !209
  store i64 0, i64* %6, align 8, !dbg !210
  br label %429, !dbg !210

127:                                              ; preds = %73, %67
  %128 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !211
  %129 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %128, i32 0, i32 0, !dbg !211
  %130 = load i8*, i8** %129, align 8, !dbg !211
  %131 = call i64 @AsciiStrCmp(i8* noundef %130, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !211
  %132 = icmp eq i64 %131, 0, !dbg !211
  br i1 %132, label %133, label %224, !dbg !211

133:                                              ; preds = %127
  %134 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !211
  %135 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %134, i32 0, i32 1, !dbg !211
  %136 = load i8*, i8** %135, align 8, !dbg !211
  %137 = call i64 @AsciiStrCmp(i8* noundef %136, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !211
  %138 = icmp eq i64 %137, 0, !dbg !211
  br i1 %138, label %139, label %224, !dbg !211

139:                                              ; preds = %133
  %140 = load i8**, i8*** %10, align 8, !dbg !212
  %141 = load i8*, i8** %140, align 8, !dbg !212
  %142 = icmp eq i8* %141, null, !dbg !212
  br i1 %142, label %143, label %144, !dbg !212

143:                                              ; preds = %139
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !215
  br label %429, !dbg !215

144:                                              ; preds = %139
  call void @llvm.dbg.declare(metadata i64* %15, metadata !218, metadata !DIExpression()), !dbg !220
  store i64 0, i64* %15, align 8, !dbg !220
  br label %145, !dbg !220

145:                                              ; preds = %212, %144
  %146 = load i64, i64* %15, align 8, !dbg !220
  %147 = load i64, i64* %9, align 8, !dbg !220
  %148 = icmp ult i64 %146, %147, !dbg !220
  br i1 %148, label %149, label %215, !dbg !220

149:                                              ; preds = %145
  %150 = load i64*, i64** %11, align 8, !dbg !221
  %151 = load i64, i64* %150, align 8, !dbg !221
  %152 = add nsw i64 %151, -1, !dbg !221
  store i64 %152, i64* %150, align 8, !dbg !221
  %153 = load i8*, i8** %8, align 8, !dbg !224
  %154 = load i64, i64* %15, align 8, !dbg !224
  %155 = getelementptr inbounds i8, i8* %153, i64 %154, !dbg !224
  %156 = load i8, i8* %155, align 1, !dbg !224
  %157 = zext i8 %156 to i32, !dbg !224
  %158 = and i32 %157, 128, !dbg !224
  %159 = icmp eq i32 %158, 0, !dbg !224
  br i1 %159, label %160, label %171, !dbg !224

160:                                              ; preds = %149
  %161 = load i8*, i8** %8, align 8, !dbg !225
  %162 = load i64, i64* %15, align 8, !dbg !225
  %163 = getelementptr inbounds i8, i8* %161, i64 %162, !dbg !225
  %164 = load i8, i8* %163, align 1, !dbg !225
  %165 = zext i8 %164 to i16, !dbg !225
  %166 = trunc i16 %165 to i8, !dbg !225
  %167 = load i8**, i8*** %10, align 8, !dbg !225
  %168 = load i8*, i8** %167, align 8, !dbg !225
  %169 = load i64, i64* %15, align 8, !dbg !225
  %170 = getelementptr inbounds i8, i8* %168, i64 %169, !dbg !225
  store i8 %166, i8* %170, align 1, !dbg !225
  br label %211, !dbg !228

171:                                              ; preds = %149
  %172 = load i64, i64* %15, align 8, !dbg !229
  %173 = add i64 %172, 4, !dbg !229
  %174 = load i64, i64* %9, align 8, !dbg !229
  %175 = icmp ugt i64 %173, %174, !dbg !229
  br i1 %175, label %176, label %205, !dbg !229

176:                                              ; preds = %171
  %177 = load i8**, i8*** %10, align 8, !dbg !231
  %178 = load i8*, i8** %177, align 8, !dbg !231
  %179 = load i64, i64* %15, align 8, !dbg !231
  %180 = add i64 %179, 1, !dbg !231
  store i64 %180, i64* %15, align 8, !dbg !231
  %181 = getelementptr inbounds i8, i8* %178, i64 %179, !dbg !231
  store i8 27, i8* %181, align 1, !dbg !231
  %182 = load i64*, i64** %11, align 8, !dbg !234
  %183 = load i64, i64* %182, align 8, !dbg !234
  %184 = add nsw i64 %183, -1, !dbg !234
  store i64 %184, i64* %182, align 8, !dbg !234
  %185 = load i8**, i8*** %10, align 8, !dbg !235
  %186 = load i8*, i8** %185, align 8, !dbg !235
  %187 = load i64, i64* %15, align 8, !dbg !235
  %188 = add i64 %187, 1, !dbg !235
  store i64 %188, i64* %15, align 8, !dbg !235
  %189 = getelementptr inbounds i8, i8* %186, i64 %187, !dbg !235
  store i8 36, i8* %189, align 1, !dbg !235
  %190 = load i64*, i64** %11, align 8, !dbg !236
  %191 = load i64, i64* %190, align 8, !dbg !236
  %192 = add nsw i64 %191, -1, !dbg !236
  store i64 %192, i64* %190, align 8, !dbg !236
  %193 = load i8**, i8*** %10, align 8, !dbg !237
  %194 = load i8*, i8** %193, align 8, !dbg !237
  %195 = load i64, i64* %15, align 8, !dbg !237
  %196 = add i64 %195, 1, !dbg !237
  store i64 %196, i64* %15, align 8, !dbg !237
  %197 = getelementptr inbounds i8, i8* %194, i64 %195, !dbg !237
  store i8 42, i8* %197, align 1, !dbg !237
  %198 = load i64*, i64** %11, align 8, !dbg !238
  %199 = load i64, i64* %198, align 8, !dbg !238
  %200 = add nsw i64 %199, -1, !dbg !238
  store i64 %200, i64* %198, align 8, !dbg !238
  %201 = load i8**, i8*** %10, align 8, !dbg !239
  %202 = load i8*, i8** %201, align 8, !dbg !239
  %203 = load i64, i64* %15, align 8, !dbg !239
  %204 = getelementptr inbounds i8, i8* %202, i64 %203, !dbg !239
  store i8 72, i8* %204, align 1, !dbg !239
  br label %215, !dbg !240

205:                                              ; preds = %171
  %206 = load i8**, i8*** %10, align 8, !dbg !241
  %207 = load i8*, i8** %206, align 8, !dbg !241
  %208 = load i64, i64* %15, align 8, !dbg !241
  %209 = getelementptr inbounds i8, i8* %207, i64 %208, !dbg !241
  store i8 -3, i8* %209, align 1, !dbg !241
  br label %210, !dbg !243

210:                                              ; preds = %205
  br label %211, !dbg !244

211:                                              ; preds = %210, %160
  br label %212, !dbg !245

212:                                              ; preds = %211
  %213 = load i64, i64* %15, align 8, !dbg !246
  %214 = add i64 %213, 1, !dbg !246
  store i64 %214, i64* %15, align 8, !dbg !246
  br label %145, !dbg !246, !llvm.loop !247

215:                                              ; preds = %176, %145
  %216 = load i8**, i8*** %10, align 8, !dbg !249
  %217 = load i8*, i8** %216, align 8, !dbg !249
  %218 = load i64, i64* %9, align 8, !dbg !249
  %219 = add nsw i64 %218, 3, !dbg !249
  %220 = getelementptr inbounds i8, i8* %217, i64 %219, !dbg !249
  store i8 0, i8* %220, align 1, !dbg !249
  %221 = load i64*, i64** %11, align 8, !dbg !250
  %222 = load i64, i64* %221, align 8, !dbg !250
  %223 = sub nsw i64 %222, 4, !dbg !250
  store i64 %223, i64* %221, align 8, !dbg !250
  store i64 0, i64* %6, align 8, !dbg !251
  br label %429, !dbg !251

224:                                              ; preds = %133, %127
  %225 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !252
  %226 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %225, i32 0, i32 0, !dbg !252
  %227 = load i8*, i8** %226, align 8, !dbg !252
  %228 = call i64 @AsciiStrCmp(i8* noundef %227, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #3, !dbg !252
  %229 = icmp eq i64 %228, 0, !dbg !252
  br i1 %229, label %230, label %425, !dbg !252

230:                                              ; preds = %224
  %231 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !252
  %232 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %231, i32 0, i32 1, !dbg !252
  %233 = load i8*, i8** %232, align 8, !dbg !252
  %234 = call i64 @AsciiStrCmp(i8* noundef %233, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !252
  %235 = icmp eq i64 %234, 0, !dbg !252
  br i1 %235, label %236, label %425, !dbg !252

236:                                              ; preds = %230
  %237 = load i8**, i8*** %10, align 8, !dbg !253
  %238 = load i8*, i8** %237, align 8, !dbg !253
  %239 = icmp eq i8* %238, null, !dbg !253
  br i1 %239, label %240, label %241, !dbg !253

240:                                              ; preds = %236
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !256
  br label %429, !dbg !256

241:                                              ; preds = %236
  call void @llvm.dbg.declare(metadata i64* %16, metadata !259, metadata !DIExpression()), !dbg !260
  store i64 0, i64* %16, align 8, !dbg !260
  call void @llvm.dbg.declare(metadata i64* %17, metadata !261, metadata !DIExpression()), !dbg !263
  store i64 0, i64* %17, align 8, !dbg !263
  br label %242, !dbg !263

242:                                              ; preds = %418, %241
  %243 = load i64, i64* %17, align 8, !dbg !263
  %244 = load i64, i64* %9, align 8, !dbg !263
  %245 = icmp ult i64 %243, %244, !dbg !263
  br i1 %245, label %246, label %419, !dbg !263

246:                                              ; preds = %242
  call void @llvm.dbg.declare(metadata i8* %18, metadata !264, metadata !DIExpression()), !dbg !268
  %247 = load i8*, i8** %8, align 8, !dbg !268
  %248 = load i64, i64* %17, align 8, !dbg !268
  %249 = getelementptr inbounds i8, i8* %247, i64 %248, !dbg !268
  %250 = load i8, i8* %249, align 1, !dbg !268
  store i8 %250, i8* %18, align 1, !dbg !268
  %251 = load i8, i8* %18, align 1, !dbg !269
  %252 = zext i8 %251 to i32, !dbg !269
  %253 = icmp sle i32 %252, 127, !dbg !269
  br i1 %253, label %254, label %263, !dbg !269

254:                                              ; preds = %246
  %255 = load i8, i8* %18, align 1, !dbg !270
  %256 = load i8**, i8*** %10, align 8, !dbg !270
  %257 = load i8*, i8** %256, align 8, !dbg !270
  %258 = load i64, i64* %16, align 8, !dbg !270
  %259 = add i64 %258, 1, !dbg !270
  store i64 %259, i64* %16, align 8, !dbg !270
  %260 = getelementptr inbounds i8, i8* %257, i64 %258, !dbg !270
  store i8 %255, i8* %260, align 1, !dbg !270
  %261 = load i64, i64* %17, align 8, !dbg !273
  %262 = add i64 %261, 1, !dbg !273
  store i64 %262, i64* %17, align 8, !dbg !273
  br label %418, !dbg !274

263:                                              ; preds = %246
  %264 = load i8, i8* %18, align 1, !dbg !275
  %265 = zext i8 %264 to i32, !dbg !275
  %266 = and i32 %265, 224, !dbg !275
  %267 = icmp eq i32 %266, 192, !dbg !275
  br i1 %267, label %268, label %338, !dbg !275

268:                                              ; preds = %263
  %269 = load i64, i64* %17, align 8, !dbg !275
  %270 = add i64 %269, 1, !dbg !275
  %271 = load i64, i64* %9, align 8, !dbg !275
  %272 = icmp ult i64 %270, %271, !dbg !275
  br i1 %272, label %273, label %338, !dbg !275

273:                                              ; preds = %268
  call void @llvm.dbg.declare(metadata i8* %19, metadata !276, metadata !DIExpression()), !dbg !279
  %274 = load i8*, i8** %8, align 8, !dbg !279
  %275 = load i64, i64* %17, align 8, !dbg !279
  %276 = add i64 %275, 1, !dbg !279
  %277 = getelementptr inbounds i8, i8* %274, i64 %276, !dbg !279
  %278 = load i8, i8* %277, align 1, !dbg !279
  store i8 %278, i8* %19, align 1, !dbg !279
  %279 = load i8, i8* %19, align 1, !dbg !280
  %280 = zext i8 %279 to i32, !dbg !280
  %281 = and i32 %280, 192, !dbg !280
  %282 = icmp eq i32 %281, 128, !dbg !280
  br i1 %282, label %283, label %328, !dbg !280

283:                                              ; preds = %273
  call void @llvm.dbg.declare(metadata i16* %20, metadata !281, metadata !DIExpression()), !dbg !285
  %284 = load i8, i8* %18, align 1, !dbg !285
  %285 = zext i8 %284 to i32, !dbg !285
  %286 = and i32 %285, 31, !dbg !285
  %287 = shl i32 %286, 6, !dbg !285
  %288 = load i8, i8* %19, align 1, !dbg !285
  %289 = zext i8 %288 to i32, !dbg !285
  %290 = and i32 %289, 63, !dbg !285
  %291 = or i32 %287, %290, !dbg !285
  %292 = trunc i32 %291 to i16, !dbg !285
  store i16 %292, i16* %20, align 2, !dbg !285
  %293 = load i16, i16* %20, align 2, !dbg !286
  %294 = zext i16 %293 to i32, !dbg !286
  %295 = icmp sle i32 %294, 255, !dbg !286
  br i1 %295, label %296, label %304, !dbg !286

296:                                              ; preds = %283
  %297 = load i16, i16* %20, align 2, !dbg !287
  %298 = trunc i16 %297 to i8, !dbg !287
  %299 = load i8**, i8*** %10, align 8, !dbg !287
  %300 = load i8*, i8** %299, align 8, !dbg !287
  %301 = load i64, i64* %16, align 8, !dbg !287
  %302 = add i64 %301, 1, !dbg !287
  store i64 %302, i64* %16, align 8, !dbg !287
  %303 = getelementptr inbounds i8, i8* %300, i64 %301, !dbg !287
  store i8 %298, i8* %303, align 1, !dbg !287
  br label %325, !dbg !290

304:                                              ; preds = %283
  %305 = load i8**, i8*** %10, align 8, !dbg !291
  %306 = load i8*, i8** %305, align 8, !dbg !291
  %307 = load i64, i64* %16, align 8, !dbg !291
  %308 = add i64 %307, 1, !dbg !291
  store i64 %308, i64* %16, align 8, !dbg !291
  %309 = getelementptr inbounds i8, i8* %306, i64 %307, !dbg !291
  store i8 27, i8* %309, align 1, !dbg !291
  %310 = load i8**, i8*** %10, align 8, !dbg !293
  %311 = load i8*, i8** %310, align 8, !dbg !293
  %312 = load i64, i64* %16, align 8, !dbg !293
  %313 = add i64 %312, 1, !dbg !293
  store i64 %313, i64* %16, align 8, !dbg !293
  %314 = getelementptr inbounds i8, i8* %311, i64 %312, !dbg !293
  store i8 36, i8* %314, align 1, !dbg !293
  %315 = load i8**, i8*** %10, align 8, !dbg !294
  %316 = load i8*, i8** %315, align 8, !dbg !294
  %317 = load i64, i64* %16, align 8, !dbg !294
  %318 = add i64 %317, 1, !dbg !294
  store i64 %318, i64* %16, align 8, !dbg !294
  %319 = getelementptr inbounds i8, i8* %316, i64 %317, !dbg !294
  store i8 42, i8* %319, align 1, !dbg !294
  %320 = load i8**, i8*** %10, align 8, !dbg !295
  %321 = load i8*, i8** %320, align 8, !dbg !295
  %322 = load i64, i64* %16, align 8, !dbg !295
  %323 = add i64 %322, 1, !dbg !295
  store i64 %323, i64* %16, align 8, !dbg !295
  %324 = getelementptr inbounds i8, i8* %321, i64 %322, !dbg !295
  store i8 72, i8* %324, align 1, !dbg !295
  br label %419, !dbg !296

325:                                              ; preds = %296
  %326 = load i64, i64* %17, align 8, !dbg !297
  %327 = add i64 %326, 2, !dbg !297
  store i64 %327, i64* %17, align 8, !dbg !297
  br label %337, !dbg !298

328:                                              ; preds = %273
  %329 = load i8, i8* %18, align 1, !dbg !299
  %330 = load i8**, i8*** %10, align 8, !dbg !299
  %331 = load i8*, i8** %330, align 8, !dbg !299
  %332 = load i64, i64* %16, align 8, !dbg !299
  %333 = add i64 %332, 1, !dbg !299
  store i64 %333, i64* %16, align 8, !dbg !299
  %334 = getelementptr inbounds i8, i8* %331, i64 %332, !dbg !299
  store i8 %329, i8* %334, align 1, !dbg !299
  %335 = load i64, i64* %17, align 8, !dbg !301
  %336 = add i64 %335, 1, !dbg !301
  store i64 %336, i64* %17, align 8, !dbg !301
  br label %337, !dbg !302

337:                                              ; preds = %328, %325
  br label %417, !dbg !303

338:                                              ; preds = %268, %263
  %339 = load i8, i8* %18, align 1, !dbg !304
  %340 = zext i8 %339 to i32, !dbg !304
  %341 = and i32 %340, 240, !dbg !304
  %342 = icmp eq i32 %341, 224, !dbg !304
  br i1 %342, label %343, label %407, !dbg !304

343:                                              ; preds = %338
  %344 = load i64, i64* %17, align 8, !dbg !304
  %345 = add i64 %344, 2, !dbg !304
  %346 = load i64, i64* %9, align 8, !dbg !304
  %347 = icmp ult i64 %345, %346, !dbg !304
  br i1 %347, label %348, label %407, !dbg !304

348:                                              ; preds = %343
  call void @llvm.dbg.declare(metadata i8* %21, metadata !305, metadata !DIExpression()), !dbg !308
  %349 = load i8*, i8** %8, align 8, !dbg !308
  %350 = load i64, i64* %17, align 8, !dbg !308
  %351 = add i64 %350, 1, !dbg !308
  %352 = getelementptr inbounds i8, i8* %349, i64 %351, !dbg !308
  %353 = load i8, i8* %352, align 1, !dbg !308
  store i8 %353, i8* %21, align 1, !dbg !308
  call void @llvm.dbg.declare(metadata i8* %22, metadata !309, metadata !DIExpression()), !dbg !310
  %354 = load i8*, i8** %8, align 8, !dbg !310
  %355 = load i64, i64* %17, align 8, !dbg !310
  %356 = add i64 %355, 2, !dbg !310
  %357 = getelementptr inbounds i8, i8* %354, i64 %356, !dbg !310
  %358 = load i8, i8* %357, align 1, !dbg !310
  store i8 %358, i8* %22, align 1, !dbg !310
  %359 = load i8, i8* %21, align 1, !dbg !311
  %360 = zext i8 %359 to i32, !dbg !311
  %361 = and i32 %360, 192, !dbg !311
  %362 = icmp eq i32 %361, 128, !dbg !311
  br i1 %362, label %363, label %397, !dbg !311

363:                                              ; preds = %348
  %364 = load i8, i8* %22, align 1, !dbg !311
  %365 = zext i8 %364 to i32, !dbg !311
  %366 = and i32 %365, 192, !dbg !311
  %367 = icmp eq i32 %366, 128, !dbg !311
  br i1 %367, label %368, label %397, !dbg !311

368:                                              ; preds = %363
  call void @llvm.dbg.declare(metadata i16* %23, metadata !312, metadata !DIExpression()), !dbg !315
  %369 = load i8, i8* %18, align 1, !dbg !315
  %370 = zext i8 %369 to i32, !dbg !315
  %371 = and i32 %370, 15, !dbg !315
  %372 = shl i32 %371, 12, !dbg !315
  %373 = load i8, i8* %21, align 1, !dbg !315
  %374 = zext i8 %373 to i32, !dbg !315
  %375 = and i32 %374, 63, !dbg !315
  %376 = shl i32 %375, 6, !dbg !315
  %377 = or i32 %372, %376, !dbg !315
  %378 = load i8, i8* %22, align 1, !dbg !315
  %379 = zext i8 %378 to i32, !dbg !315
  %380 = and i32 %379, 63, !dbg !315
  %381 = or i32 %377, %380, !dbg !315
  %382 = trunc i32 %381 to i16, !dbg !315
  store i16 %382, i16* %23, align 2, !dbg !315
  %383 = load i16, i16* %23, align 2, !dbg !316
  %384 = zext i16 %383 to i32, !dbg !316
  %385 = icmp sle i32 %384, 255, !dbg !316
  br i1 %385, label %386, label %394, !dbg !316

386:                                              ; preds = %368
  %387 = load i16, i16* %23, align 2, !dbg !317
  %388 = trunc i16 %387 to i8, !dbg !317
  %389 = load i8**, i8*** %10, align 8, !dbg !317
  %390 = load i8*, i8** %389, align 8, !dbg !317
  %391 = load i64, i64* %16, align 8, !dbg !317
  %392 = add i64 %391, 1, !dbg !317
  store i64 %392, i64* %16, align 8, !dbg !317
  %393 = getelementptr inbounds i8, i8* %390, i64 %391, !dbg !317
  store i8 %388, i8* %393, align 1, !dbg !317
  br label %394, !dbg !320

394:                                              ; preds = %386, %368
  %395 = load i64, i64* %17, align 8, !dbg !321
  %396 = add i64 %395, 3, !dbg !321
  store i64 %396, i64* %17, align 8, !dbg !321
  br label %406, !dbg !322

397:                                              ; preds = %363, %348
  %398 = load i8, i8* %18, align 1, !dbg !323
  %399 = load i8**, i8*** %10, align 8, !dbg !323
  %400 = load i8*, i8** %399, align 8, !dbg !323
  %401 = load i64, i64* %16, align 8, !dbg !323
  %402 = add i64 %401, 1, !dbg !323
  store i64 %402, i64* %16, align 8, !dbg !323
  %403 = getelementptr inbounds i8, i8* %400, i64 %401, !dbg !323
  store i8 %398, i8* %403, align 1, !dbg !323
  %404 = load i64, i64* %17, align 8, !dbg !325
  %405 = add i64 %404, 1, !dbg !325
  store i64 %405, i64* %17, align 8, !dbg !325
  br label %406, !dbg !326

406:                                              ; preds = %397, %394
  br label %416, !dbg !327

407:                                              ; preds = %343, %338
  %408 = load i8, i8* %18, align 1, !dbg !328
  %409 = load i8**, i8*** %10, align 8, !dbg !328
  %410 = load i8*, i8** %409, align 8, !dbg !328
  %411 = load i64, i64* %16, align 8, !dbg !328
  %412 = add i64 %411, 1, !dbg !328
  store i64 %412, i64* %16, align 8, !dbg !328
  %413 = getelementptr inbounds i8, i8* %410, i64 %411, !dbg !328
  store i8 %408, i8* %413, align 1, !dbg !328
  %414 = load i64, i64* %17, align 8, !dbg !330
  %415 = add i64 %414, 1, !dbg !330
  store i64 %415, i64* %17, align 8, !dbg !330
  br label %416, !dbg !331

416:                                              ; preds = %407, %406
  br label %417, !dbg !332

417:                                              ; preds = %416, %337
  br label %418, !dbg !333

418:                                              ; preds = %417, %254
  br label %242, !dbg !334, !llvm.loop !335

419:                                              ; preds = %304, %242
  %420 = load i64*, i64** %11, align 8, !dbg !337
  %421 = load i64, i64* %420, align 8, !dbg !337
  %422 = load i64, i64* %16, align 8, !dbg !337
  %423 = sub i64 %421, %422, !dbg !337
  %424 = load i64*, i64** %11, align 8, !dbg !337
  store i64 %423, i64* %424, align 8, !dbg !337
  store i64 0, i64* %6, align 8, !dbg !338
  br label %429, !dbg !338

425:                                              ; preds = %230, %224
  br label %426, !dbg !339

426:                                              ; preds = %425
  br label %427, !dbg !340

427:                                              ; preds = %426
  br label %428, !dbg !341

428:                                              ; preds = %427
  store i64 -9223372036854775805, i64* %6, align 8, !dbg !342
  br label %429, !dbg !342

429:                                              ; preds = %428, %419, %240, %215, %143, %121, %83, %62, %39
  %430 = load i64, i64* %6, align 8, !dbg !343
  ret i64 %430, !dbg !343
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i64 @AsciiStrCmp(i8* noundef, i8* noundef) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @StandardConvert(i8* noundef %0, i64* noundef %1, %struct._HEAP_MANAGER_PROTOCOL* noundef %2) #0 !dbg !344 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca %struct._HEAP_MANAGER_PROTOCOL*, align 8
  %8 = alloca %struct.ICONV_T*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.CHUNK*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !397, metadata !DIExpression()), !dbg !398
  store i64* %1, i64** %6, align 8
  call void @llvm.dbg.declare(metadata i64** %6, metadata !399, metadata !DIExpression()), !dbg !400
  store %struct._HEAP_MANAGER_PROTOCOL* %2, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %7, metadata !401, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %8, metadata !403, metadata !DIExpression()), !dbg !404
  store %struct.ICONV_T* null, %struct.ICONV_T** %8, align 8, !dbg !404
  call void @llvm.dbg.declare(metadata i64* %9, metadata !405, metadata !DIExpression()), !dbg !406
  %14 = call i64 @IconvOpen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), %struct.ICONV_T** noundef %8) #3, !dbg !406
  store i64 %14, i64* %9, align 8, !dbg !406
  %15 = load i64, i64* %9, align 8, !dbg !407
  %16 = icmp slt i64 %15, 0, !dbg !407
  br i1 %16, label %17, label %31, !dbg !407

17:                                               ; preds = %3
  br label %18, !dbg !408

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !411
  %20 = icmp ne i8 %19, 0, !dbg !411
  br i1 %20, label %21, label %28, !dbg !411

21:                                               ; preds = %18
  br label %22, !dbg !413

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !416
  %24 = icmp ne i8 %23, 0, !dbg !416
  br i1 %24, label %25, label %26, !dbg !416

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !418
  br label %26, !dbg !418

26:                                               ; preds = %25, %22
  br label %27, !dbg !416

27:                                               ; preds = %26
  br label %28, !dbg !413

28:                                               ; preds = %27, %18
  br label %29, !dbg !411

29:                                               ; preds = %28
  %30 = load i64, i64* %9, align 8, !dbg !421
  store i64 %30, i64* %4, align 8, !dbg !421
  br label %92, !dbg !421

31:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %10, metadata !422, metadata !DIExpression()), !dbg !423
  store %struct.CHUNK* null, %struct.CHUNK** %10, align 8, !dbg !423
  %32 = load i64*, i64** %6, align 8, !dbg !424
  %33 = load i64, i64* %32, align 8, !dbg !424
  %34 = icmp sle i64 %33, 128, !dbg !424
  br i1 %34, label %35, label %40, !dbg !424

35:                                               ; preds = %31
  %36 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !425
  %37 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %36, i32 0, i32 1, !dbg !425
  %38 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %37, align 8, !dbg !425
  %39 = call i64 %38(i64 noundef 0, %struct.CHUNK** noundef %10) #3, !dbg !425
  br label %73, !dbg !428

40:                                               ; preds = %31
  %41 = load i64*, i64** %6, align 8, !dbg !429
  %42 = load i64, i64* %41, align 8, !dbg !429
  %43 = icmp sle i64 %42, 256, !dbg !429
  br i1 %43, label %44, label %49, !dbg !429

44:                                               ; preds = %40
  %45 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !430
  %46 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %45, i32 0, i32 1, !dbg !430
  %47 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %46, align 8, !dbg !430
  %48 = call i64 %47(i64 noundef 1, %struct.CHUNK** noundef %10) #3, !dbg !430
  br label %72, !dbg !433

49:                                               ; preds = %40
  %50 = load i64*, i64** %6, align 8, !dbg !434
  %51 = load i64, i64* %50, align 8, !dbg !434
  %52 = icmp sle i64 %51, 512, !dbg !434
  br i1 %52, label %53, label %58, !dbg !434

53:                                               ; preds = %49
  %54 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !435
  %55 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %54, i32 0, i32 1, !dbg !435
  %56 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %55, align 8, !dbg !435
  %57 = call i64 %56(i64 noundef 2, %struct.CHUNK** noundef %10) #3, !dbg !435
  br label %71, !dbg !438

58:                                               ; preds = %49
  br label %59, !dbg !439

59:                                               ; preds = %58
  %60 = call i8 @DebugPrintEnabled() #3, !dbg !441
  %61 = icmp ne i8 %60, 0, !dbg !441
  br i1 %61, label %62, label %69, !dbg !441

62:                                               ; preds = %59
  br label %63, !dbg !443

63:                                               ; preds = %62
  %64 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !446
  %65 = icmp ne i8 %64, 0, !dbg !446
  br i1 %65, label %66, label %67, !dbg !446

66:                                               ; preds = %63
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.4, i64 0, i64 0)) #3, !dbg !448
  br label %67, !dbg !448

67:                                               ; preds = %66, %63
  br label %68, !dbg !446

68:                                               ; preds = %67
  br label %69, !dbg !443

69:                                               ; preds = %68, %59
  br label %70, !dbg !441

70:                                               ; preds = %69
  store i64 -9223372036854775806, i64* %4, align 8, !dbg !451
  br label %92, !dbg !451

71:                                               ; preds = %53
  br label %72, !dbg !452

72:                                               ; preds = %71, %44
  br label %73, !dbg !453

73:                                               ; preds = %72, %35
  call void @llvm.dbg.declare(metadata i64* %11, metadata !454, metadata !DIExpression()), !dbg !455
  %74 = load i64*, i64** %6, align 8, !dbg !455
  %75 = load i64, i64* %74, align 8, !dbg !455
  store i64 %75, i64* %11, align 8, !dbg !455
  call void @llvm.dbg.declare(metadata i8** %12, metadata !456, metadata !DIExpression()), !dbg !457
  %76 = load i8*, i8** %5, align 8, !dbg !457
  store i8* %76, i8** %12, align 8, !dbg !457
  call void @llvm.dbg.declare(metadata i8** %13, metadata !458, metadata !DIExpression()), !dbg !459
  %77 = load %struct.CHUNK*, %struct.CHUNK** %10, align 8, !dbg !459
  %78 = bitcast %struct.CHUNK* %77 to i8*, !dbg !459
  store i8* %78, i8** %13, align 8, !dbg !459
  %79 = load %struct.ICONV_T*, %struct.ICONV_T** %8, align 8, !dbg !460
  %80 = load i8*, i8** %12, align 8, !dbg !460
  %81 = load i64*, i64** %6, align 8, !dbg !460
  %82 = load i64, i64* %81, align 8, !dbg !460
  %83 = call i64 @Iconv(%struct.ICONV_T* noundef %79, i8* noundef %80, i64 noundef %82, i8** noundef %13, i64* noundef %11) #3, !dbg !460
  store i64 %83, i64* %9, align 8, !dbg !460
  %84 = load i8*, i8** %13, align 8, !dbg !461
  store i8* %84, i8** %5, align 8, !dbg !461
  %85 = load i64, i64* %11, align 8, !dbg !462
  %86 = load i64*, i64** %6, align 8, !dbg !462
  store i64 %85, i64* %86, align 8, !dbg !462
  %87 = load i64, i64* %9, align 8, !dbg !463
  %88 = icmp slt i64 %87, 0, !dbg !463
  br i1 %88, label %89, label %90, !dbg !463

89:                                               ; preds = %73
  store i64 -9223372036854775787, i64* %4, align 8, !dbg !464
  br label %92, !dbg !464

90:                                               ; preds = %73
  %91 = load i64, i64* %9, align 8, !dbg !466
  store i64 %91, i64* %4, align 8, !dbg !466
  br label %92, !dbg !466

92:                                               ; preds = %90, %89, %70, %29
  %93 = load i64, i64* %4, align 8, !dbg !467
  ret i64 %93, !dbg !467
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintEnabled() #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintLevelEnabled(i64 noundef) #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local void @DebugPrint(i64 noundef, i8* noundef, ...) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Libxml2Convert(i8* noundef %0, i64* noundef %1, %struct._HEAP_MANAGER_PROTOCOL* noundef %2) #0 !dbg !468 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca %struct._HEAP_MANAGER_PROTOCOL*, align 8
  %8 = alloca %struct.ICONV_T*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.CHUNK*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !469, metadata !DIExpression()), !dbg !470
  store i64* %1, i64** %6, align 8
  call void @llvm.dbg.declare(metadata i64** %6, metadata !471, metadata !DIExpression()), !dbg !472
  store %struct._HEAP_MANAGER_PROTOCOL* %2, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %7, metadata !473, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %8, metadata !475, metadata !DIExpression()), !dbg !476
  store %struct.ICONV_T* null, %struct.ICONV_T** %8, align 8, !dbg !476
  call void @llvm.dbg.declare(metadata i64* %9, metadata !477, metadata !DIExpression()), !dbg !478
  %14 = call i64 @IconvOpen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), %struct.ICONV_T** noundef %8) #3, !dbg !478
  store i64 %14, i64* %9, align 8, !dbg !478
  %15 = load i64, i64* %9, align 8, !dbg !479
  %16 = icmp slt i64 %15, 0, !dbg !479
  br i1 %16, label %17, label %31, !dbg !479

17:                                               ; preds = %3
  br label %18, !dbg !480

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !483
  %20 = icmp ne i8 %19, 0, !dbg !483
  br i1 %20, label %21, label %28, !dbg !483

21:                                               ; preds = %18
  br label %22, !dbg !485

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !488
  %24 = icmp ne i8 %23, 0, !dbg !488
  br i1 %24, label %25, label %26, !dbg !488

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !490
  br label %26, !dbg !490

26:                                               ; preds = %25, %22
  br label %27, !dbg !488

27:                                               ; preds = %26
  br label %28, !dbg !485

28:                                               ; preds = %27, %18
  br label %29, !dbg !483

29:                                               ; preds = %28
  %30 = load i64, i64* %9, align 8, !dbg !493
  store i64 %30, i64* %4, align 8, !dbg !493
  br label %101, !dbg !493

31:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %10, metadata !494, metadata !DIExpression()), !dbg !495
  store %struct.CHUNK* null, %struct.CHUNK** %10, align 8, !dbg !495
  %32 = load i64*, i64** %6, align 8, !dbg !496
  %33 = load i64, i64* %32, align 8, !dbg !496
  %34 = mul nsw i64 %33, 2, !dbg !496
  %35 = icmp sle i64 %34, 128, !dbg !496
  br i1 %35, label %36, label %41, !dbg !496

36:                                               ; preds = %31
  %37 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !497
  %38 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %37, i32 0, i32 1, !dbg !497
  %39 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %38, align 8, !dbg !497
  %40 = call i64 %39(i64 noundef 0, %struct.CHUNK** noundef %10) #3, !dbg !497
  br label %76, !dbg !500

41:                                               ; preds = %31
  %42 = load i64*, i64** %6, align 8, !dbg !501
  %43 = load i64, i64* %42, align 8, !dbg !501
  %44 = mul nsw i64 %43, 2, !dbg !501
  %45 = icmp sle i64 %44, 256, !dbg !501
  br i1 %45, label %46, label %51, !dbg !501

46:                                               ; preds = %41
  %47 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !502
  %48 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %47, i32 0, i32 1, !dbg !502
  %49 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %48, align 8, !dbg !502
  %50 = call i64 %49(i64 noundef 1, %struct.CHUNK** noundef %10) #3, !dbg !502
  br label %75, !dbg !505

51:                                               ; preds = %41
  %52 = load i64*, i64** %6, align 8, !dbg !506
  %53 = load i64, i64* %52, align 8, !dbg !506
  %54 = mul nsw i64 %53, 2, !dbg !506
  %55 = icmp sle i64 %54, 512, !dbg !506
  br i1 %55, label %56, label %61, !dbg !506

56:                                               ; preds = %51
  %57 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !507
  %58 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %57, i32 0, i32 1, !dbg !507
  %59 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %58, align 8, !dbg !507
  %60 = call i64 %59(i64 noundef 2, %struct.CHUNK** noundef %10) #3, !dbg !507
  br label %74, !dbg !510

61:                                               ; preds = %51
  br label %62, !dbg !511

62:                                               ; preds = %61
  %63 = call i8 @DebugPrintEnabled() #3, !dbg !513
  %64 = icmp ne i8 %63, 0, !dbg !513
  br i1 %64, label %65, label %72, !dbg !513

65:                                               ; preds = %62
  br label %66, !dbg !515

66:                                               ; preds = %65
  %67 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !518
  %68 = icmp ne i8 %67, 0, !dbg !518
  br i1 %68, label %69, label %70, !dbg !518

69:                                               ; preds = %66
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0)) #3, !dbg !520
  br label %70, !dbg !520

70:                                               ; preds = %69, %66
  br label %71, !dbg !518

71:                                               ; preds = %70
  br label %72, !dbg !515

72:                                               ; preds = %71, %62
  br label %73, !dbg !513

73:                                               ; preds = %72
  store i64 -9223372036854775806, i64* %4, align 8, !dbg !523
  br label %101, !dbg !523

74:                                               ; preds = %56
  br label %75, !dbg !524

75:                                               ; preds = %74, %46
  br label %76, !dbg !525

76:                                               ; preds = %75, %36
  %77 = load i64, i64* %9, align 8, !dbg !526
  %78 = icmp slt i64 %77, 0, !dbg !526
  br i1 %78, label %79, label %81, !dbg !526

79:                                               ; preds = %76
  %80 = load i64, i64* %9, align 8, !dbg !527
  store i64 %80, i64* %4, align 8, !dbg !527
  br label %101, !dbg !527

81:                                               ; preds = %76
  call void @llvm.dbg.declare(metadata i64* %11, metadata !529, metadata !DIExpression()), !dbg !530
  %82 = load i64*, i64** %6, align 8, !dbg !530
  %83 = load i64, i64* %82, align 8, !dbg !530
  %84 = mul nsw i64 %83, 2, !dbg !530
  store i64 %84, i64* %11, align 8, !dbg !530
  call void @llvm.dbg.declare(metadata i8** %12, metadata !531, metadata !DIExpression()), !dbg !532
  %85 = load i8*, i8** %5, align 8, !dbg !532
  store i8* %85, i8** %12, align 8, !dbg !532
  call void @llvm.dbg.declare(metadata i8** %13, metadata !533, metadata !DIExpression()), !dbg !534
  %86 = load %struct.CHUNK*, %struct.CHUNK** %10, align 8, !dbg !534
  %87 = bitcast %struct.CHUNK* %86 to i8*, !dbg !534
  store i8* %87, i8** %13, align 8, !dbg !534
  %88 = load %struct.ICONV_T*, %struct.ICONV_T** %8, align 8, !dbg !535
  %89 = load i8*, i8** %12, align 8, !dbg !535
  %90 = load i64*, i64** %6, align 8, !dbg !535
  %91 = load i64, i64* %90, align 8, !dbg !535
  %92 = call i64 @Iconv(%struct.ICONV_T* noundef %88, i8* noundef %89, i64 noundef %91, i8** noundef %13, i64* noundef %11) #3, !dbg !535
  store i64 %92, i64* %9, align 8, !dbg !535
  %93 = load i8*, i8** %13, align 8, !dbg !536
  store i8* %93, i8** %5, align 8, !dbg !536
  %94 = load i64, i64* %11, align 8, !dbg !537
  %95 = load i64*, i64** %6, align 8, !dbg !537
  store i64 %94, i64* %95, align 8, !dbg !537
  %96 = load i64, i64* %9, align 8, !dbg !538
  %97 = icmp slt i64 %96, 0, !dbg !538
  br i1 %97, label %98, label %99, !dbg !538

98:                                               ; preds = %81
  store i64 -9223372036854775787, i64* %4, align 8, !dbg !539
  br label %101, !dbg !539

99:                                               ; preds = %81
  %100 = load i64, i64* %9, align 8, !dbg !541
  store i64 %100, i64* %4, align 8, !dbg !541
  br label %101, !dbg !541

101:                                              ; preds = %99, %98, %79, %73, %29
  %102 = load i64, i64* %4, align 8, !dbg !542
  ret i64 %102, !dbg !542
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @PkexecConvert(i8* noundef %0, i64* noundef %1, %struct._HEAP_MANAGER_PROTOCOL* noundef %2) #0 !dbg !543 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca %struct._HEAP_MANAGER_PROTOCOL*, align 8
  %8 = alloca %struct.ICONV_T*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.CHUNK*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !544, metadata !DIExpression()), !dbg !545
  store i64* %1, i64** %6, align 8
  call void @llvm.dbg.declare(metadata i64** %6, metadata !546, metadata !DIExpression()), !dbg !547
  store %struct._HEAP_MANAGER_PROTOCOL* %2, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %7, metadata !548, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %8, metadata !550, metadata !DIExpression()), !dbg !551
  store %struct.ICONV_T* null, %struct.ICONV_T** %8, align 8, !dbg !551
  call void @llvm.dbg.declare(metadata i64* %9, metadata !552, metadata !DIExpression()), !dbg !553
  %14 = call i64 @IconvOpen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), %struct.ICONV_T** noundef %8) #3, !dbg !553
  store i64 %14, i64* %9, align 8, !dbg !553
  %15 = load i64, i64* %9, align 8, !dbg !554
  %16 = icmp slt i64 %15, 0, !dbg !554
  br i1 %16, label %17, label %31, !dbg !554

17:                                               ; preds = %3
  br label %18, !dbg !555

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !558
  %20 = icmp ne i8 %19, 0, !dbg !558
  br i1 %20, label %21, label %28, !dbg !558

21:                                               ; preds = %18
  br label %22, !dbg !560

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !563
  %24 = icmp ne i8 %23, 0, !dbg !563
  br i1 %24, label %25, label %26, !dbg !563

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !565
  br label %26, !dbg !565

26:                                               ; preds = %25, %22
  br label %27, !dbg !563

27:                                               ; preds = %26
  br label %28, !dbg !560

28:                                               ; preds = %27, %18
  br label %29, !dbg !558

29:                                               ; preds = %28
  %30 = load i64, i64* %9, align 8, !dbg !568
  store i64 %30, i64* %4, align 8, !dbg !568
  br label %101, !dbg !568

31:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %10, metadata !569, metadata !DIExpression()), !dbg !570
  store %struct.CHUNK* null, %struct.CHUNK** %10, align 8, !dbg !570
  %32 = load i64*, i64** %6, align 8, !dbg !571
  %33 = load i64, i64* %32, align 8, !dbg !571
  %34 = add nsw i64 %33, 4, !dbg !571
  %35 = icmp sle i64 %34, 128, !dbg !571
  br i1 %35, label %36, label %41, !dbg !571

36:                                               ; preds = %31
  %37 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !572
  %38 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %37, i32 0, i32 1, !dbg !572
  %39 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %38, align 8, !dbg !572
  %40 = call i64 %39(i64 noundef 0, %struct.CHUNK** noundef %10) #3, !dbg !572
  br label %76, !dbg !575

41:                                               ; preds = %31
  %42 = load i64*, i64** %6, align 8, !dbg !576
  %43 = load i64, i64* %42, align 8, !dbg !576
  %44 = add nsw i64 %43, 4, !dbg !576
  %45 = icmp sle i64 %44, 256, !dbg !576
  br i1 %45, label %46, label %51, !dbg !576

46:                                               ; preds = %41
  %47 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !577
  %48 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %47, i32 0, i32 1, !dbg !577
  %49 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %48, align 8, !dbg !577
  %50 = call i64 %49(i64 noundef 1, %struct.CHUNK** noundef %10) #3, !dbg !577
  br label %75, !dbg !580

51:                                               ; preds = %41
  %52 = load i64*, i64** %6, align 8, !dbg !581
  %53 = load i64, i64* %52, align 8, !dbg !581
  %54 = add nsw i64 %53, 4, !dbg !581
  %55 = icmp sle i64 %54, 512, !dbg !581
  br i1 %55, label %56, label %61, !dbg !581

56:                                               ; preds = %51
  %57 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !582
  %58 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %57, i32 0, i32 1, !dbg !582
  %59 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %58, align 8, !dbg !582
  %60 = call i64 %59(i64 noundef 2, %struct.CHUNK** noundef %10) #3, !dbg !582
  br label %74, !dbg !585

61:                                               ; preds = %51
  br label %62, !dbg !586

62:                                               ; preds = %61
  %63 = call i8 @DebugPrintEnabled() #3, !dbg !588
  %64 = icmp ne i8 %63, 0, !dbg !588
  br i1 %64, label %65, label %72, !dbg !588

65:                                               ; preds = %62
  br label %66, !dbg !590

66:                                               ; preds = %65
  %67 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !593
  %68 = icmp ne i8 %67, 0, !dbg !593
  br i1 %68, label %69, label %70, !dbg !593

69:                                               ; preds = %66
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0)) #3, !dbg !595
  br label %70, !dbg !595

70:                                               ; preds = %69, %66
  br label %71, !dbg !593

71:                                               ; preds = %70
  br label %72, !dbg !590

72:                                               ; preds = %71, %62
  br label %73, !dbg !588

73:                                               ; preds = %72
  store i64 -9223372036854775806, i64* %4, align 8, !dbg !598
  br label %101, !dbg !598

74:                                               ; preds = %56
  br label %75, !dbg !599

75:                                               ; preds = %74, %46
  br label %76, !dbg !600

76:                                               ; preds = %75, %36
  %77 = load i64, i64* %9, align 8, !dbg !601
  %78 = icmp slt i64 %77, 0, !dbg !601
  br i1 %78, label %79, label %81, !dbg !601

79:                                               ; preds = %76
  %80 = load i64, i64* %9, align 8, !dbg !602
  store i64 %80, i64* %4, align 8, !dbg !602
  br label %101, !dbg !602

81:                                               ; preds = %76
  call void @llvm.dbg.declare(metadata i64* %11, metadata !604, metadata !DIExpression()), !dbg !605
  %82 = load i64*, i64** %6, align 8, !dbg !605
  %83 = load i64, i64* %82, align 8, !dbg !605
  %84 = add nsw i64 %83, 4, !dbg !605
  store i64 %84, i64* %11, align 8, !dbg !605
  call void @llvm.dbg.declare(metadata i8** %12, metadata !606, metadata !DIExpression()), !dbg !607
  %85 = load i8*, i8** %5, align 8, !dbg !607
  store i8* %85, i8** %12, align 8, !dbg !607
  call void @llvm.dbg.declare(metadata i8** %13, metadata !608, metadata !DIExpression()), !dbg !609
  %86 = load %struct.CHUNK*, %struct.CHUNK** %10, align 8, !dbg !609
  %87 = bitcast %struct.CHUNK* %86 to i8*, !dbg !609
  store i8* %87, i8** %13, align 8, !dbg !609
  %88 = load %struct.ICONV_T*, %struct.ICONV_T** %8, align 8, !dbg !610
  %89 = load i8*, i8** %12, align 8, !dbg !610
  %90 = load i64*, i64** %6, align 8, !dbg !610
  %91 = load i64, i64* %90, align 8, !dbg !610
  %92 = call i64 @Iconv(%struct.ICONV_T* noundef %88, i8* noundef %89, i64 noundef %91, i8** noundef %13, i64* noundef %11) #3, !dbg !610
  store i64 %92, i64* %9, align 8, !dbg !610
  %93 = load i8*, i8** %13, align 8, !dbg !611
  store i8* %93, i8** %5, align 8, !dbg !611
  %94 = load i64, i64* %11, align 8, !dbg !612
  %95 = load i64*, i64** %6, align 8, !dbg !612
  store i64 %94, i64* %95, align 8, !dbg !612
  %96 = load i64, i64* %9, align 8, !dbg !613
  %97 = icmp slt i64 %96, 0, !dbg !613
  br i1 %97, label %98, label %99, !dbg !613

98:                                               ; preds = %81
  store i64 -9223372036854775787, i64* %4, align 8, !dbg !614
  br label %101, !dbg !614

99:                                               ; preds = %81
  %100 = load i64, i64* %9, align 8, !dbg !616
  store i64 %100, i64* %4, align 8, !dbg !616
  br label %101, !dbg !616

101:                                              ; preds = %99, %98, %79, %73, %29
  %102 = load i64, i64* %4, align 8, !dbg !617
  ret i64 %102, !dbg !617
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @CharConverterEntryPoint(i8* noundef %0, %struct.EFI_SYSTEM_TABLE* noundef %1) #0 !dbg !618 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.EFI_SYSTEM_TABLE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct._CHAR_CONVERTER_PROTOCOL*, align 8
  %10 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1123, metadata !DIExpression()), !dbg !1124
  store %struct.EFI_SYSTEM_TABLE* %1, %struct.EFI_SYSTEM_TABLE** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.EFI_SYSTEM_TABLE** %5, metadata !1125, metadata !DIExpression()), !dbg !1126
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1127, metadata !DIExpression()), !dbg !1128
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1129, metadata !DIExpression()), !dbg !1130
  store i8* null, i8** %7, align 8, !dbg !1130
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1131, metadata !DIExpression()), !dbg !1132
  store i8* null, i8** %8, align 8, !dbg !1132
  call void @llvm.dbg.declare(metadata %struct._CHAR_CONVERTER_PROTOCOL** %9, metadata !1133, metadata !DIExpression()), !dbg !1151
  call void @llvm.dbg.declare(metadata i64* %10, metadata !1152, metadata !DIExpression()), !dbg !1153
  store i64 40, i64* %10, align 8, !dbg !1153
  %11 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1154
  %12 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %11, i32 0, i32 5, !dbg !1154
  %13 = load i64 (i32, i64, i8**)*, i64 (i32, i64, i8**)** %12, align 8, !dbg !1154
  %14 = load i64, i64* %10, align 8, !dbg !1154
  %15 = bitcast %struct._CHAR_CONVERTER_PROTOCOL** %9 to i8**, !dbg !1154
  %16 = call i64 %13(i32 noundef 6, i64 noundef %14, i8** noundef %15) #3, !dbg !1154
  store i64 %16, i64* %6, align 8, !dbg !1154
  %17 = load i64, i64* %6, align 8, !dbg !1155
  %18 = icmp slt i64 %17, 0, !dbg !1155
  br i1 %18, label %19, label %21, !dbg !1155

19:                                               ; preds = %2
  %20 = load i64, i64* %6, align 8, !dbg !1156
  store i64 %20, i64* %3, align 8, !dbg !1156
  br label %53, !dbg !1156

21:                                               ; preds = %2
  %22 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1159
  %23 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %22, i32 0, i32 0, !dbg !1159
  store i64 (i8*, i8*, %struct.ICONV_T**)* @IconvOpen, i64 (i8*, i8*, %struct.ICONV_T**)** %23, align 8, !dbg !1159
  %24 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1160
  %25 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %24, i32 0, i32 1, !dbg !1160
  store i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)* @Iconv, i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)** %25, align 8, !dbg !1160
  %26 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1161
  %27 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %26, i32 0, i32 2, !dbg !1161
  store i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* @StandardConvert, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %27, align 8, !dbg !1161
  %28 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1162
  %29 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %28, i32 0, i32 3, !dbg !1162
  store i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* @Libxml2Convert, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %29, align 8, !dbg !1162
  %30 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1163
  %31 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %30, i32 0, i32 4, !dbg !1163
  store i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* @PkexecConvert, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %31, align 8, !dbg !1163
  %32 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1164
  %33 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %32, i32 0, i32 16, !dbg !1164
  %34 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %33, align 8, !dbg !1164
  %35 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1164
  %36 = bitcast %struct._CHAR_CONVERTER_PROTOCOL* %35 to i8*, !dbg !1164
  %37 = call i64 %34(i8** noundef %7, %struct.GUID* noundef @gEfiCharConverterProtocolGuid, i32 noundef 0, i8* noundef %36) #3, !dbg !1164
  store i64 %37, i64* %6, align 8, !dbg !1164
  %38 = load i64, i64* %6, align 8, !dbg !1165
  %39 = icmp slt i64 %38, 0, !dbg !1165
  br i1 %39, label %40, label %42, !dbg !1165

40:                                               ; preds = %21
  %41 = load i64, i64* %6, align 8, !dbg !1166
  store i64 %41, i64* %3, align 8, !dbg !1166
  br label %53, !dbg !1166

42:                                               ; preds = %21
  store i32 -1, i32* getelementptr inbounds (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL, %struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mCharConverterReady, i32 0, i32 0), align 4, !dbg !1169
  %43 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1170
  %44 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %43, i32 0, i32 16, !dbg !1170
  %45 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %44, align 8, !dbg !1170
  %46 = call i64 %45(i8** noundef %8, %struct.GUID* noundef @gEfiCharConverterReadyProtocolGuid, i32 noundef 0, i8* noundef bitcast (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mCharConverterReady to i8*)) #3, !dbg !1170
  store i64 %46, i64* %6, align 8, !dbg !1170
  %47 = load i64, i64* %6, align 8, !dbg !1171
  %48 = icmp slt i64 %47, 0, !dbg !1171
  br i1 %48, label %49, label %51, !dbg !1171

49:                                               ; preds = %42
  %50 = load i64, i64* %6, align 8, !dbg !1172
  store i64 %50, i64* %3, align 8, !dbg !1172
  br label %53, !dbg !1172

51:                                               ; preds = %42
  %52 = load i64, i64* %6, align 8, !dbg !1175
  store i64 %52, i64* %3, align 8, !dbg !1175
  br label %53, !dbg !1175

53:                                               ; preds = %51, %49, %40, %19
  %54 = load i64, i64* %3, align 8, !dbg !1176
  ret i64 %54, !dbg !1176
}

attributes #0 = { noimplicitfloat noinline noredzone nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-stack-arg-probe" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noimplicitfloat noredzone "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noimplicitfloat noredzone "no-builtins" "trap-func-name"="undefined_behavior_has_been_optimized_away_by_clang" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!91, !92, !93, !94, !95, !96, !97, !98}
!llvm.ident = !{!99}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "mCharConverterReady", scope: !2, file: !85, line: 3, type: !86, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !72, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/CharConverter/CharConverter.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Build/OvmfX64/NOOPT_CLANGPDB/X64/Testcases/Sample2Tests/CharConverter/CharConverter", checksumkind: CSK_MD5, checksum: "d2e7f8562ea900fd3b862d2fdaef4ac5")
!4 = !{!5, !13, !20, !39, !44, !47}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 117, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "MdePkg/Include/Uefi/UefiMultiPhase.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "321376346bf760b12510b9ae9d8f46f8")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "EfiResetCold", value: 0)
!10 = !DIEnumerator(name: "EfiResetWarm", value: 1)
!11 = !DIEnumerator(name: "EfiResetShutdown", value: 2)
!12 = !DIEnumerator(name: "EfiResetPlatformSpecific", value: 3)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 29, baseType: !7, size: 32, elements: !15)
!14 = !DIFile(filename: "MdePkg/Include/Uefi/UefiSpec.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6689a006b5315b366a9c472eecb4d5b8")
!15 = !{!16, !17, !18, !19}
!16 = !DIEnumerator(name: "AllocateAnyPages", value: 0)
!17 = !DIEnumerator(name: "AllocateMaxAddress", value: 1)
!18 = !DIEnumerator(name: "AllocateAddress", value: 2)
!19 = !DIEnumerator(name: "MaxAllocateType", value: 3)
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 38, baseType: !7, size: 32, elements: !21)
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38}
!22 = !DIEnumerator(name: "EfiReservedMemoryType", value: 0)
!23 = !DIEnumerator(name: "EfiLoaderCode", value: 1)
!24 = !DIEnumerator(name: "EfiLoaderData", value: 2)
!25 = !DIEnumerator(name: "EfiBootServicesCode", value: 3)
!26 = !DIEnumerator(name: "EfiBootServicesData", value: 4)
!27 = !DIEnumerator(name: "EfiRuntimeServicesCode", value: 5)
!28 = !DIEnumerator(name: "EfiRuntimeServicesData", value: 6)
!29 = !DIEnumerator(name: "EfiConventionalMemory", value: 7)
!30 = !DIEnumerator(name: "EfiUnusableMemory", value: 8)
!31 = !DIEnumerator(name: "EfiACPIReclaimMemory", value: 9)
!32 = !DIEnumerator(name: "EfiACPIMemoryNVS", value: 10)
!33 = !DIEnumerator(name: "EfiMemoryMappedIO", value: 11)
!34 = !DIEnumerator(name: "EfiMemoryMappedIOPortSpace", value: 12)
!35 = !DIEnumerator(name: "EfiPalCode", value: 13)
!36 = !DIEnumerator(name: "EfiPersistentMemory", value: 14)
!37 = !DIEnumerator(name: "EfiUnacceptedMemoryType", value: 15)
!38 = !DIEnumerator(name: "EfiMaxMemoryType", value: 16)
!39 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 521, baseType: !7, size: 32, elements: !40)
!40 = !{!41, !42, !43}
!41 = !DIEnumerator(name: "TimerCancel", value: 0)
!42 = !DIEnumerator(name: "TimerPeriodic", value: 1)
!43 = !DIEnumerator(name: "TimerRelative", value: 2)
!44 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 1159, baseType: !7, size: 32, elements: !45)
!45 = !{!46}
!46 = !DIEnumerator(name: "EFI_NATIVE_INTERFACE", value: 0)
!47 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 1475, baseType: !7, size: 32, elements: !48)
!48 = !{!49, !50, !51}
!49 = !DIEnumerator(name: "AllHandles", value: 0)
!50 = !DIEnumerator(name: "ByRegisterNotify", value: 1)
!51 = !DIEnumerator(name: "ByProtocol", value: 2)
!52 = !{!53, !54, !60, !62, !63, !65, !68, !70, !71}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "RETURN_STATUS", file: !55, line: 1026, baseType: !56)
!55 = !DIFile(filename: "MdePkg/Include/Base.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "3996263373664be5782f777b907656f6")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINTN", file: !57, line: 211, baseType: !58)
!57 = !DIFile(filename: "MdePkg/Include/X64/ProcessorBind.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ef2524a221fe61206fa09ec88dd4f59b")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT64", file: !57, line: 162, baseType: !59)
!59 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR16", file: !57, line: 183, baseType: !61)
!61 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR8", file: !57, line: 200, baseType: !64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "INTN", file: !57, line: 216, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT64", file: !57, line: 166, baseType: !67)
!67 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "BOOLEAN", file: !57, line: 192, baseType: !69)
!69 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!72 = !{!73, !77, !79, !81, !83, !0}
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression(DW_OP_constu, 0, DW_OP_stack_value))
!74 = distinct !DIGlobalVariable(name: "B_080", scope: !2, file: !75, line: 27, type: !76, isLocal: true, isDefinition: true)
!75 = !DIFile(filename: "Testcases/Sample2Tests/CharConverter/../HeapManager/HeapManager.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "e714afc4efaaf897241f252dc062e7a1")
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!78 = distinct !DIGlobalVariable(name: "B_100", scope: !2, file: !75, line: 28, type: !76, isLocal: true, isDefinition: true)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!80 = distinct !DIGlobalVariable(name: "B_200", scope: !2, file: !75, line: 29, type: !76, isLocal: true, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression(DW_OP_constu, 6, DW_OP_stack_value))
!82 = distinct !DIGlobalVariable(name: "EfiRuntimeServicesData", scope: !2, file: !6, line: 70, type: !76, isLocal: true, isDefinition: true)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression(DW_OP_constu, 0, DW_OP_stack_value))
!84 = distinct !DIGlobalVariable(name: "EFI_NATIVE_INTERFACE", scope: !2, file: !14, line: 1163, type: !76, isLocal: true, isDefinition: true)
!85 = !DIFile(filename: "Testcases/Sample2Tests/CharConverter/CharConverter.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "d2e7f8562ea900fd3b862d2fdaef4ac5")
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "NOTIFY_PROTOCOL_READY_PROTOCOL", file: !75, line: 122, baseType: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_NOTIFY_PROTOCOL_READY_PROTOCOL", file: !75, line: 120, size: 32, elements: !88)
!88 = !{!89}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "ReadyFlags", scope: !87, file: !75, line: 121, baseType: !90, size: 32)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT32", file: !57, line: 170, baseType: !7)
!91 = !{i32 2, !"CodeView", i32 1}
!92 = !{i32 2, !"Debug Info Version", i32 3}
!93 = !{i32 1, !"wchar_size", i32 2}
!94 = !{i32 7, !"PIC Level", i32 2}
!95 = !{i32 1, !"Code Model", i32 1}
!96 = !{i32 7, !"uwtable", i32 1}
!97 = !{i32 1, !"ThinLTO", i32 0}
!98 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!99 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!100 = distinct !DISubprogram(name: "IconvOpen", scope: !85, file: !85, line: 9, type: !101, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !115)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !105, !105, !107}
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STATUS", file: !104, line: 29, baseType: !54)
!104 = !DIFile(filename: "MdePkg/Include/Uefi/UefiBaseType.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "652b6036ee3f46705189b44807c85960")
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "ICONV_T", file: !110, line: 25, baseType: !111)
!110 = !DIFile(filename: "Testcases/Sample2Tests/CharConverter/CharConverter.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ac05300bbbb33b9bef78614a50737cb1")
!111 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ICONV_T", file: !110, line: 22, size: 128, elements: !112)
!112 = !{!113, !114}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "FromEncoding", scope: !111, file: !110, line: 23, baseType: !70, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "ToEncoding", scope: !111, file: !110, line: 24, baseType: !70, size: 64, offset: 64)
!115 = !{}
!116 = !DILocalVariable(name: "ToEncoding", arg: 1, scope: !100, file: !85, line: 10, type: !105)
!117 = !DILocation(line: 10, scope: !100)
!118 = !DILocalVariable(name: "FromEncoding", arg: 2, scope: !100, file: !85, line: 11, type: !105)
!119 = !DILocation(line: 11, scope: !100)
!120 = !DILocalVariable(name: "CharDesc", arg: 3, scope: !100, file: !85, line: 12, type: !107)
!121 = !DILocation(line: 12, scope: !100)
!122 = !DILocation(line: 15, scope: !100)
!123 = !DILocation(line: 16, scope: !100)
!124 = !DILocation(line: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !85, line: 16)
!126 = distinct !DILexicalBlock(scope: !100, file: !85, line: 16)
!127 = !DILocation(line: 21, scope: !100)
!128 = !DILocation(line: 22, scope: !100)
!129 = !DILocation(line: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !85, line: 22)
!131 = distinct !DILexicalBlock(scope: !100, file: !85, line: 22)
!132 = !DILocation(line: 24, scope: !130)
!133 = !DILocation(line: 25, scope: !130)
!134 = !DILocation(line: 27, scope: !100)
!135 = !DILocation(line: 29, scope: !100)
!136 = !DILocation(line: 30, scope: !100)
!137 = !DILocation(line: 31, scope: !138)
!138 = distinct !DILexicalBlock(scope: !139, file: !85, line: 30)
!139 = distinct !DILexicalBlock(scope: !100, file: !85, line: 30)
!140 = !DILocation(line: 32, scope: !138)
!141 = !DILocation(line: 33, scope: !138)
!142 = !DILocation(line: 34, scope: !138)
!143 = !DILocation(line: 36, scope: !100)
!144 = !DILocation(line: 38, scope: !100)
!145 = !DILocation(line: 39, scope: !100)
!146 = distinct !DISubprogram(name: "Iconv", scope: !85, file: !85, line: 44, type: !147, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !115)
!147 = !DISubroutineType(types: !148)
!148 = !{!103, !108, !70, !65, !149, !150}
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!151 = !DILocalVariable(name: "CharDesc", arg: 1, scope: !146, file: !85, line: 45, type: !108)
!152 = !DILocation(line: 45, scope: !146)
!153 = !DILocalVariable(name: "InputBuffer", arg: 2, scope: !146, file: !85, line: 46, type: !70)
!154 = !DILocation(line: 46, scope: !146)
!155 = !DILocalVariable(name: "InputSize", arg: 3, scope: !146, file: !85, line: 47, type: !65)
!156 = !DILocation(line: 47, scope: !146)
!157 = !DILocalVariable(name: "OutputBuffer", arg: 4, scope: !146, file: !85, line: 48, type: !149)
!158 = !DILocation(line: 48, scope: !146)
!159 = !DILocalVariable(name: "OutputSize", arg: 5, scope: !146, file: !85, line: 49, type: !150)
!160 = !DILocation(line: 49, scope: !146)
!161 = !DILocation(line: 51, scope: !146)
!162 = !DILocation(line: 54, scope: !163)
!163 = distinct !DILexicalBlock(scope: !164, file: !85, line: 52)
!164 = distinct !DILexicalBlock(scope: !146, file: !85, line: 51)
!165 = !DILocation(line: 55, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !85, line: 54)
!167 = distinct !DILexicalBlock(scope: !163, file: !85, line: 54)
!168 = !DILocalVariable(name: "i", scope: !169, file: !85, line: 58, type: !56)
!169 = distinct !DILexicalBlock(scope: !163, file: !85, line: 58)
!170 = !DILocation(line: 58, scope: !169)
!171 = !DILocation(line: 59, scope: !172)
!172 = distinct !DILexicalBlock(scope: !173, file: !85, line: 58)
!173 = distinct !DILexicalBlock(scope: !169, file: !85, line: 58)
!174 = !DILocation(line: 60, scope: !172)
!175 = !DILocation(line: 61, scope: !172)
!176 = !DILocation(line: 58, scope: !173)
!177 = distinct !{!177, !170, !178, !179}
!178 = !DILocation(line: 61, scope: !169)
!179 = !{!"llvm.loop.mustprogress"}
!180 = !DILocation(line: 63, scope: !163)
!181 = !DILocation(line: 64, scope: !163)
!182 = !DILocation(line: 66, scope: !164)
!183 = !DILocation(line: 69, scope: !184)
!184 = distinct !DILexicalBlock(scope: !185, file: !85, line: 67)
!185 = distinct !DILexicalBlock(scope: !164, file: !85, line: 66)
!186 = !DILocation(line: 70, scope: !187)
!187 = distinct !DILexicalBlock(scope: !188, file: !85, line: 69)
!188 = distinct !DILexicalBlock(scope: !184, file: !85, line: 69)
!189 = !DILocalVariable(name: "i", scope: !190, file: !85, line: 73, type: !56)
!190 = distinct !DILexicalBlock(scope: !184, file: !85, line: 73)
!191 = !DILocation(line: 73, scope: !190)
!192 = !DILocalVariable(name: "utf16_str", scope: !193, file: !85, line: 74, type: !62)
!193 = distinct !DILexicalBlock(scope: !194, file: !85, line: 73)
!194 = distinct !DILexicalBlock(scope: !190, file: !85, line: 73)
!195 = !DILocation(line: 74, scope: !193)
!196 = !DILocation(line: 75, scope: !193)
!197 = !DILocation(line: 76, scope: !198)
!198 = distinct !DILexicalBlock(scope: !199, file: !85, line: 75)
!199 = distinct !DILexicalBlock(scope: !193, file: !85, line: 75)
!200 = !DILocation(line: 77, scope: !198)
!201 = !DILocation(line: 78, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !85, line: 77)
!203 = !DILocation(line: 79, scope: !202)
!204 = !DILocation(line: 80, scope: !193)
!205 = !DILocation(line: 81, scope: !193)
!206 = !DILocation(line: 73, scope: !194)
!207 = distinct !{!207, !191, !208, !179}
!208 = !DILocation(line: 81, scope: !190)
!209 = !DILocation(line: 83, scope: !184)
!210 = !DILocation(line: 84, scope: !184)
!211 = !DILocation(line: 86, scope: !185)
!212 = !DILocation(line: 89, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !85, line: 87)
!214 = distinct !DILexicalBlock(scope: !185, file: !85, line: 86)
!215 = !DILocation(line: 90, scope: !216)
!216 = distinct !DILexicalBlock(scope: !217, file: !85, line: 89)
!217 = distinct !DILexicalBlock(scope: !213, file: !85, line: 89)
!218 = !DILocalVariable(name: "i", scope: !219, file: !85, line: 92, type: !56)
!219 = distinct !DILexicalBlock(scope: !213, file: !85, line: 92)
!220 = !DILocation(line: 92, scope: !219)
!221 = !DILocation(line: 93, scope: !222)
!222 = distinct !DILexicalBlock(scope: !223, file: !85, line: 92)
!223 = distinct !DILexicalBlock(scope: !219, file: !85, line: 92)
!224 = !DILocation(line: 94, scope: !222)
!225 = !DILocation(line: 95, scope: !226)
!226 = distinct !DILexicalBlock(scope: !227, file: !85, line: 94)
!227 = distinct !DILexicalBlock(scope: !222, file: !85, line: 94)
!228 = !DILocation(line: 96, scope: !226)
!229 = !DILocation(line: 98, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !85, line: 96)
!231 = !DILocation(line: 100, scope: !232)
!232 = distinct !DILexicalBlock(scope: !233, file: !85, line: 99)
!233 = distinct !DILexicalBlock(scope: !230, file: !85, line: 98)
!234 = !DILocation(line: 101, scope: !232)
!235 = !DILocation(line: 102, scope: !232)
!236 = !DILocation(line: 103, scope: !232)
!237 = !DILocation(line: 104, scope: !232)
!238 = !DILocation(line: 105, scope: !232)
!239 = !DILocation(line: 106, scope: !232)
!240 = !DILocation(line: 107, scope: !232)
!241 = !DILocation(line: 111, scope: !242)
!242 = distinct !DILexicalBlock(scope: !233, file: !85, line: 110)
!243 = !DILocation(line: 112, scope: !242)
!244 = !DILocation(line: 113, scope: !230)
!245 = !DILocation(line: 114, scope: !222)
!246 = !DILocation(line: 92, scope: !223)
!247 = distinct !{!247, !220, !248, !179}
!248 = !DILocation(line: 114, scope: !219)
!249 = !DILocation(line: 116, scope: !213)
!250 = !DILocation(line: 117, scope: !213)
!251 = !DILocation(line: 118, scope: !213)
!252 = !DILocation(line: 120, scope: !214)
!253 = !DILocation(line: 123, scope: !254)
!254 = distinct !DILexicalBlock(scope: !255, file: !85, line: 121)
!255 = distinct !DILexicalBlock(scope: !214, file: !85, line: 120)
!256 = !DILocation(line: 124, scope: !257)
!257 = distinct !DILexicalBlock(scope: !258, file: !85, line: 123)
!258 = distinct !DILexicalBlock(scope: !254, file: !85, line: 123)
!259 = !DILocalVariable(name: "OutIndex", scope: !254, file: !85, line: 127, type: !56)
!260 = !DILocation(line: 127, scope: !254)
!261 = !DILocalVariable(name: "i", scope: !262, file: !85, line: 128, type: !56)
!262 = distinct !DILexicalBlock(scope: !254, file: !85, line: 128)
!263 = !DILocation(line: 128, scope: !262)
!264 = !DILocalVariable(name: "Char", scope: !265, file: !85, line: 129, type: !267)
!265 = distinct !DILexicalBlock(scope: !266, file: !85, line: 128)
!266 = distinct !DILexicalBlock(scope: !262, file: !85, line: 128)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT8", file: !57, line: 196, baseType: !69)
!268 = !DILocation(line: 129, scope: !265)
!269 = !DILocation(line: 131, scope: !265)
!270 = !DILocation(line: 132, scope: !271)
!271 = distinct !DILexicalBlock(scope: !272, file: !85, line: 131)
!272 = distinct !DILexicalBlock(scope: !265, file: !85, line: 131)
!273 = !DILocation(line: 133, scope: !271)
!274 = !DILocation(line: 134, scope: !271)
!275 = !DILocation(line: 135, scope: !272)
!276 = !DILocalVariable(name: "Char2", scope: !277, file: !85, line: 136, type: !267)
!277 = distinct !DILexicalBlock(scope: !278, file: !85, line: 135)
!278 = distinct !DILexicalBlock(scope: !272, file: !85, line: 135)
!279 = !DILocation(line: 136, scope: !277)
!280 = !DILocation(line: 138, scope: !277)
!281 = !DILocalVariable(name: "UnicodeChar", scope: !282, file: !85, line: 139, type: !284)
!282 = distinct !DILexicalBlock(scope: !283, file: !85, line: 138)
!283 = distinct !DILexicalBlock(scope: !277, file: !85, line: 138)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT16", file: !57, line: 178, baseType: !61)
!285 = !DILocation(line: 139, scope: !282)
!286 = !DILocation(line: 141, scope: !282)
!287 = !DILocation(line: 142, scope: !288)
!288 = distinct !DILexicalBlock(scope: !289, file: !85, line: 141)
!289 = distinct !DILexicalBlock(scope: !282, file: !85, line: 141)
!290 = !DILocation(line: 143, scope: !288)
!291 = !DILocation(line: 146, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !85, line: 144)
!293 = !DILocation(line: 147, scope: !292)
!294 = !DILocation(line: 148, scope: !292)
!295 = !DILocation(line: 149, scope: !292)
!296 = !DILocation(line: 150, scope: !292)
!297 = !DILocation(line: 152, scope: !282)
!298 = !DILocation(line: 153, scope: !282)
!299 = !DILocation(line: 156, scope: !300)
!300 = distinct !DILexicalBlock(scope: !283, file: !85, line: 154)
!301 = !DILocation(line: 157, scope: !300)
!302 = !DILocation(line: 158, scope: !300)
!303 = !DILocation(line: 159, scope: !277)
!304 = !DILocation(line: 160, scope: !278)
!305 = !DILocalVariable(name: "Char2", scope: !306, file: !85, line: 162, type: !267)
!306 = distinct !DILexicalBlock(scope: !307, file: !85, line: 160)
!307 = distinct !DILexicalBlock(scope: !278, file: !85, line: 160)
!308 = !DILocation(line: 162, scope: !306)
!309 = !DILocalVariable(name: "Char3", scope: !306, file: !85, line: 163, type: !267)
!310 = !DILocation(line: 163, scope: !306)
!311 = !DILocation(line: 165, scope: !306)
!312 = !DILocalVariable(name: "UnicodeChar", scope: !313, file: !85, line: 166, type: !284)
!313 = distinct !DILexicalBlock(scope: !314, file: !85, line: 165)
!314 = distinct !DILexicalBlock(scope: !306, file: !85, line: 165)
!315 = !DILocation(line: 166, scope: !313)
!316 = !DILocation(line: 170, scope: !313)
!317 = !DILocation(line: 172, scope: !318)
!318 = distinct !DILexicalBlock(scope: !319, file: !85, line: 170)
!319 = distinct !DILexicalBlock(scope: !313, file: !85, line: 170)
!320 = !DILocation(line: 173, scope: !318)
!321 = !DILocation(line: 174, scope: !313)
!322 = !DILocation(line: 175, scope: !313)
!323 = !DILocation(line: 177, scope: !324)
!324 = distinct !DILexicalBlock(scope: !314, file: !85, line: 176)
!325 = !DILocation(line: 178, scope: !324)
!326 = !DILocation(line: 179, scope: !324)
!327 = !DILocation(line: 180, scope: !306)
!328 = !DILocation(line: 182, scope: !329)
!329 = distinct !DILexicalBlock(scope: !307, file: !85, line: 181)
!330 = !DILocation(line: 183, scope: !329)
!331 = !DILocation(line: 184, scope: !329)
!332 = !DILocation(line: 160, scope: !307)
!333 = !DILocation(line: 135, scope: !278)
!334 = !DILocation(line: 128, scope: !266)
!335 = distinct !{!335, !263, !336, !179}
!336 = !DILocation(line: 185, scope: !262)
!337 = !DILocation(line: 187, scope: !254)
!338 = !DILocation(line: 199, scope: !254)
!339 = !DILocation(line: 121, scope: !255)
!340 = !DILocation(line: 87, scope: !214)
!341 = !DILocation(line: 67, scope: !185)
!342 = !DILocation(line: 203, scope: !146)
!343 = !DILocation(line: 204, scope: !146)
!344 = distinct !DISubprogram(name: "StandardConvert", scope: !85, file: !85, line: 208, type: !345, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !115)
!345 = !DISubroutineType(types: !346)
!346 = !{!103, !70, !150, !347}
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!348 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_PROTOCOL", file: !75, line: 118, baseType: !349)
!349 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_HEAP_MANAGER_PROTOCOL", file: !75, line: 108, size: 576, elements: !350)
!350 = !{!351, !356, !368, !373, !378, !380, !382, !393, !395}
!351 = !DIDerivedType(tag: DW_TAG_member, name: "GetBlockSize", scope: !349, file: !75, line: 109, baseType: !352, size: 64)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_GET_BLOCK_SIZE", file: !75, line: 63, baseType: !353)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!354 = !DISubroutineType(types: !355)
!355 = !{!103, !56, !150}
!356 = !DIDerivedType(tag: DW_TAG_member, name: "AllocateChunk", scope: !349, file: !75, line: 110, baseType: !357, size: 64, offset: 64)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_ALLOCATE_CHUNK", file: !75, line: 70, baseType: !358)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!359 = !DISubroutineType(types: !360)
!360 = !{!103, !56, !361}
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHUNK_T", file: !75, line: 34, baseType: !364)
!364 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHUNK", file: !75, line: 32, size: 64, elements: !365)
!365 = !{!366}
!366 = !DIDerivedType(tag: DW_TAG_member, name: "Next", scope: !364, file: !75, line: 33, baseType: !367, size: 64)
!367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "FreeChunk", scope: !349, file: !75, line: 111, baseType: !369, size: 64, offset: 128)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_CHUNK", file: !75, line: 77, baseType: !370)
!370 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64)
!371 = !DISubroutineType(types: !372)
!372 = !{!103, !65}
!373 = !DIDerivedType(tag: DW_TAG_member, name: "FreeAllocList", scope: !349, file: !75, line: 112, baseType: !374, size: 64, offset: 192)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_ALLOC_LIST", file: !75, line: 83, baseType: !375)
!375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !376, size: 64)
!376 = !DISubroutineType(types: !377)
!377 = !{!103, null}
!378 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayFreeList", scope: !349, file: !75, line: 113, baseType: !379, size: 64, offset: 256)
!379 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_FREE_LIST", file: !75, line: 87, baseType: !375)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayHeapMetadata", scope: !349, file: !75, line: 114, baseType: !381, size: 64, offset: 320)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_HEAP_METADATA", file: !75, line: 91, baseType: !375)
!382 = !DIDerivedType(tag: DW_TAG_member, name: "InitializePage", scope: !349, file: !75, line: 115, baseType: !383, size: 64, offset: 384)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_PAGE", file: !75, line: 95, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!385 = !DISubroutineType(types: !386)
!386 = !{!103, !56, !387}
!387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !388, size: 64)
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "PAGE_T", file: !75, line: 38, baseType: !390)
!390 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PAGE", file: !75, line: 36, size: 64, elements: !391)
!391 = !{!392}
!392 = !DIDerivedType(tag: DW_TAG_member, name: "Self", scope: !390, file: !75, line: 37, baseType: !362, size: 64)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeapMetadata", scope: !349, file: !75, line: 116, baseType: !394, size: 64, offset: 448)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP_METADATA", file: !75, line: 102, baseType: !375)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeap", scope: !349, file: !75, line: 117, baseType: !396, size: 64, offset: 512)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP", file: !75, line: 106, baseType: !375)
!397 = !DILocalVariable(name: "Input", arg: 1, scope: !344, file: !85, line: 209, type: !70)
!398 = !DILocation(line: 209, scope: !344)
!399 = !DILocalVariable(name: "Size", arg: 2, scope: !344, file: !85, line: 210, type: !150)
!400 = !DILocation(line: 210, scope: !344)
!401 = !DILocalVariable(name: "HeapManagerProtocol", arg: 3, scope: !344, file: !85, line: 211, type: !347)
!402 = !DILocation(line: 211, scope: !344)
!403 = !DILocalVariable(name: "cd", scope: !344, file: !85, line: 213, type: !108)
!404 = !DILocation(line: 213, scope: !344)
!405 = !DILocalVariable(name: "Status", scope: !344, file: !85, line: 214, type: !103)
!406 = !DILocation(line: 214, scope: !344)
!407 = !DILocation(line: 215, scope: !344)
!408 = !DILocation(line: 217, scope: !409)
!409 = distinct !DILexicalBlock(scope: !410, file: !85, line: 216)
!410 = distinct !DILexicalBlock(scope: !344, file: !85, line: 215)
!411 = !DILocation(line: 217, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !85, line: 217)
!413 = !DILocation(line: 217, scope: !414)
!414 = distinct !DILexicalBlock(scope: !415, file: !85, line: 217)
!415 = distinct !DILexicalBlock(scope: !412, file: !85, line: 217)
!416 = !DILocation(line: 217, scope: !417)
!417 = distinct !DILexicalBlock(scope: !414, file: !85, line: 217)
!418 = !DILocation(line: 217, scope: !419)
!419 = distinct !DILexicalBlock(scope: !420, file: !85, line: 217)
!420 = distinct !DILexicalBlock(scope: !417, file: !85, line: 217)
!421 = !DILocation(line: 218, scope: !409)
!422 = !DILocalVariable(name: "Output", scope: !344, file: !85, line: 220, type: !362)
!423 = !DILocation(line: 220, scope: !344)
!424 = !DILocation(line: 222, scope: !344)
!425 = !DILocation(line: 223, scope: !426)
!426 = distinct !DILexicalBlock(scope: !427, file: !85, line: 222)
!427 = distinct !DILexicalBlock(scope: !344, file: !85, line: 222)
!428 = !DILocation(line: 224, scope: !426)
!429 = !DILocation(line: 225, scope: !427)
!430 = !DILocation(line: 226, scope: !431)
!431 = distinct !DILexicalBlock(scope: !432, file: !85, line: 225)
!432 = distinct !DILexicalBlock(scope: !427, file: !85, line: 225)
!433 = !DILocation(line: 227, scope: !431)
!434 = !DILocation(line: 228, scope: !432)
!435 = !DILocation(line: 229, scope: !436)
!436 = distinct !DILexicalBlock(scope: !437, file: !85, line: 228)
!437 = distinct !DILexicalBlock(scope: !432, file: !85, line: 228)
!438 = !DILocation(line: 230, scope: !436)
!439 = !DILocation(line: 232, scope: !440)
!440 = distinct !DILexicalBlock(scope: !437, file: !85, line: 231)
!441 = !DILocation(line: 232, scope: !442)
!442 = distinct !DILexicalBlock(scope: !440, file: !85, line: 232)
!443 = !DILocation(line: 232, scope: !444)
!444 = distinct !DILexicalBlock(scope: !445, file: !85, line: 232)
!445 = distinct !DILexicalBlock(scope: !442, file: !85, line: 232)
!446 = !DILocation(line: 232, scope: !447)
!447 = distinct !DILexicalBlock(scope: !444, file: !85, line: 232)
!448 = !DILocation(line: 232, scope: !449)
!449 = distinct !DILexicalBlock(scope: !450, file: !85, line: 232)
!450 = distinct !DILexicalBlock(scope: !447, file: !85, line: 232)
!451 = !DILocation(line: 233, scope: !440)
!452 = !DILocation(line: 228, scope: !437)
!453 = !DILocation(line: 225, scope: !432)
!454 = !DILocalVariable(name: "OutputSize", scope: !344, file: !85, line: 236, type: !65)
!455 = !DILocation(line: 236, scope: !344)
!456 = !DILocalVariable(name: "InputPtr", scope: !344, file: !85, line: 237, type: !70)
!457 = !DILocation(line: 237, scope: !344)
!458 = !DILocalVariable(name: "OutputPtr", scope: !344, file: !85, line: 238, type: !70)
!459 = !DILocation(line: 238, scope: !344)
!460 = !DILocation(line: 239, scope: !344)
!461 = !DILocation(line: 240, scope: !344)
!462 = !DILocation(line: 241, scope: !344)
!463 = !DILocation(line: 242, scope: !344)
!464 = !DILocation(line: 243, scope: !465)
!465 = distinct !DILexicalBlock(scope: !344, file: !85, line: 242)
!466 = !DILocation(line: 245, scope: !344)
!467 = !DILocation(line: 246, scope: !344)
!468 = distinct !DISubprogram(name: "Libxml2Convert", scope: !85, file: !85, line: 250, type: !345, scopeLine: 254, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !115)
!469 = !DILocalVariable(name: "Input", arg: 1, scope: !468, file: !85, line: 251, type: !70)
!470 = !DILocation(line: 251, scope: !468)
!471 = !DILocalVariable(name: "Size", arg: 2, scope: !468, file: !85, line: 252, type: !150)
!472 = !DILocation(line: 252, scope: !468)
!473 = !DILocalVariable(name: "HeapManagerProtocol", arg: 3, scope: !468, file: !85, line: 253, type: !347)
!474 = !DILocation(line: 253, scope: !468)
!475 = !DILocalVariable(name: "cd", scope: !468, file: !85, line: 255, type: !108)
!476 = !DILocation(line: 255, scope: !468)
!477 = !DILocalVariable(name: "Status", scope: !468, file: !85, line: 256, type: !103)
!478 = !DILocation(line: 256, scope: !468)
!479 = !DILocation(line: 257, scope: !468)
!480 = !DILocation(line: 259, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !85, line: 258)
!482 = distinct !DILexicalBlock(scope: !468, file: !85, line: 257)
!483 = !DILocation(line: 259, scope: !484)
!484 = distinct !DILexicalBlock(scope: !481, file: !85, line: 259)
!485 = !DILocation(line: 259, scope: !486)
!486 = distinct !DILexicalBlock(scope: !487, file: !85, line: 259)
!487 = distinct !DILexicalBlock(scope: !484, file: !85, line: 259)
!488 = !DILocation(line: 259, scope: !489)
!489 = distinct !DILexicalBlock(scope: !486, file: !85, line: 259)
!490 = !DILocation(line: 259, scope: !491)
!491 = distinct !DILexicalBlock(scope: !492, file: !85, line: 259)
!492 = distinct !DILexicalBlock(scope: !489, file: !85, line: 259)
!493 = !DILocation(line: 260, scope: !481)
!494 = !DILocalVariable(name: "Output", scope: !468, file: !85, line: 262, type: !362)
!495 = !DILocation(line: 262, scope: !468)
!496 = !DILocation(line: 264, scope: !468)
!497 = !DILocation(line: 265, scope: !498)
!498 = distinct !DILexicalBlock(scope: !499, file: !85, line: 264)
!499 = distinct !DILexicalBlock(scope: !468, file: !85, line: 264)
!500 = !DILocation(line: 266, scope: !498)
!501 = !DILocation(line: 267, scope: !499)
!502 = !DILocation(line: 268, scope: !503)
!503 = distinct !DILexicalBlock(scope: !504, file: !85, line: 267)
!504 = distinct !DILexicalBlock(scope: !499, file: !85, line: 267)
!505 = !DILocation(line: 269, scope: !503)
!506 = !DILocation(line: 270, scope: !504)
!507 = !DILocation(line: 271, scope: !508)
!508 = distinct !DILexicalBlock(scope: !509, file: !85, line: 270)
!509 = distinct !DILexicalBlock(scope: !504, file: !85, line: 270)
!510 = !DILocation(line: 272, scope: !508)
!511 = !DILocation(line: 274, scope: !512)
!512 = distinct !DILexicalBlock(scope: !509, file: !85, line: 273)
!513 = !DILocation(line: 274, scope: !514)
!514 = distinct !DILexicalBlock(scope: !512, file: !85, line: 274)
!515 = !DILocation(line: 274, scope: !516)
!516 = distinct !DILexicalBlock(scope: !517, file: !85, line: 274)
!517 = distinct !DILexicalBlock(scope: !514, file: !85, line: 274)
!518 = !DILocation(line: 274, scope: !519)
!519 = distinct !DILexicalBlock(scope: !516, file: !85, line: 274)
!520 = !DILocation(line: 274, scope: !521)
!521 = distinct !DILexicalBlock(scope: !522, file: !85, line: 274)
!522 = distinct !DILexicalBlock(scope: !519, file: !85, line: 274)
!523 = !DILocation(line: 275, scope: !512)
!524 = !DILocation(line: 270, scope: !509)
!525 = !DILocation(line: 267, scope: !504)
!526 = !DILocation(line: 277, scope: !468)
!527 = !DILocation(line: 278, scope: !528)
!528 = distinct !DILexicalBlock(scope: !468, file: !85, line: 277)
!529 = !DILocalVariable(name: "OutputSize", scope: !468, file: !85, line: 279, type: !65)
!530 = !DILocation(line: 279, scope: !468)
!531 = !DILocalVariable(name: "InputPtr", scope: !468, file: !85, line: 280, type: !70)
!532 = !DILocation(line: 280, scope: !468)
!533 = !DILocalVariable(name: "OutputPtr", scope: !468, file: !85, line: 281, type: !70)
!534 = !DILocation(line: 281, scope: !468)
!535 = !DILocation(line: 282, scope: !468)
!536 = !DILocation(line: 283, scope: !468)
!537 = !DILocation(line: 284, scope: !468)
!538 = !DILocation(line: 285, scope: !468)
!539 = !DILocation(line: 286, scope: !540)
!540 = distinct !DILexicalBlock(scope: !468, file: !85, line: 285)
!541 = !DILocation(line: 288, scope: !468)
!542 = !DILocation(line: 289, scope: !468)
!543 = distinct !DISubprogram(name: "PkexecConvert", scope: !85, file: !85, line: 293, type: !345, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !115)
!544 = !DILocalVariable(name: "Input", arg: 1, scope: !543, file: !85, line: 294, type: !70)
!545 = !DILocation(line: 294, scope: !543)
!546 = !DILocalVariable(name: "Size", arg: 2, scope: !543, file: !85, line: 295, type: !150)
!547 = !DILocation(line: 295, scope: !543)
!548 = !DILocalVariable(name: "HeapManagerProtocol", arg: 3, scope: !543, file: !85, line: 296, type: !347)
!549 = !DILocation(line: 296, scope: !543)
!550 = !DILocalVariable(name: "cd", scope: !543, file: !85, line: 298, type: !108)
!551 = !DILocation(line: 298, scope: !543)
!552 = !DILocalVariable(name: "Status", scope: !543, file: !85, line: 299, type: !103)
!553 = !DILocation(line: 299, scope: !543)
!554 = !DILocation(line: 300, scope: !543)
!555 = !DILocation(line: 302, scope: !556)
!556 = distinct !DILexicalBlock(scope: !557, file: !85, line: 301)
!557 = distinct !DILexicalBlock(scope: !543, file: !85, line: 300)
!558 = !DILocation(line: 302, scope: !559)
!559 = distinct !DILexicalBlock(scope: !556, file: !85, line: 302)
!560 = !DILocation(line: 302, scope: !561)
!561 = distinct !DILexicalBlock(scope: !562, file: !85, line: 302)
!562 = distinct !DILexicalBlock(scope: !559, file: !85, line: 302)
!563 = !DILocation(line: 302, scope: !564)
!564 = distinct !DILexicalBlock(scope: !561, file: !85, line: 302)
!565 = !DILocation(line: 302, scope: !566)
!566 = distinct !DILexicalBlock(scope: !567, file: !85, line: 302)
!567 = distinct !DILexicalBlock(scope: !564, file: !85, line: 302)
!568 = !DILocation(line: 303, scope: !556)
!569 = !DILocalVariable(name: "Output", scope: !543, file: !85, line: 305, type: !362)
!570 = !DILocation(line: 305, scope: !543)
!571 = !DILocation(line: 307, scope: !543)
!572 = !DILocation(line: 308, scope: !573)
!573 = distinct !DILexicalBlock(scope: !574, file: !85, line: 307)
!574 = distinct !DILexicalBlock(scope: !543, file: !85, line: 307)
!575 = !DILocation(line: 309, scope: !573)
!576 = !DILocation(line: 310, scope: !574)
!577 = !DILocation(line: 311, scope: !578)
!578 = distinct !DILexicalBlock(scope: !579, file: !85, line: 310)
!579 = distinct !DILexicalBlock(scope: !574, file: !85, line: 310)
!580 = !DILocation(line: 312, scope: !578)
!581 = !DILocation(line: 313, scope: !579)
!582 = !DILocation(line: 314, scope: !583)
!583 = distinct !DILexicalBlock(scope: !584, file: !85, line: 313)
!584 = distinct !DILexicalBlock(scope: !579, file: !85, line: 313)
!585 = !DILocation(line: 315, scope: !583)
!586 = !DILocation(line: 317, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !85, line: 316)
!588 = !DILocation(line: 317, scope: !589)
!589 = distinct !DILexicalBlock(scope: !587, file: !85, line: 317)
!590 = !DILocation(line: 317, scope: !591)
!591 = distinct !DILexicalBlock(scope: !592, file: !85, line: 317)
!592 = distinct !DILexicalBlock(scope: !589, file: !85, line: 317)
!593 = !DILocation(line: 317, scope: !594)
!594 = distinct !DILexicalBlock(scope: !591, file: !85, line: 317)
!595 = !DILocation(line: 317, scope: !596)
!596 = distinct !DILexicalBlock(scope: !597, file: !85, line: 317)
!597 = distinct !DILexicalBlock(scope: !594, file: !85, line: 317)
!598 = !DILocation(line: 318, scope: !587)
!599 = !DILocation(line: 313, scope: !584)
!600 = !DILocation(line: 310, scope: !579)
!601 = !DILocation(line: 320, scope: !543)
!602 = !DILocation(line: 321, scope: !603)
!603 = distinct !DILexicalBlock(scope: !543, file: !85, line: 320)
!604 = !DILocalVariable(name: "OutputSize", scope: !543, file: !85, line: 322, type: !65)
!605 = !DILocation(line: 322, scope: !543)
!606 = !DILocalVariable(name: "InputPtr", scope: !543, file: !85, line: 323, type: !70)
!607 = !DILocation(line: 323, scope: !543)
!608 = !DILocalVariable(name: "OutputPtr", scope: !543, file: !85, line: 324, type: !70)
!609 = !DILocation(line: 324, scope: !543)
!610 = !DILocation(line: 325, scope: !543)
!611 = !DILocation(line: 326, scope: !543)
!612 = !DILocation(line: 327, scope: !543)
!613 = !DILocation(line: 328, scope: !543)
!614 = !DILocation(line: 329, scope: !615)
!615 = distinct !DILexicalBlock(scope: !543, file: !85, line: 328)
!616 = !DILocation(line: 331, scope: !543)
!617 = !DILocation(line: 332, scope: !543)
!618 = distinct !DISubprogram(name: "CharConverterEntryPoint", scope: !85, file: !85, line: 336, type: !619, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !115)
!619 = !DISubroutineType(types: !620)
!620 = !{!103, !621, !622}
!621 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE", file: !104, line: 33, baseType: !53)
!622 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !623, size: 64)
!623 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SYSTEM_TABLE", file: !14, line: 2053, baseType: !624)
!624 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SYSTEM_TABLE", file: !14, line: 1992, size: 960, elements: !625)
!625 = !{!626, !635, !636, !637, !638, !662, !663, !718, !719, !720, !857, !1115, !1116}
!626 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !624, file: !14, line: 1996, baseType: !627, size: 192)
!627 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TABLE_HEADER", file: !6, line: 177, baseType: !628)
!628 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TABLE_HEADER", file: !6, line: 150, size: 192, elements: !629)
!629 = !{!630, !631, !632, !633, !634}
!630 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !628, file: !6, line: 156, baseType: !58, size: 64)
!631 = !DIDerivedType(tag: DW_TAG_member, name: "Revision", scope: !628, file: !6, line: 163, baseType: !90, size: 32, offset: 64)
!632 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !628, file: !6, line: 167, baseType: !90, size: 32, offset: 96)
!633 = !DIDerivedType(tag: DW_TAG_member, name: "CRC32", scope: !628, file: !6, line: 172, baseType: !90, size: 32, offset: 128)
!634 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !628, file: !6, line: 176, baseType: !90, size: 32, offset: 160)
!635 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareVendor", scope: !624, file: !14, line: 2001, baseType: !62, size: 64, offset: 192)
!636 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareRevision", scope: !624, file: !14, line: 2006, baseType: !90, size: 32, offset: 256)
!637 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleInHandle", scope: !624, file: !14, line: 2011, baseType: !621, size: 64, offset: 320)
!638 = !DIDerivedType(tag: DW_TAG_member, name: "ConIn", scope: !624, file: !14, line: 2016, baseType: !639, size: 64, offset: 384)
!639 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !640, size: 64)
!640 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !641, line: 20, baseType: !642)
!641 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextIn.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "239cf4f3dddb25a8596c70fa738413fd")
!642 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !641, line: 116, size: 192, elements: !643)
!643 = !{!644, !649, !660}
!644 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !642, file: !641, line: 117, baseType: !645, size: 64)
!645 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_RESET", file: !641, line: 86, baseType: !646)
!646 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !647, size: 64)
!647 = !DISubroutineType(types: !648)
!648 = !{!103, !639, !68}
!649 = !DIDerivedType(tag: DW_TAG_member, name: "ReadKeyStroke", scope: !642, file: !641, line: 118, baseType: !650, size: 64, offset: 64)
!650 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_READ_KEY", file: !641, line: 107, baseType: !651)
!651 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !652, size: 64)
!652 = !DISubroutineType(types: !653)
!653 = !{!103, !639, !654}
!654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !655, size: 64)
!655 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_KEY", file: !641, line: 38, baseType: !656)
!656 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_INPUT_KEY", file: !641, line: 35, size: 32, elements: !657)
!657 = !{!658, !659}
!658 = !DIDerivedType(tag: DW_TAG_member, name: "ScanCode", scope: !656, file: !641, line: 36, baseType: !284, size: 16)
!659 = !DIDerivedType(tag: DW_TAG_member, name: "UnicodeChar", scope: !656, file: !641, line: 37, baseType: !60, size: 16, offset: 16)
!660 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForKey", scope: !642, file: !641, line: 122, baseType: !661, size: 64, offset: 128)
!661 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT", file: !104, line: 37, baseType: !53)
!662 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleOutHandle", scope: !624, file: !14, line: 2020, baseType: !621, size: 64, offset: 448)
!663 = !DIDerivedType(tag: DW_TAG_member, name: "ConOut", scope: !624, file: !14, line: 2025, baseType: !664, size: 64, offset: 512)
!664 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !665, size: 64)
!665 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !666, line: 27, baseType: !667)
!666 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextOut.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "685bec042927ad46d31bf42ae7f6ddcd")
!667 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !666, line: 387, size: 640, elements: !668)
!668 = !{!669, !674, !679, !681, !687, !692, !694, !699, !704, !706}
!669 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !667, file: !666, line: 388, baseType: !670, size: 64)
!670 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_RESET", file: !666, line: 167, baseType: !671)
!671 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !672, size: 64)
!672 = !DISubroutineType(types: !673)
!673 = !{!103, !664, !68}
!674 = !DIDerivedType(tag: DW_TAG_member, name: "OutputString", scope: !667, file: !666, line: 390, baseType: !675, size: 64, offset: 64)
!675 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_STRING", file: !666, line: 192, baseType: !676)
!676 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !677, size: 64)
!677 = !DISubroutineType(types: !678)
!678 = !{!103, !664, !62}
!679 = !DIDerivedType(tag: DW_TAG_member, name: "TestString", scope: !667, file: !666, line: 391, baseType: !680, size: 64, offset: 128)
!680 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_TEST_STRING", file: !666, line: 213, baseType: !676)
!681 = !DIDerivedType(tag: DW_TAG_member, name: "QueryMode", scope: !667, file: !666, line: 393, baseType: !682, size: 64, offset: 192)
!682 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_QUERY_MODE", file: !666, line: 236, baseType: !683)
!683 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !684, size: 64)
!684 = !DISubroutineType(types: !685)
!685 = !{!103, !664, !56, !686, !686}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!687 = !DIDerivedType(tag: DW_TAG_member, name: "SetMode", scope: !667, file: !666, line: 394, baseType: !688, size: 64, offset: 256)
!688 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_MODE", file: !666, line: 256, baseType: !689)
!689 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !690, size: 64)
!690 = !DISubroutineType(types: !691)
!691 = !{!103, !664, !56}
!692 = !DIDerivedType(tag: DW_TAG_member, name: "SetAttribute", scope: !667, file: !666, line: 395, baseType: !693, size: 64, offset: 320)
!693 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_ATTRIBUTE", file: !666, line: 277, baseType: !689)
!694 = !DIDerivedType(tag: DW_TAG_member, name: "ClearScreen", scope: !667, file: !666, line: 397, baseType: !695, size: 64, offset: 384)
!695 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_CLEAR_SCREEN", file: !666, line: 295, baseType: !696)
!696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !697, size: 64)
!697 = !DISubroutineType(types: !698)
!698 = !{!103, !664}
!699 = !DIDerivedType(tag: DW_TAG_member, name: "SetCursorPosition", scope: !667, file: !666, line: 398, baseType: !700, size: 64, offset: 448)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_CURSOR_POSITION", file: !666, line: 318, baseType: !701)
!701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !702, size: 64)
!702 = !DISubroutineType(types: !703)
!703 = !{!103, !664, !56, !56}
!704 = !DIDerivedType(tag: DW_TAG_member, name: "EnableCursor", scope: !667, file: !666, line: 399, baseType: !705, size: 64, offset: 512)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_ENABLE_CURSOR", file: !666, line: 340, baseType: !671)
!706 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !667, file: !666, line: 404, baseType: !707, size: 64, offset: 576)
!707 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64)
!708 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !666, line: 379, baseType: !709)
!709 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !666, line: 349, size: 192, elements: !710)
!710 = !{!711, !713, !714, !715, !716, !717}
!711 = !DIDerivedType(tag: DW_TAG_member, name: "MaxMode", scope: !709, file: !666, line: 353, baseType: !712, size: 32)
!712 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT32", file: !57, line: 174, baseType: !76)
!713 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !709, file: !666, line: 362, baseType: !712, size: 32, offset: 32)
!714 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !709, file: !666, line: 366, baseType: !712, size: 32, offset: 64)
!715 = !DIDerivedType(tag: DW_TAG_member, name: "CursorColumn", scope: !709, file: !666, line: 370, baseType: !712, size: 32, offset: 96)
!716 = !DIDerivedType(tag: DW_TAG_member, name: "CursorRow", scope: !709, file: !666, line: 374, baseType: !712, size: 32, offset: 128)
!717 = !DIDerivedType(tag: DW_TAG_member, name: "CursorVisible", scope: !709, file: !666, line: 378, baseType: !68, size: 8, offset: 160)
!718 = !DIDerivedType(tag: DW_TAG_member, name: "StandardErrorHandle", scope: !624, file: !14, line: 2030, baseType: !621, size: 64, offset: 576)
!719 = !DIDerivedType(tag: DW_TAG_member, name: "StdErr", scope: !624, file: !14, line: 2035, baseType: !664, size: 64, offset: 640)
!720 = !DIDerivedType(tag: DW_TAG_member, name: "RuntimeServices", scope: !624, file: !14, line: 2039, baseType: !721, size: 64, offset: 704)
!721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !722, size: 64)
!722 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1871, baseType: !723)
!723 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1828, size: 1088, elements: !724)
!724 = !{!725, !726, !755, !760, !766, !771, !787, !792, !810, !815, !820, !825, !831, !845, !852}
!725 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !723, file: !14, line: 1832, baseType: !627, size: 192)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "GetTime", scope: !723, file: !14, line: 1837, baseType: !727, size: 64, offset: 192)
!727 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_TIME", file: !14, line: 816, baseType: !728)
!728 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !729, size: 64)
!729 = !DISubroutineType(types: !730)
!730 = !{!103, !731, !748}
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64)
!732 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME", file: !104, line: 80, baseType: !733)
!733 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME", file: !104, line: 68, size: 128, elements: !734)
!734 = !{!735, !736, !737, !738, !739, !740, !741, !742, !743, !746, !747}
!735 = !DIDerivedType(tag: DW_TAG_member, name: "Year", scope: !733, file: !104, line: 69, baseType: !284, size: 16)
!736 = !DIDerivedType(tag: DW_TAG_member, name: "Month", scope: !733, file: !104, line: 70, baseType: !267, size: 8, offset: 16)
!737 = !DIDerivedType(tag: DW_TAG_member, name: "Day", scope: !733, file: !104, line: 71, baseType: !267, size: 8, offset: 24)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "Hour", scope: !733, file: !104, line: 72, baseType: !267, size: 8, offset: 32)
!739 = !DIDerivedType(tag: DW_TAG_member, name: "Minute", scope: !733, file: !104, line: 73, baseType: !267, size: 8, offset: 40)
!740 = !DIDerivedType(tag: DW_TAG_member, name: "Second", scope: !733, file: !104, line: 74, baseType: !267, size: 8, offset: 48)
!741 = !DIDerivedType(tag: DW_TAG_member, name: "Pad1", scope: !733, file: !104, line: 75, baseType: !267, size: 8, offset: 56)
!742 = !DIDerivedType(tag: DW_TAG_member, name: "Nanosecond", scope: !733, file: !104, line: 76, baseType: !90, size: 32, offset: 64)
!743 = !DIDerivedType(tag: DW_TAG_member, name: "TimeZone", scope: !733, file: !104, line: 77, baseType: !744, size: 16, offset: 96)
!744 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT16", file: !57, line: 187, baseType: !745)
!745 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!746 = !DIDerivedType(tag: DW_TAG_member, name: "Daylight", scope: !733, file: !104, line: 78, baseType: !267, size: 8, offset: 112)
!747 = !DIDerivedType(tag: DW_TAG_member, name: "Pad2", scope: !733, file: !104, line: 79, baseType: !267, size: 8, offset: 120)
!748 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !749, size: 64)
!749 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME_CAPABILITIES", file: !14, line: 799, baseType: !750)
!750 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME_CAPABILITIES", file: !14, line: 776, size: 96, elements: !751)
!751 = !{!752, !753, !754}
!752 = !DIDerivedType(tag: DW_TAG_member, name: "Resolution", scope: !750, file: !14, line: 783, baseType: !90, size: 32)
!753 = !DIDerivedType(tag: DW_TAG_member, name: "Accuracy", scope: !750, file: !14, line: 790, baseType: !90, size: 32, offset: 32)
!754 = !DIDerivedType(tag: DW_TAG_member, name: "SetsToZero", scope: !750, file: !14, line: 798, baseType: !68, size: 8, offset: 64)
!755 = !DIDerivedType(tag: DW_TAG_member, name: "SetTime", scope: !723, file: !14, line: 1838, baseType: !756, size: 64, offset: 256)
!756 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIME", file: !14, line: 833, baseType: !757)
!757 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !758, size: 64)
!758 = !DISubroutineType(types: !759)
!759 = !{!103, !731}
!760 = !DIDerivedType(tag: DW_TAG_member, name: "GetWakeupTime", scope: !723, file: !14, line: 1839, baseType: !761, size: 64, offset: 320)
!761 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_WAKEUP_TIME", file: !14, line: 854, baseType: !762)
!762 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !763, size: 64)
!763 = !DISubroutineType(types: !764)
!764 = !{!103, !765, !765, !731}
!765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!766 = !DIDerivedType(tag: DW_TAG_member, name: "SetWakeupTime", scope: !723, file: !14, line: 1840, baseType: !767, size: 64, offset: 384)
!767 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WAKEUP_TIME", file: !14, line: 876, baseType: !768)
!768 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !769, size: 64)
!769 = !DISubroutineType(types: !770)
!770 = !{!103, !68, !731}
!771 = !DIDerivedType(tag: DW_TAG_member, name: "SetVirtualAddressMap", scope: !723, file: !14, line: 1845, baseType: !772, size: 64, offset: 448)
!772 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VIRTUAL_ADDRESS_MAP", file: !14, line: 327, baseType: !773)
!773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !774, size: 64)
!774 = !DISubroutineType(types: !775)
!775 = !{!103, !56, !56, !90, !776}
!776 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !777, size: 64)
!777 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 175, baseType: !778)
!778 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 143, size: 320, elements: !779)
!779 = !{!780, !781, !783, !785, !786}
!780 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !778, file: !14, line: 149, baseType: !90, size: 32)
!781 = !DIDerivedType(tag: DW_TAG_member, name: "PhysicalStart", scope: !778, file: !14, line: 155, baseType: !782, size: 64, offset: 64)
!782 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PHYSICAL_ADDRESS", file: !104, line: 50, baseType: !58)
!783 = !DIDerivedType(tag: DW_TAG_member, name: "VirtualStart", scope: !778, file: !14, line: 161, baseType: !784, size: 64, offset: 128)
!784 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_VIRTUAL_ADDRESS", file: !104, line: 55, baseType: !58)
!785 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfPages", scope: !778, file: !14, line: 168, baseType: !58, size: 64, offset: 192)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !778, file: !14, line: 174, baseType: !58, size: 64, offset: 256)
!787 = !DIDerivedType(tag: DW_TAG_member, name: "ConvertPointer", scope: !723, file: !14, line: 1846, baseType: !788, size: 64, offset: 512)
!788 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONVERT_POINTER", file: !14, line: 422, baseType: !789)
!789 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64)
!790 = !DISubroutineType(types: !791)
!791 = !{!103, !56, !71}
!792 = !DIDerivedType(tag: DW_TAG_member, name: "GetVariable", scope: !723, file: !14, line: 1851, baseType: !793, size: 64, offset: 576)
!793 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_VARIABLE", file: !14, line: 686, baseType: !794)
!794 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !795, size: 64)
!795 = !DISubroutineType(types: !796)
!796 = !{!103, !62, !797, !809, !686, !53}
!797 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !798, size: 64)
!798 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GUID", file: !104, line: 25, baseType: !799)
!799 = !DIDerivedType(tag: DW_TAG_typedef, name: "GUID", file: !55, line: 218, baseType: !800)
!800 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GUID", file: !55, line: 213, size: 128, elements: !801)
!801 = !{!802, !803, !804, !805}
!802 = !DIDerivedType(tag: DW_TAG_member, name: "Data1", scope: !800, file: !55, line: 214, baseType: !90, size: 32)
!803 = !DIDerivedType(tag: DW_TAG_member, name: "Data2", scope: !800, file: !55, line: 215, baseType: !284, size: 16, offset: 32)
!804 = !DIDerivedType(tag: DW_TAG_member, name: "Data3", scope: !800, file: !55, line: 216, baseType: !284, size: 16, offset: 48)
!805 = !DIDerivedType(tag: DW_TAG_member, name: "Data4", scope: !800, file: !55, line: 217, baseType: !806, size: 64, offset: 64)
!806 = !DICompositeType(tag: DW_TAG_array_type, baseType: !267, size: 64, elements: !807)
!807 = !{!808}
!808 = !DISubrange(count: 8)
!809 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextVariableName", scope: !723, file: !14, line: 1852, baseType: !811, size: 64, offset: 640)
!811 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_VARIABLE_NAME", file: !14, line: 722, baseType: !812)
!812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !813, size: 64)
!813 = !DISubroutineType(types: !814)
!814 = !{!103, !686, !62, !797}
!815 = !DIDerivedType(tag: DW_TAG_member, name: "SetVariable", scope: !723, file: !14, line: 1853, baseType: !816, size: 64, offset: 704)
!816 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VARIABLE", file: !14, line: 764, baseType: !817)
!817 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !818, size: 64)
!818 = !DISubroutineType(types: !819)
!819 = !{!103, !62, !797, !90, !56, !53}
!820 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextHighMonotonicCount", scope: !723, file: !14, line: 1858, baseType: !821, size: 64, offset: 768)
!821 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_HIGH_MONO_COUNT", file: !14, line: 1097, baseType: !822)
!822 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !823, size: 64)
!823 = !DISubroutineType(types: !824)
!824 = !{!103, !809}
!825 = !DIDerivedType(tag: DW_TAG_member, name: "ResetSystem", scope: !723, file: !14, line: 1859, baseType: !826, size: 64, offset: 832)
!826 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_SYSTEM", file: !14, line: 1062, baseType: !827)
!827 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !828, size: 64)
!828 = !DISubroutineType(types: !829)
!829 = !{null, !830, !103, !56, !53}
!830 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_TYPE", file: !6, line: 145, baseType: !5)
!831 = !DIDerivedType(tag: DW_TAG_member, name: "UpdateCapsule", scope: !723, file: !14, line: 1864, baseType: !832, size: 64, offset: 896)
!832 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UPDATE_CAPSULE", file: !14, line: 1723, baseType: !833)
!833 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !834, size: 64)
!834 = !DISubroutineType(types: !835)
!835 = !{!103, !836, !56, !782}
!836 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !837, size: 64)
!837 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !838, size: 64)
!838 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CAPSULE_HEADER", file: !14, line: 1669, baseType: !839)
!839 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CAPSULE_HEADER", file: !14, line: 1648, size: 224, elements: !840)
!840 = !{!841, !842, !843, !844}
!841 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleGuid", scope: !839, file: !14, line: 1652, baseType: !798, size: 128)
!842 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !839, file: !14, line: 1658, baseType: !90, size: 32, offset: 128)
!843 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !839, file: !14, line: 1664, baseType: !90, size: 32, offset: 160)
!844 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleImageSize", scope: !839, file: !14, line: 1668, baseType: !90, size: 32, offset: 192)
!845 = !DIDerivedType(tag: DW_TAG_member, name: "QueryCapsuleCapabilities", scope: !723, file: !14, line: 1865, baseType: !846, size: 64, offset: 960)
!846 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_CAPSULE_CAPABILITIES", file: !14, line: 1754, baseType: !847)
!847 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !848, size: 64)
!848 = !DISubroutineType(types: !849)
!849 = !{!103, !836, !56, !850, !851}
!850 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!851 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !830, size: 64)
!852 = !DIDerivedType(tag: DW_TAG_member, name: "QueryVariableInfo", scope: !723, file: !14, line: 1870, baseType: !853, size: 64, offset: 1024)
!853 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_VARIABLE_INFO", file: !14, line: 1785, baseType: !854)
!854 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !855, size: 64)
!855 = !DISubroutineType(types: !856)
!856 = !{!103, !90, !850, !850, !850}
!857 = !DIDerivedType(tag: DW_TAG_member, name: "BootServices", scope: !624, file: !14, line: 2043, baseType: !858, size: 64, offset: 768)
!858 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !859, size: 64)
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_BOOT_SERVICES", file: !14, line: 1972, baseType: !860)
!860 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_BOOT_SERVICES", file: !14, line: 1879, size: 3008, elements: !861)
!861 = !{!862, !863, !869, !874, !882, !887, !892, !897, !902, !912, !918, !923, !928, !930, !932, !939, !944, !949, !954, !955, !960, !966, !983, !988, !993, !999, !1004, !1009, !1014, !1019, !1024, !1029, !1034, !1039, !1044, !1049, !1063, !1070, !1076, !1081, !1086, !1091, !1096, !1101, !1106}
!862 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !860, file: !14, line: 1883, baseType: !627, size: 192)
!863 = !DIDerivedType(tag: DW_TAG_member, name: "RaiseTPL", scope: !860, file: !14, line: 1888, baseType: !864, size: 64, offset: 192)
!864 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RAISE_TPL", file: !14, line: 644, baseType: !865)
!865 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !866, size: 64)
!866 = !DISubroutineType(types: !867)
!867 = !{!868, !868}
!868 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TPL", file: !104, line: 41, baseType: !56)
!869 = !DIDerivedType(tag: DW_TAG_member, name: "RestoreTPL", scope: !860, file: !14, line: 1889, baseType: !870, size: 64, offset: 256)
!870 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESTORE_TPL", file: !14, line: 656, baseType: !871)
!871 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !872, size: 64)
!872 = !DISubroutineType(types: !873)
!873 = !{null, !868}
!874 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePages", scope: !860, file: !14, line: 1894, baseType: !875, size: 64, offset: 320)
!875 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_PAGES", file: !14, line: 203, baseType: !876)
!876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!877 = !DISubroutineType(types: !878)
!878 = !{!103, !879, !880, !56, !881}
!879 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_TYPE", file: !14, line: 47, baseType: !13)
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_TYPE", file: !6, line: 112, baseType: !20)
!881 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !782, size: 64)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "FreePages", scope: !860, file: !14, line: 1895, baseType: !883, size: 64, offset: 384)
!883 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_PAGES", file: !14, line: 224, baseType: !884)
!884 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !885, size: 64)
!885 = !DISubroutineType(types: !886)
!886 = !{!103, !782, !56}
!887 = !DIDerivedType(tag: DW_TAG_member, name: "GetMemoryMap", scope: !860, file: !14, line: 1896, baseType: !888, size: 64, offset: 448)
!888 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_MEMORY_MAP", file: !14, line: 256, baseType: !889)
!889 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !890, size: 64)
!890 = !DISubroutineType(types: !891)
!891 = !{!103, !686, !776, !686, !686, !809}
!892 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePool", scope: !860, file: !14, line: 1897, baseType: !893, size: 64, offset: 512)
!893 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_POOL", file: !14, line: 285, baseType: !894)
!894 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !895, size: 64)
!895 = !DISubroutineType(types: !896)
!896 = !{!103, !880, !56, !71}
!897 = !DIDerivedType(tag: DW_TAG_member, name: "FreePool", scope: !860, file: !14, line: 1898, baseType: !898, size: 64, offset: 576)
!898 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_POOL", file: !14, line: 302, baseType: !899)
!899 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !900, size: 64)
!900 = !DISubroutineType(types: !901)
!901 = !{!103, !53}
!902 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEvent", scope: !860, file: !14, line: 1903, baseType: !903, size: 64, offset: 640)
!903 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT", file: !14, line: 480, baseType: !904)
!904 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !905, size: 64)
!905 = !DISubroutineType(types: !906)
!906 = !{!103, !90, !868, !907, !53, !911}
!907 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT_NOTIFY", file: !14, line: 457, baseType: !908)
!908 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !909, size: 64)
!909 = !DISubroutineType(types: !910)
!910 = !{null, !661, !53}
!911 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !661, size: 64)
!912 = !DIDerivedType(tag: DW_TAG_member, name: "SetTimer", scope: !860, file: !14, line: 1904, baseType: !913, size: 64, offset: 704)
!913 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIMER", file: !14, line: 554, baseType: !914)
!914 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !915, size: 64)
!915 = !DISubroutineType(types: !916)
!916 = !{!103, !661, !917, !58}
!917 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIMER_DELAY", file: !14, line: 534, baseType: !39)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForEvent", scope: !860, file: !14, line: 1905, baseType: !919, size: 64, offset: 768)
!919 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_WAIT_FOR_EVENT", file: !14, line: 590, baseType: !920)
!920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !921, size: 64)
!921 = !DISubroutineType(types: !922)
!922 = !{!103, !56, !911, !686}
!923 = !DIDerivedType(tag: DW_TAG_member, name: "SignalEvent", scope: !860, file: !14, line: 1906, baseType: !924, size: 64, offset: 832)
!924 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIGNAL_EVENT", file: !14, line: 570, baseType: !925)
!925 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64)
!926 = !DISubroutineType(types: !927)
!927 = !{!103, !661}
!928 = !DIDerivedType(tag: DW_TAG_member, name: "CloseEvent", scope: !860, file: !14, line: 1907, baseType: !929, size: 64, offset: 896)
!929 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_EVENT", file: !14, line: 606, baseType: !925)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "CheckEvent", scope: !860, file: !14, line: 1908, baseType: !931, size: 64, offset: 960)
!931 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CHECK_EVENT", file: !14, line: 622, baseType: !925)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "InstallProtocolInterface", scope: !860, file: !14, line: 1913, baseType: !933, size: 64, offset: 1024)
!933 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_PROTOCOL_INTERFACE", file: !14, line: 1188, baseType: !934)
!934 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !935, size: 64)
!935 = !DISubroutineType(types: !936)
!936 = !{!103, !937, !797, !938, !53}
!937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !621, size: 64)
!938 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INTERFACE_TYPE", file: !14, line: 1164, baseType: !44)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "ReinstallProtocolInterface", scope: !860, file: !14, line: 1914, baseType: !940, size: 64, offset: 1088)
!940 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1238, baseType: !941)
!941 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !942, size: 64)
!942 = !DISubroutineType(types: !943)
!943 = !{!103, !621, !797, !53, !53}
!944 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallProtocolInterface", scope: !860, file: !14, line: 1915, baseType: !945, size: 64, offset: 1152)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1264, baseType: !946)
!946 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !947, size: 64)
!947 = !DISubroutineType(types: !948)
!948 = !{!103, !621, !797, !53}
!949 = !DIDerivedType(tag: DW_TAG_member, name: "HandleProtocol", scope: !860, file: !14, line: 1916, baseType: !950, size: 64, offset: 1216)
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE_PROTOCOL", file: !14, line: 1305, baseType: !951)
!951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !952, size: 64)
!952 = !DISubroutineType(types: !953)
!953 = !{!103, !621, !797, !71}
!954 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !860, file: !14, line: 1917, baseType: !53, size: 64, offset: 1280)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "RegisterProtocolNotify", scope: !860, file: !14, line: 1918, baseType: !956, size: 64, offset: 1344)
!956 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REGISTER_PROTOCOL_NOTIFY", file: !14, line: 1466, baseType: !957)
!957 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !958, size: 64)
!958 = !DISubroutineType(types: !959)
!959 = !{!103, !797, !661, !71}
!960 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandle", scope: !860, file: !14, line: 1919, baseType: !961, size: 64, offset: 1408)
!961 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE", file: !14, line: 1515, baseType: !962)
!962 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !963, size: 64)
!963 = !DISubroutineType(types: !964)
!964 = !{!103, !965, !797, !53, !686, !937}
!965 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_SEARCH_TYPE", file: !14, line: 1489, baseType: !47)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "LocateDevicePath", scope: !860, file: !14, line: 1920, baseType: !967, size: 64, offset: 1472)
!967 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_DEVICE_PATH", file: !14, line: 1541, baseType: !968)
!968 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !969, size: 64)
!969 = !DISubroutineType(types: !970)
!970 = !{!103, !797, !971, !937}
!971 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !972, size: 64)
!972 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !973, size: 64)
!973 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DEVICE_PATH_PROTOCOL", file: !974, line: 58, baseType: !975)
!974 = !DIFile(filename: "MdePkg/Include/Protocol/DevicePath.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6b6d593d171f69b933a87911e52d4607")
!975 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_DEVICE_PATH_PROTOCOL", file: !974, line: 43, size: 32, elements: !976)
!976 = !{!977, !978, !979}
!977 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !975, file: !974, line: 44, baseType: !267, size: 8)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "SubType", scope: !975, file: !974, line: 51, baseType: !267, size: 8, offset: 8)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "Length", scope: !975, file: !974, line: 56, baseType: !980, size: 16, offset: 16)
!980 = !DICompositeType(tag: DW_TAG_array_type, baseType: !267, size: 16, elements: !981)
!981 = !{!982}
!982 = !DISubrange(count: 2)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "InstallConfigurationTable", scope: !860, file: !14, line: 1921, baseType: !984, size: 64, offset: 1536)
!984 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_CONFIGURATION_TABLE", file: !14, line: 1562, baseType: !985)
!985 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !986, size: 64)
!986 = !DISubroutineType(types: !987)
!987 = !{!103, !797, !53}
!988 = !DIDerivedType(tag: DW_TAG_member, name: "LoadImage", scope: !860, file: !14, line: 1926, baseType: !989, size: 64, offset: 1600)
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_LOAD", file: !14, line: 913, baseType: !990)
!990 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !991, size: 64)
!991 = !DISubroutineType(types: !992)
!992 = !{!103, !68, !621, !972, !53, !56, !937}
!993 = !DIDerivedType(tag: DW_TAG_member, name: "StartImage", scope: !860, file: !14, line: 1927, baseType: !994, size: 64, offset: 1664)
!994 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_START", file: !14, line: 938, baseType: !995)
!995 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !996, size: 64)
!996 = !DISubroutineType(types: !997)
!997 = !{!103, !621, !686, !998}
!998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!999 = !DIDerivedType(tag: DW_TAG_member, name: "Exit", scope: !860, file: !14, line: 1928, baseType: !1000, size: 64, offset: 1728)
!1000 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT", file: !14, line: 966, baseType: !1001)
!1001 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1002, size: 64)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!103, !621, !103, !56, !62}
!1004 = !DIDerivedType(tag: DW_TAG_member, name: "UnloadImage", scope: !860, file: !14, line: 1929, baseType: !1005, size: 64, offset: 1792)
!1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_UNLOAD", file: !14, line: 984, baseType: !1006)
!1006 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1007, size: 64)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!103, !621}
!1009 = !DIDerivedType(tag: DW_TAG_member, name: "ExitBootServices", scope: !860, file: !14, line: 1930, baseType: !1010, size: 64, offset: 1856)
!1010 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT_BOOT_SERVICES", file: !14, line: 1000, baseType: !1011)
!1011 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1012, size: 64)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!103, !621, !56}
!1014 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextMonotonicCount", scope: !860, file: !14, line: 1935, baseType: !1015, size: 64, offset: 1920)
!1015 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_MONOTONIC_COUNT", file: !14, line: 1081, baseType: !1016)
!1016 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1017, size: 64)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!103, !850}
!1019 = !DIDerivedType(tag: DW_TAG_member, name: "Stall", scope: !860, file: !14, line: 1936, baseType: !1020, size: 64, offset: 1984)
!1020 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STALL", file: !14, line: 1016, baseType: !1021)
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1022, size: 64)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!103, !56}
!1024 = !DIDerivedType(tag: DW_TAG_member, name: "SetWatchdogTimer", scope: !860, file: !14, line: 1937, baseType: !1025, size: 64, offset: 2048)
!1025 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WATCHDOG_TIMER", file: !14, line: 1038, baseType: !1026)
!1026 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1027, size: 64)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!103, !56, !58, !56, !62}
!1029 = !DIDerivedType(tag: DW_TAG_member, name: "ConnectController", scope: !860, file: !14, line: 1942, baseType: !1030, size: 64, offset: 2112)
!1030 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONNECT_CONTROLLER", file: !14, line: 361, baseType: !1031)
!1031 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1032, size: 64)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!103, !621, !937, !972, !68}
!1034 = !DIDerivedType(tag: DW_TAG_member, name: "DisconnectController", scope: !860, file: !14, line: 1943, baseType: !1035, size: 64, offset: 2176)
!1035 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DISCONNECT_CONTROLLER", file: !14, line: 394, baseType: !1036)
!1036 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1037, size: 64)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!103, !621, !621, !621}
!1039 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocol", scope: !860, file: !14, line: 1948, baseType: !1040, size: 64, offset: 2240)
!1040 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL", file: !14, line: 1347, baseType: !1041)
!1041 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1042, size: 64)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!103, !621, !797, !71, !621, !621, !90}
!1044 = !DIDerivedType(tag: DW_TAG_member, name: "CloseProtocol", scope: !860, file: !14, line: 1949, baseType: !1045, size: 64, offset: 2304)
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_PROTOCOL", file: !14, line: 1379, baseType: !1046)
!1046 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1047, size: 64)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!103, !621, !797, !621, !621}
!1049 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocolInformation", scope: !860, file: !14, line: 1950, baseType: !1050, size: 64, offset: 2368)
!1050 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION", file: !14, line: 1413, baseType: !1051)
!1051 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1052, size: 64)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!103, !621, !797, !1054, !686}
!1054 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1055, size: 64)
!1055 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1056, size: 64)
!1056 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1394, baseType: !1057)
!1057 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1389, size: 192, elements: !1058)
!1058 = !{!1059, !1060, !1061, !1062}
!1059 = !DIDerivedType(tag: DW_TAG_member, name: "AgentHandle", scope: !1057, file: !14, line: 1390, baseType: !621, size: 64)
!1060 = !DIDerivedType(tag: DW_TAG_member, name: "ControllerHandle", scope: !1057, file: !14, line: 1391, baseType: !621, size: 64, offset: 64)
!1061 = !DIDerivedType(tag: DW_TAG_member, name: "Attributes", scope: !1057, file: !14, line: 1392, baseType: !90, size: 32, offset: 128)
!1062 = !DIDerivedType(tag: DW_TAG_member, name: "OpenCount", scope: !1057, file: !14, line: 1393, baseType: !90, size: 32, offset: 160)
!1063 = !DIDerivedType(tag: DW_TAG_member, name: "ProtocolsPerHandle", scope: !860, file: !14, line: 1955, baseType: !1064, size: 64, offset: 2432)
!1064 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PROTOCOLS_PER_HANDLE", file: !14, line: 1443, baseType: !1065)
!1065 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1066, size: 64)
!1066 = !DISubroutineType(types: !1067)
!1067 = !{!103, !621, !1068, !686}
!1068 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1069, size: 64)
!1069 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !797, size: 64)
!1070 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandleBuffer", scope: !860, file: !14, line: 1956, baseType: !1071, size: 64, offset: 2496)
!1071 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE_BUFFER", file: !14, line: 1588, baseType: !1072)
!1072 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1073, size: 64)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!103, !965, !797, !53, !686, !1075}
!1075 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !937, size: 64)
!1076 = !DIDerivedType(tag: DW_TAG_member, name: "LocateProtocol", scope: !860, file: !14, line: 1957, baseType: !1077, size: 64, offset: 2560)
!1077 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_PROTOCOL", file: !14, line: 1615, baseType: !1078)
!1078 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1079, size: 64)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!103, !797, !53, !71}
!1081 = !DIDerivedType(tag: DW_TAG_member, name: "InstallMultipleProtocolInterfaces", scope: !860, file: !14, line: 1958, baseType: !1082, size: 64, offset: 2624)
!1082 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !14, line: 1213, baseType: !1083)
!1083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1084, size: 64)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!103, !937, null}
!1086 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallMultipleProtocolInterfaces", scope: !860, file: !14, line: 1959, baseType: !1087, size: 64, offset: 2688)
!1087 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !14, line: 1283, baseType: !1088)
!1088 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1089, size: 64)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!103, !621, null}
!1091 = !DIDerivedType(tag: DW_TAG_member, name: "CalculateCrc32", scope: !860, file: !14, line: 1964, baseType: !1092, size: 64, offset: 2752)
!1092 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CALCULATE_CRC32", file: !14, line: 1118, baseType: !1093)
!1093 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 64)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{!103, !53, !56, !809}
!1096 = !DIDerivedType(tag: DW_TAG_member, name: "CopyMem", scope: !860, file: !14, line: 1969, baseType: !1097, size: 64, offset: 2816)
!1097 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_COPY_MEM", file: !14, line: 1134, baseType: !1098)
!1098 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1099, size: 64)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{null, !53, !53, !56}
!1101 = !DIDerivedType(tag: DW_TAG_member, name: "SetMem", scope: !860, file: !14, line: 1970, baseType: !1102, size: 64, offset: 2880)
!1102 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_MEM", file: !14, line: 1150, baseType: !1103)
!1103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1104, size: 64)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{null, !53, !56, !267}
!1106 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEventEx", scope: !860, file: !14, line: 1971, baseType: !1107, size: 64, offset: 2944)
!1107 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT_EX", file: !14, line: 509, baseType: !1108)
!1108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1109, size: 64)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!103, !90, !868, !907, !1111, !1113, !911}
!1111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1112, size: 64)
!1112 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1114, size: 64)
!1114 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !798)
!1115 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfTableEntries", scope: !624, file: !14, line: 2047, baseType: !56, size: 64, offset: 832)
!1116 = !DIDerivedType(tag: DW_TAG_member, name: "ConfigurationTable", scope: !624, file: !14, line: 2052, baseType: !1117, size: 64, offset: 896)
!1117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1118, size: 64)
!1118 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1987, baseType: !1119)
!1119 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1978, size: 192, elements: !1120)
!1120 = !{!1121, !1122}
!1121 = !DIDerivedType(tag: DW_TAG_member, name: "VendorGuid", scope: !1119, file: !14, line: 1982, baseType: !798, size: 128)
!1122 = !DIDerivedType(tag: DW_TAG_member, name: "VendorTable", scope: !1119, file: !14, line: 1986, baseType: !53, size: 64, offset: 128)
!1123 = !DILocalVariable(name: "ImageHandle", arg: 1, scope: !618, file: !85, line: 337, type: !621)
!1124 = !DILocation(line: 337, scope: !618)
!1125 = !DILocalVariable(name: "SystemTable", arg: 2, scope: !618, file: !85, line: 338, type: !622)
!1126 = !DILocation(line: 338, scope: !618)
!1127 = !DILocalVariable(name: "Status", scope: !618, file: !85, line: 341, type: !103)
!1128 = !DILocation(line: 341, scope: !618)
!1129 = !DILocalVariable(name: "HandleProtoc", scope: !618, file: !85, line: 342, type: !621)
!1130 = !DILocation(line: 342, scope: !618)
!1131 = !DILocalVariable(name: "HandleNotify", scope: !618, file: !85, line: 343, type: !621)
!1132 = !DILocation(line: 343, scope: !618)
!1133 = !DILocalVariable(name: "mCharConverter", scope: !618, file: !85, line: 344, type: !1134)
!1134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1135, size: 64)
!1135 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PROTOCOL", file: !110, line: 83, baseType: !1136)
!1136 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CHAR_CONVERTER_PROTOCOL", file: !110, line: 77, size: 320, elements: !1137)
!1137 = !{!1138, !1141, !1144, !1147, !1149}
!1138 = !DIDerivedType(tag: DW_TAG_member, name: "IconvOpen", scope: !1136, file: !110, line: 78, baseType: !1139, size: 64)
!1139 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV_OPEN", file: !110, line: 37, baseType: !1140)
!1140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!1141 = !DIDerivedType(tag: DW_TAG_member, name: "Iconv", scope: !1136, file: !110, line: 79, baseType: !1142, size: 64, offset: 64)
!1142 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV", file: !110, line: 45, baseType: !1143)
!1143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!1144 = !DIDerivedType(tag: DW_TAG_member, name: "StandardConvert", scope: !1136, file: !110, line: 80, baseType: !1145, size: 64, offset: 128)
!1145 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_STANDARD_CONVERT", file: !110, line: 55, baseType: !1146)
!1146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!1147 = !DIDerivedType(tag: DW_TAG_member, name: "Libxml2Convert", scope: !1136, file: !110, line: 81, baseType: !1148, size: 64, offset: 192)
!1148 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_LIBXML2_CONVERT", file: !110, line: 63, baseType: !1146)
!1149 = !DIDerivedType(tag: DW_TAG_member, name: "PkexecConvert", scope: !1136, file: !110, line: 82, baseType: !1150, size: 64, offset: 256)
!1150 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PKEXEC_CONVERT", file: !110, line: 71, baseType: !1146)
!1151 = !DILocation(line: 344, scope: !618)
!1152 = !DILocalVariable(name: "ProtocolSize", scope: !618, file: !85, line: 345, type: !56)
!1153 = !DILocation(line: 345, scope: !618)
!1154 = !DILocation(line: 350, scope: !618)
!1155 = !DILocation(line: 355, scope: !618)
!1156 = !DILocation(line: 356, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1158, file: !85, line: 355)
!1158 = distinct !DILexicalBlock(scope: !618, file: !85, line: 355)
!1159 = !DILocation(line: 362, scope: !618)
!1160 = !DILocation(line: 363, scope: !618)
!1161 = !DILocation(line: 364, scope: !618)
!1162 = !DILocation(line: 365, scope: !618)
!1163 = !DILocation(line: 366, scope: !618)
!1164 = !DILocation(line: 371, scope: !618)
!1165 = !DILocation(line: 377, scope: !618)
!1166 = !DILocation(line: 378, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1168, file: !85, line: 377)
!1168 = distinct !DILexicalBlock(scope: !618, file: !85, line: 377)
!1169 = !DILocation(line: 381, scope: !618)
!1170 = !DILocation(line: 382, scope: !618)
!1171 = !DILocation(line: 388, scope: !618)
!1172 = !DILocation(line: 389, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1174, file: !85, line: 388)
!1174 = distinct !DILexicalBlock(scope: !618, file: !85, line: 388)
!1175 = !DILocation(line: 392, scope: !618)
!1176 = !DILocation(line: 393, scope: !618)

^0 = module: (path: "./CharConverter.bc", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "DebugPrint") ; guid = 478242322684871111
^2 = gv: (name: ".str.5", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 1060230639956729141
^3 = gv: (name: ".str.3", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 1807929970182386141
^4 = gv: (name: "mCharConverterReady", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 2467023875392196599
^5 = gv: (name: "gEfiCharConverterProtocolGuid") ; guid = 2580643386560207340
^6 = gv: (name: ".str", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 4324995905376758293
^7 = gv: (name: "gEfiCharConverterReadyProtocolGuid") ; guid = 4420064722380067124
^8 = gv: (name: ".str.4", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 4641308850274193240
^9 = gv: (name: "FreePool") ; guid = 5601427804771207582
^10 = gv: (name: "gSmst") ; guid = 6336347229606852196
^11 = gv: (name: "IconvOpen", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 84, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^20), (callee: ^12), (callee: ^9), (callee: ^13))))) ; guid = 7208721584264290618
^12 = gv: (name: "AsciiStrSize") ; guid = 7793398922472087080
^13 = gv: (name: "AsciiStrCpyS") ; guid = 8558314224629441892
^14 = gv: (name: "AsciiStrCmp") ; guid = 9110187580210364075
^15 = gv: (name: "Iconv", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 504, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^14)), refs: (^6, ^22, ^21)))) ; guid = 9422493605889573265
^16 = gv: (name: "CharConverterEntryPoint", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 71, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), refs: (^10, ^11, ^15, ^25, ^19, ^18, ^5, ^4, ^7)))) ; guid = 10094263481538156052
^17 = gv: (name: "DebugPrintLevelEnabled") ; guid = 10095421576718565903
^18 = gv: (name: "PkexecConvert", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 119, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^11), (callee: ^24), (callee: ^17), (callee: ^1), (callee: ^15)), refs: (^6, ^21, ^3, ^2)))) ; guid = 11285592873921238574
^19 = gv: (name: "Libxml2Convert", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 119, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^11), (callee: ^24), (callee: ^17), (callee: ^1), (callee: ^15)), refs: (^6, ^21, ^3, ^2)))) ; guid = 11474250447324837967
^20 = gv: (name: "AllocateZeroPool") ; guid = 12086697503965093001
^21 = gv: (name: ".str.2", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 12814846469750259078
^22 = gv: (name: ".str.1", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 13379681723806778744
^23 = gv: (name: "llvm.dbg.declare") ; guid = 13513223491971101989
^24 = gv: (name: "DebugPrintEnabled") ; guid = 15723647242063003913
^25 = gv: (name: "StandardConvert", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 109, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^11), (callee: ^24), (callee: ^17), (callee: ^1), (callee: ^15)), refs: (^6, ^21, ^3, ^8)))) ; guid = 18013266026522304264
^26 = flags: 8
^27 = blockcount: 185
