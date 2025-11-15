; ModuleID = './UEFI_testcase.bc'
source_filename = "llvm-link"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-gnu"

%struct._NOTIFY_PROTOCOL_READY_PROTOCOL = type { i32 }
%struct.HEAP = type { [3 x %struct.CHUNK*], [10 x %struct.CHUNK*] }
%struct.CHUNK = type { %struct.CHUNK* }
%struct.HEAP_METADATA_T = type { [30 x %struct.Handle_Entry_T], i64 }
%struct.Handle_Entry_T = type { %struct.CHUNK*, i64, i64 }
%struct._HEAP_MANAGER_PROTOCOL = type { i64 (i64, i64*)*, i64 (i64, %struct.CHUNK**)*, i64 (i64)*, i64 (...)*, i64 (...)*, i64 (...)*, i64 (i64, %struct.CHUNK**)*, i64 (...)*, i64 (...)* }
%struct._CHAR_CONVERTER_PROTOCOL = type { i64 (i8*, i8*, %struct.ICONV_T**)*, i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* }
%struct.ICONV_T = type { i8*, i8* }
%struct._EFI_SMM_SYSTEM_TABLE2 = type { %struct.EFI_TABLE_HEADER, i16*, i32, i64 (%struct._EFI_SMM_SYSTEM_TABLE2*, %struct.GUID*, i8*, i64)*, %struct._EFI_MM_CPU_IO_PROTOCOL, i64 (i32, i64, i8**)*, i64 (i8*)*, i64 (i32, i32, i64, i64*)*, i64 (i64, i64)*, i64 (void (i8*)*, i64, i8*)*, i64, i64, i64*, i8**, i64, %struct.EFI_CONFIGURATION_TABLE*, i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8*, %struct.GUID*, i8*)*, i64 (i8*, %struct.GUID*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (i32, %struct.GUID*, i8*, i64*, i8**)*, i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8*, i64*)*, i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)*, i64 (i8*)* }
%struct.EFI_TABLE_HEADER = type { i64, i32, i32, i32, i32 }
%struct.GUID = type { i32, i16, i16, [8 x i8] }
%struct._EFI_MM_CPU_IO_PROTOCOL = type { %struct.EFI_MM_IO_ACCESS, %struct.EFI_MM_IO_ACCESS }
%struct.EFI_MM_IO_ACCESS = type { i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)*, i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)* }
%struct.EFI_CONFIGURATION_TABLE = type { %struct.GUID, i8* }
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
%struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER = type { %struct.GUID, i32, i32, [1024 x i8] }
%struct.CHAR_CONVERTER_DATA = type { i64, [512 x i8] }

@.str = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"UTF-16\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"ISO-8859-1\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"IconvOpen Failed\0A\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"...input is too large,UINTN giving up\0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"...input is too large, giving up\0A\00", align 1
@mCharConverterReady = dso_local global %struct._NOTIFY_PROTOCOL_READY_PROTOCOL zeroinitializer, align 4, !dbg !0
@BlockSizes = dso_local global [3 x i64] [i64 128, i64 256, i64 512], align 16, !dbg !91
@Heap = dso_local global %struct.HEAP zeroinitializer, align 8, !dbg !128
@.str.6 = private unnamed_addr constant [27 x i8] c"No free chunks available!\0A\00", align 1
@HeapMd = dso_local global %struct.HEAP_METADATA_T zeroinitializer, align 8, !dbg !141
@.str.1.7 = private unnamed_addr constant [28 x i8] c"No free handles available!\0A\00", align 1
@.str.2.8 = private unnamed_addr constant [20 x i8] c"Invalid selection!\0A\00", align 1
@.str.3.9 = private unnamed_addr constant [34 x i8] c"Freed chunk(%d)(%d) at %p (0x%x)\0A\00", align 1
@.str.4.10 = private unnamed_addr constant [21 x i8] c"Invalid chunk size.\0A\00", align 1
@.str.5.11 = private unnamed_addr constant [20 x i8] c"Free list is empty\0A\00", align 1
@.str.6.12 = private unnamed_addr constant [19 x i8] c"Free list (0x%x):\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"  Chunk at %p (points to %p)\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"\0AHandle Table:\0A\00", align 1
@.str.9 = private unnamed_addr constant [37 x i8] c"Handle | Address   | Size  | In Use\0A\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c"-------|-----------|-------|-------\0A\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"%6d | %p | 0x%03x | Yes \00", align 1
@.str.12 = private unnamed_addr constant [30 x i8] c"%6d | (Free)    | -     | No \00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"<--Top\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"AllocateAlignedPages failed\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"InitializeHeapMetadata\0A\00", align 1
@.str.17 = private unnamed_addr constant [16 x i8] c"InitializeHeap\0A\00", align 1
@mHeapManagerReady = dso_local global %struct._NOTIFY_PROTOCOL_READY_PROTOCOL zeroinitializer, align 4, !dbg !121
@mHeapManager = dso_local global %struct._HEAP_MANAGER_PROTOCOL* null, align 8, !dbg !158
@mCharConverter = dso_local global %struct._CHAR_CONVERTER_PROTOCOL* null, align 8, !dbg !211
@.str.18 = private unnamed_addr constant [7 x i16] [i16 72, i16 101, i16 108, i16 108, i16 111, i16 0, i16 0], align 2
@w_msg = dso_local global i16* getelementptr inbounds ([7 x i16], [7 x i16]* @.str.18, i32 0, i32 0), align 8, !dbg !301
@.str.1.19 = private unnamed_addr constant [7 x i8] c"pwned\0A\00", align 1
@.str.2.20 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.3.21 = private unnamed_addr constant [27 x i8] c" - this Sample has a WMP.\0A\00", align 1
@.str.4.22 = private unnamed_addr constant [92 x i8] c"Here's a couple addresses - just cuz: \0A\09Winning Msg function (%p)\0A\09A function pointer (%p)\0A\00", align 1
@funcptr = dso_local global void (...)* null, align 8, !dbg !303
@.str.5.23 = private unnamed_addr constant [17 x i8] c"INVALID Input!!\0A\00", align 1
@gSmst = external global %struct._EFI_SMM_SYSTEM_TABLE2*, align 8
@gEfiHeapManagerProtocolGuid = external global %struct.GUID, align 4
@.str.6.24 = private unnamed_addr constant [58 x i8] c"%a: Failed to locate ProcessFirmwareProtocol. Status: %r\0A\00", align 1
@__func__.HeapManagerReadyCallback = private unnamed_addr constant [25 x i8] c"HeapManagerReadyCallback\00", align 1
@.str.7.25 = private unnamed_addr constant [26 x i8] c"HeapManagerReadyCallback\0A\00", align 1
@gEfiCharConverterProtocolGuid = external global %struct.GUID, align 4
@__func__.CharConverterReadyCallback = private unnamed_addr constant [27 x i8] c"CharConverterReadyCallback\00", align 1
@.str.8.26 = private unnamed_addr constant [28 x i8] c"CharConverterReadyCallback\0A\00", align 1
@gEfiHeapManagerReadyProtocolGuid = external global %struct.GUID, align 4
@.str.9.27 = private unnamed_addr constant [40 x i8] c"%a: Could not register protocol notify\0A\00", align 1
@__func__.Sample2TestsDriverEntryPoint = private unnamed_addr constant [29 x i8] c"Sample2TestsDriverEntryPoint\00", align 1
@gEfiCharConverterReadyProtocolGuid = external global %struct.GUID, align 4
@gEfiSample2TestsDriverCommGuid = external global %struct.GUID, align 4
@.str.10.28 = private unnamed_addr constant [62 x i8] c"%a: Failed to register Sample2TestsDriverHandler. Status: %r\0A\00", align 1

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @IconvOpen(i8* noundef %0, i8* noundef %1, %struct.ICONV_T** noundef %2) #0 !dbg !317 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.ICONV_T**, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !329, metadata !DIExpression()), !dbg !330
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !331, metadata !DIExpression()), !dbg !332
  store %struct.ICONV_T** %2, %struct.ICONV_T*** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.ICONV_T*** %7, metadata !333, metadata !DIExpression()), !dbg !334
  %8 = call i8* @AllocateZeroPool(i64 noundef 16) #3, !dbg !335
  %9 = bitcast i8* %8 to %struct.ICONV_T*, !dbg !335
  %10 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !335
  store %struct.ICONV_T* %9, %struct.ICONV_T** %10, align 8, !dbg !335
  %11 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !336
  %12 = load %struct.ICONV_T*, %struct.ICONV_T** %11, align 8, !dbg !336
  %13 = icmp eq %struct.ICONV_T* %12, null, !dbg !336
  br i1 %13, label %14, label %15, !dbg !336

14:                                               ; preds = %3
  store i64 -9223372036854775799, i64* %4, align 8, !dbg !337
  br label %70, !dbg !337

15:                                               ; preds = %3
  %16 = load i8*, i8** %6, align 8, !dbg !340
  %17 = call i64 @AsciiStrSize(i8* noundef %16) #3, !dbg !340
  %18 = call i8* @AllocateZeroPool(i64 noundef %17) #3, !dbg !340
  %19 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !340
  %20 = load %struct.ICONV_T*, %struct.ICONV_T** %19, align 8, !dbg !340
  %21 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %20, i32 0, i32 0, !dbg !340
  store i8* %18, i8** %21, align 8, !dbg !340
  %22 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !341
  %23 = load %struct.ICONV_T*, %struct.ICONV_T** %22, align 8, !dbg !341
  %24 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %23, i32 0, i32 0, !dbg !341
  %25 = load i8*, i8** %24, align 8, !dbg !341
  %26 = icmp eq i8* %25, null, !dbg !341
  br i1 %26, label %27, label %32, !dbg !341

27:                                               ; preds = %15
  %28 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !342
  %29 = load %struct.ICONV_T*, %struct.ICONV_T** %28, align 8, !dbg !342
  %30 = bitcast %struct.ICONV_T* %29 to i8*, !dbg !342
  call void @FreePool(i8* noundef %30) #3, !dbg !342
  %31 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !345
  store %struct.ICONV_T* null, %struct.ICONV_T** %31, align 8, !dbg !345
  store i64 -9223372036854775799, i64* %4, align 8, !dbg !346
  br label %70, !dbg !346

32:                                               ; preds = %15
  %33 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !347
  %34 = load %struct.ICONV_T*, %struct.ICONV_T** %33, align 8, !dbg !347
  %35 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %34, i32 0, i32 0, !dbg !347
  %36 = load i8*, i8** %35, align 8, !dbg !347
  %37 = load i8*, i8** %6, align 8, !dbg !347
  %38 = call i64 @AsciiStrSize(i8* noundef %37) #3, !dbg !347
  %39 = load i8*, i8** %6, align 8, !dbg !347
  %40 = call i64 @AsciiStrCpyS(i8* noundef %36, i64 noundef %38, i8* noundef %39) #3, !dbg !347
  %41 = load i8*, i8** %5, align 8, !dbg !348
  %42 = call i64 @AsciiStrSize(i8* noundef %41) #3, !dbg !348
  %43 = call i8* @AllocateZeroPool(i64 noundef %42) #3, !dbg !348
  %44 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !348
  %45 = load %struct.ICONV_T*, %struct.ICONV_T** %44, align 8, !dbg !348
  %46 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %45, i32 0, i32 1, !dbg !348
  store i8* %43, i8** %46, align 8, !dbg !348
  %47 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !349
  %48 = load %struct.ICONV_T*, %struct.ICONV_T** %47, align 8, !dbg !349
  %49 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %48, i32 0, i32 1, !dbg !349
  %50 = load i8*, i8** %49, align 8, !dbg !349
  %51 = icmp eq i8* %50, null, !dbg !349
  br i1 %51, label %52, label %61, !dbg !349

52:                                               ; preds = %32
  %53 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !350
  %54 = load %struct.ICONV_T*, %struct.ICONV_T** %53, align 8, !dbg !350
  %55 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %54, i32 0, i32 0, !dbg !350
  %56 = load i8*, i8** %55, align 8, !dbg !350
  call void @FreePool(i8* noundef %56) #3, !dbg !350
  %57 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !353
  %58 = load %struct.ICONV_T*, %struct.ICONV_T** %57, align 8, !dbg !353
  %59 = bitcast %struct.ICONV_T* %58 to i8*, !dbg !353
  call void @FreePool(i8* noundef %59) #3, !dbg !353
  %60 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !354
  store %struct.ICONV_T* null, %struct.ICONV_T** %60, align 8, !dbg !354
  store i64 -9223372036854775799, i64* %4, align 8, !dbg !355
  br label %70, !dbg !355

61:                                               ; preds = %32
  %62 = load %struct.ICONV_T**, %struct.ICONV_T*** %7, align 8, !dbg !356
  %63 = load %struct.ICONV_T*, %struct.ICONV_T** %62, align 8, !dbg !356
  %64 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %63, i32 0, i32 1, !dbg !356
  %65 = load i8*, i8** %64, align 8, !dbg !356
  %66 = load i8*, i8** %5, align 8, !dbg !356
  %67 = call i64 @AsciiStrSize(i8* noundef %66) #3, !dbg !356
  %68 = load i8*, i8** %5, align 8, !dbg !356
  %69 = call i64 @AsciiStrCpyS(i8* noundef %65, i64 noundef %67, i8* noundef %68) #3, !dbg !356
  store i64 0, i64* %4, align 8, !dbg !357
  br label %70, !dbg !357

70:                                               ; preds = %61, %52, %27, %14
  %71 = load i64, i64* %4, align 8, !dbg !358
  ret i64 %71, !dbg !358
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
define dso_local i64 @Iconv(%struct.ICONV_T* noundef %0, i8* noundef %1, i64 noundef %2, i8** noundef %3, i64* noundef %4) #0 !dbg !359 {
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
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %7, metadata !362, metadata !DIExpression()), !dbg !363
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !364, metadata !DIExpression()), !dbg !365
  store i64 %2, i64* %9, align 8
  call void @llvm.dbg.declare(metadata i64* %9, metadata !366, metadata !DIExpression()), !dbg !367
  store i8** %3, i8*** %10, align 8
  call void @llvm.dbg.declare(metadata i8*** %10, metadata !368, metadata !DIExpression()), !dbg !369
  store i64* %4, i64** %11, align 8
  call void @llvm.dbg.declare(metadata i64** %11, metadata !370, metadata !DIExpression()), !dbg !371
  %24 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !372
  %25 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %24, i32 0, i32 0, !dbg !372
  %26 = load i8*, i8** %25, align 8, !dbg !372
  %27 = call i64 @AsciiStrCmp(i8* noundef %26, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #3, !dbg !372
  %28 = icmp eq i64 %27, 0, !dbg !372
  br i1 %28, label %29, label %67, !dbg !372

29:                                               ; preds = %5
  %30 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !372
  %31 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %30, i32 0, i32 1, !dbg !372
  %32 = load i8*, i8** %31, align 8, !dbg !372
  %33 = call i64 @AsciiStrCmp(i8* noundef %32, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !372
  %34 = icmp eq i64 %33, 0, !dbg !372
  br i1 %34, label %35, label %67, !dbg !372

35:                                               ; preds = %29
  %36 = load i8**, i8*** %10, align 8, !dbg !373
  %37 = load i8*, i8** %36, align 8, !dbg !373
  %38 = icmp eq i8* %37, null, !dbg !373
  br i1 %38, label %39, label %40, !dbg !373

39:                                               ; preds = %35
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !376
  br label %429, !dbg !376

40:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata i64* %12, metadata !379, metadata !DIExpression()), !dbg !381
  store i64 0, i64* %12, align 8, !dbg !381
  br label %41, !dbg !381

41:                                               ; preds = %59, %40
  %42 = load i64, i64* %12, align 8, !dbg !381
  %43 = load i64, i64* %9, align 8, !dbg !381
  %44 = icmp ult i64 %42, %43, !dbg !381
  br i1 %44, label %45, label %62, !dbg !381

45:                                               ; preds = %41
  %46 = load i8*, i8** %8, align 8, !dbg !382
  %47 = load i64, i64* %12, align 8, !dbg !382
  %48 = getelementptr inbounds i8, i8* %46, i64 %47, !dbg !382
  %49 = load i8, i8* %48, align 1, !dbg !382
  %50 = zext i8 %49 to i16, !dbg !382
  %51 = trunc i16 %50 to i8, !dbg !382
  %52 = load i8**, i8*** %10, align 8, !dbg !382
  %53 = load i8*, i8** %52, align 8, !dbg !382
  %54 = load i64, i64* %12, align 8, !dbg !382
  %55 = getelementptr inbounds i8, i8* %53, i64 %54, !dbg !382
  store i8 %51, i8* %55, align 1, !dbg !382
  %56 = load i64*, i64** %11, align 8, !dbg !385
  %57 = load i64, i64* %56, align 8, !dbg !385
  %58 = add nsw i64 %57, -1, !dbg !385
  store i64 %58, i64* %56, align 8, !dbg !385
  br label %59, !dbg !386

59:                                               ; preds = %45
  %60 = load i64, i64* %12, align 8, !dbg !387
  %61 = add i64 %60, 1, !dbg !387
  store i64 %61, i64* %12, align 8, !dbg !387
  br label %41, !dbg !387, !llvm.loop !388

62:                                               ; preds = %41
  %63 = load i8**, i8*** %10, align 8, !dbg !391
  %64 = load i8*, i8** %63, align 8, !dbg !391
  %65 = load i64, i64* %9, align 8, !dbg !391
  %66 = getelementptr inbounds i8, i8* %64, i64 %65, !dbg !391
  store i8 0, i8* %66, align 1, !dbg !391
  store i64 0, i64* %6, align 8, !dbg !392
  br label %429, !dbg !392

67:                                               ; preds = %29, %5
  %68 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !393
  %69 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %68, i32 0, i32 0, !dbg !393
  %70 = load i8*, i8** %69, align 8, !dbg !393
  %71 = call i64 @AsciiStrCmp(i8* noundef %70, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !393
  %72 = icmp eq i64 %71, 0, !dbg !393
  br i1 %72, label %73, label %127, !dbg !393

73:                                               ; preds = %67
  %74 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !393
  %75 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %74, i32 0, i32 1, !dbg !393
  %76 = load i8*, i8** %75, align 8, !dbg !393
  %77 = call i64 @AsciiStrCmp(i8* noundef %76, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #3, !dbg !393
  %78 = icmp eq i64 %77, 0, !dbg !393
  br i1 %78, label %79, label %127, !dbg !393

79:                                               ; preds = %73
  %80 = load i8**, i8*** %10, align 8, !dbg !394
  %81 = load i8*, i8** %80, align 8, !dbg !394
  %82 = icmp eq i8* %81, null, !dbg !394
  br i1 %82, label %83, label %84, !dbg !394

83:                                               ; preds = %79
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !397
  br label %429, !dbg !397

84:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata i64* %13, metadata !400, metadata !DIExpression()), !dbg !402
  store i64 0, i64* %13, align 8, !dbg !402
  br label %85, !dbg !402

85:                                               ; preds = %118, %84
  %86 = load i64, i64* %13, align 8, !dbg !402
  %87 = load i64, i64* %9, align 8, !dbg !402
  %88 = sdiv i64 %87, 2, !dbg !402
  %89 = icmp ult i64 %86, %88, !dbg !402
  br i1 %89, label %90, label %121, !dbg !402

90:                                               ; preds = %85
  call void @llvm.dbg.declare(metadata i16** %14, metadata !403, metadata !DIExpression()), !dbg !406
  %91 = load i8*, i8** %8, align 8, !dbg !406
  %92 = bitcast i8* %91 to i16*, !dbg !406
  store i16* %92, i16** %14, align 8, !dbg !406
  %93 = load i16*, i16** %14, align 8, !dbg !407
  %94 = load i64, i64* %13, align 8, !dbg !407
  %95 = getelementptr inbounds i16, i16* %93, i64 %94, !dbg !407
  %96 = load i16, i16* %95, align 2, !dbg !407
  %97 = zext i16 %96 to i32, !dbg !407
  %98 = icmp sle i32 %97, 127, !dbg !407
  br i1 %98, label %99, label %109, !dbg !407

99:                                               ; preds = %90
  %100 = load i16*, i16** %14, align 8, !dbg !408
  %101 = load i64, i64* %13, align 8, !dbg !408
  %102 = getelementptr inbounds i16, i16* %100, i64 %101, !dbg !408
  %103 = load i16, i16* %102, align 2, !dbg !408
  %104 = trunc i16 %103 to i8, !dbg !408
  %105 = load i8**, i8*** %10, align 8, !dbg !408
  %106 = load i8*, i8** %105, align 8, !dbg !408
  %107 = load i64, i64* %13, align 8, !dbg !408
  %108 = getelementptr inbounds i8, i8* %106, i64 %107, !dbg !408
  store i8 %104, i8* %108, align 1, !dbg !408
  br label %114, !dbg !411

109:                                              ; preds = %90
  %110 = load i8**, i8*** %10, align 8, !dbg !412
  %111 = load i8*, i8** %110, align 8, !dbg !412
  %112 = load i64, i64* %13, align 8, !dbg !412
  %113 = getelementptr inbounds i8, i8* %111, i64 %112, !dbg !412
  store i8 63, i8* %113, align 1, !dbg !412
  br label %114, !dbg !414

114:                                              ; preds = %109, %99
  %115 = load i64*, i64** %11, align 8, !dbg !415
  %116 = load i64, i64* %115, align 8, !dbg !415
  %117 = add nsw i64 %116, -1, !dbg !415
  store i64 %117, i64* %115, align 8, !dbg !415
  br label %118, !dbg !416

118:                                              ; preds = %114
  %119 = load i64, i64* %13, align 8, !dbg !417
  %120 = add i64 %119, 1, !dbg !417
  store i64 %120, i64* %13, align 8, !dbg !417
  br label %85, !dbg !417, !llvm.loop !418

121:                                              ; preds = %85
  %122 = load i8**, i8*** %10, align 8, !dbg !420
  %123 = load i8*, i8** %122, align 8, !dbg !420
  %124 = load i64, i64* %9, align 8, !dbg !420
  %125 = sdiv i64 %124, 2, !dbg !420
  %126 = getelementptr inbounds i8, i8* %123, i64 %125, !dbg !420
  store i8 0, i8* %126, align 1, !dbg !420
  store i64 0, i64* %6, align 8, !dbg !421
  br label %429, !dbg !421

127:                                              ; preds = %73, %67
  %128 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !422
  %129 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %128, i32 0, i32 0, !dbg !422
  %130 = load i8*, i8** %129, align 8, !dbg !422
  %131 = call i64 @AsciiStrCmp(i8* noundef %130, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !422
  %132 = icmp eq i64 %131, 0, !dbg !422
  br i1 %132, label %133, label %224, !dbg !422

133:                                              ; preds = %127
  %134 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !422
  %135 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %134, i32 0, i32 1, !dbg !422
  %136 = load i8*, i8** %135, align 8, !dbg !422
  %137 = call i64 @AsciiStrCmp(i8* noundef %136, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !422
  %138 = icmp eq i64 %137, 0, !dbg !422
  br i1 %138, label %139, label %224, !dbg !422

139:                                              ; preds = %133
  %140 = load i8**, i8*** %10, align 8, !dbg !423
  %141 = load i8*, i8** %140, align 8, !dbg !423
  %142 = icmp eq i8* %141, null, !dbg !423
  br i1 %142, label %143, label %144, !dbg !423

143:                                              ; preds = %139
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !426
  br label %429, !dbg !426

144:                                              ; preds = %139
  call void @llvm.dbg.declare(metadata i64* %15, metadata !429, metadata !DIExpression()), !dbg !431
  store i64 0, i64* %15, align 8, !dbg !431
  br label %145, !dbg !431

145:                                              ; preds = %212, %144
  %146 = load i64, i64* %15, align 8, !dbg !431
  %147 = load i64, i64* %9, align 8, !dbg !431
  %148 = icmp ult i64 %146, %147, !dbg !431
  br i1 %148, label %149, label %215, !dbg !431

149:                                              ; preds = %145
  %150 = load i64*, i64** %11, align 8, !dbg !432
  %151 = load i64, i64* %150, align 8, !dbg !432
  %152 = add nsw i64 %151, -1, !dbg !432
  store i64 %152, i64* %150, align 8, !dbg !432
  %153 = load i8*, i8** %8, align 8, !dbg !435
  %154 = load i64, i64* %15, align 8, !dbg !435
  %155 = getelementptr inbounds i8, i8* %153, i64 %154, !dbg !435
  %156 = load i8, i8* %155, align 1, !dbg !435
  %157 = zext i8 %156 to i32, !dbg !435
  %158 = and i32 %157, 128, !dbg !435
  %159 = icmp eq i32 %158, 0, !dbg !435
  br i1 %159, label %160, label %171, !dbg !435

160:                                              ; preds = %149
  %161 = load i8*, i8** %8, align 8, !dbg !436
  %162 = load i64, i64* %15, align 8, !dbg !436
  %163 = getelementptr inbounds i8, i8* %161, i64 %162, !dbg !436
  %164 = load i8, i8* %163, align 1, !dbg !436
  %165 = zext i8 %164 to i16, !dbg !436
  %166 = trunc i16 %165 to i8, !dbg !436
  %167 = load i8**, i8*** %10, align 8, !dbg !436
  %168 = load i8*, i8** %167, align 8, !dbg !436
  %169 = load i64, i64* %15, align 8, !dbg !436
  %170 = getelementptr inbounds i8, i8* %168, i64 %169, !dbg !436
  store i8 %166, i8* %170, align 1, !dbg !436
  br label %211, !dbg !439

171:                                              ; preds = %149
  %172 = load i64, i64* %15, align 8, !dbg !440
  %173 = add i64 %172, 4, !dbg !440
  %174 = load i64, i64* %9, align 8, !dbg !440
  %175 = icmp ugt i64 %173, %174, !dbg !440
  br i1 %175, label %176, label %205, !dbg !440

176:                                              ; preds = %171
  %177 = load i8**, i8*** %10, align 8, !dbg !442
  %178 = load i8*, i8** %177, align 8, !dbg !442
  %179 = load i64, i64* %15, align 8, !dbg !442
  %180 = add i64 %179, 1, !dbg !442
  store i64 %180, i64* %15, align 8, !dbg !442
  %181 = getelementptr inbounds i8, i8* %178, i64 %179, !dbg !442
  store i8 27, i8* %181, align 1, !dbg !442
  %182 = load i64*, i64** %11, align 8, !dbg !445
  %183 = load i64, i64* %182, align 8, !dbg !445
  %184 = add nsw i64 %183, -1, !dbg !445
  store i64 %184, i64* %182, align 8, !dbg !445
  %185 = load i8**, i8*** %10, align 8, !dbg !446
  %186 = load i8*, i8** %185, align 8, !dbg !446
  %187 = load i64, i64* %15, align 8, !dbg !446
  %188 = add i64 %187, 1, !dbg !446
  store i64 %188, i64* %15, align 8, !dbg !446
  %189 = getelementptr inbounds i8, i8* %186, i64 %187, !dbg !446
  store i8 36, i8* %189, align 1, !dbg !446
  %190 = load i64*, i64** %11, align 8, !dbg !447
  %191 = load i64, i64* %190, align 8, !dbg !447
  %192 = add nsw i64 %191, -1, !dbg !447
  store i64 %192, i64* %190, align 8, !dbg !447
  %193 = load i8**, i8*** %10, align 8, !dbg !448
  %194 = load i8*, i8** %193, align 8, !dbg !448
  %195 = load i64, i64* %15, align 8, !dbg !448
  %196 = add i64 %195, 1, !dbg !448
  store i64 %196, i64* %15, align 8, !dbg !448
  %197 = getelementptr inbounds i8, i8* %194, i64 %195, !dbg !448
  store i8 42, i8* %197, align 1, !dbg !448
  %198 = load i64*, i64** %11, align 8, !dbg !449
  %199 = load i64, i64* %198, align 8, !dbg !449
  %200 = add nsw i64 %199, -1, !dbg !449
  store i64 %200, i64* %198, align 8, !dbg !449
  %201 = load i8**, i8*** %10, align 8, !dbg !450
  %202 = load i8*, i8** %201, align 8, !dbg !450
  %203 = load i64, i64* %15, align 8, !dbg !450
  %204 = getelementptr inbounds i8, i8* %202, i64 %203, !dbg !450
  store i8 72, i8* %204, align 1, !dbg !450
  br label %215, !dbg !451

205:                                              ; preds = %171
  %206 = load i8**, i8*** %10, align 8, !dbg !452
  %207 = load i8*, i8** %206, align 8, !dbg !452
  %208 = load i64, i64* %15, align 8, !dbg !452
  %209 = getelementptr inbounds i8, i8* %207, i64 %208, !dbg !452
  store i8 -3, i8* %209, align 1, !dbg !452
  br label %210, !dbg !454

210:                                              ; preds = %205
  br label %211, !dbg !455

211:                                              ; preds = %210, %160
  br label %212, !dbg !456

212:                                              ; preds = %211
  %213 = load i64, i64* %15, align 8, !dbg !457
  %214 = add i64 %213, 1, !dbg !457
  store i64 %214, i64* %15, align 8, !dbg !457
  br label %145, !dbg !457, !llvm.loop !458

215:                                              ; preds = %176, %145
  %216 = load i8**, i8*** %10, align 8, !dbg !460
  %217 = load i8*, i8** %216, align 8, !dbg !460
  %218 = load i64, i64* %9, align 8, !dbg !460
  %219 = add nsw i64 %218, 3, !dbg !460
  %220 = getelementptr inbounds i8, i8* %217, i64 %219, !dbg !460
  store i8 0, i8* %220, align 1, !dbg !460
  %221 = load i64*, i64** %11, align 8, !dbg !461
  %222 = load i64, i64* %221, align 8, !dbg !461
  %223 = sub nsw i64 %222, 4, !dbg !461
  store i64 %223, i64* %221, align 8, !dbg !461
  store i64 0, i64* %6, align 8, !dbg !462
  br label %429, !dbg !462

224:                                              ; preds = %133, %127
  %225 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !463
  %226 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %225, i32 0, i32 0, !dbg !463
  %227 = load i8*, i8** %226, align 8, !dbg !463
  %228 = call i64 @AsciiStrCmp(i8* noundef %227, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #3, !dbg !463
  %229 = icmp eq i64 %228, 0, !dbg !463
  br i1 %229, label %230, label %425, !dbg !463

230:                                              ; preds = %224
  %231 = load %struct.ICONV_T*, %struct.ICONV_T** %7, align 8, !dbg !463
  %232 = getelementptr inbounds %struct.ICONV_T, %struct.ICONV_T* %231, i32 0, i32 1, !dbg !463
  %233 = load i8*, i8** %232, align 8, !dbg !463
  %234 = call i64 @AsciiStrCmp(i8* noundef %233, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !463
  %235 = icmp eq i64 %234, 0, !dbg !463
  br i1 %235, label %236, label %425, !dbg !463

236:                                              ; preds = %230
  %237 = load i8**, i8*** %10, align 8, !dbg !464
  %238 = load i8*, i8** %237, align 8, !dbg !464
  %239 = icmp eq i8* %238, null, !dbg !464
  br i1 %239, label %240, label %241, !dbg !464

240:                                              ; preds = %236
  store i64 -9223372036854775799, i64* %6, align 8, !dbg !467
  br label %429, !dbg !467

241:                                              ; preds = %236
  call void @llvm.dbg.declare(metadata i64* %16, metadata !470, metadata !DIExpression()), !dbg !471
  store i64 0, i64* %16, align 8, !dbg !471
  call void @llvm.dbg.declare(metadata i64* %17, metadata !472, metadata !DIExpression()), !dbg !474
  store i64 0, i64* %17, align 8, !dbg !474
  br label %242, !dbg !474

242:                                              ; preds = %418, %241
  %243 = load i64, i64* %17, align 8, !dbg !474
  %244 = load i64, i64* %9, align 8, !dbg !474
  %245 = icmp ult i64 %243, %244, !dbg !474
  br i1 %245, label %246, label %419, !dbg !474

246:                                              ; preds = %242
  call void @llvm.dbg.declare(metadata i8* %18, metadata !475, metadata !DIExpression()), !dbg !478
  %247 = load i8*, i8** %8, align 8, !dbg !478
  %248 = load i64, i64* %17, align 8, !dbg !478
  %249 = getelementptr inbounds i8, i8* %247, i64 %248, !dbg !478
  %250 = load i8, i8* %249, align 1, !dbg !478
  store i8 %250, i8* %18, align 1, !dbg !478
  %251 = load i8, i8* %18, align 1, !dbg !479
  %252 = zext i8 %251 to i32, !dbg !479
  %253 = icmp sle i32 %252, 127, !dbg !479
  br i1 %253, label %254, label %263, !dbg !479

254:                                              ; preds = %246
  %255 = load i8, i8* %18, align 1, !dbg !480
  %256 = load i8**, i8*** %10, align 8, !dbg !480
  %257 = load i8*, i8** %256, align 8, !dbg !480
  %258 = load i64, i64* %16, align 8, !dbg !480
  %259 = add i64 %258, 1, !dbg !480
  store i64 %259, i64* %16, align 8, !dbg !480
  %260 = getelementptr inbounds i8, i8* %257, i64 %258, !dbg !480
  store i8 %255, i8* %260, align 1, !dbg !480
  %261 = load i64, i64* %17, align 8, !dbg !483
  %262 = add i64 %261, 1, !dbg !483
  store i64 %262, i64* %17, align 8, !dbg !483
  br label %418, !dbg !484

263:                                              ; preds = %246
  %264 = load i8, i8* %18, align 1, !dbg !485
  %265 = zext i8 %264 to i32, !dbg !485
  %266 = and i32 %265, 224, !dbg !485
  %267 = icmp eq i32 %266, 192, !dbg !485
  br i1 %267, label %268, label %338, !dbg !485

268:                                              ; preds = %263
  %269 = load i64, i64* %17, align 8, !dbg !485
  %270 = add i64 %269, 1, !dbg !485
  %271 = load i64, i64* %9, align 8, !dbg !485
  %272 = icmp ult i64 %270, %271, !dbg !485
  br i1 %272, label %273, label %338, !dbg !485

273:                                              ; preds = %268
  call void @llvm.dbg.declare(metadata i8* %19, metadata !486, metadata !DIExpression()), !dbg !489
  %274 = load i8*, i8** %8, align 8, !dbg !489
  %275 = load i64, i64* %17, align 8, !dbg !489
  %276 = add i64 %275, 1, !dbg !489
  %277 = getelementptr inbounds i8, i8* %274, i64 %276, !dbg !489
  %278 = load i8, i8* %277, align 1, !dbg !489
  store i8 %278, i8* %19, align 1, !dbg !489
  %279 = load i8, i8* %19, align 1, !dbg !490
  %280 = zext i8 %279 to i32, !dbg !490
  %281 = and i32 %280, 192, !dbg !490
  %282 = icmp eq i32 %281, 128, !dbg !490
  br i1 %282, label %283, label %328, !dbg !490

283:                                              ; preds = %273
  call void @llvm.dbg.declare(metadata i16* %20, metadata !491, metadata !DIExpression()), !dbg !494
  %284 = load i8, i8* %18, align 1, !dbg !494
  %285 = zext i8 %284 to i32, !dbg !494
  %286 = and i32 %285, 31, !dbg !494
  %287 = shl i32 %286, 6, !dbg !494
  %288 = load i8, i8* %19, align 1, !dbg !494
  %289 = zext i8 %288 to i32, !dbg !494
  %290 = and i32 %289, 63, !dbg !494
  %291 = or i32 %287, %290, !dbg !494
  %292 = trunc i32 %291 to i16, !dbg !494
  store i16 %292, i16* %20, align 2, !dbg !494
  %293 = load i16, i16* %20, align 2, !dbg !495
  %294 = zext i16 %293 to i32, !dbg !495
  %295 = icmp sle i32 %294, 255, !dbg !495
  br i1 %295, label %296, label %304, !dbg !495

296:                                              ; preds = %283
  %297 = load i16, i16* %20, align 2, !dbg !496
  %298 = trunc i16 %297 to i8, !dbg !496
  %299 = load i8**, i8*** %10, align 8, !dbg !496
  %300 = load i8*, i8** %299, align 8, !dbg !496
  %301 = load i64, i64* %16, align 8, !dbg !496
  %302 = add i64 %301, 1, !dbg !496
  store i64 %302, i64* %16, align 8, !dbg !496
  %303 = getelementptr inbounds i8, i8* %300, i64 %301, !dbg !496
  store i8 %298, i8* %303, align 1, !dbg !496
  br label %325, !dbg !499

304:                                              ; preds = %283
  %305 = load i8**, i8*** %10, align 8, !dbg !500
  %306 = load i8*, i8** %305, align 8, !dbg !500
  %307 = load i64, i64* %16, align 8, !dbg !500
  %308 = add i64 %307, 1, !dbg !500
  store i64 %308, i64* %16, align 8, !dbg !500
  %309 = getelementptr inbounds i8, i8* %306, i64 %307, !dbg !500
  store i8 27, i8* %309, align 1, !dbg !500
  %310 = load i8**, i8*** %10, align 8, !dbg !502
  %311 = load i8*, i8** %310, align 8, !dbg !502
  %312 = load i64, i64* %16, align 8, !dbg !502
  %313 = add i64 %312, 1, !dbg !502
  store i64 %313, i64* %16, align 8, !dbg !502
  %314 = getelementptr inbounds i8, i8* %311, i64 %312, !dbg !502
  store i8 36, i8* %314, align 1, !dbg !502
  %315 = load i8**, i8*** %10, align 8, !dbg !503
  %316 = load i8*, i8** %315, align 8, !dbg !503
  %317 = load i64, i64* %16, align 8, !dbg !503
  %318 = add i64 %317, 1, !dbg !503
  store i64 %318, i64* %16, align 8, !dbg !503
  %319 = getelementptr inbounds i8, i8* %316, i64 %317, !dbg !503
  store i8 42, i8* %319, align 1, !dbg !503
  %320 = load i8**, i8*** %10, align 8, !dbg !504
  %321 = load i8*, i8** %320, align 8, !dbg !504
  %322 = load i64, i64* %16, align 8, !dbg !504
  %323 = add i64 %322, 1, !dbg !504
  store i64 %323, i64* %16, align 8, !dbg !504
  %324 = getelementptr inbounds i8, i8* %321, i64 %322, !dbg !504
  store i8 72, i8* %324, align 1, !dbg !504
  br label %419, !dbg !505

325:                                              ; preds = %296
  %326 = load i64, i64* %17, align 8, !dbg !506
  %327 = add i64 %326, 2, !dbg !506
  store i64 %327, i64* %17, align 8, !dbg !506
  br label %337, !dbg !507

328:                                              ; preds = %273
  %329 = load i8, i8* %18, align 1, !dbg !508
  %330 = load i8**, i8*** %10, align 8, !dbg !508
  %331 = load i8*, i8** %330, align 8, !dbg !508
  %332 = load i64, i64* %16, align 8, !dbg !508
  %333 = add i64 %332, 1, !dbg !508
  store i64 %333, i64* %16, align 8, !dbg !508
  %334 = getelementptr inbounds i8, i8* %331, i64 %332, !dbg !508
  store i8 %329, i8* %334, align 1, !dbg !508
  %335 = load i64, i64* %17, align 8, !dbg !510
  %336 = add i64 %335, 1, !dbg !510
  store i64 %336, i64* %17, align 8, !dbg !510
  br label %337, !dbg !511

337:                                              ; preds = %328, %325
  br label %417, !dbg !512

338:                                              ; preds = %268, %263
  %339 = load i8, i8* %18, align 1, !dbg !513
  %340 = zext i8 %339 to i32, !dbg !513
  %341 = and i32 %340, 240, !dbg !513
  %342 = icmp eq i32 %341, 224, !dbg !513
  br i1 %342, label %343, label %407, !dbg !513

343:                                              ; preds = %338
  %344 = load i64, i64* %17, align 8, !dbg !513
  %345 = add i64 %344, 2, !dbg !513
  %346 = load i64, i64* %9, align 8, !dbg !513
  %347 = icmp ult i64 %345, %346, !dbg !513
  br i1 %347, label %348, label %407, !dbg !513

348:                                              ; preds = %343
  call void @llvm.dbg.declare(metadata i8* %21, metadata !514, metadata !DIExpression()), !dbg !517
  %349 = load i8*, i8** %8, align 8, !dbg !517
  %350 = load i64, i64* %17, align 8, !dbg !517
  %351 = add i64 %350, 1, !dbg !517
  %352 = getelementptr inbounds i8, i8* %349, i64 %351, !dbg !517
  %353 = load i8, i8* %352, align 1, !dbg !517
  store i8 %353, i8* %21, align 1, !dbg !517
  call void @llvm.dbg.declare(metadata i8* %22, metadata !518, metadata !DIExpression()), !dbg !519
  %354 = load i8*, i8** %8, align 8, !dbg !519
  %355 = load i64, i64* %17, align 8, !dbg !519
  %356 = add i64 %355, 2, !dbg !519
  %357 = getelementptr inbounds i8, i8* %354, i64 %356, !dbg !519
  %358 = load i8, i8* %357, align 1, !dbg !519
  store i8 %358, i8* %22, align 1, !dbg !519
  %359 = load i8, i8* %21, align 1, !dbg !520
  %360 = zext i8 %359 to i32, !dbg !520
  %361 = and i32 %360, 192, !dbg !520
  %362 = icmp eq i32 %361, 128, !dbg !520
  br i1 %362, label %363, label %397, !dbg !520

363:                                              ; preds = %348
  %364 = load i8, i8* %22, align 1, !dbg !520
  %365 = zext i8 %364 to i32, !dbg !520
  %366 = and i32 %365, 192, !dbg !520
  %367 = icmp eq i32 %366, 128, !dbg !520
  br i1 %367, label %368, label %397, !dbg !520

368:                                              ; preds = %363
  call void @llvm.dbg.declare(metadata i16* %23, metadata !521, metadata !DIExpression()), !dbg !524
  %369 = load i8, i8* %18, align 1, !dbg !524
  %370 = zext i8 %369 to i32, !dbg !524
  %371 = and i32 %370, 15, !dbg !524
  %372 = shl i32 %371, 12, !dbg !524
  %373 = load i8, i8* %21, align 1, !dbg !524
  %374 = zext i8 %373 to i32, !dbg !524
  %375 = and i32 %374, 63, !dbg !524
  %376 = shl i32 %375, 6, !dbg !524
  %377 = or i32 %372, %376, !dbg !524
  %378 = load i8, i8* %22, align 1, !dbg !524
  %379 = zext i8 %378 to i32, !dbg !524
  %380 = and i32 %379, 63, !dbg !524
  %381 = or i32 %377, %380, !dbg !524
  %382 = trunc i32 %381 to i16, !dbg !524
  store i16 %382, i16* %23, align 2, !dbg !524
  %383 = load i16, i16* %23, align 2, !dbg !525
  %384 = zext i16 %383 to i32, !dbg !525
  %385 = icmp sle i32 %384, 255, !dbg !525
  br i1 %385, label %386, label %394, !dbg !525

386:                                              ; preds = %368
  %387 = load i16, i16* %23, align 2, !dbg !526
  %388 = trunc i16 %387 to i8, !dbg !526
  %389 = load i8**, i8*** %10, align 8, !dbg !526
  %390 = load i8*, i8** %389, align 8, !dbg !526
  %391 = load i64, i64* %16, align 8, !dbg !526
  %392 = add i64 %391, 1, !dbg !526
  store i64 %392, i64* %16, align 8, !dbg !526
  %393 = getelementptr inbounds i8, i8* %390, i64 %391, !dbg !526
  store i8 %388, i8* %393, align 1, !dbg !526
  br label %394, !dbg !529

394:                                              ; preds = %386, %368
  %395 = load i64, i64* %17, align 8, !dbg !530
  %396 = add i64 %395, 3, !dbg !530
  store i64 %396, i64* %17, align 8, !dbg !530
  br label %406, !dbg !531

397:                                              ; preds = %363, %348
  %398 = load i8, i8* %18, align 1, !dbg !532
  %399 = load i8**, i8*** %10, align 8, !dbg !532
  %400 = load i8*, i8** %399, align 8, !dbg !532
  %401 = load i64, i64* %16, align 8, !dbg !532
  %402 = add i64 %401, 1, !dbg !532
  store i64 %402, i64* %16, align 8, !dbg !532
  %403 = getelementptr inbounds i8, i8* %400, i64 %401, !dbg !532
  store i8 %398, i8* %403, align 1, !dbg !532
  %404 = load i64, i64* %17, align 8, !dbg !534
  %405 = add i64 %404, 1, !dbg !534
  store i64 %405, i64* %17, align 8, !dbg !534
  br label %406, !dbg !535

406:                                              ; preds = %397, %394
  br label %416, !dbg !536

407:                                              ; preds = %343, %338
  %408 = load i8, i8* %18, align 1, !dbg !537
  %409 = load i8**, i8*** %10, align 8, !dbg !537
  %410 = load i8*, i8** %409, align 8, !dbg !537
  %411 = load i64, i64* %16, align 8, !dbg !537
  %412 = add i64 %411, 1, !dbg !537
  store i64 %412, i64* %16, align 8, !dbg !537
  %413 = getelementptr inbounds i8, i8* %410, i64 %411, !dbg !537
  store i8 %408, i8* %413, align 1, !dbg !537
  %414 = load i64, i64* %17, align 8, !dbg !539
  %415 = add i64 %414, 1, !dbg !539
  store i64 %415, i64* %17, align 8, !dbg !539
  br label %416, !dbg !540

416:                                              ; preds = %407, %406
  br label %417, !dbg !541

417:                                              ; preds = %416, %337
  br label %418, !dbg !542

418:                                              ; preds = %417, %254
  br label %242, !dbg !543, !llvm.loop !544

419:                                              ; preds = %304, %242
  %420 = load i64*, i64** %11, align 8, !dbg !546
  %421 = load i64, i64* %420, align 8, !dbg !546
  %422 = load i64, i64* %16, align 8, !dbg !546
  %423 = sub i64 %421, %422, !dbg !546
  %424 = load i64*, i64** %11, align 8, !dbg !546
  store i64 %423, i64* %424, align 8, !dbg !546
  store i64 0, i64* %6, align 8, !dbg !547
  br label %429, !dbg !547

425:                                              ; preds = %230, %224
  br label %426, !dbg !548

426:                                              ; preds = %425
  br label %427, !dbg !549

427:                                              ; preds = %426
  br label %428, !dbg !550

428:                                              ; preds = %427
  store i64 -9223372036854775805, i64* %6, align 8, !dbg !551
  br label %429, !dbg !551

429:                                              ; preds = %428, %419, %240, %215, %143, %121, %83, %62, %39
  %430 = load i64, i64* %6, align 8, !dbg !552
  ret i64 %430, !dbg !552
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i64 @AsciiStrCmp(i8* noundef, i8* noundef) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @StandardConvert(i8* noundef %0, i64* noundef %1, %struct._HEAP_MANAGER_PROTOCOL* noundef %2) #0 !dbg !553 {
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
  call void @llvm.dbg.declare(metadata i8** %5, metadata !597, metadata !DIExpression()), !dbg !598
  store i64* %1, i64** %6, align 8
  call void @llvm.dbg.declare(metadata i64** %6, metadata !599, metadata !DIExpression()), !dbg !600
  store %struct._HEAP_MANAGER_PROTOCOL* %2, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %7, metadata !601, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %8, metadata !603, metadata !DIExpression()), !dbg !604
  store %struct.ICONV_T* null, %struct.ICONV_T** %8, align 8, !dbg !604
  call void @llvm.dbg.declare(metadata i64* %9, metadata !605, metadata !DIExpression()), !dbg !606
  %14 = call i64 @IconvOpen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), %struct.ICONV_T** noundef %8) #3, !dbg !606
  store i64 %14, i64* %9, align 8, !dbg !606
  %15 = load i64, i64* %9, align 8, !dbg !607
  %16 = icmp slt i64 %15, 0, !dbg !607
  br i1 %16, label %17, label %31, !dbg !607

17:                                               ; preds = %3
  br label %18, !dbg !608

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !611
  %20 = icmp ne i8 %19, 0, !dbg !611
  br i1 %20, label %21, label %28, !dbg !611

21:                                               ; preds = %18
  br label %22, !dbg !613

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !616
  %24 = icmp ne i8 %23, 0, !dbg !616
  br i1 %24, label %25, label %26, !dbg !616

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !618
  br label %26, !dbg !618

26:                                               ; preds = %25, %22
  br label %27, !dbg !616

27:                                               ; preds = %26
  br label %28, !dbg !613

28:                                               ; preds = %27, %18
  br label %29, !dbg !611

29:                                               ; preds = %28
  %30 = load i64, i64* %9, align 8, !dbg !621
  store i64 %30, i64* %4, align 8, !dbg !621
  br label %92, !dbg !621

31:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %10, metadata !622, metadata !DIExpression()), !dbg !623
  store %struct.CHUNK* null, %struct.CHUNK** %10, align 8, !dbg !623
  %32 = load i64*, i64** %6, align 8, !dbg !624
  %33 = load i64, i64* %32, align 8, !dbg !624
  %34 = icmp sle i64 %33, 128, !dbg !624
  br i1 %34, label %35, label %40, !dbg !624

35:                                               ; preds = %31
  %36 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !625
  %37 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %36, i32 0, i32 1, !dbg !625
  %38 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %37, align 8, !dbg !625
  %39 = call i64 %38(i64 noundef 0, %struct.CHUNK** noundef %10) #3, !dbg !625
  br label %73, !dbg !628

40:                                               ; preds = %31
  %41 = load i64*, i64** %6, align 8, !dbg !629
  %42 = load i64, i64* %41, align 8, !dbg !629
  %43 = icmp sle i64 %42, 256, !dbg !629
  br i1 %43, label %44, label %49, !dbg !629

44:                                               ; preds = %40
  %45 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !630
  %46 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %45, i32 0, i32 1, !dbg !630
  %47 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %46, align 8, !dbg !630
  %48 = call i64 %47(i64 noundef 1, %struct.CHUNK** noundef %10) #3, !dbg !630
  br label %72, !dbg !633

49:                                               ; preds = %40
  %50 = load i64*, i64** %6, align 8, !dbg !634
  %51 = load i64, i64* %50, align 8, !dbg !634
  %52 = icmp sle i64 %51, 512, !dbg !634
  br i1 %52, label %53, label %58, !dbg !634

53:                                               ; preds = %49
  %54 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !635
  %55 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %54, i32 0, i32 1, !dbg !635
  %56 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %55, align 8, !dbg !635
  %57 = call i64 %56(i64 noundef 2, %struct.CHUNK** noundef %10) #3, !dbg !635
  br label %71, !dbg !638

58:                                               ; preds = %49
  br label %59, !dbg !639

59:                                               ; preds = %58
  %60 = call i8 @DebugPrintEnabled() #3, !dbg !641
  %61 = icmp ne i8 %60, 0, !dbg !641
  br i1 %61, label %62, label %69, !dbg !641

62:                                               ; preds = %59
  br label %63, !dbg !643

63:                                               ; preds = %62
  %64 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !646
  %65 = icmp ne i8 %64, 0, !dbg !646
  br i1 %65, label %66, label %67, !dbg !646

66:                                               ; preds = %63
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.4, i64 0, i64 0)) #3, !dbg !648
  br label %67, !dbg !648

67:                                               ; preds = %66, %63
  br label %68, !dbg !646

68:                                               ; preds = %67
  br label %69, !dbg !643

69:                                               ; preds = %68, %59
  br label %70, !dbg !641

70:                                               ; preds = %69
  store i64 -9223372036854775806, i64* %4, align 8, !dbg !651
  br label %92, !dbg !651

71:                                               ; preds = %53
  br label %72, !dbg !652

72:                                               ; preds = %71, %44
  br label %73, !dbg !653

73:                                               ; preds = %72, %35
  call void @llvm.dbg.declare(metadata i64* %11, metadata !654, metadata !DIExpression()), !dbg !655
  %74 = load i64*, i64** %6, align 8, !dbg !655
  %75 = load i64, i64* %74, align 8, !dbg !655
  store i64 %75, i64* %11, align 8, !dbg !655
  call void @llvm.dbg.declare(metadata i8** %12, metadata !656, metadata !DIExpression()), !dbg !657
  %76 = load i8*, i8** %5, align 8, !dbg !657
  store i8* %76, i8** %12, align 8, !dbg !657
  call void @llvm.dbg.declare(metadata i8** %13, metadata !658, metadata !DIExpression()), !dbg !659
  %77 = load %struct.CHUNK*, %struct.CHUNK** %10, align 8, !dbg !659
  %78 = bitcast %struct.CHUNK* %77 to i8*, !dbg !659
  store i8* %78, i8** %13, align 8, !dbg !659
  %79 = load %struct.ICONV_T*, %struct.ICONV_T** %8, align 8, !dbg !660
  %80 = load i8*, i8** %12, align 8, !dbg !660
  %81 = load i64*, i64** %6, align 8, !dbg !660
  %82 = load i64, i64* %81, align 8, !dbg !660
  %83 = call i64 @Iconv(%struct.ICONV_T* noundef %79, i8* noundef %80, i64 noundef %82, i8** noundef %13, i64* noundef %11) #3, !dbg !660
  store i64 %83, i64* %9, align 8, !dbg !660
  %84 = load i8*, i8** %13, align 8, !dbg !661
  store i8* %84, i8** %5, align 8, !dbg !661
  %85 = load i64, i64* %11, align 8, !dbg !662
  %86 = load i64*, i64** %6, align 8, !dbg !662
  store i64 %85, i64* %86, align 8, !dbg !662
  %87 = load i64, i64* %9, align 8, !dbg !663
  %88 = icmp slt i64 %87, 0, !dbg !663
  br i1 %88, label %89, label %90, !dbg !663

89:                                               ; preds = %73
  store i64 -9223372036854775787, i64* %4, align 8, !dbg !664
  br label %92, !dbg !664

90:                                               ; preds = %73
  %91 = load i64, i64* %9, align 8, !dbg !666
  store i64 %91, i64* %4, align 8, !dbg !666
  br label %92, !dbg !666

92:                                               ; preds = %90, %89, %70, %29
  %93 = load i64, i64* %4, align 8, !dbg !667
  ret i64 %93, !dbg !667
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintEnabled() #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintLevelEnabled(i64 noundef) #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local void @DebugPrint(i64 noundef, i8* noundef, ...) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Libxml2Convert(i8* noundef %0, i64* noundef %1, %struct._HEAP_MANAGER_PROTOCOL* noundef %2) #0 !dbg !668 {
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
  call void @llvm.dbg.declare(metadata i8** %5, metadata !669, metadata !DIExpression()), !dbg !670
  store i64* %1, i64** %6, align 8
  call void @llvm.dbg.declare(metadata i64** %6, metadata !671, metadata !DIExpression()), !dbg !672
  store %struct._HEAP_MANAGER_PROTOCOL* %2, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %7, metadata !673, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %8, metadata !675, metadata !DIExpression()), !dbg !676
  store %struct.ICONV_T* null, %struct.ICONV_T** %8, align 8, !dbg !676
  call void @llvm.dbg.declare(metadata i64* %9, metadata !677, metadata !DIExpression()), !dbg !678
  %14 = call i64 @IconvOpen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), %struct.ICONV_T** noundef %8) #3, !dbg !678
  store i64 %14, i64* %9, align 8, !dbg !678
  %15 = load i64, i64* %9, align 8, !dbg !679
  %16 = icmp slt i64 %15, 0, !dbg !679
  br i1 %16, label %17, label %31, !dbg !679

17:                                               ; preds = %3
  br label %18, !dbg !680

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !683
  %20 = icmp ne i8 %19, 0, !dbg !683
  br i1 %20, label %21, label %28, !dbg !683

21:                                               ; preds = %18
  br label %22, !dbg !685

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !688
  %24 = icmp ne i8 %23, 0, !dbg !688
  br i1 %24, label %25, label %26, !dbg !688

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !690
  br label %26, !dbg !690

26:                                               ; preds = %25, %22
  br label %27, !dbg !688

27:                                               ; preds = %26
  br label %28, !dbg !685

28:                                               ; preds = %27, %18
  br label %29, !dbg !683

29:                                               ; preds = %28
  %30 = load i64, i64* %9, align 8, !dbg !693
  store i64 %30, i64* %4, align 8, !dbg !693
  br label %101, !dbg !693

31:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %10, metadata !694, metadata !DIExpression()), !dbg !695
  store %struct.CHUNK* null, %struct.CHUNK** %10, align 8, !dbg !695
  %32 = load i64*, i64** %6, align 8, !dbg !696
  %33 = load i64, i64* %32, align 8, !dbg !696
  %34 = mul nsw i64 %33, 2, !dbg !696
  %35 = icmp sle i64 %34, 128, !dbg !696
  br i1 %35, label %36, label %41, !dbg !696

36:                                               ; preds = %31
  %37 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !697
  %38 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %37, i32 0, i32 1, !dbg !697
  %39 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %38, align 8, !dbg !697
  %40 = call i64 %39(i64 noundef 0, %struct.CHUNK** noundef %10) #3, !dbg !697
  br label %76, !dbg !700

41:                                               ; preds = %31
  %42 = load i64*, i64** %6, align 8, !dbg !701
  %43 = load i64, i64* %42, align 8, !dbg !701
  %44 = mul nsw i64 %43, 2, !dbg !701
  %45 = icmp sle i64 %44, 256, !dbg !701
  br i1 %45, label %46, label %51, !dbg !701

46:                                               ; preds = %41
  %47 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !702
  %48 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %47, i32 0, i32 1, !dbg !702
  %49 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %48, align 8, !dbg !702
  %50 = call i64 %49(i64 noundef 1, %struct.CHUNK** noundef %10) #3, !dbg !702
  br label %75, !dbg !705

51:                                               ; preds = %41
  %52 = load i64*, i64** %6, align 8, !dbg !706
  %53 = load i64, i64* %52, align 8, !dbg !706
  %54 = mul nsw i64 %53, 2, !dbg !706
  %55 = icmp sle i64 %54, 512, !dbg !706
  br i1 %55, label %56, label %61, !dbg !706

56:                                               ; preds = %51
  %57 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !707
  %58 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %57, i32 0, i32 1, !dbg !707
  %59 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %58, align 8, !dbg !707
  %60 = call i64 %59(i64 noundef 2, %struct.CHUNK** noundef %10) #3, !dbg !707
  br label %74, !dbg !710

61:                                               ; preds = %51
  br label %62, !dbg !711

62:                                               ; preds = %61
  %63 = call i8 @DebugPrintEnabled() #3, !dbg !713
  %64 = icmp ne i8 %63, 0, !dbg !713
  br i1 %64, label %65, label %72, !dbg !713

65:                                               ; preds = %62
  br label %66, !dbg !715

66:                                               ; preds = %65
  %67 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !718
  %68 = icmp ne i8 %67, 0, !dbg !718
  br i1 %68, label %69, label %70, !dbg !718

69:                                               ; preds = %66
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0)) #3, !dbg !720
  br label %70, !dbg !720

70:                                               ; preds = %69, %66
  br label %71, !dbg !718

71:                                               ; preds = %70
  br label %72, !dbg !715

72:                                               ; preds = %71, %62
  br label %73, !dbg !713

73:                                               ; preds = %72
  store i64 -9223372036854775806, i64* %4, align 8, !dbg !723
  br label %101, !dbg !723

74:                                               ; preds = %56
  br label %75, !dbg !724

75:                                               ; preds = %74, %46
  br label %76, !dbg !725

76:                                               ; preds = %75, %36
  %77 = load i64, i64* %9, align 8, !dbg !726
  %78 = icmp slt i64 %77, 0, !dbg !726
  br i1 %78, label %79, label %81, !dbg !726

79:                                               ; preds = %76
  %80 = load i64, i64* %9, align 8, !dbg !727
  store i64 %80, i64* %4, align 8, !dbg !727
  br label %101, !dbg !727

81:                                               ; preds = %76
  call void @llvm.dbg.declare(metadata i64* %11, metadata !729, metadata !DIExpression()), !dbg !730
  %82 = load i64*, i64** %6, align 8, !dbg !730
  %83 = load i64, i64* %82, align 8, !dbg !730
  %84 = mul nsw i64 %83, 2, !dbg !730
  store i64 %84, i64* %11, align 8, !dbg !730
  call void @llvm.dbg.declare(metadata i8** %12, metadata !731, metadata !DIExpression()), !dbg !732
  %85 = load i8*, i8** %5, align 8, !dbg !732
  store i8* %85, i8** %12, align 8, !dbg !732
  call void @llvm.dbg.declare(metadata i8** %13, metadata !733, metadata !DIExpression()), !dbg !734
  %86 = load %struct.CHUNK*, %struct.CHUNK** %10, align 8, !dbg !734
  %87 = bitcast %struct.CHUNK* %86 to i8*, !dbg !734
  store i8* %87, i8** %13, align 8, !dbg !734
  %88 = load %struct.ICONV_T*, %struct.ICONV_T** %8, align 8, !dbg !735
  %89 = load i8*, i8** %12, align 8, !dbg !735
  %90 = load i64*, i64** %6, align 8, !dbg !735
  %91 = load i64, i64* %90, align 8, !dbg !735
  %92 = call i64 @Iconv(%struct.ICONV_T* noundef %88, i8* noundef %89, i64 noundef %91, i8** noundef %13, i64* noundef %11) #3, !dbg !735
  store i64 %92, i64* %9, align 8, !dbg !735
  %93 = load i8*, i8** %13, align 8, !dbg !736
  store i8* %93, i8** %5, align 8, !dbg !736
  %94 = load i64, i64* %11, align 8, !dbg !737
  %95 = load i64*, i64** %6, align 8, !dbg !737
  store i64 %94, i64* %95, align 8, !dbg !737
  %96 = load i64, i64* %9, align 8, !dbg !738
  %97 = icmp slt i64 %96, 0, !dbg !738
  br i1 %97, label %98, label %99, !dbg !738

98:                                               ; preds = %81
  store i64 -9223372036854775787, i64* %4, align 8, !dbg !739
  br label %101, !dbg !739

99:                                               ; preds = %81
  %100 = load i64, i64* %9, align 8, !dbg !741
  store i64 %100, i64* %4, align 8, !dbg !741
  br label %101, !dbg !741

101:                                              ; preds = %99, %98, %79, %73, %29
  %102 = load i64, i64* %4, align 8, !dbg !742
  ret i64 %102, !dbg !742
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @PkexecConvert(i8* noundef %0, i64* noundef %1, %struct._HEAP_MANAGER_PROTOCOL* noundef %2) #0 !dbg !743 {
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
  call void @llvm.dbg.declare(metadata i8** %5, metadata !744, metadata !DIExpression()), !dbg !745
  store i64* %1, i64** %6, align 8
  call void @llvm.dbg.declare(metadata i64** %6, metadata !746, metadata !DIExpression()), !dbg !747
  store %struct._HEAP_MANAGER_PROTOCOL* %2, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %7, metadata !748, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.declare(metadata %struct.ICONV_T** %8, metadata !750, metadata !DIExpression()), !dbg !751
  store %struct.ICONV_T* null, %struct.ICONV_T** %8, align 8, !dbg !751
  call void @llvm.dbg.declare(metadata i64* %9, metadata !752, metadata !DIExpression()), !dbg !753
  %14 = call i64 @IconvOpen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), %struct.ICONV_T** noundef %8) #3, !dbg !753
  store i64 %14, i64* %9, align 8, !dbg !753
  %15 = load i64, i64* %9, align 8, !dbg !754
  %16 = icmp slt i64 %15, 0, !dbg !754
  br i1 %16, label %17, label %31, !dbg !754

17:                                               ; preds = %3
  br label %18, !dbg !755

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !758
  %20 = icmp ne i8 %19, 0, !dbg !758
  br i1 %20, label %21, label %28, !dbg !758

21:                                               ; preds = %18
  br label %22, !dbg !760

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !763
  %24 = icmp ne i8 %23, 0, !dbg !763
  br i1 %24, label %25, label %26, !dbg !763

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !765
  br label %26, !dbg !765

26:                                               ; preds = %25, %22
  br label %27, !dbg !763

27:                                               ; preds = %26
  br label %28, !dbg !760

28:                                               ; preds = %27, %18
  br label %29, !dbg !758

29:                                               ; preds = %28
  %30 = load i64, i64* %9, align 8, !dbg !768
  store i64 %30, i64* %4, align 8, !dbg !768
  br label %101, !dbg !768

31:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %10, metadata !769, metadata !DIExpression()), !dbg !770
  store %struct.CHUNK* null, %struct.CHUNK** %10, align 8, !dbg !770
  %32 = load i64*, i64** %6, align 8, !dbg !771
  %33 = load i64, i64* %32, align 8, !dbg !771
  %34 = add nsw i64 %33, 4, !dbg !771
  %35 = icmp sle i64 %34, 128, !dbg !771
  br i1 %35, label %36, label %41, !dbg !771

36:                                               ; preds = %31
  %37 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !772
  %38 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %37, i32 0, i32 1, !dbg !772
  %39 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %38, align 8, !dbg !772
  %40 = call i64 %39(i64 noundef 0, %struct.CHUNK** noundef %10) #3, !dbg !772
  br label %76, !dbg !775

41:                                               ; preds = %31
  %42 = load i64*, i64** %6, align 8, !dbg !776
  %43 = load i64, i64* %42, align 8, !dbg !776
  %44 = add nsw i64 %43, 4, !dbg !776
  %45 = icmp sle i64 %44, 256, !dbg !776
  br i1 %45, label %46, label %51, !dbg !776

46:                                               ; preds = %41
  %47 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !777
  %48 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %47, i32 0, i32 1, !dbg !777
  %49 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %48, align 8, !dbg !777
  %50 = call i64 %49(i64 noundef 1, %struct.CHUNK** noundef %10) #3, !dbg !777
  br label %75, !dbg !780

51:                                               ; preds = %41
  %52 = load i64*, i64** %6, align 8, !dbg !781
  %53 = load i64, i64* %52, align 8, !dbg !781
  %54 = add nsw i64 %53, 4, !dbg !781
  %55 = icmp sle i64 %54, 512, !dbg !781
  br i1 %55, label %56, label %61, !dbg !781

56:                                               ; preds = %51
  %57 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %7, align 8, !dbg !782
  %58 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %57, i32 0, i32 1, !dbg !782
  %59 = load i64 (i64, %struct.CHUNK**)*, i64 (i64, %struct.CHUNK**)** %58, align 8, !dbg !782
  %60 = call i64 %59(i64 noundef 2, %struct.CHUNK** noundef %10) #3, !dbg !782
  br label %74, !dbg !785

61:                                               ; preds = %51
  br label %62, !dbg !786

62:                                               ; preds = %61
  %63 = call i8 @DebugPrintEnabled() #3, !dbg !788
  %64 = icmp ne i8 %63, 0, !dbg !788
  br i1 %64, label %65, label %72, !dbg !788

65:                                               ; preds = %62
  br label %66, !dbg !790

66:                                               ; preds = %65
  %67 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !793
  %68 = icmp ne i8 %67, 0, !dbg !793
  br i1 %68, label %69, label %70, !dbg !793

69:                                               ; preds = %66
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0)) #3, !dbg !795
  br label %70, !dbg !795

70:                                               ; preds = %69, %66
  br label %71, !dbg !793

71:                                               ; preds = %70
  br label %72, !dbg !790

72:                                               ; preds = %71, %62
  br label %73, !dbg !788

73:                                               ; preds = %72
  store i64 -9223372036854775806, i64* %4, align 8, !dbg !798
  br label %101, !dbg !798

74:                                               ; preds = %56
  br label %75, !dbg !799

75:                                               ; preds = %74, %46
  br label %76, !dbg !800

76:                                               ; preds = %75, %36
  %77 = load i64, i64* %9, align 8, !dbg !801
  %78 = icmp slt i64 %77, 0, !dbg !801
  br i1 %78, label %79, label %81, !dbg !801

79:                                               ; preds = %76
  %80 = load i64, i64* %9, align 8, !dbg !802
  store i64 %80, i64* %4, align 8, !dbg !802
  br label %101, !dbg !802

81:                                               ; preds = %76
  call void @llvm.dbg.declare(metadata i64* %11, metadata !804, metadata !DIExpression()), !dbg !805
  %82 = load i64*, i64** %6, align 8, !dbg !805
  %83 = load i64, i64* %82, align 8, !dbg !805
  %84 = add nsw i64 %83, 4, !dbg !805
  store i64 %84, i64* %11, align 8, !dbg !805
  call void @llvm.dbg.declare(metadata i8** %12, metadata !806, metadata !DIExpression()), !dbg !807
  %85 = load i8*, i8** %5, align 8, !dbg !807
  store i8* %85, i8** %12, align 8, !dbg !807
  call void @llvm.dbg.declare(metadata i8** %13, metadata !808, metadata !DIExpression()), !dbg !809
  %86 = load %struct.CHUNK*, %struct.CHUNK** %10, align 8, !dbg !809
  %87 = bitcast %struct.CHUNK* %86 to i8*, !dbg !809
  store i8* %87, i8** %13, align 8, !dbg !809
  %88 = load %struct.ICONV_T*, %struct.ICONV_T** %8, align 8, !dbg !810
  %89 = load i8*, i8** %12, align 8, !dbg !810
  %90 = load i64*, i64** %6, align 8, !dbg !810
  %91 = load i64, i64* %90, align 8, !dbg !810
  %92 = call i64 @Iconv(%struct.ICONV_T* noundef %88, i8* noundef %89, i64 noundef %91, i8** noundef %13, i64* noundef %11) #3, !dbg !810
  store i64 %92, i64* %9, align 8, !dbg !810
  %93 = load i8*, i8** %13, align 8, !dbg !811
  store i8* %93, i8** %5, align 8, !dbg !811
  %94 = load i64, i64* %11, align 8, !dbg !812
  %95 = load i64*, i64** %6, align 8, !dbg !812
  store i64 %94, i64* %95, align 8, !dbg !812
  %96 = load i64, i64* %9, align 8, !dbg !813
  %97 = icmp slt i64 %96, 0, !dbg !813
  br i1 %97, label %98, label %99, !dbg !813

98:                                               ; preds = %81
  store i64 -9223372036854775787, i64* %4, align 8, !dbg !814
  br label %101, !dbg !814

99:                                               ; preds = %81
  %100 = load i64, i64* %9, align 8, !dbg !816
  store i64 %100, i64* %4, align 8, !dbg !816
  br label %101, !dbg !816

101:                                              ; preds = %99, %98, %79, %73, %29
  %102 = load i64, i64* %4, align 8, !dbg !817
  ret i64 %102, !dbg !817
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @CharConverterEntryPoint(i8* noundef %0, %struct.EFI_SYSTEM_TABLE* noundef %1) #0 !dbg !818 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.EFI_SYSTEM_TABLE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct._CHAR_CONVERTER_PROTOCOL*, align 8
  %10 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1320, metadata !DIExpression()), !dbg !1321
  store %struct.EFI_SYSTEM_TABLE* %1, %struct.EFI_SYSTEM_TABLE** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.EFI_SYSTEM_TABLE** %5, metadata !1322, metadata !DIExpression()), !dbg !1323
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1324, metadata !DIExpression()), !dbg !1325
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i8* null, i8** %7, align 8, !dbg !1327
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1328, metadata !DIExpression()), !dbg !1329
  store i8* null, i8** %8, align 8, !dbg !1329
  call void @llvm.dbg.declare(metadata %struct._CHAR_CONVERTER_PROTOCOL** %9, metadata !1330, metadata !DIExpression()), !dbg !1348
  call void @llvm.dbg.declare(metadata i64* %10, metadata !1349, metadata !DIExpression()), !dbg !1350
  store i64 40, i64* %10, align 8, !dbg !1350
  %11 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1351
  %12 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %11, i32 0, i32 5, !dbg !1351
  %13 = load i64 (i32, i64, i8**)*, i64 (i32, i64, i8**)** %12, align 8, !dbg !1351
  %14 = load i64, i64* %10, align 8, !dbg !1351
  %15 = bitcast %struct._CHAR_CONVERTER_PROTOCOL** %9 to i8**, !dbg !1351
  %16 = call i64 %13(i32 noundef 6, i64 noundef %14, i8** noundef %15) #3, !dbg !1351
  store i64 %16, i64* %6, align 8, !dbg !1351
  %17 = load i64, i64* %6, align 8, !dbg !1352
  %18 = icmp slt i64 %17, 0, !dbg !1352
  br i1 %18, label %19, label %21, !dbg !1352

19:                                               ; preds = %2
  %20 = load i64, i64* %6, align 8, !dbg !1353
  store i64 %20, i64* %3, align 8, !dbg !1353
  br label %53, !dbg !1353

21:                                               ; preds = %2
  %22 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1356
  %23 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %22, i32 0, i32 0, !dbg !1356
  store i64 (i8*, i8*, %struct.ICONV_T**)* @IconvOpen, i64 (i8*, i8*, %struct.ICONV_T**)** %23, align 8, !dbg !1356
  %24 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1357
  %25 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %24, i32 0, i32 1, !dbg !1357
  store i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)* @Iconv, i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)** %25, align 8, !dbg !1357
  %26 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1358
  %27 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %26, i32 0, i32 2, !dbg !1358
  store i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* @StandardConvert, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %27, align 8, !dbg !1358
  %28 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1359
  %29 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %28, i32 0, i32 3, !dbg !1359
  store i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* @Libxml2Convert, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %29, align 8, !dbg !1359
  %30 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1360
  %31 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %30, i32 0, i32 4, !dbg !1360
  store i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* @PkexecConvert, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %31, align 8, !dbg !1360
  %32 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1361
  %33 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %32, i32 0, i32 16, !dbg !1361
  %34 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %33, align 8, !dbg !1361
  %35 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** %9, align 8, !dbg !1361
  %36 = bitcast %struct._CHAR_CONVERTER_PROTOCOL* %35 to i8*, !dbg !1361
  %37 = call i64 %34(i8** noundef %7, %struct.GUID* noundef @gEfiCharConverterProtocolGuid, i32 noundef 0, i8* noundef %36) #3, !dbg !1361
  store i64 %37, i64* %6, align 8, !dbg !1361
  %38 = load i64, i64* %6, align 8, !dbg !1362
  %39 = icmp slt i64 %38, 0, !dbg !1362
  br i1 %39, label %40, label %42, !dbg !1362

40:                                               ; preds = %21
  %41 = load i64, i64* %6, align 8, !dbg !1363
  store i64 %41, i64* %3, align 8, !dbg !1363
  br label %53, !dbg !1363

42:                                               ; preds = %21
  store i32 -1, i32* getelementptr inbounds (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL, %struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mCharConverterReady, i32 0, i32 0), align 4, !dbg !1366
  %43 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1367
  %44 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %43, i32 0, i32 16, !dbg !1367
  %45 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %44, align 8, !dbg !1367
  %46 = call i64 %45(i8** noundef %8, %struct.GUID* noundef @gEfiCharConverterReadyProtocolGuid, i32 noundef 0, i8* noundef bitcast (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mCharConverterReady to i8*)) #3, !dbg !1367
  store i64 %46, i64* %6, align 8, !dbg !1367
  %47 = load i64, i64* %6, align 8, !dbg !1368
  %48 = icmp slt i64 %47, 0, !dbg !1368
  br i1 %48, label %49, label %51, !dbg !1368

49:                                               ; preds = %42
  %50 = load i64, i64* %6, align 8, !dbg !1369
  store i64 %50, i64* %3, align 8, !dbg !1369
  br label %53, !dbg !1369

51:                                               ; preds = %42
  %52 = load i64, i64* %6, align 8, !dbg !1372
  store i64 %52, i64* %3, align 8, !dbg !1372
  br label %53, !dbg !1372

53:                                               ; preds = %51, %49, %40, %19
  %54 = load i64, i64* %3, align 8, !dbg !1373
  ret i64 %54, !dbg !1373
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @GetBlockSize(i64 noundef %0, i64* noundef %1) #0 !dbg !1374 {
  %3 = alloca i64, align 8
  %4 = alloca i64*, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !1375, metadata !DIExpression()), !dbg !1376
  store i64* %1, i64** %4, align 8
  call void @llvm.dbg.declare(metadata i64** %4, metadata !1377, metadata !DIExpression()), !dbg !1378
  %5 = load i64, i64* %3, align 8, !dbg !1379
  %6 = icmp ule i64 %5, 128, !dbg !1379
  br i1 %6, label %7, label %9, !dbg !1379

7:                                                ; preds = %2
  %8 = load i64*, i64** %4, align 8, !dbg !1380
  store i64 0, i64* %8, align 8, !dbg !1380
  br label %9, !dbg !1380

9:                                                ; preds = %7, %2
  %10 = load i64, i64* %3, align 8, !dbg !1382
  %11 = icmp ule i64 %10, 256, !dbg !1382
  br i1 %11, label %12, label %14, !dbg !1382

12:                                               ; preds = %9
  %13 = load i64*, i64** %4, align 8, !dbg !1383
  store i64 1, i64* %13, align 8, !dbg !1383
  br label %14, !dbg !1383

14:                                               ; preds = %12, %9
  %15 = load i64, i64* %3, align 8, !dbg !1385
  %16 = icmp ule i64 %15, 512, !dbg !1385
  br i1 %16, label %17, label %19, !dbg !1385

17:                                               ; preds = %14
  %18 = load i64*, i64** %4, align 8, !dbg !1386
  store i64 2, i64* %18, align 8, !dbg !1386
  br label %21, !dbg !1386

19:                                               ; preds = %14
  %20 = load i64*, i64** %4, align 8, !dbg !1388
  store i64 -1, i64* %20, align 8, !dbg !1388
  br label %21, !dbg !1388

21:                                               ; preds = %19, %17
  ret i64 0, !dbg !1389
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @AllocateChunk(i64 noundef %0, %struct.CHUNK** noundef %1) #0 !dbg !1390 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.CHUNK**, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !1394, metadata !DIExpression()), !dbg !1395
  store %struct.CHUNK** %1, %struct.CHUNK*** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.CHUNK*** %5, metadata !1396, metadata !DIExpression()), !dbg !1397
  %7 = load i64, i64* %4, align 8, !dbg !1398
  %8 = icmp ult i64 %7, 0, !dbg !1398
  br i1 %8, label %9, label %10, !dbg !1398

9:                                                ; preds = %2
  store i64 -9223372036854775806, i64* %3, align 8, !dbg !1399
  br label %70, !dbg !1399

10:                                               ; preds = %2
  %11 = load i64, i64* %4, align 8, !dbg !1402
  %12 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %11, !dbg !1402
  %13 = load %struct.CHUNK*, %struct.CHUNK** %12, align 8, !dbg !1402
  %14 = icmp ne %struct.CHUNK* %13, null, !dbg !1402
  br i1 %14, label %28, label %15, !dbg !1402

15:                                               ; preds = %10
  br label %16, !dbg !1403

16:                                               ; preds = %15
  %17 = call i8 @DebugPrintEnabled() #3, !dbg !1406
  %18 = icmp ne i8 %17, 0, !dbg !1406
  br i1 %18, label %19, label %26, !dbg !1406

19:                                               ; preds = %16
  br label %20, !dbg !1408

20:                                               ; preds = %19
  %21 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1411
  %22 = icmp ne i8 %21, 0, !dbg !1411
  br i1 %22, label %23, label %24, !dbg !1411

23:                                               ; preds = %20
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i64 0, i64 0)) #3, !dbg !1413
  br label %24, !dbg !1413

24:                                               ; preds = %23, %20
  br label %25, !dbg !1411

25:                                               ; preds = %24
  br label %26, !dbg !1408

26:                                               ; preds = %25, %16
  br label %27, !dbg !1406

27:                                               ; preds = %26
  store i64 -9223372036854775799, i64* %3, align 8, !dbg !1416
  br label %70, !dbg !1416

28:                                               ; preds = %10
  %29 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1417
  %30 = icmp slt i64 %29, 0, !dbg !1417
  br i1 %30, label %31, label %44, !dbg !1417

31:                                               ; preds = %28
  store i64 -1, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1418
  br label %32, !dbg !1421

32:                                               ; preds = %31
  %33 = call i8 @DebugPrintEnabled() #3, !dbg !1422
  %34 = icmp ne i8 %33, 0, !dbg !1422
  br i1 %34, label %35, label %42, !dbg !1422

35:                                               ; preds = %32
  br label %36, !dbg !1424

36:                                               ; preds = %35
  %37 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1427
  %38 = icmp ne i8 %37, 0, !dbg !1427
  br i1 %38, label %39, label %40, !dbg !1427

39:                                               ; preds = %36
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1.7, i64 0, i64 0)) #3, !dbg !1429
  br label %40, !dbg !1429

40:                                               ; preds = %39, %36
  br label %41, !dbg !1427

41:                                               ; preds = %40
  br label %42, !dbg !1424

42:                                               ; preds = %41, %32
  br label %43, !dbg !1422

43:                                               ; preds = %42
  store i64 -9223372036854775799, i64* %3, align 8, !dbg !1432
  br label %70, !dbg !1432

44:                                               ; preds = %28
  %45 = load i64, i64* %4, align 8, !dbg !1433
  %46 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %45, !dbg !1433
  %47 = load %struct.CHUNK*, %struct.CHUNK** %46, align 8, !dbg !1433
  %48 = load %struct.CHUNK**, %struct.CHUNK*** %5, align 8, !dbg !1433
  store %struct.CHUNK* %47, %struct.CHUNK** %48, align 8, !dbg !1433
  %49 = load i64, i64* %4, align 8, !dbg !1434
  %50 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %49, !dbg !1434
  %51 = load %struct.CHUNK*, %struct.CHUNK** %50, align 8, !dbg !1434
  %52 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %51, i32 0, i32 0, !dbg !1434
  %53 = load %struct.CHUNK*, %struct.CHUNK** %52, align 8, !dbg !1434
  %54 = load i64, i64* %4, align 8, !dbg !1434
  %55 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %54, !dbg !1434
  store %struct.CHUNK* %53, %struct.CHUNK** %55, align 8, !dbg !1434
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1435, metadata !DIExpression()), !dbg !1436
  %56 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1436
  %57 = add nsw i64 %56, -1, !dbg !1436
  store i64 %57, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1436
  store i64 %56, i64* %6, align 8, !dbg !1436
  %58 = load %struct.CHUNK**, %struct.CHUNK*** %5, align 8, !dbg !1437
  %59 = load %struct.CHUNK*, %struct.CHUNK** %58, align 8, !dbg !1437
  %60 = load i64, i64* %6, align 8, !dbg !1437
  %61 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %60, !dbg !1437
  %62 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %61, i32 0, i32 0, !dbg !1437
  store %struct.CHUNK* %59, %struct.CHUNK** %62, align 8, !dbg !1437
  %63 = load i64, i64* %4, align 8, !dbg !1438
  %64 = load i64, i64* %6, align 8, !dbg !1438
  %65 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %64, !dbg !1438
  %66 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %65, i32 0, i32 1, !dbg !1438
  store i64 %63, i64* %66, align 8, !dbg !1438
  %67 = load i64, i64* %6, align 8, !dbg !1439
  %68 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %67, !dbg !1439
  %69 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %68, i32 0, i32 2, !dbg !1439
  store i64 1, i64* %69, align 8, !dbg !1439
  store i64 0, i64* %3, align 8, !dbg !1440
  br label %70, !dbg !1440

70:                                               ; preds = %44, %43, %27, %9
  %71 = load i64, i64* %3, align 8, !dbg !1441
  ret i64 %71, !dbg !1441
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @FreeChunk(i64 noundef %0) #0 !dbg !1442 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CHUNK*, align 8
  %5 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !1443, metadata !DIExpression()), !dbg !1444
  %6 = load i64, i64* %3, align 8, !dbg !1445
  %7 = icmp slt i64 %6, 0, !dbg !1445
  br i1 %7, label %17, label %8, !dbg !1445

8:                                                ; preds = %1
  %9 = load i64, i64* %3, align 8, !dbg !1445
  %10 = icmp sge i64 %9, 30, !dbg !1445
  br i1 %10, label %17, label %11, !dbg !1445

11:                                               ; preds = %8
  %12 = load i64, i64* %3, align 8, !dbg !1445
  %13 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %12, !dbg !1445
  %14 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %13, i32 0, i32 2, !dbg !1445
  %15 = load i64, i64* %14, align 8, !dbg !1445
  %16 = icmp ne i64 %15, 0, !dbg !1445
  br i1 %16, label %30, label %17, !dbg !1445

17:                                               ; preds = %11, %8, %1
  br label %18, !dbg !1446

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !1449
  %20 = icmp ne i8 %19, 0, !dbg !1449
  br i1 %20, label %21, label %28, !dbg !1449

21:                                               ; preds = %18
  br label %22, !dbg !1451

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1454
  %24 = icmp ne i8 %23, 0, !dbg !1454
  br i1 %24, label %25, label %26, !dbg !1454

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.8, i64 0, i64 0)) #3, !dbg !1456
  br label %26, !dbg !1456

26:                                               ; preds = %25, %22
  br label %27, !dbg !1454

27:                                               ; preds = %26
  br label %28, !dbg !1451

28:                                               ; preds = %27, %18
  br label %29, !dbg !1449

29:                                               ; preds = %28
  store i64 -9223372036854775806, i64* %2, align 8, !dbg !1459
  br label %70, !dbg !1459

30:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %4, metadata !1460, metadata !DIExpression()), !dbg !1461
  %31 = load i64, i64* %3, align 8, !dbg !1461
  %32 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %31, !dbg !1461
  %33 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %32, i32 0, i32 0, !dbg !1461
  %34 = load %struct.CHUNK*, %struct.CHUNK** %33, align 8, !dbg !1461
  store %struct.CHUNK* %34, %struct.CHUNK** %4, align 8, !dbg !1461
  call void @llvm.dbg.declare(metadata i64* %5, metadata !1462, metadata !DIExpression()), !dbg !1463
  %35 = load i64, i64* %3, align 8, !dbg !1463
  %36 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %35, !dbg !1463
  %37 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %36, i32 0, i32 1, !dbg !1463
  %38 = load i64, i64* %37, align 8, !dbg !1463
  store i64 %38, i64* %5, align 8, !dbg !1463
  %39 = load i64, i64* %5, align 8, !dbg !1464
  %40 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %39, !dbg !1464
  %41 = load %struct.CHUNK*, %struct.CHUNK** %40, align 8, !dbg !1464
  %42 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1464
  %43 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %42, i32 0, i32 0, !dbg !1464
  store %struct.CHUNK* %41, %struct.CHUNK** %43, align 8, !dbg !1464
  %44 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1465
  %45 = load i64, i64* %5, align 8, !dbg !1465
  %46 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %45, !dbg !1465
  store %struct.CHUNK* %44, %struct.CHUNK** %46, align 8, !dbg !1465
  %47 = load i64, i64* %3, align 8, !dbg !1466
  %48 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %47, !dbg !1466
  %49 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %48, i32 0, i32 2, !dbg !1466
  store i64 0, i64* %49, align 8, !dbg !1466
  %50 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1467
  %51 = add nsw i64 %50, 1, !dbg !1467
  store i64 %51, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1467
  br label %52, !dbg !1468

52:                                               ; preds = %30
  %53 = call i8 @DebugPrintEnabled() #3, !dbg !1469
  %54 = icmp ne i8 %53, 0, !dbg !1469
  br i1 %54, label %55, label %68, !dbg !1469

55:                                               ; preds = %52
  br label %56, !dbg !1471

56:                                               ; preds = %55
  %57 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1474
  %58 = icmp ne i8 %57, 0, !dbg !1474
  br i1 %58, label %59, label %66, !dbg !1474

59:                                               ; preds = %56
  %60 = load i64, i64* %3, align 8, !dbg !1476
  %61 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1476
  %62 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1476
  %63 = load i64, i64* %5, align 8, !dbg !1476
  %64 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %63, !dbg !1476
  %65 = load i64, i64* %64, align 8, !dbg !1476
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3.9, i64 0, i64 0), i64 noundef %60, i64 noundef %61, %struct.CHUNK* noundef %62, i64 noundef %65) #3, !dbg !1476
  br label %66, !dbg !1476

66:                                               ; preds = %59, %56
  br label %67, !dbg !1474

67:                                               ; preds = %66
  br label %68, !dbg !1471

68:                                               ; preds = %67, %52
  br label %69, !dbg !1469

69:                                               ; preds = %68
  store i64 0, i64* %2, align 8, !dbg !1479
  br label %70, !dbg !1479

70:                                               ; preds = %69, %29
  %71 = load i64, i64* %2, align 8, !dbg !1480
  ret i64 %71, !dbg !1480
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @FreeAllocList() #0 !dbg !1481 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %2, metadata !1484, metadata !DIExpression()), !dbg !1485
  store i64 0, i64* %2, align 8, !dbg !1485
  call void @llvm.dbg.declare(metadata i64* %3, metadata !1486, metadata !DIExpression()), !dbg !1488
  store i64 29, i64* %3, align 8, !dbg !1488
  br label %4, !dbg !1488

4:                                                ; preds = %22, %0
  %5 = load i64, i64* %3, align 8, !dbg !1488
  %6 = icmp sge i64 %5, 0, !dbg !1488
  br i1 %6, label %7, label %25, !dbg !1488

7:                                                ; preds = %4
  %8 = load i64, i64* %3, align 8, !dbg !1489
  %9 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %8, !dbg !1489
  %10 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %9, i32 0, i32 2, !dbg !1489
  %11 = load i64, i64* %10, align 8, !dbg !1489
  %12 = icmp ne i64 %11, 0, !dbg !1489
  br i1 %12, label %13, label %21, !dbg !1489

13:                                               ; preds = %7
  %14 = load i64, i64* %3, align 8, !dbg !1492
  %15 = call i64 @FreeChunk(i64 noundef %14) #3, !dbg !1492
  store i64 %15, i64* %2, align 8, !dbg !1492
  %16 = load i64, i64* %2, align 8, !dbg !1495
  %17 = icmp slt i64 %16, 0, !dbg !1495
  br i1 %17, label %18, label %20, !dbg !1495

18:                                               ; preds = %13
  %19 = load i64, i64* %2, align 8, !dbg !1496
  store i64 %19, i64* %1, align 8, !dbg !1496
  br label %27, !dbg !1496

20:                                               ; preds = %13
  br label %21, !dbg !1499

21:                                               ; preds = %20, %7
  br label %22, !dbg !1500

22:                                               ; preds = %21
  %23 = load i64, i64* %3, align 8, !dbg !1501
  %24 = add nsw i64 %23, -1, !dbg !1501
  store i64 %24, i64* %3, align 8, !dbg !1501
  br label %4, !dbg !1501, !llvm.loop !1502

25:                                               ; preds = %4
  %26 = load i64, i64* %2, align 8, !dbg !1504
  store i64 %26, i64* %1, align 8, !dbg !1504
  br label %27, !dbg !1504

27:                                               ; preds = %25, %18
  %28 = load i64, i64* %1, align 8, !dbg !1505
  ret i64 %28, !dbg !1505
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @DisplayFreeList(i64 noundef %0) #0 !dbg !1506 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CHUNK*, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !1507, metadata !DIExpression()), !dbg !1508
  %5 = load i64, i64* %3, align 8, !dbg !1509
  %6 = icmp ult i64 %5, 1, !dbg !1509
  br i1 %6, label %10, label %7, !dbg !1509

7:                                                ; preds = %1
  %8 = load i64, i64* %3, align 8, !dbg !1509
  %9 = icmp ugt i64 %8, 3, !dbg !1509
  br i1 %9, label %10, label %23, !dbg !1509

10:                                               ; preds = %7, %1
  br label %11, !dbg !1510

11:                                               ; preds = %10
  %12 = call i8 @DebugPrintEnabled() #3, !dbg !1513
  %13 = icmp ne i8 %12, 0, !dbg !1513
  br i1 %13, label %14, label %21, !dbg !1513

14:                                               ; preds = %11
  br label %15, !dbg !1515

15:                                               ; preds = %14
  %16 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1518
  %17 = icmp ne i8 %16, 0, !dbg !1518
  br i1 %17, label %18, label %19, !dbg !1518

18:                                               ; preds = %15
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4.10, i64 0, i64 0)) #3, !dbg !1520
  br label %19, !dbg !1520

19:                                               ; preds = %18, %15
  br label %20, !dbg !1518

20:                                               ; preds = %19
  br label %21, !dbg !1515

21:                                               ; preds = %20, %11
  br label %22, !dbg !1513

22:                                               ; preds = %21
  store i64 -9223372036854775806, i64* %2, align 8, !dbg !1523
  br label %84, !dbg !1523

23:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %4, metadata !1524, metadata !DIExpression()), !dbg !1525
  %24 = load i64, i64* %3, align 8, !dbg !1525
  %25 = sub i64 %24, 1, !dbg !1525
  %26 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %25, !dbg !1525
  %27 = load %struct.CHUNK*, %struct.CHUNK** %26, align 8, !dbg !1525
  store %struct.CHUNK* %27, %struct.CHUNK** %4, align 8, !dbg !1525
  %28 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1526
  %29 = icmp ne %struct.CHUNK* %28, null, !dbg !1526
  br i1 %29, label %43, label %30, !dbg !1526

30:                                               ; preds = %23
  br label %31, !dbg !1527

31:                                               ; preds = %30
  %32 = call i8 @DebugPrintEnabled() #3, !dbg !1530
  %33 = icmp ne i8 %32, 0, !dbg !1530
  br i1 %33, label %34, label %41, !dbg !1530

34:                                               ; preds = %31
  br label %35, !dbg !1532

35:                                               ; preds = %34
  %36 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1535
  %37 = icmp ne i8 %36, 0, !dbg !1535
  br i1 %37, label %38, label %39, !dbg !1535

38:                                               ; preds = %35
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5.11, i64 0, i64 0)) #3, !dbg !1537
  br label %39, !dbg !1537

39:                                               ; preds = %38, %35
  br label %40, !dbg !1535

40:                                               ; preds = %39
  br label %41, !dbg !1532

41:                                               ; preds = %40, %31
  br label %42, !dbg !1530

42:                                               ; preds = %41
  store i64 -9223372036854775799, i64* %2, align 8, !dbg !1540
  br label %84, !dbg !1540

43:                                               ; preds = %23
  br label %44, !dbg !1541

44:                                               ; preds = %43
  %45 = call i8 @DebugPrintEnabled() #3, !dbg !1542
  %46 = icmp ne i8 %45, 0, !dbg !1542
  br i1 %46, label %47, label %58, !dbg !1542

47:                                               ; preds = %44
  br label %48, !dbg !1544

48:                                               ; preds = %47
  %49 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1547
  %50 = icmp ne i8 %49, 0, !dbg !1547
  br i1 %50, label %51, label %56, !dbg !1547

51:                                               ; preds = %48
  %52 = load i64, i64* %3, align 8, !dbg !1549
  %53 = sub i64 %52, 1, !dbg !1549
  %54 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %53, !dbg !1549
  %55 = load i64, i64* %54, align 8, !dbg !1549
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6.12, i64 0, i64 0), i64 noundef %55) #3, !dbg !1549
  br label %56, !dbg !1549

56:                                               ; preds = %51, %48
  br label %57, !dbg !1547

57:                                               ; preds = %56
  br label %58, !dbg !1544

58:                                               ; preds = %57, %44
  br label %59, !dbg !1542

59:                                               ; preds = %58
  br label %60, !dbg !1552

60:                                               ; preds = %79, %59
  %61 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1552
  %62 = icmp ne %struct.CHUNK* %61, null, !dbg !1552
  br i1 %62, label %63, label %83, !dbg !1552

63:                                               ; preds = %60
  br label %64, !dbg !1553

64:                                               ; preds = %63
  %65 = call i8 @DebugPrintEnabled() #3, !dbg !1555
  %66 = icmp ne i8 %65, 0, !dbg !1555
  br i1 %66, label %67, label %78, !dbg !1555

67:                                               ; preds = %64
  br label %68, !dbg !1557

68:                                               ; preds = %67
  %69 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1560
  %70 = icmp ne i8 %69, 0, !dbg !1560
  br i1 %70, label %71, label %76, !dbg !1560

71:                                               ; preds = %68
  %72 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1562
  %73 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1562
  %74 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %73, i32 0, i32 0, !dbg !1562
  %75 = load %struct.CHUNK*, %struct.CHUNK** %74, align 8, !dbg !1562
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), %struct.CHUNK* noundef %72, %struct.CHUNK* noundef %75) #3, !dbg !1562
  br label %76, !dbg !1562

76:                                               ; preds = %71, %68
  br label %77, !dbg !1560

77:                                               ; preds = %76
  br label %78, !dbg !1557

78:                                               ; preds = %77, %64
  br label %79, !dbg !1555

79:                                               ; preds = %78
  %80 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1565
  %81 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %80, i32 0, i32 0, !dbg !1565
  %82 = load %struct.CHUNK*, %struct.CHUNK** %81, align 8, !dbg !1565
  store %struct.CHUNK* %82, %struct.CHUNK** %4, align 8, !dbg !1565
  br label %60, !dbg !1552, !llvm.loop !1566

83:                                               ; preds = %60
  store i64 0, i64* %2, align 8, !dbg !1568
  br label %84, !dbg !1568

84:                                               ; preds = %83, %42, %22
  %85 = load i64, i64* %2, align 8, !dbg !1569
  ret i64 %85, !dbg !1569
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @DisplayHeapMetadata() #0 !dbg !1570 {
  %1 = alloca i64, align 8
  br label %2, !dbg !1571

2:                                                ; preds = %0
  %3 = call i8 @DebugPrintEnabled() #3, !dbg !1572
  %4 = icmp ne i8 %3, 0, !dbg !1572
  br i1 %4, label %5, label %12, !dbg !1572

5:                                                ; preds = %2
  br label %6, !dbg !1574

6:                                                ; preds = %5
  %7 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1577
  %8 = icmp ne i8 %7, 0, !dbg !1577
  br i1 %8, label %9, label %10, !dbg !1577

9:                                                ; preds = %6
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0)) #3, !dbg !1579
  br label %10, !dbg !1579

10:                                               ; preds = %9, %6
  br label %11, !dbg !1577

11:                                               ; preds = %10
  br label %12, !dbg !1574

12:                                               ; preds = %11, %2
  br label %13, !dbg !1572

13:                                               ; preds = %12
  br label %14, !dbg !1582

14:                                               ; preds = %13
  %15 = call i8 @DebugPrintEnabled() #3, !dbg !1583
  %16 = icmp ne i8 %15, 0, !dbg !1583
  br i1 %16, label %17, label %24, !dbg !1583

17:                                               ; preds = %14
  br label %18, !dbg !1585

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1588
  %20 = icmp ne i8 %19, 0, !dbg !1588
  br i1 %20, label %21, label %22, !dbg !1588

21:                                               ; preds = %18
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.9, i64 0, i64 0)) #3, !dbg !1590
  br label %22, !dbg !1590

22:                                               ; preds = %21, %18
  br label %23, !dbg !1588

23:                                               ; preds = %22
  br label %24, !dbg !1585

24:                                               ; preds = %23, %14
  br label %25, !dbg !1583

25:                                               ; preds = %24
  br label %26, !dbg !1593

26:                                               ; preds = %25
  %27 = call i8 @DebugPrintEnabled() #3, !dbg !1594
  %28 = icmp ne i8 %27, 0, !dbg !1594
  br i1 %28, label %29, label %36, !dbg !1594

29:                                               ; preds = %26
  br label %30, !dbg !1596

30:                                               ; preds = %29
  %31 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1599
  %32 = icmp ne i8 %31, 0, !dbg !1599
  br i1 %32, label %33, label %34, !dbg !1599

33:                                               ; preds = %30
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.10, i64 0, i64 0)) #3, !dbg !1601
  br label %34, !dbg !1601

34:                                               ; preds = %33, %30
  br label %35, !dbg !1599

35:                                               ; preds = %34
  br label %36, !dbg !1596

36:                                               ; preds = %35, %26
  br label %37, !dbg !1594

37:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i64* %1, metadata !1604, metadata !DIExpression()), !dbg !1606
  store i64 0, i64* %1, align 8, !dbg !1606
  br label %38, !dbg !1606

38:                                               ; preds = %115, %37
  %39 = load i64, i64* %1, align 8, !dbg !1606
  %40 = icmp slt i64 %39, 30, !dbg !1606
  br i1 %40, label %41, label %118, !dbg !1606

41:                                               ; preds = %38
  %42 = load i64, i64* %1, align 8, !dbg !1607
  %43 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %42, !dbg !1607
  %44 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %43, i32 0, i32 2, !dbg !1607
  %45 = load i64, i64* %44, align 8, !dbg !1607
  %46 = icmp ne i64 %45, 0, !dbg !1607
  br i1 %46, label %47, label %71, !dbg !1607

47:                                               ; preds = %41
  br label %48, !dbg !1610

48:                                               ; preds = %47
  %49 = call i8 @DebugPrintEnabled() #3, !dbg !1613
  %50 = icmp ne i8 %49, 0, !dbg !1613
  br i1 %50, label %51, label %69, !dbg !1613

51:                                               ; preds = %48
  br label %52, !dbg !1615

52:                                               ; preds = %51
  %53 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1618
  %54 = icmp ne i8 %53, 0, !dbg !1618
  br i1 %54, label %55, label %67, !dbg !1618

55:                                               ; preds = %52
  %56 = load i64, i64* %1, align 8, !dbg !1620
  %57 = load i64, i64* %1, align 8, !dbg !1620
  %58 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %57, !dbg !1620
  %59 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %58, i32 0, i32 0, !dbg !1620
  %60 = load %struct.CHUNK*, %struct.CHUNK** %59, align 8, !dbg !1620
  %61 = load i64, i64* %1, align 8, !dbg !1620
  %62 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %61, !dbg !1620
  %63 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %62, i32 0, i32 1, !dbg !1620
  %64 = load i64, i64* %63, align 8, !dbg !1620
  %65 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %64, !dbg !1620
  %66 = load i64, i64* %65, align 8, !dbg !1620
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i64 noundef %56, %struct.CHUNK* noundef %60, i64 noundef %66) #3, !dbg !1620
  br label %67, !dbg !1620

67:                                               ; preds = %55, %52
  br label %68, !dbg !1618

68:                                               ; preds = %67
  br label %69, !dbg !1615

69:                                               ; preds = %68, %48
  br label %70, !dbg !1613

70:                                               ; preds = %69
  br label %85, !dbg !1623

71:                                               ; preds = %41
  br label %72, !dbg !1624

72:                                               ; preds = %71
  %73 = call i8 @DebugPrintEnabled() #3, !dbg !1626
  %74 = icmp ne i8 %73, 0, !dbg !1626
  br i1 %74, label %75, label %83, !dbg !1626

75:                                               ; preds = %72
  br label %76, !dbg !1628

76:                                               ; preds = %75
  %77 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1631
  %78 = icmp ne i8 %77, 0, !dbg !1631
  br i1 %78, label %79, label %81, !dbg !1631

79:                                               ; preds = %76
  %80 = load i64, i64* %1, align 8, !dbg !1633
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.12, i64 0, i64 0), i64 noundef %80) #3, !dbg !1633
  br label %81, !dbg !1633

81:                                               ; preds = %79, %76
  br label %82, !dbg !1631

82:                                               ; preds = %81
  br label %83, !dbg !1628

83:                                               ; preds = %82, %72
  br label %84, !dbg !1626

84:                                               ; preds = %83
  br label %85, !dbg !1636

85:                                               ; preds = %84, %70
  %86 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1637
  %87 = load i64, i64* %1, align 8, !dbg !1637
  %88 = icmp eq i64 %86, %87, !dbg !1637
  br i1 %88, label %89, label %102, !dbg !1637

89:                                               ; preds = %85
  br label %90, !dbg !1638

90:                                               ; preds = %89
  %91 = call i8 @DebugPrintEnabled() #3, !dbg !1640
  %92 = icmp ne i8 %91, 0, !dbg !1640
  br i1 %92, label %93, label %100, !dbg !1640

93:                                               ; preds = %90
  br label %94, !dbg !1642

94:                                               ; preds = %93
  %95 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1645
  %96 = icmp ne i8 %95, 0, !dbg !1645
  br i1 %96, label %97, label %98, !dbg !1645

97:                                               ; preds = %94
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0)) #3, !dbg !1647
  br label %98, !dbg !1647

98:                                               ; preds = %97, %94
  br label %99, !dbg !1645

99:                                               ; preds = %98
  br label %100, !dbg !1642

100:                                              ; preds = %99, %90
  br label %101, !dbg !1640

101:                                              ; preds = %100
  br label %102, !dbg !1640

102:                                              ; preds = %101, %85
  br label %103, !dbg !1650

103:                                              ; preds = %102
  %104 = call i8 @DebugPrintEnabled() #3, !dbg !1651
  %105 = icmp ne i8 %104, 0, !dbg !1651
  br i1 %105, label %106, label %113, !dbg !1651

106:                                              ; preds = %103
  br label %107, !dbg !1653

107:                                              ; preds = %106
  %108 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1656
  %109 = icmp ne i8 %108, 0, !dbg !1656
  br i1 %109, label %110, label %111, !dbg !1656

110:                                              ; preds = %107
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #3, !dbg !1658
  br label %111, !dbg !1658

111:                                              ; preds = %110, %107
  br label %112, !dbg !1656

112:                                              ; preds = %111
  br label %113, !dbg !1653

113:                                              ; preds = %112, %103
  br label %114, !dbg !1651

114:                                              ; preds = %113
  br label %115, !dbg !1661

115:                                              ; preds = %114
  %116 = load i64, i64* %1, align 8, !dbg !1662
  %117 = add nsw i64 %116, 1, !dbg !1662
  store i64 %117, i64* %1, align 8, !dbg !1662
  br label %38, !dbg !1662, !llvm.loop !1663

118:                                              ; preds = %38
  br label %119, !dbg !1665

119:                                              ; preds = %118
  %120 = call i8 @DebugPrintEnabled() #3, !dbg !1666
  %121 = icmp ne i8 %120, 0, !dbg !1666
  br i1 %121, label %122, label %129, !dbg !1666

122:                                              ; preds = %119
  br label %123, !dbg !1668

123:                                              ; preds = %122
  %124 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1671
  %125 = icmp ne i8 %124, 0, !dbg !1671
  br i1 %125, label %126, label %127, !dbg !1671

126:                                              ; preds = %123
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #3, !dbg !1673
  br label %127, !dbg !1673

127:                                              ; preds = %126, %123
  br label %128, !dbg !1671

128:                                              ; preds = %127
  br label %129, !dbg !1668

129:                                              ; preds = %128, %119
  br label %130, !dbg !1666

130:                                              ; preds = %129
  ret i64 0, !dbg !1676
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @InitializePage(i64 noundef %0, %struct.CHUNK** noundef %1) #0 !dbg !1677 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.CHUNK**, align 8
  store i64 %0, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !1681, metadata !DIExpression()), !dbg !1682
  store %struct.CHUNK** %1, %struct.CHUNK*** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.CHUNK*** %5, metadata !1683, metadata !DIExpression()), !dbg !1684
  %6 = load i64, i64* %4, align 8, !dbg !1685
  %7 = lshr i64 %6, 12, !dbg !1685
  %8 = load i64, i64* %4, align 8, !dbg !1685
  %9 = and i64 %8, 4095, !dbg !1685
  %10 = icmp ne i64 %9, 0, !dbg !1685
  %11 = zext i1 %10 to i64, !dbg !1685
  %12 = select i1 %10, i32 1, i32 0, !dbg !1685
  %13 = sext i32 %12 to i64, !dbg !1685
  %14 = add i64 %7, %13, !dbg !1685
  %15 = call i8* @AllocateAlignedPages(i64 noundef %14, i64 noundef 4096) #3, !dbg !1685
  %16 = bitcast i8* %15 to %struct.CHUNK*, !dbg !1685
  %17 = load %struct.CHUNK**, %struct.CHUNK*** %5, align 8, !dbg !1685
  store %struct.CHUNK* %16, %struct.CHUNK** %17, align 8, !dbg !1685
  %18 = load %struct.CHUNK**, %struct.CHUNK*** %5, align 8, !dbg !1686
  %19 = load %struct.CHUNK*, %struct.CHUNK** %18, align 8, !dbg !1686
  %20 = icmp eq %struct.CHUNK* %19, null, !dbg !1686
  br i1 %20, label %21, label %34, !dbg !1686

21:                                               ; preds = %2
  br label %22, !dbg !1687

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintEnabled() #3, !dbg !1690
  %24 = icmp ne i8 %23, 0, !dbg !1690
  br i1 %24, label %25, label %32, !dbg !1690

25:                                               ; preds = %22
  br label %26, !dbg !1692

26:                                               ; preds = %25
  %27 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1695
  %28 = icmp ne i8 %27, 0, !dbg !1695
  br i1 %28, label %29, label %30, !dbg !1695

29:                                               ; preds = %26
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0)) #3, !dbg !1697
  br label %30, !dbg !1697

30:                                               ; preds = %29, %26
  br label %31, !dbg !1695

31:                                               ; preds = %30
  br label %32, !dbg !1692

32:                                               ; preds = %31, %22
  br label %33, !dbg !1690

33:                                               ; preds = %32
  store i64 -9223372036854775787, i64* %3, align 8, !dbg !1700
  br label %35, !dbg !1700

34:                                               ; preds = %2
  store i64 0, i64* %3, align 8, !dbg !1701
  br label %35, !dbg !1701

35:                                               ; preds = %34, %33
  %36 = load i64, i64* %3, align 8, !dbg !1702
  ret i64 %36, !dbg !1702
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8* @AllocateAlignedPages(i64 noundef, i64 noundef) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @InitializeHeapMetadata() #0 !dbg !1703 {
  %1 = alloca i64, align 8
  br label %2, !dbg !1704

2:                                                ; preds = %0
  %3 = call i8 @DebugPrintEnabled() #3, !dbg !1705
  %4 = icmp ne i8 %3, 0, !dbg !1705
  br i1 %4, label %5, label %12, !dbg !1705

5:                                                ; preds = %2
  br label %6, !dbg !1707

6:                                                ; preds = %5
  %7 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1710
  %8 = icmp ne i8 %7, 0, !dbg !1710
  br i1 %8, label %9, label %10, !dbg !1710

9:                                                ; preds = %6
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i64 0, i64 0)) #3, !dbg !1712
  br label %10, !dbg !1712

10:                                               ; preds = %9, %6
  br label %11, !dbg !1710

11:                                               ; preds = %10
  br label %12, !dbg !1707

12:                                               ; preds = %11, %2
  br label %13, !dbg !1705

13:                                               ; preds = %12
  store i64 29, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !1715
  call void @llvm.dbg.declare(metadata i64* %1, metadata !1716, metadata !DIExpression()), !dbg !1718
  store i64 0, i64* %1, align 8, !dbg !1718
  br label %14, !dbg !1718

14:                                               ; preds = %27, %13
  %15 = load i64, i64* %1, align 8, !dbg !1718
  %16 = icmp ult i64 %15, 30, !dbg !1718
  br i1 %16, label %17, label %30, !dbg !1718

17:                                               ; preds = %14
  %18 = load i64, i64* %1, align 8, !dbg !1719
  %19 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %18, !dbg !1719
  %20 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %19, i32 0, i32 0, !dbg !1719
  store %struct.CHUNK* null, %struct.CHUNK** %20, align 8, !dbg !1719
  %21 = load i64, i64* %1, align 8, !dbg !1722
  %22 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %21, !dbg !1722
  %23 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %22, i32 0, i32 1, !dbg !1722
  store i64 0, i64* %23, align 8, !dbg !1722
  %24 = load i64, i64* %1, align 8, !dbg !1723
  %25 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %24, !dbg !1723
  %26 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %25, i32 0, i32 2, !dbg !1723
  store i64 0, i64* %26, align 8, !dbg !1723
  br label %27, !dbg !1724

27:                                               ; preds = %17
  %28 = load i64, i64* %1, align 8, !dbg !1725
  %29 = add i64 %28, 1, !dbg !1725
  store i64 %29, i64* %1, align 8, !dbg !1725
  br label %14, !dbg !1725, !llvm.loop !1726

30:                                               ; preds = %14
  ret i64 0, !dbg !1728
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @InitializeHeap() #0 !dbg !1729 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.CHUNK*, align 8
  %5 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i64* %2, metadata !1730, metadata !DIExpression()), !dbg !1731
  store i64 0, i64* %2, align 8, !dbg !1731
  br label %6, !dbg !1732

6:                                                ; preds = %0
  %7 = call i8 @DebugPrintEnabled() #3, !dbg !1733
  %8 = icmp ne i8 %7, 0, !dbg !1733
  br i1 %8, label %9, label %16, !dbg !1733

9:                                                ; preds = %6
  br label %10, !dbg !1735

10:                                               ; preds = %9
  %11 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !1738
  %12 = icmp ne i8 %11, 0, !dbg !1738
  br i1 %12, label %13, label %14, !dbg !1738

13:                                               ; preds = %10
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.17, i64 0, i64 0)) #3, !dbg !1740
  br label %14, !dbg !1740

14:                                               ; preds = %13, %10
  br label %15, !dbg !1738

15:                                               ; preds = %14
  br label %16, !dbg !1735

16:                                               ; preds = %15, %6
  br label %17, !dbg !1733

17:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata i32* %3, metadata !1743, metadata !DIExpression()), !dbg !1745
  store i32 0, i32* %3, align 4, !dbg !1745
  br label %18, !dbg !1745

18:                                               ; preds = %69, %17
  %19 = load i32, i32* %3, align 4, !dbg !1745
  %20 = icmp slt i32 %19, 3, !dbg !1745
  br i1 %20, label %21, label %72, !dbg !1745

21:                                               ; preds = %18
  %22 = load i32, i32* %3, align 4, !dbg !1746
  %23 = sext i32 %22 to i64, !dbg !1746
  %24 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %23, !dbg !1746
  %25 = load i64, i64* %24, align 8, !dbg !1746
  %26 = mul i64 10, %25, !dbg !1746
  %27 = load i32, i32* %3, align 4, !dbg !1746
  %28 = sext i32 %27 to i64, !dbg !1746
  %29 = getelementptr inbounds [3 x %struct.CHUNK*], [3 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 0), i64 0, i64 %28, !dbg !1746
  %30 = call i64 @InitializePage(i64 noundef %26, %struct.CHUNK** noundef %29) #3, !dbg !1746
  store i64 %30, i64* %2, align 8, !dbg !1746
  %31 = load i64, i64* %2, align 8, !dbg !1749
  %32 = icmp slt i64 %31, 0, !dbg !1749
  br i1 %32, label %33, label %35, !dbg !1749

33:                                               ; preds = %21
  %34 = load i64, i64* %2, align 8, !dbg !1750
  store i64 %34, i64* %1, align 8, !dbg !1750
  br label %74, !dbg !1750

35:                                               ; preds = %21
  %36 = load i32, i32* %3, align 4, !dbg !1753
  %37 = sext i32 %36 to i64, !dbg !1753
  %38 = getelementptr inbounds [3 x %struct.CHUNK*], [3 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 0), i64 0, i64 %37, !dbg !1753
  %39 = load %struct.CHUNK*, %struct.CHUNK** %38, align 8, !dbg !1753
  %40 = bitcast %struct.CHUNK* %39 to %struct.CHUNK*, !dbg !1753
  %41 = load i32, i32* %3, align 4, !dbg !1753
  %42 = sext i32 %41 to i64, !dbg !1753
  %43 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %42, !dbg !1753
  store %struct.CHUNK* %40, %struct.CHUNK** %43, align 8, !dbg !1753
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %4, metadata !1754, metadata !DIExpression()), !dbg !1755
  %44 = load i32, i32* %3, align 4, !dbg !1755
  %45 = sext i32 %44 to i64, !dbg !1755
  %46 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %45, !dbg !1755
  %47 = load %struct.CHUNK*, %struct.CHUNK** %46, align 8, !dbg !1755
  store %struct.CHUNK* %47, %struct.CHUNK** %4, align 8, !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %5, metadata !1756, metadata !DIExpression()), !dbg !1758
  store i32 0, i32* %5, align 4, !dbg !1758
  br label %48, !dbg !1758

48:                                               ; preds = %65, %35
  %49 = load i32, i32* %5, align 4, !dbg !1758
  %50 = icmp slt i32 %49, 9, !dbg !1758
  br i1 %50, label %51, label %68, !dbg !1758

51:                                               ; preds = %48
  %52 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1759
  %53 = bitcast %struct.CHUNK* %52 to i8*, !dbg !1759
  %54 = load i32, i32* %3, align 4, !dbg !1759
  %55 = sext i32 %54 to i64, !dbg !1759
  %56 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %55, !dbg !1759
  %57 = load i64, i64* %56, align 8, !dbg !1759
  %58 = getelementptr inbounds i8, i8* %53, i64 %57, !dbg !1759
  %59 = bitcast i8* %58 to %struct.CHUNK*, !dbg !1759
  %60 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1759
  %61 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %60, i32 0, i32 0, !dbg !1759
  store %struct.CHUNK* %59, %struct.CHUNK** %61, align 8, !dbg !1759
  %62 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !1762
  %63 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %62, i32 0, i32 0, !dbg !1762
  %64 = load %struct.CHUNK*, %struct.CHUNK** %63, align 8, !dbg !1762
  store %struct.CHUNK* %64, %struct.CHUNK** %4, align 8, !dbg !1762
  br label %65, !dbg !1763

65:                                               ; preds = %51
  %66 = load i32, i32* %5, align 4, !dbg !1764
  %67 = add nsw i32 %66, 1, !dbg !1764
  store i32 %67, i32* %5, align 4, !dbg !1764
  br label %48, !dbg !1764, !llvm.loop !1765

68:                                               ; preds = %48
  br label %69, !dbg !1767

69:                                               ; preds = %68
  %70 = load i32, i32* %3, align 4, !dbg !1768
  %71 = add nsw i32 %70, 1, !dbg !1768
  store i32 %71, i32* %3, align 4, !dbg !1768
  br label %18, !dbg !1768, !llvm.loop !1769

72:                                               ; preds = %18
  %73 = load i64, i64* %2, align 8, !dbg !1771
  store i64 %73, i64* %1, align 8, !dbg !1771
  br label %74, !dbg !1771

74:                                               ; preds = %72, %33
  %75 = load i64, i64* %1, align 8, !dbg !1772
  ret i64 %75, !dbg !1772
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @HeapManagerEntryPoint(i8* noundef %0, %struct.EFI_SYSTEM_TABLE* noundef %1) #0 !dbg !1773 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.EFI_SYSTEM_TABLE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct._HEAP_MANAGER_PROTOCOL*, align 8
  %10 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !2129, metadata !DIExpression()), !dbg !2130
  store %struct.EFI_SYSTEM_TABLE* %1, %struct.EFI_SYSTEM_TABLE** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.EFI_SYSTEM_TABLE** %5, metadata !2131, metadata !DIExpression()), !dbg !2132
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2133, metadata !DIExpression()), !dbg !2134
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2135, metadata !DIExpression()), !dbg !2136
  store i8* null, i8** %7, align 8, !dbg !2136
  call void @llvm.dbg.declare(metadata i8** %8, metadata !2137, metadata !DIExpression()), !dbg !2138
  store i8* null, i8** %8, align 8, !dbg !2138
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %9, metadata !2139, metadata !DIExpression()), !dbg !2164
  call void @llvm.dbg.declare(metadata i64* %10, metadata !2165, metadata !DIExpression()), !dbg !2166
  store i64 72, i64* %10, align 8, !dbg !2166
  %11 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2167
  %12 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %11, i32 0, i32 5, !dbg !2167
  %13 = load i64 (i32, i64, i8**)*, i64 (i32, i64, i8**)** %12, align 8, !dbg !2167
  %14 = load i64, i64* %10, align 8, !dbg !2167
  %15 = bitcast %struct._HEAP_MANAGER_PROTOCOL** %9 to i8**, !dbg !2167
  %16 = call i64 %13(i32 noundef 6, i64 noundef %14, i8** noundef %15) #3, !dbg !2167
  store i64 %16, i64* %6, align 8, !dbg !2167
  %17 = load i64, i64* %6, align 8, !dbg !2168
  %18 = icmp slt i64 %17, 0, !dbg !2168
  br i1 %18, label %19, label %21, !dbg !2168

19:                                               ; preds = %2
  %20 = load i64, i64* %6, align 8, !dbg !2169
  store i64 %20, i64* %3, align 8, !dbg !2169
  br label %61, !dbg !2169

21:                                               ; preds = %2
  %22 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2172
  %23 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %22, i32 0, i32 0, !dbg !2172
  store i64 (i64, i64*)* @GetBlockSize, i64 (i64, i64*)** %23, align 8, !dbg !2172
  %24 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2173
  %25 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %24, i32 0, i32 1, !dbg !2173
  store i64 (i64, %struct.CHUNK**)* @AllocateChunk, i64 (i64, %struct.CHUNK**)** %25, align 8, !dbg !2173
  %26 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2174
  %27 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %26, i32 0, i32 2, !dbg !2174
  store i64 (i64)* @FreeChunk, i64 (i64)** %27, align 8, !dbg !2174
  %28 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2175
  %29 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %28, i32 0, i32 3, !dbg !2175
  store i64 (...)* bitcast (i64 ()* @FreeAllocList to i64 (...)*), i64 (...)** %29, align 8, !dbg !2175
  %30 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2176
  %31 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %30, i32 0, i32 4, !dbg !2176
  store i64 (...)* bitcast (i64 (i64)* @DisplayFreeList to i64 (...)*), i64 (...)** %31, align 8, !dbg !2176
  %32 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2177
  %33 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %32, i32 0, i32 5, !dbg !2177
  store i64 (...)* bitcast (i64 ()* @DisplayHeapMetadata to i64 (...)*), i64 (...)** %33, align 8, !dbg !2177
  %34 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2178
  %35 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %34, i32 0, i32 6, !dbg !2178
  store i64 (i64, %struct.CHUNK**)* @InitializePage, i64 (i64, %struct.CHUNK**)** %35, align 8, !dbg !2178
  %36 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2179
  %37 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %36, i32 0, i32 7, !dbg !2179
  store i64 (...)* bitcast (i64 ()* @InitializeHeapMetadata to i64 (...)*), i64 (...)** %37, align 8, !dbg !2179
  %38 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2180
  %39 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %38, i32 0, i32 8, !dbg !2180
  store i64 (...)* bitcast (i64 ()* @InitializeHeap to i64 (...)*), i64 (...)** %39, align 8, !dbg !2180
  %40 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2181
  %41 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %40, i32 0, i32 16, !dbg !2181
  %42 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %41, align 8, !dbg !2181
  %43 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !2181
  %44 = bitcast %struct._HEAP_MANAGER_PROTOCOL* %43 to i8*, !dbg !2181
  %45 = call i64 %42(i8** noundef %7, %struct.GUID* noundef @gEfiHeapManagerProtocolGuid, i32 noundef 0, i8* noundef %44) #3, !dbg !2181
  store i64 %45, i64* %6, align 8, !dbg !2181
  %46 = load i64, i64* %6, align 8, !dbg !2182
  %47 = icmp slt i64 %46, 0, !dbg !2182
  br i1 %47, label %48, label %50, !dbg !2182

48:                                               ; preds = %21
  %49 = load i64, i64* %6, align 8, !dbg !2183
  store i64 %49, i64* %3, align 8, !dbg !2183
  br label %61, !dbg !2183

50:                                               ; preds = %21
  store i32 -1, i32* getelementptr inbounds (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL, %struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mHeapManagerReady, i32 0, i32 0), align 4, !dbg !2186
  %51 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2187
  %52 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %51, i32 0, i32 16, !dbg !2187
  %53 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %52, align 8, !dbg !2187
  %54 = call i64 %53(i8** noundef %8, %struct.GUID* noundef @gEfiHeapManagerReadyProtocolGuid, i32 noundef 0, i8* noundef bitcast (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mHeapManagerReady to i8*)) #3, !dbg !2187
  store i64 %54, i64* %6, align 8, !dbg !2187
  %55 = load i64, i64* %6, align 8, !dbg !2188
  %56 = icmp slt i64 %55, 0, !dbg !2188
  br i1 %56, label %57, label %59, !dbg !2188

57:                                               ; preds = %50
  %58 = load i64, i64* %6, align 8, !dbg !2189
  store i64 %58, i64* %3, align 8, !dbg !2189
  br label %61, !dbg !2189

59:                                               ; preds = %50
  %60 = load i64, i64* %6, align 8, !dbg !2192
  store i64 %60, i64* %3, align 8, !dbg !2192
  br label %61, !dbg !2192

61:                                               ; preds = %59, %57, %48, %19
  %62 = load i64, i64* %3, align 8, !dbg !2193
  ret i64 %62, !dbg !2193
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local void @winning_msg() #0 !dbg !2194 {
  br label %1, !dbg !2197

1:                                                ; preds = %0
  %2 = call i8 @DebugPrintEnabled() #3, !dbg !2198
  %3 = icmp ne i8 %2, 0, !dbg !2198
  br i1 %3, label %4, label %11, !dbg !2198

4:                                                ; preds = %1
  br label %5, !dbg !2200

5:                                                ; preds = %4
  %6 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2203
  %7 = icmp ne i8 %6, 0, !dbg !2203
  br i1 %7, label %8, label %9, !dbg !2203

8:                                                ; preds = %5
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1.19, i64 0, i64 0)) #3, !dbg !2205
  br label %9, !dbg !2205

9:                                                ; preds = %8, %5
  br label %10, !dbg !2203

10:                                               ; preds = %9
  br label %11, !dbg !2200

11:                                               ; preds = %10, %1
  br label %12, !dbg !2198

12:                                               ; preds = %11
  ret void, !dbg !2208
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local void @welcome_msg() #0 !dbg !2209 {
  br label %1, !dbg !2210

1:                                                ; preds = %0
  %2 = call i8 @DebugPrintEnabled() #3, !dbg !2211
  %3 = icmp ne i8 %2, 0, !dbg !2211
  br i1 %3, label %4, label %12, !dbg !2211

4:                                                ; preds = %1
  br label %5, !dbg !2213

5:                                                ; preds = %4
  %6 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2216
  %7 = icmp ne i8 %6, 0, !dbg !2216
  br i1 %7, label %8, label %10, !dbg !2216

8:                                                ; preds = %5
  %9 = load i16*, i16** @w_msg, align 8, !dbg !2218
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2.20, i64 0, i64 0), i16* noundef %9) #3, !dbg !2218
  br label %10, !dbg !2218

10:                                               ; preds = %8, %5
  br label %11, !dbg !2216

11:                                               ; preds = %10
  br label %12, !dbg !2213

12:                                               ; preds = %11, %1
  br label %13, !dbg !2211

13:                                               ; preds = %12
  br label %14, !dbg !2221

14:                                               ; preds = %13
  %15 = call i8 @DebugPrintEnabled() #3, !dbg !2222
  %16 = icmp ne i8 %15, 0, !dbg !2222
  br i1 %16, label %17, label %24, !dbg !2222

17:                                               ; preds = %14
  br label %18, !dbg !2224

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2227
  %20 = icmp ne i8 %19, 0, !dbg !2227
  br i1 %20, label %21, label %22, !dbg !2227

21:                                               ; preds = %18
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3.21, i64 0, i64 0)) #3, !dbg !2229
  br label %22, !dbg !2229

22:                                               ; preds = %21, %18
  br label %23, !dbg !2227

23:                                               ; preds = %22
  br label %24, !dbg !2224

24:                                               ; preds = %23, %14
  br label %25, !dbg !2222

25:                                               ; preds = %24
  br label %26, !dbg !2232

26:                                               ; preds = %25
  %27 = call i8 @DebugPrintEnabled() #3, !dbg !2233
  %28 = icmp ne i8 %27, 0, !dbg !2233
  br i1 %28, label %29, label %36, !dbg !2233

29:                                               ; preds = %26
  br label %30, !dbg !2235

30:                                               ; preds = %29
  %31 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2238
  %32 = icmp ne i8 %31, 0, !dbg !2238
  br i1 %32, label %33, label %34, !dbg !2238

33:                                               ; preds = %30
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @.str.4.22, i64 0, i64 0), void (...)* noundef bitcast (void ()* @winning_msg to void (...)*), void (...)** noundef @funcptr) #3, !dbg !2240
  br label %34, !dbg !2240

34:                                               ; preds = %33, %30
  br label %35, !dbg !2238

35:                                               ; preds = %34
  br label %36, !dbg !2235

36:                                               ; preds = %35, %26
  br label %37, !dbg !2233

37:                                               ; preds = %36
  ret void, !dbg !2243
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @convert(%struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** noundef %0) #0 !dbg !2244 {
  %2 = alloca %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER**, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CHAR_CONVERTER_DATA*, align 8
  store %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %0, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, metadata !2248, metadata !DIExpression()), !dbg !2249
  call void @llvm.dbg.declare(metadata i64* %3, metadata !2250, metadata !DIExpression()), !dbg !2251
  store i64 0, i64* %3, align 8, !dbg !2251
  call void @llvm.dbg.declare(metadata %struct.CHAR_CONVERTER_DATA** %4, metadata !2252, metadata !DIExpression()), !dbg !2253
  %5 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER**, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, align 8, !dbg !2253
  %6 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %5, align 8, !dbg !2253
  %7 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %6, i32 0, i32 3, !dbg !2253
  %8 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 0, !dbg !2253
  %9 = bitcast i8* %8 to %struct.CHAR_CONVERTER_DATA*, !dbg !2253
  store %struct.CHAR_CONVERTER_DATA* %9, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2253
  %10 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER**, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, align 8, !dbg !2254
  %11 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %10, align 8, !dbg !2254
  %12 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %11, i32 0, i32 2, !dbg !2254
  %13 = load i32, i32* %12, align 4, !dbg !2254
  switch i32 %13, label %47 [
    i32 0, label %14
    i32 1, label %25
    i32 2, label %36
  ], !dbg !2254

14:                                               ; preds = %1
  %15 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter, align 8, !dbg !2255
  %16 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %15, i32 0, i32 2, !dbg !2255
  %17 = load i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %16, align 8, !dbg !2255
  %18 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2255
  %19 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %18, i32 0, i32 1, !dbg !2255
  %20 = getelementptr inbounds [512 x i8], [512 x i8]* %19, i64 0, i64 0, !dbg !2255
  %21 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2255
  %22 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %21, i32 0, i32 0, !dbg !2255
  %23 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2255
  %24 = call i64 %17(i8* noundef %20, i64* noundef %22, %struct._HEAP_MANAGER_PROTOCOL* noundef %23) #3, !dbg !2255
  store i64 %24, i64* %3, align 8, !dbg !2255
  br label %60, !dbg !2257

25:                                               ; preds = %1
  %26 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter, align 8, !dbg !2258
  %27 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %26, i32 0, i32 3, !dbg !2258
  %28 = load i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %27, align 8, !dbg !2258
  %29 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2258
  %30 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %29, i32 0, i32 1, !dbg !2258
  %31 = getelementptr inbounds [512 x i8], [512 x i8]* %30, i64 0, i64 0, !dbg !2258
  %32 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2258
  %33 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %32, i32 0, i32 0, !dbg !2258
  %34 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2258
  %35 = call i64 %28(i8* noundef %31, i64* noundef %33, %struct._HEAP_MANAGER_PROTOCOL* noundef %34) #3, !dbg !2258
  store i64 %35, i64* %3, align 8, !dbg !2258
  br label %60, !dbg !2259

36:                                               ; preds = %1
  %37 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter, align 8, !dbg !2260
  %38 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %37, i32 0, i32 4, !dbg !2260
  %39 = load i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %38, align 8, !dbg !2260
  %40 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2260
  %41 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %40, i32 0, i32 1, !dbg !2260
  %42 = getelementptr inbounds [512 x i8], [512 x i8]* %41, i64 0, i64 0, !dbg !2260
  %43 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !2260
  %44 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %43, i32 0, i32 0, !dbg !2260
  %45 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2260
  %46 = call i64 %39(i8* noundef %42, i64* noundef %44, %struct._HEAP_MANAGER_PROTOCOL* noundef %45) #3, !dbg !2260
  store i64 %46, i64* %3, align 8, !dbg !2260
  br label %60, !dbg !2261

47:                                               ; preds = %1
  br label %48, !dbg !2262

48:                                               ; preds = %47
  %49 = call i8 @DebugPrintEnabled() #3, !dbg !2263
  %50 = icmp ne i8 %49, 0, !dbg !2263
  br i1 %50, label %51, label %58, !dbg !2263

51:                                               ; preds = %48
  br label %52, !dbg !2265

52:                                               ; preds = %51
  %53 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2268
  %54 = icmp ne i8 %53, 0, !dbg !2268
  br i1 %54, label %55, label %56, !dbg !2268

55:                                               ; preds = %52
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5.23, i64 0, i64 0)) #3, !dbg !2270
  br label %56, !dbg !2270

56:                                               ; preds = %55, %52
  br label %57, !dbg !2268

57:                                               ; preds = %56
  br label %58, !dbg !2265

58:                                               ; preds = %57, %48
  br label %59, !dbg !2263

59:                                               ; preds = %58
  store i64 -9223372036854775806, i64* %3, align 8, !dbg !2273
  br label %60, !dbg !2274

60:                                               ; preds = %59, %36, %25, %14
  %61 = load i64, i64* %3, align 8, !dbg !2275
  ret i64 %61, !dbg !2275
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Sample2TestsDriverHandler(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64* noundef %3) #0 !dbg !2276 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64*, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, align 8
  store i8* %0, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2279, metadata !DIExpression()), !dbg !2280
  store i8* %1, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2281, metadata !DIExpression()), !dbg !2282
  store i8* %2, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !2283, metadata !DIExpression()), !dbg !2284
  store i64* %3, i64** %9, align 8
  call void @llvm.dbg.declare(metadata i64** %9, metadata !2285, metadata !DIExpression()), !dbg !2286
  call void @llvm.dbg.declare(metadata i64* %10, metadata !2287, metadata !DIExpression()), !dbg !2288
  call void @llvm.dbg.declare(metadata %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, metadata !2289, metadata !DIExpression()), !dbg !2290
  %12 = load i8*, i8** %8, align 8, !dbg !2291
  %13 = icmp eq i8* %12, null, !dbg !2291
  br i1 %13, label %17, label %14, !dbg !2291

14:                                               ; preds = %4
  %15 = load i64*, i64** %9, align 8, !dbg !2291
  %16 = icmp eq i64* %15, null, !dbg !2291
  br i1 %16, label %17, label %18, !dbg !2291

17:                                               ; preds = %14, %4
  store i64 -9223372036854775806, i64* %5, align 8, !dbg !2292
  br label %59, !dbg !2292

18:                                               ; preds = %14
  %19 = load i8*, i8** %8, align 8, !dbg !2295
  %20 = bitcast i8* %19 to %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, !dbg !2295
  store %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %20, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, align 8, !dbg !2295
  %21 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, align 8, !dbg !2296
  %22 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %21, i32 0, i32 1, !dbg !2296
  %23 = load i32, i32* %22, align 4, !dbg !2296
  switch i32 %23, label %57 [
    i32 0, label %24
    i32 1, label %26
    i32 2, label %32
    i32 3, label %48
    i32 4, label %54
  ], !dbg !2296

24:                                               ; preds = %18
  %25 = call i64 @convert(%struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** noundef %11) #3, !dbg !2297
  br label %58, !dbg !2299

26:                                               ; preds = %18
  %27 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2300
  %28 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %27, i32 0, i32 3, !dbg !2300
  %29 = load i64 (...)*, i64 (...)** %28, align 8, !dbg !2300
  %30 = bitcast i64 (...)* %29 to i64 ()*, !dbg !2300
  %31 = call i64 %30() #3, !dbg !2300
  br label %58, !dbg !2301

32:                                               ; preds = %18
  %33 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, align 8, !dbg !2302
  %34 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %33, i32 0, i32 3, !dbg !2302
  %35 = getelementptr inbounds [1024 x i8], [1024 x i8]* %34, i64 0, i64 0, !dbg !2302
  %36 = load i8, i8* %35, align 4, !dbg !2302
  %37 = zext i8 %36 to i64, !dbg !2302
  store i64 %37, i64* %10, align 8, !dbg !2302
  %38 = load i64, i64* %10, align 8, !dbg !2303
  %39 = icmp eq i64 %38, 0, !dbg !2303
  br i1 %39, label %40, label %41, !dbg !2303

40:                                               ; preds = %32
  store i64 1, i64* %10, align 8, !dbg !2304
  br label %41, !dbg !2307

41:                                               ; preds = %40, %32
  %42 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2308
  %43 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %42, i32 0, i32 4, !dbg !2308
  %44 = load i64 (...)*, i64 (...)** %43, align 8, !dbg !2308
  %45 = load i64, i64* %10, align 8, !dbg !2308
  %46 = bitcast i64 (...)* %44 to i64 (i64)*, !dbg !2308
  %47 = call i64 %46(i64 noundef %45) #3, !dbg !2308
  br label %58, !dbg !2309

48:                                               ; preds = %18
  %49 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2310
  %50 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %49, i32 0, i32 5, !dbg !2310
  %51 = load i64 (...)*, i64 (...)** %50, align 8, !dbg !2310
  %52 = bitcast i64 (...)* %51 to i64 ()*, !dbg !2310
  %53 = call i64 %52() #3, !dbg !2310
  br label %58, !dbg !2311

54:                                               ; preds = %18
  %55 = load void (...)*, void (...)** @funcptr, align 8, !dbg !2312
  %56 = bitcast void (...)* %55 to void ()*, !dbg !2312
  call void %56() #3, !dbg !2312
  br label %58, !dbg !2313

57:                                               ; preds = %18
  br label %58, !dbg !2314

58:                                               ; preds = %57, %54, %48, %41, %26, %24
  store i64 0, i64* %5, align 8, !dbg !2315
  br label %59, !dbg !2315

59:                                               ; preds = %58, %17
  %60 = load i64, i64* %5, align 8, !dbg !2316
  ret i64 %60, !dbg !2316
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @HeapManagerReadyCallback(%struct.GUID* noundef %0, i8* noundef %1, i8* noundef %2) #0 !dbg !2317 {
  %4 = alloca i64, align 8
  %5 = alloca %struct.GUID*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store %struct.GUID* %0, %struct.GUID** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.GUID** %5, metadata !2322, metadata !DIExpression()), !dbg !2323
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2324, metadata !DIExpression()), !dbg !2325
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2326, metadata !DIExpression()), !dbg !2327
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2328, metadata !DIExpression()), !dbg !2329
  %9 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2330
  %10 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %9, i32 0, i32 21, !dbg !2330
  %11 = load i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8**)** %10, align 8, !dbg !2330
  %12 = call i64 %11(%struct.GUID* noundef @gEfiHeapManagerProtocolGuid, i8* noundef null, i8** noundef bitcast (%struct._HEAP_MANAGER_PROTOCOL** @mHeapManager to i8**)) #3, !dbg !2330
  store i64 %12, i64* %8, align 8, !dbg !2330
  %13 = load i64, i64* %8, align 8, !dbg !2331
  %14 = icmp slt i64 %13, 0, !dbg !2331
  br i1 %14, label %15, label %30, !dbg !2331

15:                                               ; preds = %3
  br label %16, !dbg !2332

16:                                               ; preds = %15
  %17 = call i8 @DebugPrintEnabled() #3, !dbg !2335
  %18 = icmp ne i8 %17, 0, !dbg !2335
  br i1 %18, label %19, label %27, !dbg !2335

19:                                               ; preds = %16
  br label %20, !dbg !2337

20:                                               ; preds = %19
  %21 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2340
  %22 = icmp ne i8 %21, 0, !dbg !2340
  br i1 %22, label %23, label %25, !dbg !2340

23:                                               ; preds = %20
  %24 = load i64, i64* %8, align 8, !dbg !2342
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @.str.6.24, i64 0, i64 0), i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @__func__.HeapManagerReadyCallback, i64 0, i64 0), i64 noundef %24) #3, !dbg !2342
  br label %25, !dbg !2342

25:                                               ; preds = %23, %20
  br label %26, !dbg !2340

26:                                               ; preds = %25
  br label %27, !dbg !2337

27:                                               ; preds = %26, %16
  br label %28, !dbg !2335

28:                                               ; preds = %27
  %29 = load i64, i64* %8, align 8, !dbg !2345
  store i64 %29, i64* %4, align 8, !dbg !2345
  br label %53, !dbg !2345

30:                                               ; preds = %3
  br label %31, !dbg !2346

31:                                               ; preds = %30
  %32 = call i8 @DebugPrintEnabled() #3, !dbg !2347
  %33 = icmp ne i8 %32, 0, !dbg !2347
  br i1 %33, label %34, label %41, !dbg !2347

34:                                               ; preds = %31
  br label %35, !dbg !2349

35:                                               ; preds = %34
  %36 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2352
  %37 = icmp ne i8 %36, 0, !dbg !2352
  br i1 %37, label %38, label %39, !dbg !2352

38:                                               ; preds = %35
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7.25, i64 0, i64 0)) #3, !dbg !2354
  br label %39, !dbg !2354

39:                                               ; preds = %38, %35
  br label %40, !dbg !2352

40:                                               ; preds = %39
  br label %41, !dbg !2349

41:                                               ; preds = %40, %31
  br label %42, !dbg !2347

42:                                               ; preds = %41
  %43 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2357
  %44 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %43, i32 0, i32 8, !dbg !2357
  %45 = load i64 (...)*, i64 (...)** %44, align 8, !dbg !2357
  %46 = bitcast i64 (...)* %45 to i64 ()*, !dbg !2357
  %47 = call i64 %46() #3, !dbg !2357
  %48 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2358
  %49 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %48, i32 0, i32 7, !dbg !2358
  %50 = load i64 (...)*, i64 (...)** %49, align 8, !dbg !2358
  %51 = bitcast i64 (...)* %50 to i64 ()*, !dbg !2358
  %52 = call i64 %51() #3, !dbg !2358
  store i64 0, i64* %4, align 8, !dbg !2359
  br label %53, !dbg !2359

53:                                               ; preds = %42, %28
  %54 = load i64, i64* %4, align 8, !dbg !2360
  ret i64 %54, !dbg !2360
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @CharConverterReadyCallback(%struct.GUID* noundef %0, i8* noundef %1, i8* noundef %2) #0 !dbg !2361 {
  %4 = alloca i64, align 8
  %5 = alloca %struct.GUID*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store %struct.GUID* %0, %struct.GUID** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.GUID** %5, metadata !2362, metadata !DIExpression()), !dbg !2363
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !2364, metadata !DIExpression()), !dbg !2365
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2366, metadata !DIExpression()), !dbg !2367
  call void @llvm.dbg.declare(metadata i64* %8, metadata !2368, metadata !DIExpression()), !dbg !2369
  %9 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2370
  %10 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %9, i32 0, i32 21, !dbg !2370
  %11 = load i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8**)** %10, align 8, !dbg !2370
  %12 = call i64 %11(%struct.GUID* noundef @gEfiCharConverterProtocolGuid, i8* noundef null, i8** noundef bitcast (%struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter to i8**)) #3, !dbg !2370
  store i64 %12, i64* %8, align 8, !dbg !2370
  %13 = load i64, i64* %8, align 8, !dbg !2371
  %14 = icmp slt i64 %13, 0, !dbg !2371
  br i1 %14, label %15, label %30, !dbg !2371

15:                                               ; preds = %3
  br label %16, !dbg !2372

16:                                               ; preds = %15
  %17 = call i8 @DebugPrintEnabled() #3, !dbg !2375
  %18 = icmp ne i8 %17, 0, !dbg !2375
  br i1 %18, label %19, label %27, !dbg !2375

19:                                               ; preds = %16
  br label %20, !dbg !2377

20:                                               ; preds = %19
  %21 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2380
  %22 = icmp ne i8 %21, 0, !dbg !2380
  br i1 %22, label %23, label %25, !dbg !2380

23:                                               ; preds = %20
  %24 = load i64, i64* %8, align 8, !dbg !2382
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @.str.6.24, i64 0, i64 0), i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @__func__.CharConverterReadyCallback, i64 0, i64 0), i64 noundef %24) #3, !dbg !2382
  br label %25, !dbg !2382

25:                                               ; preds = %23, %20
  br label %26, !dbg !2380

26:                                               ; preds = %25
  br label %27, !dbg !2377

27:                                               ; preds = %26, %16
  br label %28, !dbg !2375

28:                                               ; preds = %27
  %29 = load i64, i64* %8, align 8, !dbg !2385
  store i64 %29, i64* %4, align 8, !dbg !2385
  br label %43, !dbg !2385

30:                                               ; preds = %3
  br label %31, !dbg !2386

31:                                               ; preds = %30
  %32 = call i8 @DebugPrintEnabled() #3, !dbg !2387
  %33 = icmp ne i8 %32, 0, !dbg !2387
  br i1 %33, label %34, label %41, !dbg !2387

34:                                               ; preds = %31
  br label %35, !dbg !2389

35:                                               ; preds = %34
  %36 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2392
  %37 = icmp ne i8 %36, 0, !dbg !2392
  br i1 %37, label %38, label %39, !dbg !2392

38:                                               ; preds = %35
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.8.26, i64 0, i64 0)) #3, !dbg !2394
  br label %39, !dbg !2394

39:                                               ; preds = %38, %35
  br label %40, !dbg !2392

40:                                               ; preds = %39
  br label %41, !dbg !2389

41:                                               ; preds = %40, %31
  br label %42, !dbg !2387

42:                                               ; preds = %41
  store i64 0, i64* %4, align 8, !dbg !2397
  br label %43, !dbg !2397

43:                                               ; preds = %42, %28
  %44 = load i64, i64* %4, align 8, !dbg !2398
  ret i64 %44, !dbg !2398
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Sample2TestsDriverEntryPoint(i8* noundef %0, %struct.EFI_SYSTEM_TABLE* noundef %1) #0 !dbg !2399 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.EFI_SYSTEM_TABLE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !2745, metadata !DIExpression()), !dbg !2746
  store %struct.EFI_SYSTEM_TABLE* %1, %struct.EFI_SYSTEM_TABLE** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.EFI_SYSTEM_TABLE** %5, metadata !2747, metadata !DIExpression()), !dbg !2748
  call void @llvm.dbg.declare(metadata i64* %6, metadata !2749, metadata !DIExpression()), !dbg !2750
  call void @llvm.dbg.declare(metadata i8** %7, metadata !2751, metadata !DIExpression()), !dbg !2752
  call void @llvm.dbg.declare(metadata i8** %8, metadata !2753, metadata !DIExpression()), !dbg !2754
  call void @llvm.dbg.declare(metadata i8** %9, metadata !2755, metadata !DIExpression()), !dbg !2756
  %10 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2757
  %11 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %10, i32 0, i32 21, !dbg !2757
  %12 = load i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8**)** %11, align 8, !dbg !2757
  %13 = call i64 %12(%struct.GUID* noundef @gEfiHeapManagerProtocolGuid, i8* noundef null, i8** noundef bitcast (%struct._HEAP_MANAGER_PROTOCOL** @mHeapManager to i8**)) #3, !dbg !2757
  store i64 %13, i64* %6, align 8, !dbg !2757
  %14 = load i64, i64* %6, align 8, !dbg !2758
  %15 = icmp slt i64 %14, 0, !dbg !2758
  br i1 %15, label %16, label %38, !dbg !2758

16:                                               ; preds = %2
  %17 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2759
  %18 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %17, i32 0, i32 19, !dbg !2759
  %19 = load i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)** %18, align 8, !dbg !2759
  %20 = call i64 %19(%struct.GUID* noundef @gEfiHeapManagerReadyProtocolGuid, i64 (%struct.GUID*, i8*, i8*)* noundef @HeapManagerReadyCallback, i8** noundef %8) #3, !dbg !2759
  store i64 %20, i64* %6, align 8, !dbg !2759
  %21 = load i64, i64* %6, align 8, !dbg !2762
  %22 = icmp slt i64 %21, 0, !dbg !2762
  br i1 %22, label %23, label %37, !dbg !2762

23:                                               ; preds = %16
  br label %24, !dbg !2763

24:                                               ; preds = %23
  %25 = call i8 @DebugPrintEnabled() #3, !dbg !2766
  %26 = icmp ne i8 %25, 0, !dbg !2766
  br i1 %26, label %27, label %34, !dbg !2766

27:                                               ; preds = %24
  br label %28, !dbg !2768

28:                                               ; preds = %27
  %29 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2771
  %30 = icmp ne i8 %29, 0, !dbg !2771
  br i1 %30, label %31, label %32, !dbg !2771

31:                                               ; preds = %28
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9.27, i64 0, i64 0), i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__func__.Sample2TestsDriverEntryPoint, i64 0, i64 0)) #3, !dbg !2773
  br label %32, !dbg !2773

32:                                               ; preds = %31, %28
  br label %33, !dbg !2771

33:                                               ; preds = %32
  br label %34, !dbg !2768

34:                                               ; preds = %33, %24
  br label %35, !dbg !2766

35:                                               ; preds = %34
  %36 = load i64, i64* %6, align 8, !dbg !2776
  store i64 %36, i64* %3, align 8, !dbg !2776
  br label %96, !dbg !2776

37:                                               ; preds = %16
  br label %49, !dbg !2777

38:                                               ; preds = %2
  %39 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2778
  %40 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %39, i32 0, i32 8, !dbg !2778
  %41 = load i64 (...)*, i64 (...)** %40, align 8, !dbg !2778
  %42 = bitcast i64 (...)* %41 to i64 ()*, !dbg !2778
  %43 = call i64 %42() #3, !dbg !2778
  %44 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !2780
  %45 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %44, i32 0, i32 7, !dbg !2780
  %46 = load i64 (...)*, i64 (...)** %45, align 8, !dbg !2780
  %47 = bitcast i64 (...)* %46 to i64 ()*, !dbg !2780
  %48 = call i64 %47() #3, !dbg !2780
  br label %49, !dbg !2781

49:                                               ; preds = %38, %37
  store void (...)* bitcast (void ()* @welcome_msg to void (...)*), void (...)** @funcptr, align 8, !dbg !2782
  %50 = load void (...)*, void (...)** @funcptr, align 8, !dbg !2783
  %51 = bitcast void (...)* %50 to void ()*, !dbg !2783
  call void %51() #3, !dbg !2783
  %52 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2784
  %53 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %52, i32 0, i32 19, !dbg !2784
  %54 = load i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)** %53, align 8, !dbg !2784
  %55 = call i64 %54(%struct.GUID* noundef @gEfiCharConverterReadyProtocolGuid, i64 (%struct.GUID*, i8*, i8*)* noundef @CharConverterReadyCallback, i8** noundef %9) #3, !dbg !2784
  store i64 %55, i64* %6, align 8, !dbg !2784
  %56 = load i64, i64* %6, align 8, !dbg !2785
  %57 = icmp slt i64 %56, 0, !dbg !2785
  br i1 %57, label %58, label %72, !dbg !2785

58:                                               ; preds = %49
  br label %59, !dbg !2786

59:                                               ; preds = %58
  %60 = call i8 @DebugPrintEnabled() #3, !dbg !2789
  %61 = icmp ne i8 %60, 0, !dbg !2789
  br i1 %61, label %62, label %69, !dbg !2789

62:                                               ; preds = %59
  br label %63, !dbg !2791

63:                                               ; preds = %62
  %64 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2794
  %65 = icmp ne i8 %64, 0, !dbg !2794
  br i1 %65, label %66, label %67, !dbg !2794

66:                                               ; preds = %63
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9.27, i64 0, i64 0), i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__func__.Sample2TestsDriverEntryPoint, i64 0, i64 0)) #3, !dbg !2796
  br label %67, !dbg !2796

67:                                               ; preds = %66, %63
  br label %68, !dbg !2794

68:                                               ; preds = %67
  br label %69, !dbg !2791

69:                                               ; preds = %68, %59
  br label %70, !dbg !2789

70:                                               ; preds = %69
  %71 = load i64, i64* %6, align 8, !dbg !2799
  store i64 %71, i64* %3, align 8, !dbg !2799
  br label %96, !dbg !2799

72:                                               ; preds = %49
  %73 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !2800
  %74 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %73, i32 0, i32 23, !dbg !2800
  %75 = load i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)*, i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)** %74, align 8, !dbg !2800
  %76 = call i64 %75(i64 (i8*, i8*, i8*, i64*)* noundef @Sample2TestsDriverHandler, %struct.GUID* noundef @gEfiSample2TestsDriverCommGuid, i8** noundef %7) #3, !dbg !2800
  store i64 %76, i64* %6, align 8, !dbg !2800
  %77 = load i64, i64* %6, align 8, !dbg !2801
  %78 = icmp slt i64 %77, 0, !dbg !2801
  br i1 %78, label %79, label %94, !dbg !2801

79:                                               ; preds = %72
  br label %80, !dbg !2802

80:                                               ; preds = %79
  %81 = call i8 @DebugPrintEnabled() #3, !dbg !2805
  %82 = icmp ne i8 %81, 0, !dbg !2805
  br i1 %82, label %83, label %91, !dbg !2805

83:                                               ; preds = %80
  br label %84, !dbg !2807

84:                                               ; preds = %83
  %85 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !2810
  %86 = icmp ne i8 %85, 0, !dbg !2810
  br i1 %86, label %87, label %89, !dbg !2810

87:                                               ; preds = %84
  %88 = load i64, i64* %6, align 8, !dbg !2812
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @.str.10.28, i64 0, i64 0), i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__func__.Sample2TestsDriverEntryPoint, i64 0, i64 0), i64 noundef %88) #3, !dbg !2812
  br label %89, !dbg !2812

89:                                               ; preds = %87, %84
  br label %90, !dbg !2810

90:                                               ; preds = %89
  br label %91, !dbg !2807

91:                                               ; preds = %90, %80
  br label %92, !dbg !2805

92:                                               ; preds = %91
  %93 = load i64, i64* %6, align 8, !dbg !2815
  store i64 %93, i64* %3, align 8, !dbg !2815
  br label %96, !dbg !2815

94:                                               ; preds = %72
  %95 = load i64, i64* %6, align 8, !dbg !2816
  store i64 %95, i64* %3, align 8, !dbg !2816
  br label %96, !dbg !2816

96:                                               ; preds = %94, %92, %70, %35
  %97 = load i64, i64* %3, align 8, !dbg !2817
  ret i64 %97, !dbg !2817
}

attributes #0 = { noimplicitfloat noinline noredzone nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-stack-arg-probe" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noimplicitfloat noredzone "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noimplicitfloat noredzone "no-builtins" "trap-func-name"="undefined_behavior_has_been_optimized_away_by_clang" }

!llvm.dbg.cu = !{!2, !93, !160}
!llvm.ident = !{!308, !308, !308}
!llvm.module.flags = !{!309, !310, !311, !312, !313, !314, !315, !316}

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
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(name: "BlockSizes", scope: !93, file: !123, line: 7, type: !157, isLocal: false, isDefinition: true)
!93 = distinct !DICompileUnit(language: DW_LANG_C99, file: !94, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !95, globals: !110, splitDebugInlining: false, nameTableKind: None)
!94 = !DIFile(filename: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/HeapManager/HeapManager.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Build/OvmfX64/NOOPT_CLANGPDB/X64/Testcases/Sample2Tests/HeapManager/HeapManager", checksumkind: CSK_MD5, checksum: "6c926d8fe363f8895e792556b2d0d8e9")
!95 = !{!54, !68, !65, !96, !103, !53, !108, !71}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHUNK_T", file: !98, line: 34, baseType: !99)
!98 = !DIFile(filename: "Testcases/Sample2Tests/HeapManager/HeapManager.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "e714afc4efaaf897241f252dc062e7a1")
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHUNK", file: !98, line: 32, size: 64, elements: !100)
!100 = !{!101}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "Next", scope: !99, file: !98, line: 33, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "PAGE_T", file: !98, line: 38, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PAGE", file: !98, line: 36, size: 64, elements: !106)
!106 = !{!107}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "Self", scope: !105, file: !98, line: 37, baseType: !96, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT8", file: !57, line: 196, baseType: !69)
!110 = !{!91, !111, !113, !115, !117, !119, !121, !128, !141}
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression(DW_OP_constu, 0, DW_OP_stack_value))
!112 = distinct !DIGlobalVariable(name: "B_080", scope: !93, file: !98, line: 27, type: !76, isLocal: true, isDefinition: true)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!114 = distinct !DIGlobalVariable(name: "B_100", scope: !93, file: !98, line: 28, type: !76, isLocal: true, isDefinition: true)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!116 = distinct !DIGlobalVariable(name: "B_200", scope: !93, file: !98, line: 29, type: !76, isLocal: true, isDefinition: true)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression(DW_OP_constu, 6, DW_OP_stack_value))
!118 = distinct !DIGlobalVariable(name: "EfiRuntimeServicesData", scope: !93, file: !6, line: 70, type: !76, isLocal: true, isDefinition: true)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression(DW_OP_constu, 0, DW_OP_stack_value))
!120 = distinct !DIGlobalVariable(name: "EFI_NATIVE_INTERFACE", scope: !93, file: !14, line: 1163, type: !76, isLocal: true, isDefinition: true)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(name: "mHeapManagerReady", scope: !93, file: !123, line: 3, type: !124, isLocal: false, isDefinition: true)
!123 = !DIFile(filename: "Testcases/Sample2Tests/HeapManager/HeapManager.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6c926d8fe363f8895e792556b2d0d8e9")
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "NOTIFY_PROTOCOL_READY_PROTOCOL", file: !98, line: 122, baseType: !125)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_NOTIFY_PROTOCOL_READY_PROTOCOL", file: !98, line: 120, size: 32, elements: !126)
!126 = !{!127}
!127 = !DIDerivedType(tag: DW_TAG_member, name: "ReadyFlags", scope: !125, file: !98, line: 121, baseType: !90, size: 32)
!128 = !DIGlobalVariableExpression(var: !129, expr: !DIExpression())
!129 = distinct !DIGlobalVariable(name: "Heap", scope: !93, file: !123, line: 5, type: !130, isLocal: false, isDefinition: true)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_T", file: !98, line: 55, baseType: !131)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "HEAP", file: !98, line: 52, size: 832, elements: !132)
!132 = !{!133, !137}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "Pages", scope: !131, file: !98, line: 53, baseType: !134, size: 192)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 192, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 3)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "FreeList", scope: !131, file: !98, line: 54, baseType: !138, size: 640, offset: 192)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 640, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 10)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(name: "HeapMd", scope: !93, file: !123, line: 6, type: !143, isLocal: false, isDefinition: true)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_METADATA_T", file: !98, line: 49, baseType: !144)
!144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "HEAP_METADATA_T", file: !98, line: 46, size: 5824, elements: !145)
!145 = !{!146, !156}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "HandleTable", scope: !144, file: !98, line: 47, baseType: !147, size: 5760)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !148, size: 5760, elements: !154)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "Handle_Entry_T", file: !98, line: 44, baseType: !149)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Handle_Entry_T", file: !98, line: 40, size: 192, elements: !150)
!150 = !{!151, !152, !153}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "ChunkPtr", scope: !149, file: !98, line: 41, baseType: !96, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "ChunkSize", scope: !149, file: !98, line: 42, baseType: !56, size: 64, offset: 64)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "InUse", scope: !149, file: !98, line: 43, baseType: !65, size: 64, offset: 128)
!154 = !{!155}
!155 = !DISubrange(count: 30)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "FreeHandleTop", scope: !144, file: !98, line: 48, baseType: !65, size: 64, offset: 5760)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 192, elements: !135)
!158 = !DIGlobalVariableExpression(var: !159, expr: !DIExpression())
!159 = distinct !DIGlobalVariable(name: "mHeapManager", scope: !160, file: !213, line: 3, type: !246, isLocal: false, isDefinition: true)
!160 = distinct !DICompileUnit(language: DW_LANG_C99, file: !161, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !162, retainedTypes: !176, globals: !210, splitDebugInlining: false, nameTableKind: None)
!161 = !DIFile(filename: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Build/OvmfX64/NOOPT_CLANGPDB/X64/Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver", checksumkind: CSK_MD5, checksum: "3adaf1c4a19765f62b2ca720d13894ba")
!162 = !{!163, !171, !5, !13, !20, !39, !44, !47}
!163 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "OP_TYPE", file: !164, line: 17, baseType: !7, size: 32, elements: !165)
!164 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "aaa522c4986706b69bb07c8847f73366")
!165 = !{!166, !167, !168, !169, !170}
!166 = !DIEnumerator(name: "CONVERT", value: 0)
!167 = !DIEnumerator(name: "FREE_LIST", value: 1)
!168 = !DIEnumerator(name: "DISPLAY_LIST", value: 2)
!169 = !DIEnumerator(name: "DISPLAY_METADATA", value: 3)
!170 = !DIEnumerator(name: "MSG", value: 4)
!171 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "CONVERT_TYPE", file: !164, line: 25, baseType: !7, size: 32, elements: !172)
!172 = !{!173, !174, !175}
!173 = !DIEnumerator(name: "STANDARD", value: 0)
!174 = !DIEnumerator(name: "LIBXML2", value: 1)
!175 = !DIEnumerator(name: "PKEXEC", value: 2)
!176 = !{!68, !54, !177, !53, !186, !71, !65}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_DATA", file: !164, line: 37, baseType: !179)
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHAR_CONVERTER_DATA", file: !164, line: 34, size: 4160, elements: !180)
!180 = !{!181, !182}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "Size", scope: !179, file: !164, line: 35, baseType: !65, size: 64)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "Data", scope: !179, file: !164, line: 36, baseType: !183, size: 4096, offset: 64)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 4096, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 512)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "SAMPLE2_TESTS_DRIVER_COMM_BUFFER", file: !164, line: 44, baseType: !188)
!188 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "SAMPLE2_TESTS_DRIVER_COMM_BUFFER", file: !164, line: 39, size: 8384, elements: !189)
!189 = !{!190, !204, !205, !206}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "Sample2Guid", scope: !188, file: !164, line: 40, baseType: !191, size: 128)
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GUID", file: !192, line: 25, baseType: !193)
!192 = !DIFile(filename: "MdePkg/Include/Uefi/UefiBaseType.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "652b6036ee3f46705189b44807c85960")
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "GUID", file: !55, line: 218, baseType: !194)
!194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GUID", file: !55, line: 213, size: 128, elements: !195)
!195 = !{!196, !197, !199, !200}
!196 = !DIDerivedType(tag: DW_TAG_member, name: "Data1", scope: !194, file: !55, line: 214, baseType: !90, size: 32)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "Data2", scope: !194, file: !55, line: 215, baseType: !198, size: 16, offset: 32)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT16", file: !57, line: 178, baseType: !61)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "Data3", scope: !194, file: !55, line: 216, baseType: !198, size: 16, offset: 48)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "Data4", scope: !194, file: !55, line: 217, baseType: !201, size: 64, offset: 64)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !109, size: 64, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 8)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "Operation", scope: !188, file: !164, line: 41, baseType: !163, size: 32, offset: 128)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "Conversion", scope: !188, file: !164, line: 42, baseType: !171, size: 32, offset: 160)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "Data", scope: !188, file: !164, line: 43, baseType: !207, size: 8192, offset: 192)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !109, size: 8192, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 1024)
!210 = !{!158, !211, !301, !303}
!211 = !DIGlobalVariableExpression(var: !212, expr: !DIExpression())
!212 = distinct !DIGlobalVariable(name: "mCharConverter", scope: !160, file: !213, line: 4, type: !214, isLocal: false, isDefinition: true)
!213 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "3adaf1c4a19765f62b2ca720d13894ba")
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PROTOCOL", file: !216, line: 83, baseType: !217)
!216 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/../CharConverter/CharConverter.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ac05300bbbb33b9bef78614a50737cb1")
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CHAR_CONVERTER_PROTOCOL", file: !216, line: 77, size: 320, elements: !218)
!218 = !{!219, !234, !241, !297, !299}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "IconvOpen", scope: !217, file: !216, line: 78, baseType: !220, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV_OPEN", file: !216, line: 37, baseType: !221)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DISubroutineType(types: !223)
!223 = !{!224, !225, !225, !227}
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STATUS", file: !192, line: 29, baseType: !54)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!226 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "ICONV_T", file: !216, line: 25, baseType: !230)
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ICONV_T", file: !216, line: 22, size: 128, elements: !231)
!231 = !{!232, !233}
!232 = !DIDerivedType(tag: DW_TAG_member, name: "FromEncoding", scope: !230, file: !216, line: 23, baseType: !70, size: 64)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "ToEncoding", scope: !230, file: !216, line: 24, baseType: !70, size: 64, offset: 64)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "Iconv", scope: !217, file: !216, line: 79, baseType: !235, size: 64, offset: 64)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV", file: !216, line: 45, baseType: !236)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = !DISubroutineType(types: !238)
!238 = !{!224, !228, !70, !65, !239, !240}
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "StandardConvert", scope: !217, file: !216, line: 80, baseType: !242, size: 64, offset: 128)
!242 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_STANDARD_CONVERT", file: !216, line: 55, baseType: !243)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DISubroutineType(types: !245)
!245 = !{!224, !70, !240, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_PROTOCOL", file: !248, line: 118, baseType: !249)
!248 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/../CharConverter/../HeapManager/HeapManager.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "e714afc4efaaf897241f252dc062e7a1")
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_HEAP_MANAGER_PROTOCOL", file: !248, line: 108, size: 576, elements: !250)
!250 = !{!251, !256, !268, !273, !278, !280, !282, !293, !295}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "GetBlockSize", scope: !249, file: !248, line: 109, baseType: !252, size: 64)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_GET_BLOCK_SIZE", file: !248, line: 63, baseType: !253)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DISubroutineType(types: !255)
!255 = !{!224, !56, !240}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "AllocateChunk", scope: !249, file: !248, line: 110, baseType: !257, size: 64, offset: 64)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_ALLOCATE_CHUNK", file: !248, line: 70, baseType: !258)
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64)
!259 = !DISubroutineType(types: !260)
!260 = !{!224, !56, !261}
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHUNK_T", file: !248, line: 34, baseType: !264)
!264 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHUNK", file: !248, line: 32, size: 64, elements: !265)
!265 = !{!266}
!266 = !DIDerivedType(tag: DW_TAG_member, name: "Next", scope: !264, file: !248, line: 33, baseType: !267, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "FreeChunk", scope: !249, file: !248, line: 111, baseType: !269, size: 64, offset: 128)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_CHUNK", file: !248, line: 77, baseType: !270)
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DISubroutineType(types: !272)
!272 = !{!224, !65}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "FreeAllocList", scope: !249, file: !248, line: 112, baseType: !274, size: 64, offset: 192)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_ALLOC_LIST", file: !248, line: 83, baseType: !275)
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!276 = !DISubroutineType(types: !277)
!277 = !{!224, null}
!278 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayFreeList", scope: !249, file: !248, line: 113, baseType: !279, size: 64, offset: 256)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_FREE_LIST", file: !248, line: 87, baseType: !275)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayHeapMetadata", scope: !249, file: !248, line: 114, baseType: !281, size: 64, offset: 320)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_HEAP_METADATA", file: !248, line: 91, baseType: !275)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "InitializePage", scope: !249, file: !248, line: 115, baseType: !283, size: 64, offset: 384)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_PAGE", file: !248, line: 95, baseType: !284)
!284 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !285, size: 64)
!285 = !DISubroutineType(types: !286)
!286 = !{!224, !56, !287}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!289 = !DIDerivedType(tag: DW_TAG_typedef, name: "PAGE_T", file: !248, line: 38, baseType: !290)
!290 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PAGE", file: !248, line: 36, size: 64, elements: !291)
!291 = !{!292}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "Self", scope: !290, file: !248, line: 37, baseType: !262, size: 64)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeapMetadata", scope: !249, file: !248, line: 116, baseType: !294, size: 64, offset: 448)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP_METADATA", file: !248, line: 102, baseType: !275)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeap", scope: !249, file: !248, line: 117, baseType: !296, size: 64, offset: 512)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP", file: !248, line: 106, baseType: !275)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "Libxml2Convert", scope: !217, file: !216, line: 81, baseType: !298, size: 64, offset: 192)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_LIBXML2_CONVERT", file: !216, line: 63, baseType: !243)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "PkexecConvert", scope: !217, file: !216, line: 82, baseType: !300, size: 64, offset: 256)
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PKEXEC_CONVERT", file: !216, line: 71, baseType: !243)
!301 = !DIGlobalVariableExpression(var: !302, expr: !DIExpression())
!302 = distinct !DIGlobalVariable(name: "w_msg", scope: !160, file: !213, line: 7, type: !62, isLocal: false, isDefinition: true)
!303 = !DIGlobalVariableExpression(var: !304, expr: !DIExpression())
!304 = distinct !DIGlobalVariable(name: "funcptr", scope: !160, file: !213, line: 8, type: !305, isLocal: false, isDefinition: true)
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64)
!306 = !DISubroutineType(types: !307)
!307 = !{null, null}
!308 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!309 = !{i32 2, !"CodeView", i32 1}
!310 = !{i32 2, !"Debug Info Version", i32 3}
!311 = !{i32 1, !"wchar_size", i32 2}
!312 = !{i32 7, !"PIC Level", i32 2}
!313 = !{i32 1, !"Code Model", i32 1}
!314 = !{i32 7, !"uwtable", i32 1}
!315 = !{i32 1, !"ThinLTO", i32 0}
!316 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!317 = distinct !DISubprogram(name: "IconvOpen", scope: !85, file: !85, line: 9, type: !318, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !328)
!318 = !DISubroutineType(types: !319)
!319 = !{!224, !225, !225, !320}
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !321, size: 64)
!321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 64)
!322 = !DIDerivedType(tag: DW_TAG_typedef, name: "ICONV_T", file: !323, line: 25, baseType: !324)
!323 = !DIFile(filename: "Testcases/Sample2Tests/CharConverter/CharConverter.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ac05300bbbb33b9bef78614a50737cb1")
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ICONV_T", file: !323, line: 22, size: 128, elements: !325)
!325 = !{!326, !327}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "FromEncoding", scope: !324, file: !323, line: 23, baseType: !70, size: 64)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "ToEncoding", scope: !324, file: !323, line: 24, baseType: !70, size: 64, offset: 64)
!328 = !{}
!329 = !DILocalVariable(name: "ToEncoding", arg: 1, scope: !317, file: !85, line: 10, type: !225)
!330 = !DILocation(line: 10, scope: !317)
!331 = !DILocalVariable(name: "FromEncoding", arg: 2, scope: !317, file: !85, line: 11, type: !225)
!332 = !DILocation(line: 11, scope: !317)
!333 = !DILocalVariable(name: "CharDesc", arg: 3, scope: !317, file: !85, line: 12, type: !320)
!334 = !DILocation(line: 12, scope: !317)
!335 = !DILocation(line: 15, scope: !317)
!336 = !DILocation(line: 16, scope: !317)
!337 = !DILocation(line: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !339, file: !85, line: 16)
!339 = distinct !DILexicalBlock(scope: !317, file: !85, line: 16)
!340 = !DILocation(line: 21, scope: !317)
!341 = !DILocation(line: 22, scope: !317)
!342 = !DILocation(line: 23, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !85, line: 22)
!344 = distinct !DILexicalBlock(scope: !317, file: !85, line: 22)
!345 = !DILocation(line: 24, scope: !343)
!346 = !DILocation(line: 25, scope: !343)
!347 = !DILocation(line: 27, scope: !317)
!348 = !DILocation(line: 29, scope: !317)
!349 = !DILocation(line: 30, scope: !317)
!350 = !DILocation(line: 31, scope: !351)
!351 = distinct !DILexicalBlock(scope: !352, file: !85, line: 30)
!352 = distinct !DILexicalBlock(scope: !317, file: !85, line: 30)
!353 = !DILocation(line: 32, scope: !351)
!354 = !DILocation(line: 33, scope: !351)
!355 = !DILocation(line: 34, scope: !351)
!356 = !DILocation(line: 36, scope: !317)
!357 = !DILocation(line: 38, scope: !317)
!358 = !DILocation(line: 39, scope: !317)
!359 = distinct !DISubprogram(name: "Iconv", scope: !85, file: !85, line: 44, type: !360, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !328)
!360 = !DISubroutineType(types: !361)
!361 = !{!224, !321, !70, !65, !239, !240}
!362 = !DILocalVariable(name: "CharDesc", arg: 1, scope: !359, file: !85, line: 45, type: !321)
!363 = !DILocation(line: 45, scope: !359)
!364 = !DILocalVariable(name: "InputBuffer", arg: 2, scope: !359, file: !85, line: 46, type: !70)
!365 = !DILocation(line: 46, scope: !359)
!366 = !DILocalVariable(name: "InputSize", arg: 3, scope: !359, file: !85, line: 47, type: !65)
!367 = !DILocation(line: 47, scope: !359)
!368 = !DILocalVariable(name: "OutputBuffer", arg: 4, scope: !359, file: !85, line: 48, type: !239)
!369 = !DILocation(line: 48, scope: !359)
!370 = !DILocalVariable(name: "OutputSize", arg: 5, scope: !359, file: !85, line: 49, type: !240)
!371 = !DILocation(line: 49, scope: !359)
!372 = !DILocation(line: 51, scope: !359)
!373 = !DILocation(line: 54, scope: !374)
!374 = distinct !DILexicalBlock(scope: !375, file: !85, line: 52)
!375 = distinct !DILexicalBlock(scope: !359, file: !85, line: 51)
!376 = !DILocation(line: 55, scope: !377)
!377 = distinct !DILexicalBlock(scope: !378, file: !85, line: 54)
!378 = distinct !DILexicalBlock(scope: !374, file: !85, line: 54)
!379 = !DILocalVariable(name: "i", scope: !380, file: !85, line: 58, type: !56)
!380 = distinct !DILexicalBlock(scope: !374, file: !85, line: 58)
!381 = !DILocation(line: 58, scope: !380)
!382 = !DILocation(line: 59, scope: !383)
!383 = distinct !DILexicalBlock(scope: !384, file: !85, line: 58)
!384 = distinct !DILexicalBlock(scope: !380, file: !85, line: 58)
!385 = !DILocation(line: 60, scope: !383)
!386 = !DILocation(line: 61, scope: !383)
!387 = !DILocation(line: 58, scope: !384)
!388 = distinct !{!388, !381, !389, !390}
!389 = !DILocation(line: 61, scope: !380)
!390 = !{!"llvm.loop.mustprogress"}
!391 = !DILocation(line: 63, scope: !374)
!392 = !DILocation(line: 64, scope: !374)
!393 = !DILocation(line: 66, scope: !375)
!394 = !DILocation(line: 69, scope: !395)
!395 = distinct !DILexicalBlock(scope: !396, file: !85, line: 67)
!396 = distinct !DILexicalBlock(scope: !375, file: !85, line: 66)
!397 = !DILocation(line: 70, scope: !398)
!398 = distinct !DILexicalBlock(scope: !399, file: !85, line: 69)
!399 = distinct !DILexicalBlock(scope: !395, file: !85, line: 69)
!400 = !DILocalVariable(name: "i", scope: !401, file: !85, line: 73, type: !56)
!401 = distinct !DILexicalBlock(scope: !395, file: !85, line: 73)
!402 = !DILocation(line: 73, scope: !401)
!403 = !DILocalVariable(name: "utf16_str", scope: !404, file: !85, line: 74, type: !62)
!404 = distinct !DILexicalBlock(scope: !405, file: !85, line: 73)
!405 = distinct !DILexicalBlock(scope: !401, file: !85, line: 73)
!406 = !DILocation(line: 74, scope: !404)
!407 = !DILocation(line: 75, scope: !404)
!408 = !DILocation(line: 76, scope: !409)
!409 = distinct !DILexicalBlock(scope: !410, file: !85, line: 75)
!410 = distinct !DILexicalBlock(scope: !404, file: !85, line: 75)
!411 = !DILocation(line: 77, scope: !409)
!412 = !DILocation(line: 78, scope: !413)
!413 = distinct !DILexicalBlock(scope: !410, file: !85, line: 77)
!414 = !DILocation(line: 79, scope: !413)
!415 = !DILocation(line: 80, scope: !404)
!416 = !DILocation(line: 81, scope: !404)
!417 = !DILocation(line: 73, scope: !405)
!418 = distinct !{!418, !402, !419, !390}
!419 = !DILocation(line: 81, scope: !401)
!420 = !DILocation(line: 83, scope: !395)
!421 = !DILocation(line: 84, scope: !395)
!422 = !DILocation(line: 86, scope: !396)
!423 = !DILocation(line: 89, scope: !424)
!424 = distinct !DILexicalBlock(scope: !425, file: !85, line: 87)
!425 = distinct !DILexicalBlock(scope: !396, file: !85, line: 86)
!426 = !DILocation(line: 90, scope: !427)
!427 = distinct !DILexicalBlock(scope: !428, file: !85, line: 89)
!428 = distinct !DILexicalBlock(scope: !424, file: !85, line: 89)
!429 = !DILocalVariable(name: "i", scope: !430, file: !85, line: 92, type: !56)
!430 = distinct !DILexicalBlock(scope: !424, file: !85, line: 92)
!431 = !DILocation(line: 92, scope: !430)
!432 = !DILocation(line: 93, scope: !433)
!433 = distinct !DILexicalBlock(scope: !434, file: !85, line: 92)
!434 = distinct !DILexicalBlock(scope: !430, file: !85, line: 92)
!435 = !DILocation(line: 94, scope: !433)
!436 = !DILocation(line: 95, scope: !437)
!437 = distinct !DILexicalBlock(scope: !438, file: !85, line: 94)
!438 = distinct !DILexicalBlock(scope: !433, file: !85, line: 94)
!439 = !DILocation(line: 96, scope: !437)
!440 = !DILocation(line: 98, scope: !441)
!441 = distinct !DILexicalBlock(scope: !438, file: !85, line: 96)
!442 = !DILocation(line: 100, scope: !443)
!443 = distinct !DILexicalBlock(scope: !444, file: !85, line: 99)
!444 = distinct !DILexicalBlock(scope: !441, file: !85, line: 98)
!445 = !DILocation(line: 101, scope: !443)
!446 = !DILocation(line: 102, scope: !443)
!447 = !DILocation(line: 103, scope: !443)
!448 = !DILocation(line: 104, scope: !443)
!449 = !DILocation(line: 105, scope: !443)
!450 = !DILocation(line: 106, scope: !443)
!451 = !DILocation(line: 107, scope: !443)
!452 = !DILocation(line: 111, scope: !453)
!453 = distinct !DILexicalBlock(scope: !444, file: !85, line: 110)
!454 = !DILocation(line: 112, scope: !453)
!455 = !DILocation(line: 113, scope: !441)
!456 = !DILocation(line: 114, scope: !433)
!457 = !DILocation(line: 92, scope: !434)
!458 = distinct !{!458, !431, !459, !390}
!459 = !DILocation(line: 114, scope: !430)
!460 = !DILocation(line: 116, scope: !424)
!461 = !DILocation(line: 117, scope: !424)
!462 = !DILocation(line: 118, scope: !424)
!463 = !DILocation(line: 120, scope: !425)
!464 = !DILocation(line: 123, scope: !465)
!465 = distinct !DILexicalBlock(scope: !466, file: !85, line: 121)
!466 = distinct !DILexicalBlock(scope: !425, file: !85, line: 120)
!467 = !DILocation(line: 124, scope: !468)
!468 = distinct !DILexicalBlock(scope: !469, file: !85, line: 123)
!469 = distinct !DILexicalBlock(scope: !465, file: !85, line: 123)
!470 = !DILocalVariable(name: "OutIndex", scope: !465, file: !85, line: 127, type: !56)
!471 = !DILocation(line: 127, scope: !465)
!472 = !DILocalVariable(name: "i", scope: !473, file: !85, line: 128, type: !56)
!473 = distinct !DILexicalBlock(scope: !465, file: !85, line: 128)
!474 = !DILocation(line: 128, scope: !473)
!475 = !DILocalVariable(name: "Char", scope: !476, file: !85, line: 129, type: !109)
!476 = distinct !DILexicalBlock(scope: !477, file: !85, line: 128)
!477 = distinct !DILexicalBlock(scope: !473, file: !85, line: 128)
!478 = !DILocation(line: 129, scope: !476)
!479 = !DILocation(line: 131, scope: !476)
!480 = !DILocation(line: 132, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !85, line: 131)
!482 = distinct !DILexicalBlock(scope: !476, file: !85, line: 131)
!483 = !DILocation(line: 133, scope: !481)
!484 = !DILocation(line: 134, scope: !481)
!485 = !DILocation(line: 135, scope: !482)
!486 = !DILocalVariable(name: "Char2", scope: !487, file: !85, line: 136, type: !109)
!487 = distinct !DILexicalBlock(scope: !488, file: !85, line: 135)
!488 = distinct !DILexicalBlock(scope: !482, file: !85, line: 135)
!489 = !DILocation(line: 136, scope: !487)
!490 = !DILocation(line: 138, scope: !487)
!491 = !DILocalVariable(name: "UnicodeChar", scope: !492, file: !85, line: 139, type: !198)
!492 = distinct !DILexicalBlock(scope: !493, file: !85, line: 138)
!493 = distinct !DILexicalBlock(scope: !487, file: !85, line: 138)
!494 = !DILocation(line: 139, scope: !492)
!495 = !DILocation(line: 141, scope: !492)
!496 = !DILocation(line: 142, scope: !497)
!497 = distinct !DILexicalBlock(scope: !498, file: !85, line: 141)
!498 = distinct !DILexicalBlock(scope: !492, file: !85, line: 141)
!499 = !DILocation(line: 143, scope: !497)
!500 = !DILocation(line: 146, scope: !501)
!501 = distinct !DILexicalBlock(scope: !498, file: !85, line: 144)
!502 = !DILocation(line: 147, scope: !501)
!503 = !DILocation(line: 148, scope: !501)
!504 = !DILocation(line: 149, scope: !501)
!505 = !DILocation(line: 150, scope: !501)
!506 = !DILocation(line: 152, scope: !492)
!507 = !DILocation(line: 153, scope: !492)
!508 = !DILocation(line: 156, scope: !509)
!509 = distinct !DILexicalBlock(scope: !493, file: !85, line: 154)
!510 = !DILocation(line: 157, scope: !509)
!511 = !DILocation(line: 158, scope: !509)
!512 = !DILocation(line: 159, scope: !487)
!513 = !DILocation(line: 160, scope: !488)
!514 = !DILocalVariable(name: "Char2", scope: !515, file: !85, line: 162, type: !109)
!515 = distinct !DILexicalBlock(scope: !516, file: !85, line: 160)
!516 = distinct !DILexicalBlock(scope: !488, file: !85, line: 160)
!517 = !DILocation(line: 162, scope: !515)
!518 = !DILocalVariable(name: "Char3", scope: !515, file: !85, line: 163, type: !109)
!519 = !DILocation(line: 163, scope: !515)
!520 = !DILocation(line: 165, scope: !515)
!521 = !DILocalVariable(name: "UnicodeChar", scope: !522, file: !85, line: 166, type: !198)
!522 = distinct !DILexicalBlock(scope: !523, file: !85, line: 165)
!523 = distinct !DILexicalBlock(scope: !515, file: !85, line: 165)
!524 = !DILocation(line: 166, scope: !522)
!525 = !DILocation(line: 170, scope: !522)
!526 = !DILocation(line: 172, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !85, line: 170)
!528 = distinct !DILexicalBlock(scope: !522, file: !85, line: 170)
!529 = !DILocation(line: 173, scope: !527)
!530 = !DILocation(line: 174, scope: !522)
!531 = !DILocation(line: 175, scope: !522)
!532 = !DILocation(line: 177, scope: !533)
!533 = distinct !DILexicalBlock(scope: !523, file: !85, line: 176)
!534 = !DILocation(line: 178, scope: !533)
!535 = !DILocation(line: 179, scope: !533)
!536 = !DILocation(line: 180, scope: !515)
!537 = !DILocation(line: 182, scope: !538)
!538 = distinct !DILexicalBlock(scope: !516, file: !85, line: 181)
!539 = !DILocation(line: 183, scope: !538)
!540 = !DILocation(line: 184, scope: !538)
!541 = !DILocation(line: 160, scope: !516)
!542 = !DILocation(line: 135, scope: !488)
!543 = !DILocation(line: 128, scope: !477)
!544 = distinct !{!544, !474, !545, !390}
!545 = !DILocation(line: 185, scope: !473)
!546 = !DILocation(line: 187, scope: !465)
!547 = !DILocation(line: 199, scope: !465)
!548 = !DILocation(line: 121, scope: !466)
!549 = !DILocation(line: 87, scope: !425)
!550 = !DILocation(line: 67, scope: !396)
!551 = !DILocation(line: 203, scope: !359)
!552 = !DILocation(line: 204, scope: !359)
!553 = distinct !DISubprogram(name: "StandardConvert", scope: !85, file: !85, line: 208, type: !554, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !328)
!554 = !DISubroutineType(types: !555)
!555 = !{!224, !70, !240, !556}
!556 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !557, size: 64)
!557 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_PROTOCOL", file: !75, line: 118, baseType: !558)
!558 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_HEAP_MANAGER_PROTOCOL", file: !75, line: 108, size: 576, elements: !559)
!559 = !{!560, !562, !574, !576, !578, !580, !582, !593, !595}
!560 = !DIDerivedType(tag: DW_TAG_member, name: "GetBlockSize", scope: !558, file: !75, line: 109, baseType: !561, size: 64)
!561 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_GET_BLOCK_SIZE", file: !75, line: 63, baseType: !253)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "AllocateChunk", scope: !558, file: !75, line: 110, baseType: !563, size: 64, offset: 64)
!563 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_ALLOCATE_CHUNK", file: !75, line: 70, baseType: !564)
!564 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !565, size: 64)
!565 = !DISubroutineType(types: !566)
!566 = !{!224, !56, !567}
!567 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64)
!568 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !569, size: 64)
!569 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHUNK_T", file: !75, line: 34, baseType: !570)
!570 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHUNK", file: !75, line: 32, size: 64, elements: !571)
!571 = !{!572}
!572 = !DIDerivedType(tag: DW_TAG_member, name: "Next", scope: !570, file: !75, line: 33, baseType: !573, size: 64)
!573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !570, size: 64)
!574 = !DIDerivedType(tag: DW_TAG_member, name: "FreeChunk", scope: !558, file: !75, line: 111, baseType: !575, size: 64, offset: 128)
!575 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_CHUNK", file: !75, line: 77, baseType: !270)
!576 = !DIDerivedType(tag: DW_TAG_member, name: "FreeAllocList", scope: !558, file: !75, line: 112, baseType: !577, size: 64, offset: 192)
!577 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_ALLOC_LIST", file: !75, line: 83, baseType: !275)
!578 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayFreeList", scope: !558, file: !75, line: 113, baseType: !579, size: 64, offset: 256)
!579 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_FREE_LIST", file: !75, line: 87, baseType: !275)
!580 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayHeapMetadata", scope: !558, file: !75, line: 114, baseType: !581, size: 64, offset: 320)
!581 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_HEAP_METADATA", file: !75, line: 91, baseType: !275)
!582 = !DIDerivedType(tag: DW_TAG_member, name: "InitializePage", scope: !558, file: !75, line: 115, baseType: !583, size: 64, offset: 384)
!583 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_PAGE", file: !75, line: 95, baseType: !584)
!584 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !585, size: 64)
!585 = !DISubroutineType(types: !586)
!586 = !{!224, !56, !587}
!587 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !588, size: 64)
!588 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !589, size: 64)
!589 = !DIDerivedType(tag: DW_TAG_typedef, name: "PAGE_T", file: !75, line: 38, baseType: !590)
!590 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PAGE", file: !75, line: 36, size: 64, elements: !591)
!591 = !{!592}
!592 = !DIDerivedType(tag: DW_TAG_member, name: "Self", scope: !590, file: !75, line: 37, baseType: !568, size: 64)
!593 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeapMetadata", scope: !558, file: !75, line: 116, baseType: !594, size: 64, offset: 448)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP_METADATA", file: !75, line: 102, baseType: !275)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeap", scope: !558, file: !75, line: 117, baseType: !596, size: 64, offset: 512)
!596 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP", file: !75, line: 106, baseType: !275)
!597 = !DILocalVariable(name: "Input", arg: 1, scope: !553, file: !85, line: 209, type: !70)
!598 = !DILocation(line: 209, scope: !553)
!599 = !DILocalVariable(name: "Size", arg: 2, scope: !553, file: !85, line: 210, type: !240)
!600 = !DILocation(line: 210, scope: !553)
!601 = !DILocalVariable(name: "HeapManagerProtocol", arg: 3, scope: !553, file: !85, line: 211, type: !556)
!602 = !DILocation(line: 211, scope: !553)
!603 = !DILocalVariable(name: "cd", scope: !553, file: !85, line: 213, type: !321)
!604 = !DILocation(line: 213, scope: !553)
!605 = !DILocalVariable(name: "Status", scope: !553, file: !85, line: 214, type: !224)
!606 = !DILocation(line: 214, scope: !553)
!607 = !DILocation(line: 215, scope: !553)
!608 = !DILocation(line: 217, scope: !609)
!609 = distinct !DILexicalBlock(scope: !610, file: !85, line: 216)
!610 = distinct !DILexicalBlock(scope: !553, file: !85, line: 215)
!611 = !DILocation(line: 217, scope: !612)
!612 = distinct !DILexicalBlock(scope: !609, file: !85, line: 217)
!613 = !DILocation(line: 217, scope: !614)
!614 = distinct !DILexicalBlock(scope: !615, file: !85, line: 217)
!615 = distinct !DILexicalBlock(scope: !612, file: !85, line: 217)
!616 = !DILocation(line: 217, scope: !617)
!617 = distinct !DILexicalBlock(scope: !614, file: !85, line: 217)
!618 = !DILocation(line: 217, scope: !619)
!619 = distinct !DILexicalBlock(scope: !620, file: !85, line: 217)
!620 = distinct !DILexicalBlock(scope: !617, file: !85, line: 217)
!621 = !DILocation(line: 218, scope: !609)
!622 = !DILocalVariable(name: "Output", scope: !553, file: !85, line: 220, type: !568)
!623 = !DILocation(line: 220, scope: !553)
!624 = !DILocation(line: 222, scope: !553)
!625 = !DILocation(line: 223, scope: !626)
!626 = distinct !DILexicalBlock(scope: !627, file: !85, line: 222)
!627 = distinct !DILexicalBlock(scope: !553, file: !85, line: 222)
!628 = !DILocation(line: 224, scope: !626)
!629 = !DILocation(line: 225, scope: !627)
!630 = !DILocation(line: 226, scope: !631)
!631 = distinct !DILexicalBlock(scope: !632, file: !85, line: 225)
!632 = distinct !DILexicalBlock(scope: !627, file: !85, line: 225)
!633 = !DILocation(line: 227, scope: !631)
!634 = !DILocation(line: 228, scope: !632)
!635 = !DILocation(line: 229, scope: !636)
!636 = distinct !DILexicalBlock(scope: !637, file: !85, line: 228)
!637 = distinct !DILexicalBlock(scope: !632, file: !85, line: 228)
!638 = !DILocation(line: 230, scope: !636)
!639 = !DILocation(line: 232, scope: !640)
!640 = distinct !DILexicalBlock(scope: !637, file: !85, line: 231)
!641 = !DILocation(line: 232, scope: !642)
!642 = distinct !DILexicalBlock(scope: !640, file: !85, line: 232)
!643 = !DILocation(line: 232, scope: !644)
!644 = distinct !DILexicalBlock(scope: !645, file: !85, line: 232)
!645 = distinct !DILexicalBlock(scope: !642, file: !85, line: 232)
!646 = !DILocation(line: 232, scope: !647)
!647 = distinct !DILexicalBlock(scope: !644, file: !85, line: 232)
!648 = !DILocation(line: 232, scope: !649)
!649 = distinct !DILexicalBlock(scope: !650, file: !85, line: 232)
!650 = distinct !DILexicalBlock(scope: !647, file: !85, line: 232)
!651 = !DILocation(line: 233, scope: !640)
!652 = !DILocation(line: 228, scope: !637)
!653 = !DILocation(line: 225, scope: !632)
!654 = !DILocalVariable(name: "OutputSize", scope: !553, file: !85, line: 236, type: !65)
!655 = !DILocation(line: 236, scope: !553)
!656 = !DILocalVariable(name: "InputPtr", scope: !553, file: !85, line: 237, type: !70)
!657 = !DILocation(line: 237, scope: !553)
!658 = !DILocalVariable(name: "OutputPtr", scope: !553, file: !85, line: 238, type: !70)
!659 = !DILocation(line: 238, scope: !553)
!660 = !DILocation(line: 239, scope: !553)
!661 = !DILocation(line: 240, scope: !553)
!662 = !DILocation(line: 241, scope: !553)
!663 = !DILocation(line: 242, scope: !553)
!664 = !DILocation(line: 243, scope: !665)
!665 = distinct !DILexicalBlock(scope: !553, file: !85, line: 242)
!666 = !DILocation(line: 245, scope: !553)
!667 = !DILocation(line: 246, scope: !553)
!668 = distinct !DISubprogram(name: "Libxml2Convert", scope: !85, file: !85, line: 250, type: !554, scopeLine: 254, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !328)
!669 = !DILocalVariable(name: "Input", arg: 1, scope: !668, file: !85, line: 251, type: !70)
!670 = !DILocation(line: 251, scope: !668)
!671 = !DILocalVariable(name: "Size", arg: 2, scope: !668, file: !85, line: 252, type: !240)
!672 = !DILocation(line: 252, scope: !668)
!673 = !DILocalVariable(name: "HeapManagerProtocol", arg: 3, scope: !668, file: !85, line: 253, type: !556)
!674 = !DILocation(line: 253, scope: !668)
!675 = !DILocalVariable(name: "cd", scope: !668, file: !85, line: 255, type: !321)
!676 = !DILocation(line: 255, scope: !668)
!677 = !DILocalVariable(name: "Status", scope: !668, file: !85, line: 256, type: !224)
!678 = !DILocation(line: 256, scope: !668)
!679 = !DILocation(line: 257, scope: !668)
!680 = !DILocation(line: 259, scope: !681)
!681 = distinct !DILexicalBlock(scope: !682, file: !85, line: 258)
!682 = distinct !DILexicalBlock(scope: !668, file: !85, line: 257)
!683 = !DILocation(line: 259, scope: !684)
!684 = distinct !DILexicalBlock(scope: !681, file: !85, line: 259)
!685 = !DILocation(line: 259, scope: !686)
!686 = distinct !DILexicalBlock(scope: !687, file: !85, line: 259)
!687 = distinct !DILexicalBlock(scope: !684, file: !85, line: 259)
!688 = !DILocation(line: 259, scope: !689)
!689 = distinct !DILexicalBlock(scope: !686, file: !85, line: 259)
!690 = !DILocation(line: 259, scope: !691)
!691 = distinct !DILexicalBlock(scope: !692, file: !85, line: 259)
!692 = distinct !DILexicalBlock(scope: !689, file: !85, line: 259)
!693 = !DILocation(line: 260, scope: !681)
!694 = !DILocalVariable(name: "Output", scope: !668, file: !85, line: 262, type: !568)
!695 = !DILocation(line: 262, scope: !668)
!696 = !DILocation(line: 264, scope: !668)
!697 = !DILocation(line: 265, scope: !698)
!698 = distinct !DILexicalBlock(scope: !699, file: !85, line: 264)
!699 = distinct !DILexicalBlock(scope: !668, file: !85, line: 264)
!700 = !DILocation(line: 266, scope: !698)
!701 = !DILocation(line: 267, scope: !699)
!702 = !DILocation(line: 268, scope: !703)
!703 = distinct !DILexicalBlock(scope: !704, file: !85, line: 267)
!704 = distinct !DILexicalBlock(scope: !699, file: !85, line: 267)
!705 = !DILocation(line: 269, scope: !703)
!706 = !DILocation(line: 270, scope: !704)
!707 = !DILocation(line: 271, scope: !708)
!708 = distinct !DILexicalBlock(scope: !709, file: !85, line: 270)
!709 = distinct !DILexicalBlock(scope: !704, file: !85, line: 270)
!710 = !DILocation(line: 272, scope: !708)
!711 = !DILocation(line: 274, scope: !712)
!712 = distinct !DILexicalBlock(scope: !709, file: !85, line: 273)
!713 = !DILocation(line: 274, scope: !714)
!714 = distinct !DILexicalBlock(scope: !712, file: !85, line: 274)
!715 = !DILocation(line: 274, scope: !716)
!716 = distinct !DILexicalBlock(scope: !717, file: !85, line: 274)
!717 = distinct !DILexicalBlock(scope: !714, file: !85, line: 274)
!718 = !DILocation(line: 274, scope: !719)
!719 = distinct !DILexicalBlock(scope: !716, file: !85, line: 274)
!720 = !DILocation(line: 274, scope: !721)
!721 = distinct !DILexicalBlock(scope: !722, file: !85, line: 274)
!722 = distinct !DILexicalBlock(scope: !719, file: !85, line: 274)
!723 = !DILocation(line: 275, scope: !712)
!724 = !DILocation(line: 270, scope: !709)
!725 = !DILocation(line: 267, scope: !704)
!726 = !DILocation(line: 277, scope: !668)
!727 = !DILocation(line: 278, scope: !728)
!728 = distinct !DILexicalBlock(scope: !668, file: !85, line: 277)
!729 = !DILocalVariable(name: "OutputSize", scope: !668, file: !85, line: 279, type: !65)
!730 = !DILocation(line: 279, scope: !668)
!731 = !DILocalVariable(name: "InputPtr", scope: !668, file: !85, line: 280, type: !70)
!732 = !DILocation(line: 280, scope: !668)
!733 = !DILocalVariable(name: "OutputPtr", scope: !668, file: !85, line: 281, type: !70)
!734 = !DILocation(line: 281, scope: !668)
!735 = !DILocation(line: 282, scope: !668)
!736 = !DILocation(line: 283, scope: !668)
!737 = !DILocation(line: 284, scope: !668)
!738 = !DILocation(line: 285, scope: !668)
!739 = !DILocation(line: 286, scope: !740)
!740 = distinct !DILexicalBlock(scope: !668, file: !85, line: 285)
!741 = !DILocation(line: 288, scope: !668)
!742 = !DILocation(line: 289, scope: !668)
!743 = distinct !DISubprogram(name: "PkexecConvert", scope: !85, file: !85, line: 293, type: !554, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !328)
!744 = !DILocalVariable(name: "Input", arg: 1, scope: !743, file: !85, line: 294, type: !70)
!745 = !DILocation(line: 294, scope: !743)
!746 = !DILocalVariable(name: "Size", arg: 2, scope: !743, file: !85, line: 295, type: !240)
!747 = !DILocation(line: 295, scope: !743)
!748 = !DILocalVariable(name: "HeapManagerProtocol", arg: 3, scope: !743, file: !85, line: 296, type: !556)
!749 = !DILocation(line: 296, scope: !743)
!750 = !DILocalVariable(name: "cd", scope: !743, file: !85, line: 298, type: !321)
!751 = !DILocation(line: 298, scope: !743)
!752 = !DILocalVariable(name: "Status", scope: !743, file: !85, line: 299, type: !224)
!753 = !DILocation(line: 299, scope: !743)
!754 = !DILocation(line: 300, scope: !743)
!755 = !DILocation(line: 302, scope: !756)
!756 = distinct !DILexicalBlock(scope: !757, file: !85, line: 301)
!757 = distinct !DILexicalBlock(scope: !743, file: !85, line: 300)
!758 = !DILocation(line: 302, scope: !759)
!759 = distinct !DILexicalBlock(scope: !756, file: !85, line: 302)
!760 = !DILocation(line: 302, scope: !761)
!761 = distinct !DILexicalBlock(scope: !762, file: !85, line: 302)
!762 = distinct !DILexicalBlock(scope: !759, file: !85, line: 302)
!763 = !DILocation(line: 302, scope: !764)
!764 = distinct !DILexicalBlock(scope: !761, file: !85, line: 302)
!765 = !DILocation(line: 302, scope: !766)
!766 = distinct !DILexicalBlock(scope: !767, file: !85, line: 302)
!767 = distinct !DILexicalBlock(scope: !764, file: !85, line: 302)
!768 = !DILocation(line: 303, scope: !756)
!769 = !DILocalVariable(name: "Output", scope: !743, file: !85, line: 305, type: !568)
!770 = !DILocation(line: 305, scope: !743)
!771 = !DILocation(line: 307, scope: !743)
!772 = !DILocation(line: 308, scope: !773)
!773 = distinct !DILexicalBlock(scope: !774, file: !85, line: 307)
!774 = distinct !DILexicalBlock(scope: !743, file: !85, line: 307)
!775 = !DILocation(line: 309, scope: !773)
!776 = !DILocation(line: 310, scope: !774)
!777 = !DILocation(line: 311, scope: !778)
!778 = distinct !DILexicalBlock(scope: !779, file: !85, line: 310)
!779 = distinct !DILexicalBlock(scope: !774, file: !85, line: 310)
!780 = !DILocation(line: 312, scope: !778)
!781 = !DILocation(line: 313, scope: !779)
!782 = !DILocation(line: 314, scope: !783)
!783 = distinct !DILexicalBlock(scope: !784, file: !85, line: 313)
!784 = distinct !DILexicalBlock(scope: !779, file: !85, line: 313)
!785 = !DILocation(line: 315, scope: !783)
!786 = !DILocation(line: 317, scope: !787)
!787 = distinct !DILexicalBlock(scope: !784, file: !85, line: 316)
!788 = !DILocation(line: 317, scope: !789)
!789 = distinct !DILexicalBlock(scope: !787, file: !85, line: 317)
!790 = !DILocation(line: 317, scope: !791)
!791 = distinct !DILexicalBlock(scope: !792, file: !85, line: 317)
!792 = distinct !DILexicalBlock(scope: !789, file: !85, line: 317)
!793 = !DILocation(line: 317, scope: !794)
!794 = distinct !DILexicalBlock(scope: !791, file: !85, line: 317)
!795 = !DILocation(line: 317, scope: !796)
!796 = distinct !DILexicalBlock(scope: !797, file: !85, line: 317)
!797 = distinct !DILexicalBlock(scope: !794, file: !85, line: 317)
!798 = !DILocation(line: 318, scope: !787)
!799 = !DILocation(line: 313, scope: !784)
!800 = !DILocation(line: 310, scope: !779)
!801 = !DILocation(line: 320, scope: !743)
!802 = !DILocation(line: 321, scope: !803)
!803 = distinct !DILexicalBlock(scope: !743, file: !85, line: 320)
!804 = !DILocalVariable(name: "OutputSize", scope: !743, file: !85, line: 322, type: !65)
!805 = !DILocation(line: 322, scope: !743)
!806 = !DILocalVariable(name: "InputPtr", scope: !743, file: !85, line: 323, type: !70)
!807 = !DILocation(line: 323, scope: !743)
!808 = !DILocalVariable(name: "OutputPtr", scope: !743, file: !85, line: 324, type: !70)
!809 = !DILocation(line: 324, scope: !743)
!810 = !DILocation(line: 325, scope: !743)
!811 = !DILocation(line: 326, scope: !743)
!812 = !DILocation(line: 327, scope: !743)
!813 = !DILocation(line: 328, scope: !743)
!814 = !DILocation(line: 329, scope: !815)
!815 = distinct !DILexicalBlock(scope: !743, file: !85, line: 328)
!816 = !DILocation(line: 331, scope: !743)
!817 = !DILocation(line: 332, scope: !743)
!818 = distinct !DISubprogram(name: "CharConverterEntryPoint", scope: !85, file: !85, line: 336, type: !819, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !328)
!819 = !DISubroutineType(types: !820)
!820 = !{!224, !821, !822}
!821 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE", file: !192, line: 33, baseType: !53)
!822 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !823, size: 64)
!823 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SYSTEM_TABLE", file: !14, line: 2053, baseType: !824)
!824 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SYSTEM_TABLE", file: !14, line: 1992, size: 960, elements: !825)
!825 = !{!826, !835, !836, !837, !838, !862, !863, !918, !919, !920, !1054, !1312, !1313}
!826 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !824, file: !14, line: 1996, baseType: !827, size: 192)
!827 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TABLE_HEADER", file: !6, line: 177, baseType: !828)
!828 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TABLE_HEADER", file: !6, line: 150, size: 192, elements: !829)
!829 = !{!830, !831, !832, !833, !834}
!830 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !828, file: !6, line: 156, baseType: !58, size: 64)
!831 = !DIDerivedType(tag: DW_TAG_member, name: "Revision", scope: !828, file: !6, line: 163, baseType: !90, size: 32, offset: 64)
!832 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !828, file: !6, line: 167, baseType: !90, size: 32, offset: 96)
!833 = !DIDerivedType(tag: DW_TAG_member, name: "CRC32", scope: !828, file: !6, line: 172, baseType: !90, size: 32, offset: 128)
!834 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !828, file: !6, line: 176, baseType: !90, size: 32, offset: 160)
!835 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareVendor", scope: !824, file: !14, line: 2001, baseType: !62, size: 64, offset: 192)
!836 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareRevision", scope: !824, file: !14, line: 2006, baseType: !90, size: 32, offset: 256)
!837 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleInHandle", scope: !824, file: !14, line: 2011, baseType: !821, size: 64, offset: 320)
!838 = !DIDerivedType(tag: DW_TAG_member, name: "ConIn", scope: !824, file: !14, line: 2016, baseType: !839, size: 64, offset: 384)
!839 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !840, size: 64)
!840 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !841, line: 20, baseType: !842)
!841 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextIn.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "239cf4f3dddb25a8596c70fa738413fd")
!842 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !841, line: 116, size: 192, elements: !843)
!843 = !{!844, !849, !860}
!844 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !842, file: !841, line: 117, baseType: !845, size: 64)
!845 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_RESET", file: !841, line: 86, baseType: !846)
!846 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !847, size: 64)
!847 = !DISubroutineType(types: !848)
!848 = !{!224, !839, !68}
!849 = !DIDerivedType(tag: DW_TAG_member, name: "ReadKeyStroke", scope: !842, file: !841, line: 118, baseType: !850, size: 64, offset: 64)
!850 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_READ_KEY", file: !841, line: 107, baseType: !851)
!851 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !852, size: 64)
!852 = !DISubroutineType(types: !853)
!853 = !{!224, !839, !854}
!854 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !855, size: 64)
!855 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_KEY", file: !841, line: 38, baseType: !856)
!856 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_INPUT_KEY", file: !841, line: 35, size: 32, elements: !857)
!857 = !{!858, !859}
!858 = !DIDerivedType(tag: DW_TAG_member, name: "ScanCode", scope: !856, file: !841, line: 36, baseType: !198, size: 16)
!859 = !DIDerivedType(tag: DW_TAG_member, name: "UnicodeChar", scope: !856, file: !841, line: 37, baseType: !60, size: 16, offset: 16)
!860 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForKey", scope: !842, file: !841, line: 122, baseType: !861, size: 64, offset: 128)
!861 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT", file: !192, line: 37, baseType: !53)
!862 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleOutHandle", scope: !824, file: !14, line: 2020, baseType: !821, size: 64, offset: 448)
!863 = !DIDerivedType(tag: DW_TAG_member, name: "ConOut", scope: !824, file: !14, line: 2025, baseType: !864, size: 64, offset: 512)
!864 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !865, size: 64)
!865 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !866, line: 27, baseType: !867)
!866 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextOut.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "685bec042927ad46d31bf42ae7f6ddcd")
!867 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !866, line: 387, size: 640, elements: !868)
!868 = !{!869, !874, !879, !881, !887, !892, !894, !899, !904, !906}
!869 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !867, file: !866, line: 388, baseType: !870, size: 64)
!870 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_RESET", file: !866, line: 167, baseType: !871)
!871 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !872, size: 64)
!872 = !DISubroutineType(types: !873)
!873 = !{!224, !864, !68}
!874 = !DIDerivedType(tag: DW_TAG_member, name: "OutputString", scope: !867, file: !866, line: 390, baseType: !875, size: 64, offset: 64)
!875 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_STRING", file: !866, line: 192, baseType: !876)
!876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!877 = !DISubroutineType(types: !878)
!878 = !{!224, !864, !62}
!879 = !DIDerivedType(tag: DW_TAG_member, name: "TestString", scope: !867, file: !866, line: 391, baseType: !880, size: 64, offset: 128)
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_TEST_STRING", file: !866, line: 213, baseType: !876)
!881 = !DIDerivedType(tag: DW_TAG_member, name: "QueryMode", scope: !867, file: !866, line: 393, baseType: !882, size: 64, offset: 192)
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_QUERY_MODE", file: !866, line: 236, baseType: !883)
!883 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !884, size: 64)
!884 = !DISubroutineType(types: !885)
!885 = !{!224, !864, !56, !886, !886}
!886 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!887 = !DIDerivedType(tag: DW_TAG_member, name: "SetMode", scope: !867, file: !866, line: 394, baseType: !888, size: 64, offset: 256)
!888 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_MODE", file: !866, line: 256, baseType: !889)
!889 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !890, size: 64)
!890 = !DISubroutineType(types: !891)
!891 = !{!224, !864, !56}
!892 = !DIDerivedType(tag: DW_TAG_member, name: "SetAttribute", scope: !867, file: !866, line: 395, baseType: !893, size: 64, offset: 320)
!893 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_ATTRIBUTE", file: !866, line: 277, baseType: !889)
!894 = !DIDerivedType(tag: DW_TAG_member, name: "ClearScreen", scope: !867, file: !866, line: 397, baseType: !895, size: 64, offset: 384)
!895 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_CLEAR_SCREEN", file: !866, line: 295, baseType: !896)
!896 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !897, size: 64)
!897 = !DISubroutineType(types: !898)
!898 = !{!224, !864}
!899 = !DIDerivedType(tag: DW_TAG_member, name: "SetCursorPosition", scope: !867, file: !866, line: 398, baseType: !900, size: 64, offset: 448)
!900 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_CURSOR_POSITION", file: !866, line: 318, baseType: !901)
!901 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !902, size: 64)
!902 = !DISubroutineType(types: !903)
!903 = !{!224, !864, !56, !56}
!904 = !DIDerivedType(tag: DW_TAG_member, name: "EnableCursor", scope: !867, file: !866, line: 399, baseType: !905, size: 64, offset: 512)
!905 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_ENABLE_CURSOR", file: !866, line: 340, baseType: !871)
!906 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !867, file: !866, line: 404, baseType: !907, size: 64, offset: 576)
!907 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !908, size: 64)
!908 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !866, line: 379, baseType: !909)
!909 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !866, line: 349, size: 192, elements: !910)
!910 = !{!911, !913, !914, !915, !916, !917}
!911 = !DIDerivedType(tag: DW_TAG_member, name: "MaxMode", scope: !909, file: !866, line: 353, baseType: !912, size: 32)
!912 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT32", file: !57, line: 174, baseType: !76)
!913 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !909, file: !866, line: 362, baseType: !912, size: 32, offset: 32)
!914 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !909, file: !866, line: 366, baseType: !912, size: 32, offset: 64)
!915 = !DIDerivedType(tag: DW_TAG_member, name: "CursorColumn", scope: !909, file: !866, line: 370, baseType: !912, size: 32, offset: 96)
!916 = !DIDerivedType(tag: DW_TAG_member, name: "CursorRow", scope: !909, file: !866, line: 374, baseType: !912, size: 32, offset: 128)
!917 = !DIDerivedType(tag: DW_TAG_member, name: "CursorVisible", scope: !909, file: !866, line: 378, baseType: !68, size: 8, offset: 160)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "StandardErrorHandle", scope: !824, file: !14, line: 2030, baseType: !821, size: 64, offset: 576)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "StdErr", scope: !824, file: !14, line: 2035, baseType: !864, size: 64, offset: 640)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "RuntimeServices", scope: !824, file: !14, line: 2039, baseType: !921, size: 64, offset: 704)
!921 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !922, size: 64)
!922 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1871, baseType: !923)
!923 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1828, size: 1088, elements: !924)
!924 = !{!925, !926, !955, !960, !966, !971, !987, !992, !1007, !1012, !1017, !1022, !1028, !1042, !1049}
!925 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !923, file: !14, line: 1832, baseType: !827, size: 192)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "GetTime", scope: !923, file: !14, line: 1837, baseType: !927, size: 64, offset: 192)
!927 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_TIME", file: !14, line: 816, baseType: !928)
!928 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !929, size: 64)
!929 = !DISubroutineType(types: !930)
!930 = !{!224, !931, !948}
!931 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !932, size: 64)
!932 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME", file: !192, line: 80, baseType: !933)
!933 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME", file: !192, line: 68, size: 128, elements: !934)
!934 = !{!935, !936, !937, !938, !939, !940, !941, !942, !943, !946, !947}
!935 = !DIDerivedType(tag: DW_TAG_member, name: "Year", scope: !933, file: !192, line: 69, baseType: !198, size: 16)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "Month", scope: !933, file: !192, line: 70, baseType: !109, size: 8, offset: 16)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "Day", scope: !933, file: !192, line: 71, baseType: !109, size: 8, offset: 24)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "Hour", scope: !933, file: !192, line: 72, baseType: !109, size: 8, offset: 32)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "Minute", scope: !933, file: !192, line: 73, baseType: !109, size: 8, offset: 40)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "Second", scope: !933, file: !192, line: 74, baseType: !109, size: 8, offset: 48)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "Pad1", scope: !933, file: !192, line: 75, baseType: !109, size: 8, offset: 56)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "Nanosecond", scope: !933, file: !192, line: 76, baseType: !90, size: 32, offset: 64)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "TimeZone", scope: !933, file: !192, line: 77, baseType: !944, size: 16, offset: 96)
!944 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT16", file: !57, line: 187, baseType: !945)
!945 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "Daylight", scope: !933, file: !192, line: 78, baseType: !109, size: 8, offset: 112)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "Pad2", scope: !933, file: !192, line: 79, baseType: !109, size: 8, offset: 120)
!948 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !949, size: 64)
!949 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME_CAPABILITIES", file: !14, line: 799, baseType: !950)
!950 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME_CAPABILITIES", file: !14, line: 776, size: 96, elements: !951)
!951 = !{!952, !953, !954}
!952 = !DIDerivedType(tag: DW_TAG_member, name: "Resolution", scope: !950, file: !14, line: 783, baseType: !90, size: 32)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "Accuracy", scope: !950, file: !14, line: 790, baseType: !90, size: 32, offset: 32)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "SetsToZero", scope: !950, file: !14, line: 798, baseType: !68, size: 8, offset: 64)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "SetTime", scope: !923, file: !14, line: 1838, baseType: !956, size: 64, offset: 256)
!956 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIME", file: !14, line: 833, baseType: !957)
!957 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !958, size: 64)
!958 = !DISubroutineType(types: !959)
!959 = !{!224, !931}
!960 = !DIDerivedType(tag: DW_TAG_member, name: "GetWakeupTime", scope: !923, file: !14, line: 1839, baseType: !961, size: 64, offset: 320)
!961 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_WAKEUP_TIME", file: !14, line: 854, baseType: !962)
!962 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !963, size: 64)
!963 = !DISubroutineType(types: !964)
!964 = !{!224, !965, !965, !931}
!965 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "SetWakeupTime", scope: !923, file: !14, line: 1840, baseType: !967, size: 64, offset: 384)
!967 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WAKEUP_TIME", file: !14, line: 876, baseType: !968)
!968 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !969, size: 64)
!969 = !DISubroutineType(types: !970)
!970 = !{!224, !68, !931}
!971 = !DIDerivedType(tag: DW_TAG_member, name: "SetVirtualAddressMap", scope: !923, file: !14, line: 1845, baseType: !972, size: 64, offset: 448)
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VIRTUAL_ADDRESS_MAP", file: !14, line: 327, baseType: !973)
!973 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !974, size: 64)
!974 = !DISubroutineType(types: !975)
!975 = !{!224, !56, !56, !90, !976}
!976 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !977, size: 64)
!977 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 175, baseType: !978)
!978 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 143, size: 320, elements: !979)
!979 = !{!980, !981, !983, !985, !986}
!980 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !978, file: !14, line: 149, baseType: !90, size: 32)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "PhysicalStart", scope: !978, file: !14, line: 155, baseType: !982, size: 64, offset: 64)
!982 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PHYSICAL_ADDRESS", file: !192, line: 50, baseType: !58)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "VirtualStart", scope: !978, file: !14, line: 161, baseType: !984, size: 64, offset: 128)
!984 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_VIRTUAL_ADDRESS", file: !192, line: 55, baseType: !58)
!985 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfPages", scope: !978, file: !14, line: 168, baseType: !58, size: 64, offset: 192)
!986 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !978, file: !14, line: 174, baseType: !58, size: 64, offset: 256)
!987 = !DIDerivedType(tag: DW_TAG_member, name: "ConvertPointer", scope: !923, file: !14, line: 1846, baseType: !988, size: 64, offset: 512)
!988 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONVERT_POINTER", file: !14, line: 422, baseType: !989)
!989 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !990, size: 64)
!990 = !DISubroutineType(types: !991)
!991 = !{!224, !56, !71}
!992 = !DIDerivedType(tag: DW_TAG_member, name: "GetVariable", scope: !923, file: !14, line: 1851, baseType: !993, size: 64, offset: 576)
!993 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_VARIABLE", file: !14, line: 686, baseType: !994)
!994 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !995, size: 64)
!995 = !DISubroutineType(types: !996)
!996 = !{!224, !62, !997, !1006, !886, !53}
!997 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !998, size: 64)
!998 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GUID", file: !192, line: 25, baseType: !999)
!999 = !DIDerivedType(tag: DW_TAG_typedef, name: "GUID", file: !55, line: 218, baseType: !1000)
!1000 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GUID", file: !55, line: 213, size: 128, elements: !1001)
!1001 = !{!1002, !1003, !1004, !1005}
!1002 = !DIDerivedType(tag: DW_TAG_member, name: "Data1", scope: !1000, file: !55, line: 214, baseType: !90, size: 32)
!1003 = !DIDerivedType(tag: DW_TAG_member, name: "Data2", scope: !1000, file: !55, line: 215, baseType: !198, size: 16, offset: 32)
!1004 = !DIDerivedType(tag: DW_TAG_member, name: "Data3", scope: !1000, file: !55, line: 216, baseType: !198, size: 16, offset: 48)
!1005 = !DIDerivedType(tag: DW_TAG_member, name: "Data4", scope: !1000, file: !55, line: 217, baseType: !201, size: 64, offset: 64)
!1006 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!1007 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextVariableName", scope: !923, file: !14, line: 1852, baseType: !1008, size: 64, offset: 640)
!1008 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_VARIABLE_NAME", file: !14, line: 722, baseType: !1009)
!1009 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1010, size: 64)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{!224, !886, !62, !997}
!1012 = !DIDerivedType(tag: DW_TAG_member, name: "SetVariable", scope: !923, file: !14, line: 1853, baseType: !1013, size: 64, offset: 704)
!1013 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VARIABLE", file: !14, line: 764, baseType: !1014)
!1014 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1015, size: 64)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!224, !62, !997, !90, !56, !53}
!1017 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextHighMonotonicCount", scope: !923, file: !14, line: 1858, baseType: !1018, size: 64, offset: 768)
!1018 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_HIGH_MONO_COUNT", file: !14, line: 1097, baseType: !1019)
!1019 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1020, size: 64)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!224, !1006}
!1022 = !DIDerivedType(tag: DW_TAG_member, name: "ResetSystem", scope: !923, file: !14, line: 1859, baseType: !1023, size: 64, offset: 832)
!1023 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_SYSTEM", file: !14, line: 1062, baseType: !1024)
!1024 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1025, size: 64)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{null, !1027, !224, !56, !53}
!1027 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_TYPE", file: !6, line: 145, baseType: !5)
!1028 = !DIDerivedType(tag: DW_TAG_member, name: "UpdateCapsule", scope: !923, file: !14, line: 1864, baseType: !1029, size: 64, offset: 896)
!1029 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UPDATE_CAPSULE", file: !14, line: 1723, baseType: !1030)
!1030 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1031, size: 64)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!224, !1033, !56, !982}
!1033 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1034, size: 64)
!1034 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1035, size: 64)
!1035 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CAPSULE_HEADER", file: !14, line: 1669, baseType: !1036)
!1036 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CAPSULE_HEADER", file: !14, line: 1648, size: 224, elements: !1037)
!1037 = !{!1038, !1039, !1040, !1041}
!1038 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleGuid", scope: !1036, file: !14, line: 1652, baseType: !998, size: 128)
!1039 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !1036, file: !14, line: 1658, baseType: !90, size: 32, offset: 128)
!1040 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !1036, file: !14, line: 1664, baseType: !90, size: 32, offset: 160)
!1041 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleImageSize", scope: !1036, file: !14, line: 1668, baseType: !90, size: 32, offset: 192)
!1042 = !DIDerivedType(tag: DW_TAG_member, name: "QueryCapsuleCapabilities", scope: !923, file: !14, line: 1865, baseType: !1043, size: 64, offset: 960)
!1043 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_CAPSULE_CAPABILITIES", file: !14, line: 1754, baseType: !1044)
!1044 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1045, size: 64)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!224, !1033, !56, !1047, !1048}
!1047 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!1048 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1027, size: 64)
!1049 = !DIDerivedType(tag: DW_TAG_member, name: "QueryVariableInfo", scope: !923, file: !14, line: 1870, baseType: !1050, size: 64, offset: 1024)
!1050 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_VARIABLE_INFO", file: !14, line: 1785, baseType: !1051)
!1051 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1052, size: 64)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!224, !90, !1047, !1047, !1047}
!1054 = !DIDerivedType(tag: DW_TAG_member, name: "BootServices", scope: !824, file: !14, line: 2043, baseType: !1055, size: 64, offset: 768)
!1055 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1056, size: 64)
!1056 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_BOOT_SERVICES", file: !14, line: 1972, baseType: !1057)
!1057 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_BOOT_SERVICES", file: !14, line: 1879, size: 3008, elements: !1058)
!1058 = !{!1059, !1060, !1066, !1071, !1079, !1084, !1089, !1094, !1099, !1109, !1115, !1120, !1125, !1127, !1129, !1136, !1141, !1146, !1151, !1152, !1157, !1163, !1180, !1185, !1190, !1196, !1201, !1206, !1211, !1216, !1221, !1226, !1231, !1236, !1241, !1246, !1260, !1267, !1273, !1278, !1283, !1288, !1293, !1298, !1303}
!1059 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !1057, file: !14, line: 1883, baseType: !827, size: 192)
!1060 = !DIDerivedType(tag: DW_TAG_member, name: "RaiseTPL", scope: !1057, file: !14, line: 1888, baseType: !1061, size: 64, offset: 192)
!1061 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RAISE_TPL", file: !14, line: 644, baseType: !1062)
!1062 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1063, size: 64)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!1065, !1065}
!1065 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TPL", file: !192, line: 41, baseType: !56)
!1066 = !DIDerivedType(tag: DW_TAG_member, name: "RestoreTPL", scope: !1057, file: !14, line: 1889, baseType: !1067, size: 64, offset: 256)
!1067 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESTORE_TPL", file: !14, line: 656, baseType: !1068)
!1068 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1069, size: 64)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{null, !1065}
!1071 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePages", scope: !1057, file: !14, line: 1894, baseType: !1072, size: 64, offset: 320)
!1072 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_PAGES", file: !14, line: 203, baseType: !1073)
!1073 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1074, size: 64)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!224, !1076, !1077, !56, !1078}
!1076 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_TYPE", file: !14, line: 47, baseType: !13)
!1077 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_TYPE", file: !6, line: 112, baseType: !20)
!1078 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !982, size: 64)
!1079 = !DIDerivedType(tag: DW_TAG_member, name: "FreePages", scope: !1057, file: !14, line: 1895, baseType: !1080, size: 64, offset: 384)
!1080 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_PAGES", file: !14, line: 224, baseType: !1081)
!1081 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1082, size: 64)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{!224, !982, !56}
!1084 = !DIDerivedType(tag: DW_TAG_member, name: "GetMemoryMap", scope: !1057, file: !14, line: 1896, baseType: !1085, size: 64, offset: 448)
!1085 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_MEMORY_MAP", file: !14, line: 256, baseType: !1086)
!1086 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1087, size: 64)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!224, !886, !976, !886, !886, !1006}
!1089 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePool", scope: !1057, file: !14, line: 1897, baseType: !1090, size: 64, offset: 512)
!1090 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_POOL", file: !14, line: 285, baseType: !1091)
!1091 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1092, size: 64)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!224, !1077, !56, !71}
!1094 = !DIDerivedType(tag: DW_TAG_member, name: "FreePool", scope: !1057, file: !14, line: 1898, baseType: !1095, size: 64, offset: 576)
!1095 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_POOL", file: !14, line: 302, baseType: !1096)
!1096 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1097, size: 64)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!224, !53}
!1099 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEvent", scope: !1057, file: !14, line: 1903, baseType: !1100, size: 64, offset: 640)
!1100 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT", file: !14, line: 480, baseType: !1101)
!1101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1102, size: 64)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!224, !90, !1065, !1104, !53, !1108}
!1104 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT_NOTIFY", file: !14, line: 457, baseType: !1105)
!1105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1106, size: 64)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{null, !861, !53}
!1108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !861, size: 64)
!1109 = !DIDerivedType(tag: DW_TAG_member, name: "SetTimer", scope: !1057, file: !14, line: 1904, baseType: !1110, size: 64, offset: 704)
!1110 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIMER", file: !14, line: 554, baseType: !1111)
!1111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1112, size: 64)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!224, !861, !1114, !58}
!1114 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIMER_DELAY", file: !14, line: 534, baseType: !39)
!1115 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForEvent", scope: !1057, file: !14, line: 1905, baseType: !1116, size: 64, offset: 768)
!1116 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_WAIT_FOR_EVENT", file: !14, line: 590, baseType: !1117)
!1117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1118, size: 64)
!1118 = !DISubroutineType(types: !1119)
!1119 = !{!224, !56, !1108, !886}
!1120 = !DIDerivedType(tag: DW_TAG_member, name: "SignalEvent", scope: !1057, file: !14, line: 1906, baseType: !1121, size: 64, offset: 832)
!1121 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIGNAL_EVENT", file: !14, line: 570, baseType: !1122)
!1122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1123, size: 64)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!224, !861}
!1125 = !DIDerivedType(tag: DW_TAG_member, name: "CloseEvent", scope: !1057, file: !14, line: 1907, baseType: !1126, size: 64, offset: 896)
!1126 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_EVENT", file: !14, line: 606, baseType: !1122)
!1127 = !DIDerivedType(tag: DW_TAG_member, name: "CheckEvent", scope: !1057, file: !14, line: 1908, baseType: !1128, size: 64, offset: 960)
!1128 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CHECK_EVENT", file: !14, line: 622, baseType: !1122)
!1129 = !DIDerivedType(tag: DW_TAG_member, name: "InstallProtocolInterface", scope: !1057, file: !14, line: 1913, baseType: !1130, size: 64, offset: 1024)
!1130 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_PROTOCOL_INTERFACE", file: !14, line: 1188, baseType: !1131)
!1131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1132, size: 64)
!1132 = !DISubroutineType(types: !1133)
!1133 = !{!224, !1134, !997, !1135, !53}
!1134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !821, size: 64)
!1135 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INTERFACE_TYPE", file: !14, line: 1164, baseType: !44)
!1136 = !DIDerivedType(tag: DW_TAG_member, name: "ReinstallProtocolInterface", scope: !1057, file: !14, line: 1914, baseType: !1137, size: 64, offset: 1088)
!1137 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1238, baseType: !1138)
!1138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1139, size: 64)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!224, !821, !997, !53, !53}
!1141 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallProtocolInterface", scope: !1057, file: !14, line: 1915, baseType: !1142, size: 64, offset: 1152)
!1142 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1264, baseType: !1143)
!1143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1144, size: 64)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!224, !821, !997, !53}
!1146 = !DIDerivedType(tag: DW_TAG_member, name: "HandleProtocol", scope: !1057, file: !14, line: 1916, baseType: !1147, size: 64, offset: 1216)
!1147 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE_PROTOCOL", file: !14, line: 1305, baseType: !1148)
!1148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1149, size: 64)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!224, !821, !997, !71}
!1151 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !1057, file: !14, line: 1917, baseType: !53, size: 64, offset: 1280)
!1152 = !DIDerivedType(tag: DW_TAG_member, name: "RegisterProtocolNotify", scope: !1057, file: !14, line: 1918, baseType: !1153, size: 64, offset: 1344)
!1153 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REGISTER_PROTOCOL_NOTIFY", file: !14, line: 1466, baseType: !1154)
!1154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1155, size: 64)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!224, !997, !861, !71}
!1157 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandle", scope: !1057, file: !14, line: 1919, baseType: !1158, size: 64, offset: 1408)
!1158 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE", file: !14, line: 1515, baseType: !1159)
!1159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1160, size: 64)
!1160 = !DISubroutineType(types: !1161)
!1161 = !{!224, !1162, !997, !53, !886, !1134}
!1162 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_SEARCH_TYPE", file: !14, line: 1489, baseType: !47)
!1163 = !DIDerivedType(tag: DW_TAG_member, name: "LocateDevicePath", scope: !1057, file: !14, line: 1920, baseType: !1164, size: 64, offset: 1472)
!1164 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_DEVICE_PATH", file: !14, line: 1541, baseType: !1165)
!1165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1166, size: 64)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!224, !997, !1168, !1134}
!1168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1169, size: 64)
!1169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1170, size: 64)
!1170 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DEVICE_PATH_PROTOCOL", file: !1171, line: 58, baseType: !1172)
!1171 = !DIFile(filename: "MdePkg/Include/Protocol/DevicePath.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6b6d593d171f69b933a87911e52d4607")
!1172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_DEVICE_PATH_PROTOCOL", file: !1171, line: 43, size: 32, elements: !1173)
!1173 = !{!1174, !1175, !1176}
!1174 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !1172, file: !1171, line: 44, baseType: !109, size: 8)
!1175 = !DIDerivedType(tag: DW_TAG_member, name: "SubType", scope: !1172, file: !1171, line: 51, baseType: !109, size: 8, offset: 8)
!1176 = !DIDerivedType(tag: DW_TAG_member, name: "Length", scope: !1172, file: !1171, line: 56, baseType: !1177, size: 16, offset: 16)
!1177 = !DICompositeType(tag: DW_TAG_array_type, baseType: !109, size: 16, elements: !1178)
!1178 = !{!1179}
!1179 = !DISubrange(count: 2)
!1180 = !DIDerivedType(tag: DW_TAG_member, name: "InstallConfigurationTable", scope: !1057, file: !14, line: 1921, baseType: !1181, size: 64, offset: 1536)
!1181 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_CONFIGURATION_TABLE", file: !14, line: 1562, baseType: !1182)
!1182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1183, size: 64)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!224, !997, !53}
!1185 = !DIDerivedType(tag: DW_TAG_member, name: "LoadImage", scope: !1057, file: !14, line: 1926, baseType: !1186, size: 64, offset: 1600)
!1186 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_LOAD", file: !14, line: 913, baseType: !1187)
!1187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1188, size: 64)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!224, !68, !821, !1169, !53, !56, !1134}
!1190 = !DIDerivedType(tag: DW_TAG_member, name: "StartImage", scope: !1057, file: !14, line: 1927, baseType: !1191, size: 64, offset: 1664)
!1191 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_START", file: !14, line: 938, baseType: !1192)
!1192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1193, size: 64)
!1193 = !DISubroutineType(types: !1194)
!1194 = !{!224, !821, !886, !1195}
!1195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!1196 = !DIDerivedType(tag: DW_TAG_member, name: "Exit", scope: !1057, file: !14, line: 1928, baseType: !1197, size: 64, offset: 1728)
!1197 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT", file: !14, line: 966, baseType: !1198)
!1198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1199, size: 64)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!224, !821, !224, !56, !62}
!1201 = !DIDerivedType(tag: DW_TAG_member, name: "UnloadImage", scope: !1057, file: !14, line: 1929, baseType: !1202, size: 64, offset: 1792)
!1202 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_UNLOAD", file: !14, line: 984, baseType: !1203)
!1203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1204, size: 64)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!224, !821}
!1206 = !DIDerivedType(tag: DW_TAG_member, name: "ExitBootServices", scope: !1057, file: !14, line: 1930, baseType: !1207, size: 64, offset: 1856)
!1207 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT_BOOT_SERVICES", file: !14, line: 1000, baseType: !1208)
!1208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1209, size: 64)
!1209 = !DISubroutineType(types: !1210)
!1210 = !{!224, !821, !56}
!1211 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextMonotonicCount", scope: !1057, file: !14, line: 1935, baseType: !1212, size: 64, offset: 1920)
!1212 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_MONOTONIC_COUNT", file: !14, line: 1081, baseType: !1213)
!1213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1214, size: 64)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!224, !1047}
!1216 = !DIDerivedType(tag: DW_TAG_member, name: "Stall", scope: !1057, file: !14, line: 1936, baseType: !1217, size: 64, offset: 1984)
!1217 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STALL", file: !14, line: 1016, baseType: !1218)
!1218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1219, size: 64)
!1219 = !DISubroutineType(types: !1220)
!1220 = !{!224, !56}
!1221 = !DIDerivedType(tag: DW_TAG_member, name: "SetWatchdogTimer", scope: !1057, file: !14, line: 1937, baseType: !1222, size: 64, offset: 2048)
!1222 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WATCHDOG_TIMER", file: !14, line: 1038, baseType: !1223)
!1223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1224, size: 64)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!224, !56, !58, !56, !62}
!1226 = !DIDerivedType(tag: DW_TAG_member, name: "ConnectController", scope: !1057, file: !14, line: 1942, baseType: !1227, size: 64, offset: 2112)
!1227 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONNECT_CONTROLLER", file: !14, line: 361, baseType: !1228)
!1228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1229, size: 64)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!224, !821, !1134, !1169, !68}
!1231 = !DIDerivedType(tag: DW_TAG_member, name: "DisconnectController", scope: !1057, file: !14, line: 1943, baseType: !1232, size: 64, offset: 2176)
!1232 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DISCONNECT_CONTROLLER", file: !14, line: 394, baseType: !1233)
!1233 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1234, size: 64)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!224, !821, !821, !821}
!1236 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocol", scope: !1057, file: !14, line: 1948, baseType: !1237, size: 64, offset: 2240)
!1237 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL", file: !14, line: 1347, baseType: !1238)
!1238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1239, size: 64)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{!224, !821, !997, !71, !821, !821, !90}
!1241 = !DIDerivedType(tag: DW_TAG_member, name: "CloseProtocol", scope: !1057, file: !14, line: 1949, baseType: !1242, size: 64, offset: 2304)
!1242 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_PROTOCOL", file: !14, line: 1379, baseType: !1243)
!1243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1244, size: 64)
!1244 = !DISubroutineType(types: !1245)
!1245 = !{!224, !821, !997, !821, !821}
!1246 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocolInformation", scope: !1057, file: !14, line: 1950, baseType: !1247, size: 64, offset: 2368)
!1247 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION", file: !14, line: 1413, baseType: !1248)
!1248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1249, size: 64)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!224, !821, !997, !1251, !886}
!1251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1252, size: 64)
!1252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1253, size: 64)
!1253 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1394, baseType: !1254)
!1254 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1389, size: 192, elements: !1255)
!1255 = !{!1256, !1257, !1258, !1259}
!1256 = !DIDerivedType(tag: DW_TAG_member, name: "AgentHandle", scope: !1254, file: !14, line: 1390, baseType: !821, size: 64)
!1257 = !DIDerivedType(tag: DW_TAG_member, name: "ControllerHandle", scope: !1254, file: !14, line: 1391, baseType: !821, size: 64, offset: 64)
!1258 = !DIDerivedType(tag: DW_TAG_member, name: "Attributes", scope: !1254, file: !14, line: 1392, baseType: !90, size: 32, offset: 128)
!1259 = !DIDerivedType(tag: DW_TAG_member, name: "OpenCount", scope: !1254, file: !14, line: 1393, baseType: !90, size: 32, offset: 160)
!1260 = !DIDerivedType(tag: DW_TAG_member, name: "ProtocolsPerHandle", scope: !1057, file: !14, line: 1955, baseType: !1261, size: 64, offset: 2432)
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PROTOCOLS_PER_HANDLE", file: !14, line: 1443, baseType: !1262)
!1262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1263, size: 64)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!224, !821, !1265, !886}
!1265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1266, size: 64)
!1266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !997, size: 64)
!1267 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandleBuffer", scope: !1057, file: !14, line: 1956, baseType: !1268, size: 64, offset: 2496)
!1268 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE_BUFFER", file: !14, line: 1588, baseType: !1269)
!1269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1270, size: 64)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!224, !1162, !997, !53, !886, !1272}
!1272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1134, size: 64)
!1273 = !DIDerivedType(tag: DW_TAG_member, name: "LocateProtocol", scope: !1057, file: !14, line: 1957, baseType: !1274, size: 64, offset: 2560)
!1274 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_PROTOCOL", file: !14, line: 1615, baseType: !1275)
!1275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1276, size: 64)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!224, !997, !53, !71}
!1278 = !DIDerivedType(tag: DW_TAG_member, name: "InstallMultipleProtocolInterfaces", scope: !1057, file: !14, line: 1958, baseType: !1279, size: 64, offset: 2624)
!1279 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !14, line: 1213, baseType: !1280)
!1280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1281, size: 64)
!1281 = !DISubroutineType(types: !1282)
!1282 = !{!224, !1134, null}
!1283 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallMultipleProtocolInterfaces", scope: !1057, file: !14, line: 1959, baseType: !1284, size: 64, offset: 2688)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !14, line: 1283, baseType: !1285)
!1285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1286, size: 64)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!224, !821, null}
!1288 = !DIDerivedType(tag: DW_TAG_member, name: "CalculateCrc32", scope: !1057, file: !14, line: 1964, baseType: !1289, size: 64, offset: 2752)
!1289 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CALCULATE_CRC32", file: !14, line: 1118, baseType: !1290)
!1290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1291, size: 64)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!224, !53, !56, !1006}
!1293 = !DIDerivedType(tag: DW_TAG_member, name: "CopyMem", scope: !1057, file: !14, line: 1969, baseType: !1294, size: 64, offset: 2816)
!1294 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_COPY_MEM", file: !14, line: 1134, baseType: !1295)
!1295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1296, size: 64)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{null, !53, !53, !56}
!1298 = !DIDerivedType(tag: DW_TAG_member, name: "SetMem", scope: !1057, file: !14, line: 1970, baseType: !1299, size: 64, offset: 2880)
!1299 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_MEM", file: !14, line: 1150, baseType: !1300)
!1300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1301, size: 64)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{null, !53, !56, !109}
!1303 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEventEx", scope: !1057, file: !14, line: 1971, baseType: !1304, size: 64, offset: 2944)
!1304 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT_EX", file: !14, line: 509, baseType: !1305)
!1305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1306, size: 64)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!224, !90, !1065, !1104, !1308, !1310, !1108}
!1308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1309, size: 64)
!1309 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1311, size: 64)
!1311 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !998)
!1312 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfTableEntries", scope: !824, file: !14, line: 2047, baseType: !56, size: 64, offset: 832)
!1313 = !DIDerivedType(tag: DW_TAG_member, name: "ConfigurationTable", scope: !824, file: !14, line: 2052, baseType: !1314, size: 64, offset: 896)
!1314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1315, size: 64)
!1315 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1987, baseType: !1316)
!1316 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1978, size: 192, elements: !1317)
!1317 = !{!1318, !1319}
!1318 = !DIDerivedType(tag: DW_TAG_member, name: "VendorGuid", scope: !1316, file: !14, line: 1982, baseType: !998, size: 128)
!1319 = !DIDerivedType(tag: DW_TAG_member, name: "VendorTable", scope: !1316, file: !14, line: 1986, baseType: !53, size: 64, offset: 128)
!1320 = !DILocalVariable(name: "ImageHandle", arg: 1, scope: !818, file: !85, line: 337, type: !821)
!1321 = !DILocation(line: 337, scope: !818)
!1322 = !DILocalVariable(name: "SystemTable", arg: 2, scope: !818, file: !85, line: 338, type: !822)
!1323 = !DILocation(line: 338, scope: !818)
!1324 = !DILocalVariable(name: "Status", scope: !818, file: !85, line: 341, type: !224)
!1325 = !DILocation(line: 341, scope: !818)
!1326 = !DILocalVariable(name: "HandleProtoc", scope: !818, file: !85, line: 342, type: !821)
!1327 = !DILocation(line: 342, scope: !818)
!1328 = !DILocalVariable(name: "HandleNotify", scope: !818, file: !85, line: 343, type: !821)
!1329 = !DILocation(line: 343, scope: !818)
!1330 = !DILocalVariable(name: "mCharConverter", scope: !818, file: !85, line: 344, type: !1331)
!1331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1332, size: 64)
!1332 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PROTOCOL", file: !323, line: 83, baseType: !1333)
!1333 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CHAR_CONVERTER_PROTOCOL", file: !323, line: 77, size: 320, elements: !1334)
!1334 = !{!1335, !1338, !1341, !1344, !1346}
!1335 = !DIDerivedType(tag: DW_TAG_member, name: "IconvOpen", scope: !1333, file: !323, line: 78, baseType: !1336, size: 64)
!1336 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV_OPEN", file: !323, line: 37, baseType: !1337)
!1337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64)
!1338 = !DIDerivedType(tag: DW_TAG_member, name: "Iconv", scope: !1333, file: !323, line: 79, baseType: !1339, size: 64, offset: 64)
!1339 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV", file: !323, line: 45, baseType: !1340)
!1340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64)
!1341 = !DIDerivedType(tag: DW_TAG_member, name: "StandardConvert", scope: !1333, file: !323, line: 80, baseType: !1342, size: 64, offset: 128)
!1342 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_STANDARD_CONVERT", file: !323, line: 55, baseType: !1343)
!1343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !554, size: 64)
!1344 = !DIDerivedType(tag: DW_TAG_member, name: "Libxml2Convert", scope: !1333, file: !323, line: 81, baseType: !1345, size: 64, offset: 192)
!1345 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_LIBXML2_CONVERT", file: !323, line: 63, baseType: !1343)
!1346 = !DIDerivedType(tag: DW_TAG_member, name: "PkexecConvert", scope: !1333, file: !323, line: 82, baseType: !1347, size: 64, offset: 256)
!1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PKEXEC_CONVERT", file: !323, line: 71, baseType: !1343)
!1348 = !DILocation(line: 344, scope: !818)
!1349 = !DILocalVariable(name: "ProtocolSize", scope: !818, file: !85, line: 345, type: !56)
!1350 = !DILocation(line: 345, scope: !818)
!1351 = !DILocation(line: 350, scope: !818)
!1352 = !DILocation(line: 355, scope: !818)
!1353 = !DILocation(line: 356, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1355, file: !85, line: 355)
!1355 = distinct !DILexicalBlock(scope: !818, file: !85, line: 355)
!1356 = !DILocation(line: 362, scope: !818)
!1357 = !DILocation(line: 363, scope: !818)
!1358 = !DILocation(line: 364, scope: !818)
!1359 = !DILocation(line: 365, scope: !818)
!1360 = !DILocation(line: 366, scope: !818)
!1361 = !DILocation(line: 371, scope: !818)
!1362 = !DILocation(line: 377, scope: !818)
!1363 = !DILocation(line: 378, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1365, file: !85, line: 377)
!1365 = distinct !DILexicalBlock(scope: !818, file: !85, line: 377)
!1366 = !DILocation(line: 381, scope: !818)
!1367 = !DILocation(line: 382, scope: !818)
!1368 = !DILocation(line: 388, scope: !818)
!1369 = !DILocation(line: 389, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1371, file: !85, line: 388)
!1371 = distinct !DILexicalBlock(scope: !818, file: !85, line: 388)
!1372 = !DILocation(line: 392, scope: !818)
!1373 = !DILocation(line: 393, scope: !818)
!1374 = distinct !DISubprogram(name: "GetBlockSize", scope: !123, file: !123, line: 12, type: !254, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1375 = !DILocalVariable(name: "Size", arg: 1, scope: !1374, file: !123, line: 13, type: !56)
!1376 = !DILocation(line: 13, scope: !1374)
!1377 = !DILocalVariable(name: "BlockSize", arg: 2, scope: !1374, file: !123, line: 14, type: !240)
!1378 = !DILocation(line: 14, scope: !1374)
!1379 = !DILocation(line: 17, scope: !1374)
!1380 = !DILocation(line: 18, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1374, file: !123, line: 17)
!1382 = !DILocation(line: 19, scope: !1374)
!1383 = !DILocation(line: 20, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1374, file: !123, line: 19)
!1385 = !DILocation(line: 21, scope: !1374)
!1386 = !DILocation(line: 22, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1374, file: !123, line: 21)
!1388 = !DILocation(line: 24, scope: !1387)
!1389 = !DILocation(line: 25, scope: !1374)
!1390 = distinct !DISubprogram(name: "AllocateChunk", scope: !123, file: !123, line: 31, type: !1391, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1391 = !DISubroutineType(types: !1392)
!1392 = !{!224, !56, !1393}
!1393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!1394 = !DILocalVariable(name: "ChunkSize", arg: 1, scope: !1390, file: !123, line: 32, type: !56)
!1395 = !DILocation(line: 32, scope: !1390)
!1396 = !DILocalVariable(name: "AllocatedChunk", arg: 2, scope: !1390, file: !123, line: 33, type: !1393)
!1397 = !DILocation(line: 33, scope: !1390)
!1398 = !DILocation(line: 36, scope: !1390)
!1399 = !DILocation(line: 37, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1401, file: !123, line: 36)
!1401 = distinct !DILexicalBlock(scope: !1390, file: !123, line: 36)
!1402 = !DILocation(line: 39, scope: !1390)
!1403 = !DILocation(line: 40, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1405, file: !123, line: 39)
!1405 = distinct !DILexicalBlock(scope: !1390, file: !123, line: 39)
!1406 = !DILocation(line: 40, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1404, file: !123, line: 40)
!1408 = !DILocation(line: 40, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1410, file: !123, line: 40)
!1410 = distinct !DILexicalBlock(scope: !1407, file: !123, line: 40)
!1411 = !DILocation(line: 40, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1409, file: !123, line: 40)
!1413 = !DILocation(line: 40, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1415, file: !123, line: 40)
!1415 = distinct !DILexicalBlock(scope: !1412, file: !123, line: 40)
!1416 = !DILocation(line: 41, scope: !1404)
!1417 = !DILocation(line: 44, scope: !1390)
!1418 = !DILocation(line: 45, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1420, file: !123, line: 44)
!1420 = distinct !DILexicalBlock(scope: !1390, file: !123, line: 44)
!1421 = !DILocation(line: 46, scope: !1419)
!1422 = !DILocation(line: 46, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1419, file: !123, line: 46)
!1424 = !DILocation(line: 46, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1426, file: !123, line: 46)
!1426 = distinct !DILexicalBlock(scope: !1423, file: !123, line: 46)
!1427 = !DILocation(line: 46, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1425, file: !123, line: 46)
!1429 = !DILocation(line: 46, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1431, file: !123, line: 46)
!1431 = distinct !DILexicalBlock(scope: !1428, file: !123, line: 46)
!1432 = !DILocation(line: 47, scope: !1419)
!1433 = !DILocation(line: 50, scope: !1390)
!1434 = !DILocation(line: 51, scope: !1390)
!1435 = !DILocalVariable(name: "Handle", scope: !1390, file: !123, line: 52, type: !65)
!1436 = !DILocation(line: 52, scope: !1390)
!1437 = !DILocation(line: 53, scope: !1390)
!1438 = !DILocation(line: 54, scope: !1390)
!1439 = !DILocation(line: 55, scope: !1390)
!1440 = !DILocation(line: 57, scope: !1390)
!1441 = !DILocation(line: 58, scope: !1390)
!1442 = distinct !DISubprogram(name: "FreeChunk", scope: !123, file: !123, line: 62, type: !271, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1443 = !DILocalVariable(name: "Handle", arg: 1, scope: !1442, file: !123, line: 63, type: !65)
!1444 = !DILocation(line: 63, scope: !1442)
!1445 = !DILocation(line: 66, scope: !1442)
!1446 = !DILocation(line: 67, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1448, file: !123, line: 66)
!1448 = distinct !DILexicalBlock(scope: !1442, file: !123, line: 66)
!1449 = !DILocation(line: 67, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1447, file: !123, line: 67)
!1451 = !DILocation(line: 67, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1453, file: !123, line: 67)
!1453 = distinct !DILexicalBlock(scope: !1450, file: !123, line: 67)
!1454 = !DILocation(line: 67, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1452, file: !123, line: 67)
!1456 = !DILocation(line: 67, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1458, file: !123, line: 67)
!1458 = distinct !DILexicalBlock(scope: !1455, file: !123, line: 67)
!1459 = !DILocation(line: 68, scope: !1447)
!1460 = !DILocalVariable(name: "Chunk", scope: !1442, file: !123, line: 71, type: !96)
!1461 = !DILocation(line: 71, scope: !1442)
!1462 = !DILocalVariable(name: "ChunkSize", scope: !1442, file: !123, line: 72, type: !56)
!1463 = !DILocation(line: 72, scope: !1442)
!1464 = !DILocation(line: 74, scope: !1442)
!1465 = !DILocation(line: 75, scope: !1442)
!1466 = !DILocation(line: 77, scope: !1442)
!1467 = !DILocation(line: 78, scope: !1442)
!1468 = !DILocation(line: 79, scope: !1442)
!1469 = !DILocation(line: 79, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1442, file: !123, line: 79)
!1471 = !DILocation(line: 79, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1473, file: !123, line: 79)
!1473 = distinct !DILexicalBlock(scope: !1470, file: !123, line: 79)
!1474 = !DILocation(line: 79, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1472, file: !123, line: 79)
!1476 = !DILocation(line: 79, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1478, file: !123, line: 79)
!1478 = distinct !DILexicalBlock(scope: !1475, file: !123, line: 79)
!1479 = !DILocation(line: 80, scope: !1442)
!1480 = !DILocation(line: 81, scope: !1442)
!1481 = distinct !DISubprogram(name: "FreeAllocList", scope: !123, file: !123, line: 85, type: !1482, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1482 = !DISubroutineType(types: !1483)
!1483 = !{!224}
!1484 = !DILocalVariable(name: "Status", scope: !1481, file: !123, line: 87, type: !224)
!1485 = !DILocation(line: 87, scope: !1481)
!1486 = !DILocalVariable(name: "i", scope: !1487, file: !123, line: 89, type: !65)
!1487 = distinct !DILexicalBlock(scope: !1481, file: !123, line: 89)
!1488 = !DILocation(line: 89, scope: !1487)
!1489 = !DILocation(line: 90, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1491, file: !123, line: 89)
!1491 = distinct !DILexicalBlock(scope: !1487, file: !123, line: 89)
!1492 = !DILocation(line: 91, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1494, file: !123, line: 90)
!1494 = distinct !DILexicalBlock(scope: !1490, file: !123, line: 90)
!1495 = !DILocation(line: 92, scope: !1493)
!1496 = !DILocation(line: 94, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1498, file: !123, line: 93)
!1498 = distinct !DILexicalBlock(scope: !1493, file: !123, line: 92)
!1499 = !DILocation(line: 96, scope: !1493)
!1500 = !DILocation(line: 97, scope: !1490)
!1501 = !DILocation(line: 89, scope: !1491)
!1502 = distinct !{!1502, !1488, !1503, !390}
!1503 = !DILocation(line: 97, scope: !1487)
!1504 = !DILocation(line: 98, scope: !1481)
!1505 = !DILocation(line: 99, scope: !1481)
!1506 = distinct !DISubprogram(name: "DisplayFreeList", scope: !123, file: !123, line: 103, type: !1219, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1507 = !DILocalVariable(name: "ChunkSize", arg: 1, scope: !1506, file: !123, line: 104, type: !56)
!1508 = !DILocation(line: 104, scope: !1506)
!1509 = !DILocation(line: 107, scope: !1506)
!1510 = !DILocation(line: 108, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1512, file: !123, line: 107)
!1512 = distinct !DILexicalBlock(scope: !1506, file: !123, line: 107)
!1513 = !DILocation(line: 108, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1511, file: !123, line: 108)
!1515 = !DILocation(line: 108, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1517, file: !123, line: 108)
!1517 = distinct !DILexicalBlock(scope: !1514, file: !123, line: 108)
!1518 = !DILocation(line: 108, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1516, file: !123, line: 108)
!1520 = !DILocation(line: 108, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1522, file: !123, line: 108)
!1522 = distinct !DILexicalBlock(scope: !1519, file: !123, line: 108)
!1523 = !DILocation(line: 109, scope: !1511)
!1524 = !DILocalVariable(name: "Current", scope: !1506, file: !123, line: 112, type: !96)
!1525 = !DILocation(line: 112, scope: !1506)
!1526 = !DILocation(line: 113, scope: !1506)
!1527 = !DILocation(line: 114, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1529, file: !123, line: 113)
!1529 = distinct !DILexicalBlock(scope: !1506, file: !123, line: 113)
!1530 = !DILocation(line: 114, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1528, file: !123, line: 114)
!1532 = !DILocation(line: 114, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1534, file: !123, line: 114)
!1534 = distinct !DILexicalBlock(scope: !1531, file: !123, line: 114)
!1535 = !DILocation(line: 114, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1533, file: !123, line: 114)
!1537 = !DILocation(line: 114, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1539, file: !123, line: 114)
!1539 = distinct !DILexicalBlock(scope: !1536, file: !123, line: 114)
!1540 = !DILocation(line: 115, scope: !1528)
!1541 = !DILocation(line: 117, scope: !1506)
!1542 = !DILocation(line: 117, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1506, file: !123, line: 117)
!1544 = !DILocation(line: 117, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1546, file: !123, line: 117)
!1546 = distinct !DILexicalBlock(scope: !1543, file: !123, line: 117)
!1547 = !DILocation(line: 117, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1545, file: !123, line: 117)
!1549 = !DILocation(line: 117, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1551, file: !123, line: 117)
!1551 = distinct !DILexicalBlock(scope: !1548, file: !123, line: 117)
!1552 = !DILocation(line: 118, scope: !1506)
!1553 = !DILocation(line: 119, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1506, file: !123, line: 118)
!1555 = !DILocation(line: 119, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1554, file: !123, line: 119)
!1557 = !DILocation(line: 119, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1559, file: !123, line: 119)
!1559 = distinct !DILexicalBlock(scope: !1556, file: !123, line: 119)
!1560 = !DILocation(line: 119, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1558, file: !123, line: 119)
!1562 = !DILocation(line: 119, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1564, file: !123, line: 119)
!1564 = distinct !DILexicalBlock(scope: !1561, file: !123, line: 119)
!1565 = !DILocation(line: 120, scope: !1554)
!1566 = distinct !{!1566, !1552, !1567, !390}
!1567 = !DILocation(line: 121, scope: !1506)
!1568 = !DILocation(line: 122, scope: !1506)
!1569 = !DILocation(line: 123, scope: !1506)
!1570 = distinct !DISubprogram(name: "DisplayHeapMetadata", scope: !123, file: !123, line: 127, type: !1482, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1571 = !DILocation(line: 129, scope: !1570)
!1572 = !DILocation(line: 129, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1570, file: !123, line: 129)
!1574 = !DILocation(line: 129, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1576, file: !123, line: 129)
!1576 = distinct !DILexicalBlock(scope: !1573, file: !123, line: 129)
!1577 = !DILocation(line: 129, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1575, file: !123, line: 129)
!1579 = !DILocation(line: 129, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1581, file: !123, line: 129)
!1581 = distinct !DILexicalBlock(scope: !1578, file: !123, line: 129)
!1582 = !DILocation(line: 130, scope: !1570)
!1583 = !DILocation(line: 130, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1570, file: !123, line: 130)
!1585 = !DILocation(line: 130, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1587, file: !123, line: 130)
!1587 = distinct !DILexicalBlock(scope: !1584, file: !123, line: 130)
!1588 = !DILocation(line: 130, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1586, file: !123, line: 130)
!1590 = !DILocation(line: 130, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1592, file: !123, line: 130)
!1592 = distinct !DILexicalBlock(scope: !1589, file: !123, line: 130)
!1593 = !DILocation(line: 131, scope: !1570)
!1594 = !DILocation(line: 131, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1570, file: !123, line: 131)
!1596 = !DILocation(line: 131, scope: !1597)
!1597 = distinct !DILexicalBlock(scope: !1598, file: !123, line: 131)
!1598 = distinct !DILexicalBlock(scope: !1595, file: !123, line: 131)
!1599 = !DILocation(line: 131, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1597, file: !123, line: 131)
!1601 = !DILocation(line: 131, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1603, file: !123, line: 131)
!1603 = distinct !DILexicalBlock(scope: !1600, file: !123, line: 131)
!1604 = !DILocalVariable(name: "i", scope: !1605, file: !123, line: 132, type: !65)
!1605 = distinct !DILexicalBlock(scope: !1570, file: !123, line: 132)
!1606 = !DILocation(line: 132, scope: !1605)
!1607 = !DILocation(line: 133, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1609, file: !123, line: 132)
!1609 = distinct !DILexicalBlock(scope: !1605, file: !123, line: 132)
!1610 = !DILocation(line: 134, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1612, file: !123, line: 133)
!1612 = distinct !DILexicalBlock(scope: !1608, file: !123, line: 133)
!1613 = !DILocation(line: 134, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1611, file: !123, line: 134)
!1615 = !DILocation(line: 134, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1617, file: !123, line: 134)
!1617 = distinct !DILexicalBlock(scope: !1614, file: !123, line: 134)
!1618 = !DILocation(line: 134, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1616, file: !123, line: 134)
!1620 = !DILocation(line: 134, scope: !1621)
!1621 = distinct !DILexicalBlock(scope: !1622, file: !123, line: 134)
!1622 = distinct !DILexicalBlock(scope: !1619, file: !123, line: 134)
!1623 = !DILocation(line: 135, scope: !1611)
!1624 = !DILocation(line: 136, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1612, file: !123, line: 135)
!1626 = !DILocation(line: 136, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1625, file: !123, line: 136)
!1628 = !DILocation(line: 136, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1630, file: !123, line: 136)
!1630 = distinct !DILexicalBlock(scope: !1627, file: !123, line: 136)
!1631 = !DILocation(line: 136, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1629, file: !123, line: 136)
!1633 = !DILocation(line: 136, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1635, file: !123, line: 136)
!1635 = distinct !DILexicalBlock(scope: !1632, file: !123, line: 136)
!1636 = !DILocation(line: 137, scope: !1625)
!1637 = !DILocation(line: 138, scope: !1608)
!1638 = !DILocation(line: 139, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1608, file: !123, line: 138)
!1640 = !DILocation(line: 139, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1639, file: !123, line: 139)
!1642 = !DILocation(line: 139, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1644, file: !123, line: 139)
!1644 = distinct !DILexicalBlock(scope: !1641, file: !123, line: 139)
!1645 = !DILocation(line: 139, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1643, file: !123, line: 139)
!1647 = !DILocation(line: 139, scope: !1648)
!1648 = distinct !DILexicalBlock(scope: !1649, file: !123, line: 139)
!1649 = distinct !DILexicalBlock(scope: !1646, file: !123, line: 139)
!1650 = !DILocation(line: 140, scope: !1608)
!1651 = !DILocation(line: 140, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1608, file: !123, line: 140)
!1653 = !DILocation(line: 140, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1655, file: !123, line: 140)
!1655 = distinct !DILexicalBlock(scope: !1652, file: !123, line: 140)
!1656 = !DILocation(line: 140, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1654, file: !123, line: 140)
!1658 = !DILocation(line: 140, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1660, file: !123, line: 140)
!1660 = distinct !DILexicalBlock(scope: !1657, file: !123, line: 140)
!1661 = !DILocation(line: 141, scope: !1608)
!1662 = !DILocation(line: 132, scope: !1609)
!1663 = distinct !{!1663, !1606, !1664, !390}
!1664 = !DILocation(line: 141, scope: !1605)
!1665 = !DILocation(line: 142, scope: !1570)
!1666 = !DILocation(line: 142, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1570, file: !123, line: 142)
!1668 = !DILocation(line: 142, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1670, file: !123, line: 142)
!1670 = distinct !DILexicalBlock(scope: !1667, file: !123, line: 142)
!1671 = !DILocation(line: 142, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1669, file: !123, line: 142)
!1673 = !DILocation(line: 142, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1675, file: !123, line: 142)
!1675 = distinct !DILexicalBlock(scope: !1672, file: !123, line: 142)
!1676 = !DILocation(line: 143, scope: !1570)
!1677 = distinct !DISubprogram(name: "InitializePage", scope: !123, file: !123, line: 148, type: !1678, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1678 = !DISubroutineType(types: !1679)
!1679 = !{!224, !56, !1680}
!1680 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!1681 = !DILocalVariable(name: "Size", arg: 1, scope: !1677, file: !123, line: 149, type: !56)
!1682 = !DILocation(line: 149, scope: !1677)
!1683 = !DILocalVariable(name: "Pages", arg: 2, scope: !1677, file: !123, line: 150, type: !1680)
!1684 = !DILocation(line: 150, scope: !1677)
!1685 = !DILocation(line: 153, scope: !1677)
!1686 = !DILocation(line: 154, scope: !1677)
!1687 = !DILocation(line: 155, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1689, file: !123, line: 154)
!1689 = distinct !DILexicalBlock(scope: !1677, file: !123, line: 154)
!1690 = !DILocation(line: 155, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1688, file: !123, line: 155)
!1692 = !DILocation(line: 155, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1694, file: !123, line: 155)
!1694 = distinct !DILexicalBlock(scope: !1691, file: !123, line: 155)
!1695 = !DILocation(line: 155, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1693, file: !123, line: 155)
!1697 = !DILocation(line: 155, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1699, file: !123, line: 155)
!1699 = distinct !DILexicalBlock(scope: !1696, file: !123, line: 155)
!1700 = !DILocation(line: 156, scope: !1688)
!1701 = !DILocation(line: 159, scope: !1677)
!1702 = !DILocation(line: 160, scope: !1677)
!1703 = distinct !DISubprogram(name: "InitializeHeapMetadata", scope: !123, file: !123, line: 164, type: !1482, scopeLine: 165, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1704 = !DILocation(line: 166, scope: !1703)
!1705 = !DILocation(line: 166, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1703, file: !123, line: 166)
!1707 = !DILocation(line: 166, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1709, file: !123, line: 166)
!1709 = distinct !DILexicalBlock(scope: !1706, file: !123, line: 166)
!1710 = !DILocation(line: 166, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1708, file: !123, line: 166)
!1712 = !DILocation(line: 166, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1714, file: !123, line: 166)
!1714 = distinct !DILexicalBlock(scope: !1711, file: !123, line: 166)
!1715 = !DILocation(line: 167, scope: !1703)
!1716 = !DILocalVariable(name: "i", scope: !1717, file: !123, line: 168, type: !56)
!1717 = distinct !DILexicalBlock(scope: !1703, file: !123, line: 168)
!1718 = !DILocation(line: 168, scope: !1717)
!1719 = !DILocation(line: 169, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1721, file: !123, line: 168)
!1721 = distinct !DILexicalBlock(scope: !1717, file: !123, line: 168)
!1722 = !DILocation(line: 170, scope: !1720)
!1723 = !DILocation(line: 171, scope: !1720)
!1724 = !DILocation(line: 172, scope: !1720)
!1725 = !DILocation(line: 168, scope: !1721)
!1726 = distinct !{!1726, !1718, !1727, !390}
!1727 = !DILocation(line: 172, scope: !1717)
!1728 = !DILocation(line: 174, scope: !1703)
!1729 = distinct !DISubprogram(name: "InitializeHeap", scope: !123, file: !123, line: 179, type: !1482, scopeLine: 180, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1730 = !DILocalVariable(name: "Status", scope: !1729, file: !123, line: 181, type: !224)
!1731 = !DILocation(line: 181, scope: !1729)
!1732 = !DILocation(line: 182, scope: !1729)
!1733 = !DILocation(line: 182, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1729, file: !123, line: 182)
!1735 = !DILocation(line: 182, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1737, file: !123, line: 182)
!1737 = distinct !DILexicalBlock(scope: !1734, file: !123, line: 182)
!1738 = !DILocation(line: 182, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1736, file: !123, line: 182)
!1740 = !DILocation(line: 182, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1742, file: !123, line: 182)
!1742 = distinct !DILexicalBlock(scope: !1739, file: !123, line: 182)
!1743 = !DILocalVariable(name: "i", scope: !1744, file: !123, line: 183, type: !76)
!1744 = distinct !DILexicalBlock(scope: !1729, file: !123, line: 183)
!1745 = !DILocation(line: 183, scope: !1744)
!1746 = !DILocation(line: 184, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1748, file: !123, line: 183)
!1748 = distinct !DILexicalBlock(scope: !1744, file: !123, line: 183)
!1749 = !DILocation(line: 185, scope: !1747)
!1750 = !DILocation(line: 187, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1752, file: !123, line: 186)
!1752 = distinct !DILexicalBlock(scope: !1747, file: !123, line: 185)
!1753 = !DILocation(line: 189, scope: !1747)
!1754 = !DILocalVariable(name: "Current", scope: !1747, file: !123, line: 190, type: !96)
!1755 = !DILocation(line: 190, scope: !1747)
!1756 = !DILocalVariable(name: "j", scope: !1757, file: !123, line: 191, type: !76)
!1757 = distinct !DILexicalBlock(scope: !1747, file: !123, line: 191)
!1758 = !DILocation(line: 191, scope: !1757)
!1759 = !DILocation(line: 192, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1761, file: !123, line: 191)
!1761 = distinct !DILexicalBlock(scope: !1757, file: !123, line: 191)
!1762 = !DILocation(line: 193, scope: !1760)
!1763 = !DILocation(line: 194, scope: !1760)
!1764 = !DILocation(line: 191, scope: !1761)
!1765 = distinct !{!1765, !1758, !1766, !390}
!1766 = !DILocation(line: 194, scope: !1757)
!1767 = !DILocation(line: 195, scope: !1747)
!1768 = !DILocation(line: 183, scope: !1748)
!1769 = distinct !{!1769, !1745, !1770, !390}
!1770 = !DILocation(line: 195, scope: !1744)
!1771 = !DILocation(line: 196, scope: !1729)
!1772 = !DILocation(line: 197, scope: !1729)
!1773 = distinct !DISubprogram(name: "HeapManagerEntryPoint", scope: !123, file: !123, line: 202, type: !1774, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !328)
!1774 = !DISubroutineType(types: !1775)
!1775 = !{!224, !821, !1776}
!1776 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1777, size: 64)
!1777 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SYSTEM_TABLE", file: !14, line: 2053, baseType: !1778)
!1778 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SYSTEM_TABLE", file: !14, line: 1992, size: 960, elements: !1779)
!1779 = !{!1780, !1789, !1790, !1791, !1792, !1814, !1815, !1867, !1868, !1869, !1978, !2121, !2122}
!1780 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !1778, file: !14, line: 1996, baseType: !1781, size: 192)
!1781 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TABLE_HEADER", file: !6, line: 177, baseType: !1782)
!1782 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TABLE_HEADER", file: !6, line: 150, size: 192, elements: !1783)
!1783 = !{!1784, !1785, !1786, !1787, !1788}
!1784 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !1782, file: !6, line: 156, baseType: !58, size: 64)
!1785 = !DIDerivedType(tag: DW_TAG_member, name: "Revision", scope: !1782, file: !6, line: 163, baseType: !90, size: 32, offset: 64)
!1786 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !1782, file: !6, line: 167, baseType: !90, size: 32, offset: 96)
!1787 = !DIDerivedType(tag: DW_TAG_member, name: "CRC32", scope: !1782, file: !6, line: 172, baseType: !90, size: 32, offset: 128)
!1788 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !1782, file: !6, line: 176, baseType: !90, size: 32, offset: 160)
!1789 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareVendor", scope: !1778, file: !14, line: 2001, baseType: !62, size: 64, offset: 192)
!1790 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareRevision", scope: !1778, file: !14, line: 2006, baseType: !90, size: 32, offset: 256)
!1791 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleInHandle", scope: !1778, file: !14, line: 2011, baseType: !821, size: 64, offset: 320)
!1792 = !DIDerivedType(tag: DW_TAG_member, name: "ConIn", scope: !1778, file: !14, line: 2016, baseType: !1793, size: 64, offset: 384)
!1793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1794, size: 64)
!1794 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !841, line: 20, baseType: !1795)
!1795 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !841, line: 116, size: 192, elements: !1796)
!1796 = !{!1797, !1802, !1813}
!1797 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !1795, file: !841, line: 117, baseType: !1798, size: 64)
!1798 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_RESET", file: !841, line: 86, baseType: !1799)
!1799 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1800, size: 64)
!1800 = !DISubroutineType(types: !1801)
!1801 = !{!224, !1793, !68}
!1802 = !DIDerivedType(tag: DW_TAG_member, name: "ReadKeyStroke", scope: !1795, file: !841, line: 118, baseType: !1803, size: 64, offset: 64)
!1803 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_READ_KEY", file: !841, line: 107, baseType: !1804)
!1804 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1805, size: 64)
!1805 = !DISubroutineType(types: !1806)
!1806 = !{!224, !1793, !1807}
!1807 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1808, size: 64)
!1808 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_KEY", file: !841, line: 38, baseType: !1809)
!1809 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_INPUT_KEY", file: !841, line: 35, size: 32, elements: !1810)
!1810 = !{!1811, !1812}
!1811 = !DIDerivedType(tag: DW_TAG_member, name: "ScanCode", scope: !1809, file: !841, line: 36, baseType: !198, size: 16)
!1812 = !DIDerivedType(tag: DW_TAG_member, name: "UnicodeChar", scope: !1809, file: !841, line: 37, baseType: !60, size: 16, offset: 16)
!1813 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForKey", scope: !1795, file: !841, line: 122, baseType: !861, size: 64, offset: 128)
!1814 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleOutHandle", scope: !1778, file: !14, line: 2020, baseType: !821, size: 64, offset: 448)
!1815 = !DIDerivedType(tag: DW_TAG_member, name: "ConOut", scope: !1778, file: !14, line: 2025, baseType: !1816, size: 64, offset: 512)
!1816 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1817, size: 64)
!1817 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !866, line: 27, baseType: !1818)
!1818 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !866, line: 387, size: 640, elements: !1819)
!1819 = !{!1820, !1825, !1830, !1832, !1837, !1842, !1844, !1849, !1854, !1856}
!1820 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !1818, file: !866, line: 388, baseType: !1821, size: 64)
!1821 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_RESET", file: !866, line: 167, baseType: !1822)
!1822 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1823, size: 64)
!1823 = !DISubroutineType(types: !1824)
!1824 = !{!224, !1816, !68}
!1825 = !DIDerivedType(tag: DW_TAG_member, name: "OutputString", scope: !1818, file: !866, line: 390, baseType: !1826, size: 64, offset: 64)
!1826 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_STRING", file: !866, line: 192, baseType: !1827)
!1827 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1828, size: 64)
!1828 = !DISubroutineType(types: !1829)
!1829 = !{!224, !1816, !62}
!1830 = !DIDerivedType(tag: DW_TAG_member, name: "TestString", scope: !1818, file: !866, line: 391, baseType: !1831, size: 64, offset: 128)
!1831 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_TEST_STRING", file: !866, line: 213, baseType: !1827)
!1832 = !DIDerivedType(tag: DW_TAG_member, name: "QueryMode", scope: !1818, file: !866, line: 393, baseType: !1833, size: 64, offset: 192)
!1833 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_QUERY_MODE", file: !866, line: 236, baseType: !1834)
!1834 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1835, size: 64)
!1835 = !DISubroutineType(types: !1836)
!1836 = !{!224, !1816, !56, !886, !886}
!1837 = !DIDerivedType(tag: DW_TAG_member, name: "SetMode", scope: !1818, file: !866, line: 394, baseType: !1838, size: 64, offset: 256)
!1838 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_MODE", file: !866, line: 256, baseType: !1839)
!1839 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1840, size: 64)
!1840 = !DISubroutineType(types: !1841)
!1841 = !{!224, !1816, !56}
!1842 = !DIDerivedType(tag: DW_TAG_member, name: "SetAttribute", scope: !1818, file: !866, line: 395, baseType: !1843, size: 64, offset: 320)
!1843 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_ATTRIBUTE", file: !866, line: 277, baseType: !1839)
!1844 = !DIDerivedType(tag: DW_TAG_member, name: "ClearScreen", scope: !1818, file: !866, line: 397, baseType: !1845, size: 64, offset: 384)
!1845 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_CLEAR_SCREEN", file: !866, line: 295, baseType: !1846)
!1846 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1847, size: 64)
!1847 = !DISubroutineType(types: !1848)
!1848 = !{!224, !1816}
!1849 = !DIDerivedType(tag: DW_TAG_member, name: "SetCursorPosition", scope: !1818, file: !866, line: 398, baseType: !1850, size: 64, offset: 448)
!1850 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_CURSOR_POSITION", file: !866, line: 318, baseType: !1851)
!1851 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1852, size: 64)
!1852 = !DISubroutineType(types: !1853)
!1853 = !{!224, !1816, !56, !56}
!1854 = !DIDerivedType(tag: DW_TAG_member, name: "EnableCursor", scope: !1818, file: !866, line: 399, baseType: !1855, size: 64, offset: 512)
!1855 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_ENABLE_CURSOR", file: !866, line: 340, baseType: !1822)
!1856 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !1818, file: !866, line: 404, baseType: !1857, size: 64, offset: 576)
!1857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1858, size: 64)
!1858 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !866, line: 379, baseType: !1859)
!1859 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !866, line: 349, size: 192, elements: !1860)
!1860 = !{!1861, !1862, !1863, !1864, !1865, !1866}
!1861 = !DIDerivedType(tag: DW_TAG_member, name: "MaxMode", scope: !1859, file: !866, line: 353, baseType: !912, size: 32)
!1862 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !1859, file: !866, line: 362, baseType: !912, size: 32, offset: 32)
!1863 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !1859, file: !866, line: 366, baseType: !912, size: 32, offset: 64)
!1864 = !DIDerivedType(tag: DW_TAG_member, name: "CursorColumn", scope: !1859, file: !866, line: 370, baseType: !912, size: 32, offset: 96)
!1865 = !DIDerivedType(tag: DW_TAG_member, name: "CursorRow", scope: !1859, file: !866, line: 374, baseType: !912, size: 32, offset: 128)
!1866 = !DIDerivedType(tag: DW_TAG_member, name: "CursorVisible", scope: !1859, file: !866, line: 378, baseType: !68, size: 8, offset: 160)
!1867 = !DIDerivedType(tag: DW_TAG_member, name: "StandardErrorHandle", scope: !1778, file: !14, line: 2030, baseType: !821, size: 64, offset: 576)
!1868 = !DIDerivedType(tag: DW_TAG_member, name: "StdErr", scope: !1778, file: !14, line: 2035, baseType: !1816, size: 64, offset: 640)
!1869 = !DIDerivedType(tag: DW_TAG_member, name: "RuntimeServices", scope: !1778, file: !14, line: 2039, baseType: !1870, size: 64, offset: 704)
!1870 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1871, size: 64)
!1871 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1871, baseType: !1872)
!1872 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1828, size: 1088, elements: !1873)
!1873 = !{!1874, !1875, !1902, !1907, !1912, !1917, !1931, !1932, !1946, !1951, !1956, !1957, !1958, !1972, !1977}
!1874 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !1872, file: !14, line: 1832, baseType: !1781, size: 192)
!1875 = !DIDerivedType(tag: DW_TAG_member, name: "GetTime", scope: !1872, file: !14, line: 1837, baseType: !1876, size: 64, offset: 192)
!1876 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_TIME", file: !14, line: 816, baseType: !1877)
!1877 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1878, size: 64)
!1878 = !DISubroutineType(types: !1879)
!1879 = !{!224, !1880, !1895}
!1880 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1881, size: 64)
!1881 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME", file: !192, line: 80, baseType: !1882)
!1882 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME", file: !192, line: 68, size: 128, elements: !1883)
!1883 = !{!1884, !1885, !1886, !1887, !1888, !1889, !1890, !1891, !1892, !1893, !1894}
!1884 = !DIDerivedType(tag: DW_TAG_member, name: "Year", scope: !1882, file: !192, line: 69, baseType: !198, size: 16)
!1885 = !DIDerivedType(tag: DW_TAG_member, name: "Month", scope: !1882, file: !192, line: 70, baseType: !109, size: 8, offset: 16)
!1886 = !DIDerivedType(tag: DW_TAG_member, name: "Day", scope: !1882, file: !192, line: 71, baseType: !109, size: 8, offset: 24)
!1887 = !DIDerivedType(tag: DW_TAG_member, name: "Hour", scope: !1882, file: !192, line: 72, baseType: !109, size: 8, offset: 32)
!1888 = !DIDerivedType(tag: DW_TAG_member, name: "Minute", scope: !1882, file: !192, line: 73, baseType: !109, size: 8, offset: 40)
!1889 = !DIDerivedType(tag: DW_TAG_member, name: "Second", scope: !1882, file: !192, line: 74, baseType: !109, size: 8, offset: 48)
!1890 = !DIDerivedType(tag: DW_TAG_member, name: "Pad1", scope: !1882, file: !192, line: 75, baseType: !109, size: 8, offset: 56)
!1891 = !DIDerivedType(tag: DW_TAG_member, name: "Nanosecond", scope: !1882, file: !192, line: 76, baseType: !90, size: 32, offset: 64)
!1892 = !DIDerivedType(tag: DW_TAG_member, name: "TimeZone", scope: !1882, file: !192, line: 77, baseType: !944, size: 16, offset: 96)
!1893 = !DIDerivedType(tag: DW_TAG_member, name: "Daylight", scope: !1882, file: !192, line: 78, baseType: !109, size: 8, offset: 112)
!1894 = !DIDerivedType(tag: DW_TAG_member, name: "Pad2", scope: !1882, file: !192, line: 79, baseType: !109, size: 8, offset: 120)
!1895 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1896, size: 64)
!1896 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME_CAPABILITIES", file: !14, line: 799, baseType: !1897)
!1897 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME_CAPABILITIES", file: !14, line: 776, size: 96, elements: !1898)
!1898 = !{!1899, !1900, !1901}
!1899 = !DIDerivedType(tag: DW_TAG_member, name: "Resolution", scope: !1897, file: !14, line: 783, baseType: !90, size: 32)
!1900 = !DIDerivedType(tag: DW_TAG_member, name: "Accuracy", scope: !1897, file: !14, line: 790, baseType: !90, size: 32, offset: 32)
!1901 = !DIDerivedType(tag: DW_TAG_member, name: "SetsToZero", scope: !1897, file: !14, line: 798, baseType: !68, size: 8, offset: 64)
!1902 = !DIDerivedType(tag: DW_TAG_member, name: "SetTime", scope: !1872, file: !14, line: 1838, baseType: !1903, size: 64, offset: 256)
!1903 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIME", file: !14, line: 833, baseType: !1904)
!1904 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1905, size: 64)
!1905 = !DISubroutineType(types: !1906)
!1906 = !{!224, !1880}
!1907 = !DIDerivedType(tag: DW_TAG_member, name: "GetWakeupTime", scope: !1872, file: !14, line: 1839, baseType: !1908, size: 64, offset: 320)
!1908 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_WAKEUP_TIME", file: !14, line: 854, baseType: !1909)
!1909 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1910, size: 64)
!1910 = !DISubroutineType(types: !1911)
!1911 = !{!224, !965, !965, !1880}
!1912 = !DIDerivedType(tag: DW_TAG_member, name: "SetWakeupTime", scope: !1872, file: !14, line: 1840, baseType: !1913, size: 64, offset: 384)
!1913 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WAKEUP_TIME", file: !14, line: 876, baseType: !1914)
!1914 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1915, size: 64)
!1915 = !DISubroutineType(types: !1916)
!1916 = !{!224, !68, !1880}
!1917 = !DIDerivedType(tag: DW_TAG_member, name: "SetVirtualAddressMap", scope: !1872, file: !14, line: 1845, baseType: !1918, size: 64, offset: 448)
!1918 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VIRTUAL_ADDRESS_MAP", file: !14, line: 327, baseType: !1919)
!1919 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1920, size: 64)
!1920 = !DISubroutineType(types: !1921)
!1921 = !{!224, !56, !56, !90, !1922}
!1922 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1923, size: 64)
!1923 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 175, baseType: !1924)
!1924 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 143, size: 320, elements: !1925)
!1925 = !{!1926, !1927, !1928, !1929, !1930}
!1926 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !1924, file: !14, line: 149, baseType: !90, size: 32)
!1927 = !DIDerivedType(tag: DW_TAG_member, name: "PhysicalStart", scope: !1924, file: !14, line: 155, baseType: !982, size: 64, offset: 64)
!1928 = !DIDerivedType(tag: DW_TAG_member, name: "VirtualStart", scope: !1924, file: !14, line: 161, baseType: !984, size: 64, offset: 128)
!1929 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfPages", scope: !1924, file: !14, line: 168, baseType: !58, size: 64, offset: 192)
!1930 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !1924, file: !14, line: 174, baseType: !58, size: 64, offset: 256)
!1931 = !DIDerivedType(tag: DW_TAG_member, name: "ConvertPointer", scope: !1872, file: !14, line: 1846, baseType: !988, size: 64, offset: 512)
!1932 = !DIDerivedType(tag: DW_TAG_member, name: "GetVariable", scope: !1872, file: !14, line: 1851, baseType: !1933, size: 64, offset: 576)
!1933 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_VARIABLE", file: !14, line: 686, baseType: !1934)
!1934 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1935, size: 64)
!1935 = !DISubroutineType(types: !1936)
!1936 = !{!224, !62, !1937, !1006, !886, !53}
!1937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1938, size: 64)
!1938 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GUID", file: !192, line: 25, baseType: !1939)
!1939 = !DIDerivedType(tag: DW_TAG_typedef, name: "GUID", file: !55, line: 218, baseType: !1940)
!1940 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GUID", file: !55, line: 213, size: 128, elements: !1941)
!1941 = !{!1942, !1943, !1944, !1945}
!1942 = !DIDerivedType(tag: DW_TAG_member, name: "Data1", scope: !1940, file: !55, line: 214, baseType: !90, size: 32)
!1943 = !DIDerivedType(tag: DW_TAG_member, name: "Data2", scope: !1940, file: !55, line: 215, baseType: !198, size: 16, offset: 32)
!1944 = !DIDerivedType(tag: DW_TAG_member, name: "Data3", scope: !1940, file: !55, line: 216, baseType: !198, size: 16, offset: 48)
!1945 = !DIDerivedType(tag: DW_TAG_member, name: "Data4", scope: !1940, file: !55, line: 217, baseType: !201, size: 64, offset: 64)
!1946 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextVariableName", scope: !1872, file: !14, line: 1852, baseType: !1947, size: 64, offset: 640)
!1947 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_VARIABLE_NAME", file: !14, line: 722, baseType: !1948)
!1948 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1949, size: 64)
!1949 = !DISubroutineType(types: !1950)
!1950 = !{!224, !886, !62, !1937}
!1951 = !DIDerivedType(tag: DW_TAG_member, name: "SetVariable", scope: !1872, file: !14, line: 1853, baseType: !1952, size: 64, offset: 704)
!1952 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VARIABLE", file: !14, line: 764, baseType: !1953)
!1953 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1954, size: 64)
!1954 = !DISubroutineType(types: !1955)
!1955 = !{!224, !62, !1937, !90, !56, !53}
!1956 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextHighMonotonicCount", scope: !1872, file: !14, line: 1858, baseType: !1018, size: 64, offset: 768)
!1957 = !DIDerivedType(tag: DW_TAG_member, name: "ResetSystem", scope: !1872, file: !14, line: 1859, baseType: !1023, size: 64, offset: 832)
!1958 = !DIDerivedType(tag: DW_TAG_member, name: "UpdateCapsule", scope: !1872, file: !14, line: 1864, baseType: !1959, size: 64, offset: 896)
!1959 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UPDATE_CAPSULE", file: !14, line: 1723, baseType: !1960)
!1960 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1961, size: 64)
!1961 = !DISubroutineType(types: !1962)
!1962 = !{!224, !1963, !56, !982}
!1963 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1964, size: 64)
!1964 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1965, size: 64)
!1965 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CAPSULE_HEADER", file: !14, line: 1669, baseType: !1966)
!1966 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CAPSULE_HEADER", file: !14, line: 1648, size: 224, elements: !1967)
!1967 = !{!1968, !1969, !1970, !1971}
!1968 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleGuid", scope: !1966, file: !14, line: 1652, baseType: !1938, size: 128)
!1969 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !1966, file: !14, line: 1658, baseType: !90, size: 32, offset: 128)
!1970 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !1966, file: !14, line: 1664, baseType: !90, size: 32, offset: 160)
!1971 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleImageSize", scope: !1966, file: !14, line: 1668, baseType: !90, size: 32, offset: 192)
!1972 = !DIDerivedType(tag: DW_TAG_member, name: "QueryCapsuleCapabilities", scope: !1872, file: !14, line: 1865, baseType: !1973, size: 64, offset: 960)
!1973 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_CAPSULE_CAPABILITIES", file: !14, line: 1754, baseType: !1974)
!1974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1975, size: 64)
!1975 = !DISubroutineType(types: !1976)
!1976 = !{!224, !1963, !56, !1047, !1048}
!1977 = !DIDerivedType(tag: DW_TAG_member, name: "QueryVariableInfo", scope: !1872, file: !14, line: 1870, baseType: !1050, size: 64, offset: 1024)
!1978 = !DIDerivedType(tag: DW_TAG_member, name: "BootServices", scope: !1778, file: !14, line: 2043, baseType: !1979, size: 64, offset: 768)
!1979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1980, size: 64)
!1980 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_BOOT_SERVICES", file: !14, line: 1972, baseType: !1981)
!1981 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_BOOT_SERVICES", file: !14, line: 1879, size: 3008, elements: !1982)
!1982 = !{!1983, !1984, !1985, !1986, !1987, !1988, !1993, !1994, !1995, !1996, !1997, !1998, !1999, !2000, !2001, !2006, !2011, !2016, !2021, !2022, !2027, !2032, !2045, !2050, !2055, !2056, !2057, !2058, !2059, !2060, !2061, !2062, !2067, !2068, !2073, !2078, !2092, !2099, !2104, !2109, !2110, !2111, !2112, !2113, !2114}
!1983 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !1981, file: !14, line: 1883, baseType: !1781, size: 192)
!1984 = !DIDerivedType(tag: DW_TAG_member, name: "RaiseTPL", scope: !1981, file: !14, line: 1888, baseType: !1061, size: 64, offset: 192)
!1985 = !DIDerivedType(tag: DW_TAG_member, name: "RestoreTPL", scope: !1981, file: !14, line: 1889, baseType: !1067, size: 64, offset: 256)
!1986 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePages", scope: !1981, file: !14, line: 1894, baseType: !1072, size: 64, offset: 320)
!1987 = !DIDerivedType(tag: DW_TAG_member, name: "FreePages", scope: !1981, file: !14, line: 1895, baseType: !1080, size: 64, offset: 384)
!1988 = !DIDerivedType(tag: DW_TAG_member, name: "GetMemoryMap", scope: !1981, file: !14, line: 1896, baseType: !1989, size: 64, offset: 448)
!1989 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_MEMORY_MAP", file: !14, line: 256, baseType: !1990)
!1990 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1991, size: 64)
!1991 = !DISubroutineType(types: !1992)
!1992 = !{!224, !886, !1922, !886, !886, !1006}
!1993 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePool", scope: !1981, file: !14, line: 1897, baseType: !1090, size: 64, offset: 512)
!1994 = !DIDerivedType(tag: DW_TAG_member, name: "FreePool", scope: !1981, file: !14, line: 1898, baseType: !1095, size: 64, offset: 576)
!1995 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEvent", scope: !1981, file: !14, line: 1903, baseType: !1100, size: 64, offset: 640)
!1996 = !DIDerivedType(tag: DW_TAG_member, name: "SetTimer", scope: !1981, file: !14, line: 1904, baseType: !1110, size: 64, offset: 704)
!1997 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForEvent", scope: !1981, file: !14, line: 1905, baseType: !1116, size: 64, offset: 768)
!1998 = !DIDerivedType(tag: DW_TAG_member, name: "SignalEvent", scope: !1981, file: !14, line: 1906, baseType: !1121, size: 64, offset: 832)
!1999 = !DIDerivedType(tag: DW_TAG_member, name: "CloseEvent", scope: !1981, file: !14, line: 1907, baseType: !1126, size: 64, offset: 896)
!2000 = !DIDerivedType(tag: DW_TAG_member, name: "CheckEvent", scope: !1981, file: !14, line: 1908, baseType: !1128, size: 64, offset: 960)
!2001 = !DIDerivedType(tag: DW_TAG_member, name: "InstallProtocolInterface", scope: !1981, file: !14, line: 1913, baseType: !2002, size: 64, offset: 1024)
!2002 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_PROTOCOL_INTERFACE", file: !14, line: 1188, baseType: !2003)
!2003 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2004, size: 64)
!2004 = !DISubroutineType(types: !2005)
!2005 = !{!224, !1134, !1937, !1135, !53}
!2006 = !DIDerivedType(tag: DW_TAG_member, name: "ReinstallProtocolInterface", scope: !1981, file: !14, line: 1914, baseType: !2007, size: 64, offset: 1088)
!2007 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1238, baseType: !2008)
!2008 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2009, size: 64)
!2009 = !DISubroutineType(types: !2010)
!2010 = !{!224, !821, !1937, !53, !53}
!2011 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallProtocolInterface", scope: !1981, file: !14, line: 1915, baseType: !2012, size: 64, offset: 1152)
!2012 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1264, baseType: !2013)
!2013 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2014, size: 64)
!2014 = !DISubroutineType(types: !2015)
!2015 = !{!224, !821, !1937, !53}
!2016 = !DIDerivedType(tag: DW_TAG_member, name: "HandleProtocol", scope: !1981, file: !14, line: 1916, baseType: !2017, size: 64, offset: 1216)
!2017 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE_PROTOCOL", file: !14, line: 1305, baseType: !2018)
!2018 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2019, size: 64)
!2019 = !DISubroutineType(types: !2020)
!2020 = !{!224, !821, !1937, !71}
!2021 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !1981, file: !14, line: 1917, baseType: !53, size: 64, offset: 1280)
!2022 = !DIDerivedType(tag: DW_TAG_member, name: "RegisterProtocolNotify", scope: !1981, file: !14, line: 1918, baseType: !2023, size: 64, offset: 1344)
!2023 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REGISTER_PROTOCOL_NOTIFY", file: !14, line: 1466, baseType: !2024)
!2024 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2025, size: 64)
!2025 = !DISubroutineType(types: !2026)
!2026 = !{!224, !1937, !861, !71}
!2027 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandle", scope: !1981, file: !14, line: 1919, baseType: !2028, size: 64, offset: 1408)
!2028 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE", file: !14, line: 1515, baseType: !2029)
!2029 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2030, size: 64)
!2030 = !DISubroutineType(types: !2031)
!2031 = !{!224, !1162, !1937, !53, !886, !1134}
!2032 = !DIDerivedType(tag: DW_TAG_member, name: "LocateDevicePath", scope: !1981, file: !14, line: 1920, baseType: !2033, size: 64, offset: 1472)
!2033 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_DEVICE_PATH", file: !14, line: 1541, baseType: !2034)
!2034 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2035, size: 64)
!2035 = !DISubroutineType(types: !2036)
!2036 = !{!224, !1937, !2037, !1134}
!2037 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2038, size: 64)
!2038 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2039, size: 64)
!2039 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DEVICE_PATH_PROTOCOL", file: !1171, line: 58, baseType: !2040)
!2040 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_DEVICE_PATH_PROTOCOL", file: !1171, line: 43, size: 32, elements: !2041)
!2041 = !{!2042, !2043, !2044}
!2042 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !2040, file: !1171, line: 44, baseType: !109, size: 8)
!2043 = !DIDerivedType(tag: DW_TAG_member, name: "SubType", scope: !2040, file: !1171, line: 51, baseType: !109, size: 8, offset: 8)
!2044 = !DIDerivedType(tag: DW_TAG_member, name: "Length", scope: !2040, file: !1171, line: 56, baseType: !1177, size: 16, offset: 16)
!2045 = !DIDerivedType(tag: DW_TAG_member, name: "InstallConfigurationTable", scope: !1981, file: !14, line: 1921, baseType: !2046, size: 64, offset: 1536)
!2046 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_CONFIGURATION_TABLE", file: !14, line: 1562, baseType: !2047)
!2047 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2048, size: 64)
!2048 = !DISubroutineType(types: !2049)
!2049 = !{!224, !1937, !53}
!2050 = !DIDerivedType(tag: DW_TAG_member, name: "LoadImage", scope: !1981, file: !14, line: 1926, baseType: !2051, size: 64, offset: 1600)
!2051 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_LOAD", file: !14, line: 913, baseType: !2052)
!2052 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2053, size: 64)
!2053 = !DISubroutineType(types: !2054)
!2054 = !{!224, !68, !821, !2038, !53, !56, !1134}
!2055 = !DIDerivedType(tag: DW_TAG_member, name: "StartImage", scope: !1981, file: !14, line: 1927, baseType: !1191, size: 64, offset: 1664)
!2056 = !DIDerivedType(tag: DW_TAG_member, name: "Exit", scope: !1981, file: !14, line: 1928, baseType: !1197, size: 64, offset: 1728)
!2057 = !DIDerivedType(tag: DW_TAG_member, name: "UnloadImage", scope: !1981, file: !14, line: 1929, baseType: !1202, size: 64, offset: 1792)
!2058 = !DIDerivedType(tag: DW_TAG_member, name: "ExitBootServices", scope: !1981, file: !14, line: 1930, baseType: !1207, size: 64, offset: 1856)
!2059 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextMonotonicCount", scope: !1981, file: !14, line: 1935, baseType: !1212, size: 64, offset: 1920)
!2060 = !DIDerivedType(tag: DW_TAG_member, name: "Stall", scope: !1981, file: !14, line: 1936, baseType: !1217, size: 64, offset: 1984)
!2061 = !DIDerivedType(tag: DW_TAG_member, name: "SetWatchdogTimer", scope: !1981, file: !14, line: 1937, baseType: !1222, size: 64, offset: 2048)
!2062 = !DIDerivedType(tag: DW_TAG_member, name: "ConnectController", scope: !1981, file: !14, line: 1942, baseType: !2063, size: 64, offset: 2112)
!2063 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONNECT_CONTROLLER", file: !14, line: 361, baseType: !2064)
!2064 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2065, size: 64)
!2065 = !DISubroutineType(types: !2066)
!2066 = !{!224, !821, !1134, !2038, !68}
!2067 = !DIDerivedType(tag: DW_TAG_member, name: "DisconnectController", scope: !1981, file: !14, line: 1943, baseType: !1232, size: 64, offset: 2176)
!2068 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocol", scope: !1981, file: !14, line: 1948, baseType: !2069, size: 64, offset: 2240)
!2069 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL", file: !14, line: 1347, baseType: !2070)
!2070 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2071, size: 64)
!2071 = !DISubroutineType(types: !2072)
!2072 = !{!224, !821, !1937, !71, !821, !821, !90}
!2073 = !DIDerivedType(tag: DW_TAG_member, name: "CloseProtocol", scope: !1981, file: !14, line: 1949, baseType: !2074, size: 64, offset: 2304)
!2074 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_PROTOCOL", file: !14, line: 1379, baseType: !2075)
!2075 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2076, size: 64)
!2076 = !DISubroutineType(types: !2077)
!2077 = !{!224, !821, !1937, !821, !821}
!2078 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocolInformation", scope: !1981, file: !14, line: 1950, baseType: !2079, size: 64, offset: 2368)
!2079 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION", file: !14, line: 1413, baseType: !2080)
!2080 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2081, size: 64)
!2081 = !DISubroutineType(types: !2082)
!2082 = !{!224, !821, !1937, !2083, !886}
!2083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2084, size: 64)
!2084 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2085, size: 64)
!2085 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1394, baseType: !2086)
!2086 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1389, size: 192, elements: !2087)
!2087 = !{!2088, !2089, !2090, !2091}
!2088 = !DIDerivedType(tag: DW_TAG_member, name: "AgentHandle", scope: !2086, file: !14, line: 1390, baseType: !821, size: 64)
!2089 = !DIDerivedType(tag: DW_TAG_member, name: "ControllerHandle", scope: !2086, file: !14, line: 1391, baseType: !821, size: 64, offset: 64)
!2090 = !DIDerivedType(tag: DW_TAG_member, name: "Attributes", scope: !2086, file: !14, line: 1392, baseType: !90, size: 32, offset: 128)
!2091 = !DIDerivedType(tag: DW_TAG_member, name: "OpenCount", scope: !2086, file: !14, line: 1393, baseType: !90, size: 32, offset: 160)
!2092 = !DIDerivedType(tag: DW_TAG_member, name: "ProtocolsPerHandle", scope: !1981, file: !14, line: 1955, baseType: !2093, size: 64, offset: 2432)
!2093 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PROTOCOLS_PER_HANDLE", file: !14, line: 1443, baseType: !2094)
!2094 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2095, size: 64)
!2095 = !DISubroutineType(types: !2096)
!2096 = !{!224, !821, !2097, !886}
!2097 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2098, size: 64)
!2098 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1937, size: 64)
!2099 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandleBuffer", scope: !1981, file: !14, line: 1956, baseType: !2100, size: 64, offset: 2496)
!2100 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE_BUFFER", file: !14, line: 1588, baseType: !2101)
!2101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2102, size: 64)
!2102 = !DISubroutineType(types: !2103)
!2103 = !{!224, !1162, !1937, !53, !886, !1272}
!2104 = !DIDerivedType(tag: DW_TAG_member, name: "LocateProtocol", scope: !1981, file: !14, line: 1957, baseType: !2105, size: 64, offset: 2560)
!2105 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_PROTOCOL", file: !14, line: 1615, baseType: !2106)
!2106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2107, size: 64)
!2107 = !DISubroutineType(types: !2108)
!2108 = !{!224, !1937, !53, !71}
!2109 = !DIDerivedType(tag: DW_TAG_member, name: "InstallMultipleProtocolInterfaces", scope: !1981, file: !14, line: 1958, baseType: !1279, size: 64, offset: 2624)
!2110 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallMultipleProtocolInterfaces", scope: !1981, file: !14, line: 1959, baseType: !1284, size: 64, offset: 2688)
!2111 = !DIDerivedType(tag: DW_TAG_member, name: "CalculateCrc32", scope: !1981, file: !14, line: 1964, baseType: !1289, size: 64, offset: 2752)
!2112 = !DIDerivedType(tag: DW_TAG_member, name: "CopyMem", scope: !1981, file: !14, line: 1969, baseType: !1294, size: 64, offset: 2816)
!2113 = !DIDerivedType(tag: DW_TAG_member, name: "SetMem", scope: !1981, file: !14, line: 1970, baseType: !1299, size: 64, offset: 2880)
!2114 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEventEx", scope: !1981, file: !14, line: 1971, baseType: !2115, size: 64, offset: 2944)
!2115 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT_EX", file: !14, line: 509, baseType: !2116)
!2116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2117, size: 64)
!2117 = !DISubroutineType(types: !2118)
!2118 = !{!224, !90, !1065, !1104, !1308, !2119, !1108}
!2119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2120, size: 64)
!2120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1938)
!2121 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfTableEntries", scope: !1778, file: !14, line: 2047, baseType: !56, size: 64, offset: 832)
!2122 = !DIDerivedType(tag: DW_TAG_member, name: "ConfigurationTable", scope: !1778, file: !14, line: 2052, baseType: !2123, size: 64, offset: 896)
!2123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2124, size: 64)
!2124 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1987, baseType: !2125)
!2125 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1978, size: 192, elements: !2126)
!2126 = !{!2127, !2128}
!2127 = !DIDerivedType(tag: DW_TAG_member, name: "VendorGuid", scope: !2125, file: !14, line: 1982, baseType: !1938, size: 128)
!2128 = !DIDerivedType(tag: DW_TAG_member, name: "VendorTable", scope: !2125, file: !14, line: 1986, baseType: !53, size: 64, offset: 128)
!2129 = !DILocalVariable(name: "ImageHandle", arg: 1, scope: !1773, file: !123, line: 203, type: !821)
!2130 = !DILocation(line: 203, scope: !1773)
!2131 = !DILocalVariable(name: "SystemTable", arg: 2, scope: !1773, file: !123, line: 204, type: !1776)
!2132 = !DILocation(line: 204, scope: !1773)
!2133 = !DILocalVariable(name: "Status", scope: !1773, file: !123, line: 207, type: !224)
!2134 = !DILocation(line: 207, scope: !1773)
!2135 = !DILocalVariable(name: "HandleProtoc", scope: !1773, file: !123, line: 208, type: !821)
!2136 = !DILocation(line: 208, scope: !1773)
!2137 = !DILocalVariable(name: "HandleNotify", scope: !1773, file: !123, line: 209, type: !821)
!2138 = !DILocation(line: 209, scope: !1773)
!2139 = !DILocalVariable(name: "mHeapManager", scope: !1773, file: !123, line: 210, type: !2140)
!2140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2141, size: 64)
!2141 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_PROTOCOL", file: !98, line: 118, baseType: !2142)
!2142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_HEAP_MANAGER_PROTOCOL", file: !98, line: 108, size: 576, elements: !2143)
!2143 = !{!2144, !2146, !2149, !2151, !2153, !2155, !2157, !2160, !2162}
!2144 = !DIDerivedType(tag: DW_TAG_member, name: "GetBlockSize", scope: !2142, file: !98, line: 109, baseType: !2145, size: 64)
!2145 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_GET_BLOCK_SIZE", file: !98, line: 63, baseType: !253)
!2146 = !DIDerivedType(tag: DW_TAG_member, name: "AllocateChunk", scope: !2142, file: !98, line: 110, baseType: !2147, size: 64, offset: 64)
!2147 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_ALLOCATE_CHUNK", file: !98, line: 70, baseType: !2148)
!2148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1391, size: 64)
!2149 = !DIDerivedType(tag: DW_TAG_member, name: "FreeChunk", scope: !2142, file: !98, line: 111, baseType: !2150, size: 64, offset: 128)
!2150 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_CHUNK", file: !98, line: 77, baseType: !270)
!2151 = !DIDerivedType(tag: DW_TAG_member, name: "FreeAllocList", scope: !2142, file: !98, line: 112, baseType: !2152, size: 64, offset: 192)
!2152 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_ALLOC_LIST", file: !98, line: 83, baseType: !275)
!2153 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayFreeList", scope: !2142, file: !98, line: 113, baseType: !2154, size: 64, offset: 256)
!2154 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_FREE_LIST", file: !98, line: 87, baseType: !275)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayHeapMetadata", scope: !2142, file: !98, line: 114, baseType: !2156, size: 64, offset: 320)
!2156 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_HEAP_METADATA", file: !98, line: 91, baseType: !275)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "InitializePage", scope: !2142, file: !98, line: 115, baseType: !2158, size: 64, offset: 384)
!2158 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_PAGE", file: !98, line: 95, baseType: !2159)
!2159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1678, size: 64)
!2160 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeapMetadata", scope: !2142, file: !98, line: 116, baseType: !2161, size: 64, offset: 448)
!2161 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP_METADATA", file: !98, line: 102, baseType: !275)
!2162 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeap", scope: !2142, file: !98, line: 117, baseType: !2163, size: 64, offset: 512)
!2163 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP", file: !98, line: 106, baseType: !275)
!2164 = !DILocation(line: 210, scope: !1773)
!2165 = !DILocalVariable(name: "ProtocolSize", scope: !1773, file: !123, line: 211, type: !56)
!2166 = !DILocation(line: 211, scope: !1773)
!2167 = !DILocation(line: 216, scope: !1773)
!2168 = !DILocation(line: 221, scope: !1773)
!2169 = !DILocation(line: 222, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2171, file: !123, line: 221)
!2171 = distinct !DILexicalBlock(scope: !1773, file: !123, line: 221)
!2172 = !DILocation(line: 228, scope: !1773)
!2173 = !DILocation(line: 229, scope: !1773)
!2174 = !DILocation(line: 230, scope: !1773)
!2175 = !DILocation(line: 231, scope: !1773)
!2176 = !DILocation(line: 232, scope: !1773)
!2177 = !DILocation(line: 233, scope: !1773)
!2178 = !DILocation(line: 234, scope: !1773)
!2179 = !DILocation(line: 235, scope: !1773)
!2180 = !DILocation(line: 236, scope: !1773)
!2181 = !DILocation(line: 241, scope: !1773)
!2182 = !DILocation(line: 247, scope: !1773)
!2183 = !DILocation(line: 248, scope: !2184)
!2184 = distinct !DILexicalBlock(scope: !2185, file: !123, line: 247)
!2185 = distinct !DILexicalBlock(scope: !1773, file: !123, line: 247)
!2186 = !DILocation(line: 251, scope: !1773)
!2187 = !DILocation(line: 252, scope: !1773)
!2188 = !DILocation(line: 258, scope: !1773)
!2189 = !DILocation(line: 259, scope: !2190)
!2190 = distinct !DILexicalBlock(scope: !2191, file: !123, line: 258)
!2191 = distinct !DILexicalBlock(scope: !1773, file: !123, line: 258)
!2192 = !DILocation(line: 262, scope: !1773)
!2193 = !DILocation(line: 263, scope: !1773)
!2194 = distinct !DISubprogram(name: "winning_msg", scope: !213, file: !213, line: 10, type: !2195, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2195 = !DISubroutineType(types: !2196)
!2196 = !{null}
!2197 = !DILocation(line: 11, scope: !2194)
!2198 = !DILocation(line: 11, scope: !2199)
!2199 = distinct !DILexicalBlock(scope: !2194, file: !213, line: 11)
!2200 = !DILocation(line: 11, scope: !2201)
!2201 = distinct !DILexicalBlock(scope: !2202, file: !213, line: 11)
!2202 = distinct !DILexicalBlock(scope: !2199, file: !213, line: 11)
!2203 = !DILocation(line: 11, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2201, file: !213, line: 11)
!2205 = !DILocation(line: 11, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2207, file: !213, line: 11)
!2207 = distinct !DILexicalBlock(scope: !2204, file: !213, line: 11)
!2208 = !DILocation(line: 12, scope: !2194)
!2209 = distinct !DISubprogram(name: "welcome_msg", scope: !213, file: !213, line: 14, type: !2195, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2210 = !DILocation(line: 15, scope: !2209)
!2211 = !DILocation(line: 15, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2209, file: !213, line: 15)
!2213 = !DILocation(line: 15, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2215, file: !213, line: 15)
!2215 = distinct !DILexicalBlock(scope: !2212, file: !213, line: 15)
!2216 = !DILocation(line: 15, scope: !2217)
!2217 = distinct !DILexicalBlock(scope: !2214, file: !213, line: 15)
!2218 = !DILocation(line: 15, scope: !2219)
!2219 = distinct !DILexicalBlock(scope: !2220, file: !213, line: 15)
!2220 = distinct !DILexicalBlock(scope: !2217, file: !213, line: 15)
!2221 = !DILocation(line: 16, scope: !2209)
!2222 = !DILocation(line: 16, scope: !2223)
!2223 = distinct !DILexicalBlock(scope: !2209, file: !213, line: 16)
!2224 = !DILocation(line: 16, scope: !2225)
!2225 = distinct !DILexicalBlock(scope: !2226, file: !213, line: 16)
!2226 = distinct !DILexicalBlock(scope: !2223, file: !213, line: 16)
!2227 = !DILocation(line: 16, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2225, file: !213, line: 16)
!2229 = !DILocation(line: 16, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2231, file: !213, line: 16)
!2231 = distinct !DILexicalBlock(scope: !2228, file: !213, line: 16)
!2232 = !DILocation(line: 17, scope: !2209)
!2233 = !DILocation(line: 17, scope: !2234)
!2234 = distinct !DILexicalBlock(scope: !2209, file: !213, line: 17)
!2235 = !DILocation(line: 17, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2237, file: !213, line: 17)
!2237 = distinct !DILexicalBlock(scope: !2234, file: !213, line: 17)
!2238 = !DILocation(line: 17, scope: !2239)
!2239 = distinct !DILexicalBlock(scope: !2236, file: !213, line: 17)
!2240 = !DILocation(line: 17, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2242, file: !213, line: 17)
!2242 = distinct !DILexicalBlock(scope: !2239, file: !213, line: 17)
!2243 = !DILocation(line: 18, scope: !2209)
!2244 = distinct !DISubprogram(name: "convert", scope: !213, file: !213, line: 21, type: !2245, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2245 = !DISubroutineType(types: !2246)
!2246 = !{!224, !2247}
!2247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!2248 = !DILocalVariable(name: "Buffer", arg: 1, scope: !2244, file: !213, line: 21, type: !2247)
!2249 = !DILocation(line: 21, scope: !2244)
!2250 = !DILocalVariable(name: "Status", scope: !2244, file: !213, line: 23, type: !224)
!2251 = !DILocation(line: 23, scope: !2244)
!2252 = !DILocalVariable(name: "Input", scope: !2244, file: !213, line: 24, type: !177)
!2253 = !DILocation(line: 24, scope: !2244)
!2254 = !DILocation(line: 25, scope: !2244)
!2255 = !DILocation(line: 28, scope: !2256)
!2256 = distinct !DILexicalBlock(scope: !2244, file: !213, line: 26)
!2257 = !DILocation(line: 29, scope: !2256)
!2258 = !DILocation(line: 31, scope: !2256)
!2259 = !DILocation(line: 32, scope: !2256)
!2260 = !DILocation(line: 34, scope: !2256)
!2261 = !DILocation(line: 35, scope: !2256)
!2262 = !DILocation(line: 37, scope: !2256)
!2263 = !DILocation(line: 37, scope: !2264)
!2264 = distinct !DILexicalBlock(scope: !2256, file: !213, line: 37)
!2265 = !DILocation(line: 37, scope: !2266)
!2266 = distinct !DILexicalBlock(scope: !2267, file: !213, line: 37)
!2267 = distinct !DILexicalBlock(scope: !2264, file: !213, line: 37)
!2268 = !DILocation(line: 37, scope: !2269)
!2269 = distinct !DILexicalBlock(scope: !2266, file: !213, line: 37)
!2270 = !DILocation(line: 37, scope: !2271)
!2271 = distinct !DILexicalBlock(scope: !2272, file: !213, line: 37)
!2272 = distinct !DILexicalBlock(scope: !2269, file: !213, line: 37)
!2273 = !DILocation(line: 38, scope: !2256)
!2274 = !DILocation(line: 39, scope: !2256)
!2275 = !DILocation(line: 41, scope: !2244)
!2276 = distinct !DISubprogram(name: "Sample2TestsDriverHandler", scope: !213, file: !213, line: 60, type: !2277, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2277 = !DISubroutineType(types: !2278)
!2278 = !{!224, !821, !1308, !53, !886}
!2279 = !DILocalVariable(name: "DispatchHandle", arg: 1, scope: !2276, file: !213, line: 61, type: !821)
!2280 = !DILocation(line: 61, scope: !2276)
!2281 = !DILocalVariable(name: "Context", arg: 2, scope: !2276, file: !213, line: 62, type: !1308)
!2282 = !DILocation(line: 62, scope: !2276)
!2283 = !DILocalVariable(name: "CommBuffer", arg: 3, scope: !2276, file: !213, line: 63, type: !53)
!2284 = !DILocation(line: 63, scope: !2276)
!2285 = !DILocalVariable(name: "CommBufferSize", arg: 4, scope: !2276, file: !213, line: 64, type: !886)
!2286 = !DILocation(line: 64, scope: !2276)
!2287 = !DILocalVariable(name: "ChunkSize", scope: !2276, file: !213, line: 67, type: !56)
!2288 = !DILocation(line: 67, scope: !2276)
!2289 = !DILocalVariable(name: "TmpCommBuffer", scope: !2276, file: !213, line: 69, type: !186)
!2290 = !DILocation(line: 69, scope: !2276)
!2291 = !DILocation(line: 71, scope: !2276)
!2292 = !DILocation(line: 72, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2294, file: !213, line: 71)
!2294 = distinct !DILexicalBlock(scope: !2276, file: !213, line: 71)
!2295 = !DILocation(line: 75, scope: !2276)
!2296 = !DILocation(line: 77, scope: !2276)
!2297 = !DILocation(line: 80, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2276, file: !213, line: 78)
!2299 = !DILocation(line: 81, scope: !2298)
!2300 = !DILocation(line: 83, scope: !2298)
!2301 = !DILocation(line: 84, scope: !2298)
!2302 = !DILocation(line: 86, scope: !2298)
!2303 = !DILocation(line: 87, scope: !2298)
!2304 = !DILocation(line: 88, scope: !2305)
!2305 = distinct !DILexicalBlock(scope: !2306, file: !213, line: 87)
!2306 = distinct !DILexicalBlock(scope: !2298, file: !213, line: 87)
!2307 = !DILocation(line: 89, scope: !2305)
!2308 = !DILocation(line: 90, scope: !2298)
!2309 = !DILocation(line: 91, scope: !2298)
!2310 = !DILocation(line: 93, scope: !2298)
!2311 = !DILocation(line: 94, scope: !2298)
!2312 = !DILocation(line: 96, scope: !2298)
!2313 = !DILocation(line: 97, scope: !2298)
!2314 = !DILocation(line: 99, scope: !2298)
!2315 = !DILocation(line: 102, scope: !2276)
!2316 = !DILocation(line: 103, scope: !2276)
!2317 = distinct !DISubprogram(name: "HeapManagerReadyCallback", scope: !213, file: !213, line: 119, type: !2318, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2318 = !DISubroutineType(types: !2319)
!2319 = !{!224, !2320, !53, !821}
!2320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2321, size: 64)
!2321 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !191)
!2322 = !DILocalVariable(name: "Protocol", arg: 1, scope: !2317, file: !213, line: 120, type: !2320)
!2323 = !DILocation(line: 120, scope: !2317)
!2324 = !DILocalVariable(name: "Interface", arg: 2, scope: !2317, file: !213, line: 121, type: !53)
!2325 = !DILocation(line: 121, scope: !2317)
!2326 = !DILocalVariable(name: "Handle", arg: 3, scope: !2317, file: !213, line: 122, type: !821)
!2327 = !DILocation(line: 122, scope: !2317)
!2328 = !DILocalVariable(name: "Status", scope: !2317, file: !213, line: 125, type: !224)
!2329 = !DILocation(line: 125, scope: !2317)
!2330 = !DILocation(line: 127, scope: !2317)
!2331 = !DILocation(line: 128, scope: !2317)
!2332 = !DILocation(line: 129, scope: !2333)
!2333 = distinct !DILexicalBlock(scope: !2334, file: !213, line: 128)
!2334 = distinct !DILexicalBlock(scope: !2317, file: !213, line: 128)
!2335 = !DILocation(line: 129, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2333, file: !213, line: 129)
!2337 = !DILocation(line: 129, scope: !2338)
!2338 = distinct !DILexicalBlock(scope: !2339, file: !213, line: 129)
!2339 = distinct !DILexicalBlock(scope: !2336, file: !213, line: 129)
!2340 = !DILocation(line: 129, scope: !2341)
!2341 = distinct !DILexicalBlock(scope: !2338, file: !213, line: 129)
!2342 = !DILocation(line: 129, scope: !2343)
!2343 = distinct !DILexicalBlock(scope: !2344, file: !213, line: 129)
!2344 = distinct !DILexicalBlock(scope: !2341, file: !213, line: 129)
!2345 = !DILocation(line: 130, scope: !2333)
!2346 = !DILocation(line: 132, scope: !2317)
!2347 = !DILocation(line: 132, scope: !2348)
!2348 = distinct !DILexicalBlock(scope: !2317, file: !213, line: 132)
!2349 = !DILocation(line: 132, scope: !2350)
!2350 = distinct !DILexicalBlock(scope: !2351, file: !213, line: 132)
!2351 = distinct !DILexicalBlock(scope: !2348, file: !213, line: 132)
!2352 = !DILocation(line: 132, scope: !2353)
!2353 = distinct !DILexicalBlock(scope: !2350, file: !213, line: 132)
!2354 = !DILocation(line: 132, scope: !2355)
!2355 = distinct !DILexicalBlock(scope: !2356, file: !213, line: 132)
!2356 = distinct !DILexicalBlock(scope: !2353, file: !213, line: 132)
!2357 = !DILocation(line: 133, scope: !2317)
!2358 = !DILocation(line: 134, scope: !2317)
!2359 = !DILocation(line: 136, scope: !2317)
!2360 = !DILocation(line: 137, scope: !2317)
!2361 = distinct !DISubprogram(name: "CharConverterReadyCallback", scope: !213, file: !213, line: 152, type: !2318, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2362 = !DILocalVariable(name: "Protocol", arg: 1, scope: !2361, file: !213, line: 153, type: !2320)
!2363 = !DILocation(line: 153, scope: !2361)
!2364 = !DILocalVariable(name: "Interface", arg: 2, scope: !2361, file: !213, line: 154, type: !53)
!2365 = !DILocation(line: 154, scope: !2361)
!2366 = !DILocalVariable(name: "Handle", arg: 3, scope: !2361, file: !213, line: 155, type: !821)
!2367 = !DILocation(line: 155, scope: !2361)
!2368 = !DILocalVariable(name: "Status", scope: !2361, file: !213, line: 158, type: !224)
!2369 = !DILocation(line: 158, scope: !2361)
!2370 = !DILocation(line: 160, scope: !2361)
!2371 = !DILocation(line: 161, scope: !2361)
!2372 = !DILocation(line: 162, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2374, file: !213, line: 161)
!2374 = distinct !DILexicalBlock(scope: !2361, file: !213, line: 161)
!2375 = !DILocation(line: 162, scope: !2376)
!2376 = distinct !DILexicalBlock(scope: !2373, file: !213, line: 162)
!2377 = !DILocation(line: 162, scope: !2378)
!2378 = distinct !DILexicalBlock(scope: !2379, file: !213, line: 162)
!2379 = distinct !DILexicalBlock(scope: !2376, file: !213, line: 162)
!2380 = !DILocation(line: 162, scope: !2381)
!2381 = distinct !DILexicalBlock(scope: !2378, file: !213, line: 162)
!2382 = !DILocation(line: 162, scope: !2383)
!2383 = distinct !DILexicalBlock(scope: !2384, file: !213, line: 162)
!2384 = distinct !DILexicalBlock(scope: !2381, file: !213, line: 162)
!2385 = !DILocation(line: 163, scope: !2373)
!2386 = !DILocation(line: 165, scope: !2361)
!2387 = !DILocation(line: 165, scope: !2388)
!2388 = distinct !DILexicalBlock(scope: !2361, file: !213, line: 165)
!2389 = !DILocation(line: 165, scope: !2390)
!2390 = distinct !DILexicalBlock(scope: !2391, file: !213, line: 165)
!2391 = distinct !DILexicalBlock(scope: !2388, file: !213, line: 165)
!2392 = !DILocation(line: 165, scope: !2393)
!2393 = distinct !DILexicalBlock(scope: !2390, file: !213, line: 165)
!2394 = !DILocation(line: 165, scope: !2395)
!2395 = distinct !DILexicalBlock(scope: !2396, file: !213, line: 165)
!2396 = distinct !DILexicalBlock(scope: !2393, file: !213, line: 165)
!2397 = !DILocation(line: 167, scope: !2361)
!2398 = !DILocation(line: 168, scope: !2361)
!2399 = distinct !DISubprogram(name: "Sample2TestsDriverEntryPoint", scope: !213, file: !213, line: 179, type: !2400, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !328)
!2400 = !DISubroutineType(types: !2401)
!2401 = !{!224, !821, !2402}
!2402 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2403, size: 64)
!2403 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SYSTEM_TABLE", file: !14, line: 2053, baseType: !2404)
!2404 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SYSTEM_TABLE", file: !14, line: 1992, size: 960, elements: !2405)
!2405 = !{!2406, !2415, !2416, !2417, !2418, !2440, !2441, !2493, !2494, !2495, !2596, !2737, !2738}
!2406 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !2404, file: !14, line: 1996, baseType: !2407, size: 192)
!2407 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TABLE_HEADER", file: !6, line: 177, baseType: !2408)
!2408 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TABLE_HEADER", file: !6, line: 150, size: 192, elements: !2409)
!2409 = !{!2410, !2411, !2412, !2413, !2414}
!2410 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !2408, file: !6, line: 156, baseType: !58, size: 64)
!2411 = !DIDerivedType(tag: DW_TAG_member, name: "Revision", scope: !2408, file: !6, line: 163, baseType: !90, size: 32, offset: 64)
!2412 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !2408, file: !6, line: 167, baseType: !90, size: 32, offset: 96)
!2413 = !DIDerivedType(tag: DW_TAG_member, name: "CRC32", scope: !2408, file: !6, line: 172, baseType: !90, size: 32, offset: 128)
!2414 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !2408, file: !6, line: 176, baseType: !90, size: 32, offset: 160)
!2415 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareVendor", scope: !2404, file: !14, line: 2001, baseType: !62, size: 64, offset: 192)
!2416 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareRevision", scope: !2404, file: !14, line: 2006, baseType: !90, size: 32, offset: 256)
!2417 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleInHandle", scope: !2404, file: !14, line: 2011, baseType: !821, size: 64, offset: 320)
!2418 = !DIDerivedType(tag: DW_TAG_member, name: "ConIn", scope: !2404, file: !14, line: 2016, baseType: !2419, size: 64, offset: 384)
!2419 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2420, size: 64)
!2420 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !841, line: 20, baseType: !2421)
!2421 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !841, line: 116, size: 192, elements: !2422)
!2422 = !{!2423, !2428, !2439}
!2423 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !2421, file: !841, line: 117, baseType: !2424, size: 64)
!2424 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_RESET", file: !841, line: 86, baseType: !2425)
!2425 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2426, size: 64)
!2426 = !DISubroutineType(types: !2427)
!2427 = !{!224, !2419, !68}
!2428 = !DIDerivedType(tag: DW_TAG_member, name: "ReadKeyStroke", scope: !2421, file: !841, line: 118, baseType: !2429, size: 64, offset: 64)
!2429 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_READ_KEY", file: !841, line: 107, baseType: !2430)
!2430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2431, size: 64)
!2431 = !DISubroutineType(types: !2432)
!2432 = !{!224, !2419, !2433}
!2433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2434, size: 64)
!2434 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_KEY", file: !841, line: 38, baseType: !2435)
!2435 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_INPUT_KEY", file: !841, line: 35, size: 32, elements: !2436)
!2436 = !{!2437, !2438}
!2437 = !DIDerivedType(tag: DW_TAG_member, name: "ScanCode", scope: !2435, file: !841, line: 36, baseType: !198, size: 16)
!2438 = !DIDerivedType(tag: DW_TAG_member, name: "UnicodeChar", scope: !2435, file: !841, line: 37, baseType: !60, size: 16, offset: 16)
!2439 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForKey", scope: !2421, file: !841, line: 122, baseType: !861, size: 64, offset: 128)
!2440 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleOutHandle", scope: !2404, file: !14, line: 2020, baseType: !821, size: 64, offset: 448)
!2441 = !DIDerivedType(tag: DW_TAG_member, name: "ConOut", scope: !2404, file: !14, line: 2025, baseType: !2442, size: 64, offset: 512)
!2442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2443, size: 64)
!2443 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !866, line: 27, baseType: !2444)
!2444 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !866, line: 387, size: 640, elements: !2445)
!2445 = !{!2446, !2451, !2456, !2458, !2463, !2468, !2470, !2475, !2480, !2482}
!2446 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !2444, file: !866, line: 388, baseType: !2447, size: 64)
!2447 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_RESET", file: !866, line: 167, baseType: !2448)
!2448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2449, size: 64)
!2449 = !DISubroutineType(types: !2450)
!2450 = !{!224, !2442, !68}
!2451 = !DIDerivedType(tag: DW_TAG_member, name: "OutputString", scope: !2444, file: !866, line: 390, baseType: !2452, size: 64, offset: 64)
!2452 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_STRING", file: !866, line: 192, baseType: !2453)
!2453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2454, size: 64)
!2454 = !DISubroutineType(types: !2455)
!2455 = !{!224, !2442, !62}
!2456 = !DIDerivedType(tag: DW_TAG_member, name: "TestString", scope: !2444, file: !866, line: 391, baseType: !2457, size: 64, offset: 128)
!2457 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_TEST_STRING", file: !866, line: 213, baseType: !2453)
!2458 = !DIDerivedType(tag: DW_TAG_member, name: "QueryMode", scope: !2444, file: !866, line: 393, baseType: !2459, size: 64, offset: 192)
!2459 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_QUERY_MODE", file: !866, line: 236, baseType: !2460)
!2460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2461, size: 64)
!2461 = !DISubroutineType(types: !2462)
!2462 = !{!224, !2442, !56, !886, !886}
!2463 = !DIDerivedType(tag: DW_TAG_member, name: "SetMode", scope: !2444, file: !866, line: 394, baseType: !2464, size: 64, offset: 256)
!2464 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_MODE", file: !866, line: 256, baseType: !2465)
!2465 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2466, size: 64)
!2466 = !DISubroutineType(types: !2467)
!2467 = !{!224, !2442, !56}
!2468 = !DIDerivedType(tag: DW_TAG_member, name: "SetAttribute", scope: !2444, file: !866, line: 395, baseType: !2469, size: 64, offset: 320)
!2469 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_ATTRIBUTE", file: !866, line: 277, baseType: !2465)
!2470 = !DIDerivedType(tag: DW_TAG_member, name: "ClearScreen", scope: !2444, file: !866, line: 397, baseType: !2471, size: 64, offset: 384)
!2471 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_CLEAR_SCREEN", file: !866, line: 295, baseType: !2472)
!2472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2473, size: 64)
!2473 = !DISubroutineType(types: !2474)
!2474 = !{!224, !2442}
!2475 = !DIDerivedType(tag: DW_TAG_member, name: "SetCursorPosition", scope: !2444, file: !866, line: 398, baseType: !2476, size: 64, offset: 448)
!2476 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_CURSOR_POSITION", file: !866, line: 318, baseType: !2477)
!2477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2478, size: 64)
!2478 = !DISubroutineType(types: !2479)
!2479 = !{!224, !2442, !56, !56}
!2480 = !DIDerivedType(tag: DW_TAG_member, name: "EnableCursor", scope: !2444, file: !866, line: 399, baseType: !2481, size: 64, offset: 512)
!2481 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_ENABLE_CURSOR", file: !866, line: 340, baseType: !2448)
!2482 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !2444, file: !866, line: 404, baseType: !2483, size: 64, offset: 576)
!2483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2484, size: 64)
!2484 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !866, line: 379, baseType: !2485)
!2485 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !866, line: 349, size: 192, elements: !2486)
!2486 = !{!2487, !2488, !2489, !2490, !2491, !2492}
!2487 = !DIDerivedType(tag: DW_TAG_member, name: "MaxMode", scope: !2485, file: !866, line: 353, baseType: !912, size: 32)
!2488 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !2485, file: !866, line: 362, baseType: !912, size: 32, offset: 32)
!2489 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !2485, file: !866, line: 366, baseType: !912, size: 32, offset: 64)
!2490 = !DIDerivedType(tag: DW_TAG_member, name: "CursorColumn", scope: !2485, file: !866, line: 370, baseType: !912, size: 32, offset: 96)
!2491 = !DIDerivedType(tag: DW_TAG_member, name: "CursorRow", scope: !2485, file: !866, line: 374, baseType: !912, size: 32, offset: 128)
!2492 = !DIDerivedType(tag: DW_TAG_member, name: "CursorVisible", scope: !2485, file: !866, line: 378, baseType: !68, size: 8, offset: 160)
!2493 = !DIDerivedType(tag: DW_TAG_member, name: "StandardErrorHandle", scope: !2404, file: !14, line: 2030, baseType: !821, size: 64, offset: 576)
!2494 = !DIDerivedType(tag: DW_TAG_member, name: "StdErr", scope: !2404, file: !14, line: 2035, baseType: !2442, size: 64, offset: 640)
!2495 = !DIDerivedType(tag: DW_TAG_member, name: "RuntimeServices", scope: !2404, file: !14, line: 2039, baseType: !2496, size: 64, offset: 704)
!2496 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2497, size: 64)
!2497 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1871, baseType: !2498)
!2498 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1828, size: 1088, elements: !2499)
!2499 = !{!2500, !2501, !2528, !2533, !2538, !2543, !2557, !2558, !2564, !2569, !2574, !2575, !2576, !2590, !2595}
!2500 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !2498, file: !14, line: 1832, baseType: !2407, size: 192)
!2501 = !DIDerivedType(tag: DW_TAG_member, name: "GetTime", scope: !2498, file: !14, line: 1837, baseType: !2502, size: 64, offset: 192)
!2502 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_TIME", file: !14, line: 816, baseType: !2503)
!2503 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2504, size: 64)
!2504 = !DISubroutineType(types: !2505)
!2505 = !{!224, !2506, !2521}
!2506 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2507, size: 64)
!2507 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME", file: !192, line: 80, baseType: !2508)
!2508 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME", file: !192, line: 68, size: 128, elements: !2509)
!2509 = !{!2510, !2511, !2512, !2513, !2514, !2515, !2516, !2517, !2518, !2519, !2520}
!2510 = !DIDerivedType(tag: DW_TAG_member, name: "Year", scope: !2508, file: !192, line: 69, baseType: !198, size: 16)
!2511 = !DIDerivedType(tag: DW_TAG_member, name: "Month", scope: !2508, file: !192, line: 70, baseType: !109, size: 8, offset: 16)
!2512 = !DIDerivedType(tag: DW_TAG_member, name: "Day", scope: !2508, file: !192, line: 71, baseType: !109, size: 8, offset: 24)
!2513 = !DIDerivedType(tag: DW_TAG_member, name: "Hour", scope: !2508, file: !192, line: 72, baseType: !109, size: 8, offset: 32)
!2514 = !DIDerivedType(tag: DW_TAG_member, name: "Minute", scope: !2508, file: !192, line: 73, baseType: !109, size: 8, offset: 40)
!2515 = !DIDerivedType(tag: DW_TAG_member, name: "Second", scope: !2508, file: !192, line: 74, baseType: !109, size: 8, offset: 48)
!2516 = !DIDerivedType(tag: DW_TAG_member, name: "Pad1", scope: !2508, file: !192, line: 75, baseType: !109, size: 8, offset: 56)
!2517 = !DIDerivedType(tag: DW_TAG_member, name: "Nanosecond", scope: !2508, file: !192, line: 76, baseType: !90, size: 32, offset: 64)
!2518 = !DIDerivedType(tag: DW_TAG_member, name: "TimeZone", scope: !2508, file: !192, line: 77, baseType: !944, size: 16, offset: 96)
!2519 = !DIDerivedType(tag: DW_TAG_member, name: "Daylight", scope: !2508, file: !192, line: 78, baseType: !109, size: 8, offset: 112)
!2520 = !DIDerivedType(tag: DW_TAG_member, name: "Pad2", scope: !2508, file: !192, line: 79, baseType: !109, size: 8, offset: 120)
!2521 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2522, size: 64)
!2522 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME_CAPABILITIES", file: !14, line: 799, baseType: !2523)
!2523 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME_CAPABILITIES", file: !14, line: 776, size: 96, elements: !2524)
!2524 = !{!2525, !2526, !2527}
!2525 = !DIDerivedType(tag: DW_TAG_member, name: "Resolution", scope: !2523, file: !14, line: 783, baseType: !90, size: 32)
!2526 = !DIDerivedType(tag: DW_TAG_member, name: "Accuracy", scope: !2523, file: !14, line: 790, baseType: !90, size: 32, offset: 32)
!2527 = !DIDerivedType(tag: DW_TAG_member, name: "SetsToZero", scope: !2523, file: !14, line: 798, baseType: !68, size: 8, offset: 64)
!2528 = !DIDerivedType(tag: DW_TAG_member, name: "SetTime", scope: !2498, file: !14, line: 1838, baseType: !2529, size: 64, offset: 256)
!2529 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIME", file: !14, line: 833, baseType: !2530)
!2530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2531, size: 64)
!2531 = !DISubroutineType(types: !2532)
!2532 = !{!224, !2506}
!2533 = !DIDerivedType(tag: DW_TAG_member, name: "GetWakeupTime", scope: !2498, file: !14, line: 1839, baseType: !2534, size: 64, offset: 320)
!2534 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_WAKEUP_TIME", file: !14, line: 854, baseType: !2535)
!2535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2536, size: 64)
!2536 = !DISubroutineType(types: !2537)
!2537 = !{!224, !965, !965, !2506}
!2538 = !DIDerivedType(tag: DW_TAG_member, name: "SetWakeupTime", scope: !2498, file: !14, line: 1840, baseType: !2539, size: 64, offset: 384)
!2539 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WAKEUP_TIME", file: !14, line: 876, baseType: !2540)
!2540 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2541, size: 64)
!2541 = !DISubroutineType(types: !2542)
!2542 = !{!224, !68, !2506}
!2543 = !DIDerivedType(tag: DW_TAG_member, name: "SetVirtualAddressMap", scope: !2498, file: !14, line: 1845, baseType: !2544, size: 64, offset: 448)
!2544 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VIRTUAL_ADDRESS_MAP", file: !14, line: 327, baseType: !2545)
!2545 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2546, size: 64)
!2546 = !DISubroutineType(types: !2547)
!2547 = !{!224, !56, !56, !90, !2548}
!2548 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2549, size: 64)
!2549 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 175, baseType: !2550)
!2550 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 143, size: 320, elements: !2551)
!2551 = !{!2552, !2553, !2554, !2555, !2556}
!2552 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !2550, file: !14, line: 149, baseType: !90, size: 32)
!2553 = !DIDerivedType(tag: DW_TAG_member, name: "PhysicalStart", scope: !2550, file: !14, line: 155, baseType: !982, size: 64, offset: 64)
!2554 = !DIDerivedType(tag: DW_TAG_member, name: "VirtualStart", scope: !2550, file: !14, line: 161, baseType: !984, size: 64, offset: 128)
!2555 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfPages", scope: !2550, file: !14, line: 168, baseType: !58, size: 64, offset: 192)
!2556 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !2550, file: !14, line: 174, baseType: !58, size: 64, offset: 256)
!2557 = !DIDerivedType(tag: DW_TAG_member, name: "ConvertPointer", scope: !2498, file: !14, line: 1846, baseType: !988, size: 64, offset: 512)
!2558 = !DIDerivedType(tag: DW_TAG_member, name: "GetVariable", scope: !2498, file: !14, line: 1851, baseType: !2559, size: 64, offset: 576)
!2559 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_VARIABLE", file: !14, line: 686, baseType: !2560)
!2560 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2561, size: 64)
!2561 = !DISubroutineType(types: !2562)
!2562 = !{!224, !62, !2563, !1006, !886, !53}
!2563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!2564 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextVariableName", scope: !2498, file: !14, line: 1852, baseType: !2565, size: 64, offset: 640)
!2565 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_VARIABLE_NAME", file: !14, line: 722, baseType: !2566)
!2566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2567, size: 64)
!2567 = !DISubroutineType(types: !2568)
!2568 = !{!224, !886, !62, !2563}
!2569 = !DIDerivedType(tag: DW_TAG_member, name: "SetVariable", scope: !2498, file: !14, line: 1853, baseType: !2570, size: 64, offset: 704)
!2570 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VARIABLE", file: !14, line: 764, baseType: !2571)
!2571 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2572, size: 64)
!2572 = !DISubroutineType(types: !2573)
!2573 = !{!224, !62, !2563, !90, !56, !53}
!2574 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextHighMonotonicCount", scope: !2498, file: !14, line: 1858, baseType: !1018, size: 64, offset: 768)
!2575 = !DIDerivedType(tag: DW_TAG_member, name: "ResetSystem", scope: !2498, file: !14, line: 1859, baseType: !1023, size: 64, offset: 832)
!2576 = !DIDerivedType(tag: DW_TAG_member, name: "UpdateCapsule", scope: !2498, file: !14, line: 1864, baseType: !2577, size: 64, offset: 896)
!2577 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UPDATE_CAPSULE", file: !14, line: 1723, baseType: !2578)
!2578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2579, size: 64)
!2579 = !DISubroutineType(types: !2580)
!2580 = !{!224, !2581, !56, !982}
!2581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2582, size: 64)
!2582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2583, size: 64)
!2583 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CAPSULE_HEADER", file: !14, line: 1669, baseType: !2584)
!2584 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CAPSULE_HEADER", file: !14, line: 1648, size: 224, elements: !2585)
!2585 = !{!2586, !2587, !2588, !2589}
!2586 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleGuid", scope: !2584, file: !14, line: 1652, baseType: !191, size: 128)
!2587 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !2584, file: !14, line: 1658, baseType: !90, size: 32, offset: 128)
!2588 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !2584, file: !14, line: 1664, baseType: !90, size: 32, offset: 160)
!2589 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleImageSize", scope: !2584, file: !14, line: 1668, baseType: !90, size: 32, offset: 192)
!2590 = !DIDerivedType(tag: DW_TAG_member, name: "QueryCapsuleCapabilities", scope: !2498, file: !14, line: 1865, baseType: !2591, size: 64, offset: 960)
!2591 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_CAPSULE_CAPABILITIES", file: !14, line: 1754, baseType: !2592)
!2592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2593, size: 64)
!2593 = !DISubroutineType(types: !2594)
!2594 = !{!224, !2581, !56, !1047, !1048}
!2595 = !DIDerivedType(tag: DW_TAG_member, name: "QueryVariableInfo", scope: !2498, file: !14, line: 1870, baseType: !1050, size: 64, offset: 1024)
!2596 = !DIDerivedType(tag: DW_TAG_member, name: "BootServices", scope: !2404, file: !14, line: 2043, baseType: !2597, size: 64, offset: 768)
!2597 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2598, size: 64)
!2598 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_BOOT_SERVICES", file: !14, line: 1972, baseType: !2599)
!2599 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_BOOT_SERVICES", file: !14, line: 1879, size: 3008, elements: !2600)
!2600 = !{!2601, !2602, !2603, !2604, !2605, !2606, !2611, !2612, !2613, !2614, !2615, !2616, !2617, !2618, !2619, !2624, !2629, !2634, !2639, !2640, !2645, !2650, !2663, !2668, !2673, !2674, !2675, !2676, !2677, !2678, !2679, !2680, !2685, !2686, !2691, !2696, !2710, !2717, !2722, !2727, !2728, !2729, !2730, !2731, !2732}
!2601 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !2599, file: !14, line: 1883, baseType: !2407, size: 192)
!2602 = !DIDerivedType(tag: DW_TAG_member, name: "RaiseTPL", scope: !2599, file: !14, line: 1888, baseType: !1061, size: 64, offset: 192)
!2603 = !DIDerivedType(tag: DW_TAG_member, name: "RestoreTPL", scope: !2599, file: !14, line: 1889, baseType: !1067, size: 64, offset: 256)
!2604 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePages", scope: !2599, file: !14, line: 1894, baseType: !1072, size: 64, offset: 320)
!2605 = !DIDerivedType(tag: DW_TAG_member, name: "FreePages", scope: !2599, file: !14, line: 1895, baseType: !1080, size: 64, offset: 384)
!2606 = !DIDerivedType(tag: DW_TAG_member, name: "GetMemoryMap", scope: !2599, file: !14, line: 1896, baseType: !2607, size: 64, offset: 448)
!2607 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_MEMORY_MAP", file: !14, line: 256, baseType: !2608)
!2608 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2609, size: 64)
!2609 = !DISubroutineType(types: !2610)
!2610 = !{!224, !886, !2548, !886, !886, !1006}
!2611 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePool", scope: !2599, file: !14, line: 1897, baseType: !1090, size: 64, offset: 512)
!2612 = !DIDerivedType(tag: DW_TAG_member, name: "FreePool", scope: !2599, file: !14, line: 1898, baseType: !1095, size: 64, offset: 576)
!2613 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEvent", scope: !2599, file: !14, line: 1903, baseType: !1100, size: 64, offset: 640)
!2614 = !DIDerivedType(tag: DW_TAG_member, name: "SetTimer", scope: !2599, file: !14, line: 1904, baseType: !1110, size: 64, offset: 704)
!2615 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForEvent", scope: !2599, file: !14, line: 1905, baseType: !1116, size: 64, offset: 768)
!2616 = !DIDerivedType(tag: DW_TAG_member, name: "SignalEvent", scope: !2599, file: !14, line: 1906, baseType: !1121, size: 64, offset: 832)
!2617 = !DIDerivedType(tag: DW_TAG_member, name: "CloseEvent", scope: !2599, file: !14, line: 1907, baseType: !1126, size: 64, offset: 896)
!2618 = !DIDerivedType(tag: DW_TAG_member, name: "CheckEvent", scope: !2599, file: !14, line: 1908, baseType: !1128, size: 64, offset: 960)
!2619 = !DIDerivedType(tag: DW_TAG_member, name: "InstallProtocolInterface", scope: !2599, file: !14, line: 1913, baseType: !2620, size: 64, offset: 1024)
!2620 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_PROTOCOL_INTERFACE", file: !14, line: 1188, baseType: !2621)
!2621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2622, size: 64)
!2622 = !DISubroutineType(types: !2623)
!2623 = !{!224, !1134, !2563, !1135, !53}
!2624 = !DIDerivedType(tag: DW_TAG_member, name: "ReinstallProtocolInterface", scope: !2599, file: !14, line: 1914, baseType: !2625, size: 64, offset: 1088)
!2625 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1238, baseType: !2626)
!2626 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2627, size: 64)
!2627 = !DISubroutineType(types: !2628)
!2628 = !{!224, !821, !2563, !53, !53}
!2629 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallProtocolInterface", scope: !2599, file: !14, line: 1915, baseType: !2630, size: 64, offset: 1152)
!2630 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1264, baseType: !2631)
!2631 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2632, size: 64)
!2632 = !DISubroutineType(types: !2633)
!2633 = !{!224, !821, !2563, !53}
!2634 = !DIDerivedType(tag: DW_TAG_member, name: "HandleProtocol", scope: !2599, file: !14, line: 1916, baseType: !2635, size: 64, offset: 1216)
!2635 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE_PROTOCOL", file: !14, line: 1305, baseType: !2636)
!2636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2637, size: 64)
!2637 = !DISubroutineType(types: !2638)
!2638 = !{!224, !821, !2563, !71}
!2639 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !2599, file: !14, line: 1917, baseType: !53, size: 64, offset: 1280)
!2640 = !DIDerivedType(tag: DW_TAG_member, name: "RegisterProtocolNotify", scope: !2599, file: !14, line: 1918, baseType: !2641, size: 64, offset: 1344)
!2641 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REGISTER_PROTOCOL_NOTIFY", file: !14, line: 1466, baseType: !2642)
!2642 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2643, size: 64)
!2643 = !DISubroutineType(types: !2644)
!2644 = !{!224, !2563, !861, !71}
!2645 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandle", scope: !2599, file: !14, line: 1919, baseType: !2646, size: 64, offset: 1408)
!2646 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE", file: !14, line: 1515, baseType: !2647)
!2647 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2648, size: 64)
!2648 = !DISubroutineType(types: !2649)
!2649 = !{!224, !1162, !2563, !53, !886, !1134}
!2650 = !DIDerivedType(tag: DW_TAG_member, name: "LocateDevicePath", scope: !2599, file: !14, line: 1920, baseType: !2651, size: 64, offset: 1472)
!2651 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_DEVICE_PATH", file: !14, line: 1541, baseType: !2652)
!2652 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2653, size: 64)
!2653 = !DISubroutineType(types: !2654)
!2654 = !{!224, !2563, !2655, !1134}
!2655 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2656, size: 64)
!2656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2657, size: 64)
!2657 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DEVICE_PATH_PROTOCOL", file: !1171, line: 58, baseType: !2658)
!2658 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_DEVICE_PATH_PROTOCOL", file: !1171, line: 43, size: 32, elements: !2659)
!2659 = !{!2660, !2661, !2662}
!2660 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !2658, file: !1171, line: 44, baseType: !109, size: 8)
!2661 = !DIDerivedType(tag: DW_TAG_member, name: "SubType", scope: !2658, file: !1171, line: 51, baseType: !109, size: 8, offset: 8)
!2662 = !DIDerivedType(tag: DW_TAG_member, name: "Length", scope: !2658, file: !1171, line: 56, baseType: !1177, size: 16, offset: 16)
!2663 = !DIDerivedType(tag: DW_TAG_member, name: "InstallConfigurationTable", scope: !2599, file: !14, line: 1921, baseType: !2664, size: 64, offset: 1536)
!2664 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_CONFIGURATION_TABLE", file: !14, line: 1562, baseType: !2665)
!2665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2666, size: 64)
!2666 = !DISubroutineType(types: !2667)
!2667 = !{!224, !2563, !53}
!2668 = !DIDerivedType(tag: DW_TAG_member, name: "LoadImage", scope: !2599, file: !14, line: 1926, baseType: !2669, size: 64, offset: 1600)
!2669 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_LOAD", file: !14, line: 913, baseType: !2670)
!2670 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2671, size: 64)
!2671 = !DISubroutineType(types: !2672)
!2672 = !{!224, !68, !821, !2656, !53, !56, !1134}
!2673 = !DIDerivedType(tag: DW_TAG_member, name: "StartImage", scope: !2599, file: !14, line: 1927, baseType: !1191, size: 64, offset: 1664)
!2674 = !DIDerivedType(tag: DW_TAG_member, name: "Exit", scope: !2599, file: !14, line: 1928, baseType: !1197, size: 64, offset: 1728)
!2675 = !DIDerivedType(tag: DW_TAG_member, name: "UnloadImage", scope: !2599, file: !14, line: 1929, baseType: !1202, size: 64, offset: 1792)
!2676 = !DIDerivedType(tag: DW_TAG_member, name: "ExitBootServices", scope: !2599, file: !14, line: 1930, baseType: !1207, size: 64, offset: 1856)
!2677 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextMonotonicCount", scope: !2599, file: !14, line: 1935, baseType: !1212, size: 64, offset: 1920)
!2678 = !DIDerivedType(tag: DW_TAG_member, name: "Stall", scope: !2599, file: !14, line: 1936, baseType: !1217, size: 64, offset: 1984)
!2679 = !DIDerivedType(tag: DW_TAG_member, name: "SetWatchdogTimer", scope: !2599, file: !14, line: 1937, baseType: !1222, size: 64, offset: 2048)
!2680 = !DIDerivedType(tag: DW_TAG_member, name: "ConnectController", scope: !2599, file: !14, line: 1942, baseType: !2681, size: 64, offset: 2112)
!2681 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONNECT_CONTROLLER", file: !14, line: 361, baseType: !2682)
!2682 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2683, size: 64)
!2683 = !DISubroutineType(types: !2684)
!2684 = !{!224, !821, !1134, !2656, !68}
!2685 = !DIDerivedType(tag: DW_TAG_member, name: "DisconnectController", scope: !2599, file: !14, line: 1943, baseType: !1232, size: 64, offset: 2176)
!2686 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocol", scope: !2599, file: !14, line: 1948, baseType: !2687, size: 64, offset: 2240)
!2687 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL", file: !14, line: 1347, baseType: !2688)
!2688 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2689, size: 64)
!2689 = !DISubroutineType(types: !2690)
!2690 = !{!224, !821, !2563, !71, !821, !821, !90}
!2691 = !DIDerivedType(tag: DW_TAG_member, name: "CloseProtocol", scope: !2599, file: !14, line: 1949, baseType: !2692, size: 64, offset: 2304)
!2692 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_PROTOCOL", file: !14, line: 1379, baseType: !2693)
!2693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2694, size: 64)
!2694 = !DISubroutineType(types: !2695)
!2695 = !{!224, !821, !2563, !821, !821}
!2696 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocolInformation", scope: !2599, file: !14, line: 1950, baseType: !2697, size: 64, offset: 2368)
!2697 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION", file: !14, line: 1413, baseType: !2698)
!2698 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2699, size: 64)
!2699 = !DISubroutineType(types: !2700)
!2700 = !{!224, !821, !2563, !2701, !886}
!2701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2702, size: 64)
!2702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2703, size: 64)
!2703 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1394, baseType: !2704)
!2704 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1389, size: 192, elements: !2705)
!2705 = !{!2706, !2707, !2708, !2709}
!2706 = !DIDerivedType(tag: DW_TAG_member, name: "AgentHandle", scope: !2704, file: !14, line: 1390, baseType: !821, size: 64)
!2707 = !DIDerivedType(tag: DW_TAG_member, name: "ControllerHandle", scope: !2704, file: !14, line: 1391, baseType: !821, size: 64, offset: 64)
!2708 = !DIDerivedType(tag: DW_TAG_member, name: "Attributes", scope: !2704, file: !14, line: 1392, baseType: !90, size: 32, offset: 128)
!2709 = !DIDerivedType(tag: DW_TAG_member, name: "OpenCount", scope: !2704, file: !14, line: 1393, baseType: !90, size: 32, offset: 160)
!2710 = !DIDerivedType(tag: DW_TAG_member, name: "ProtocolsPerHandle", scope: !2599, file: !14, line: 1955, baseType: !2711, size: 64, offset: 2432)
!2711 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PROTOCOLS_PER_HANDLE", file: !14, line: 1443, baseType: !2712)
!2712 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2713, size: 64)
!2713 = !DISubroutineType(types: !2714)
!2714 = !{!224, !821, !2715, !886}
!2715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2716, size: 64)
!2716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2563, size: 64)
!2717 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandleBuffer", scope: !2599, file: !14, line: 1956, baseType: !2718, size: 64, offset: 2496)
!2718 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE_BUFFER", file: !14, line: 1588, baseType: !2719)
!2719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2720, size: 64)
!2720 = !DISubroutineType(types: !2721)
!2721 = !{!224, !1162, !2563, !53, !886, !1272}
!2722 = !DIDerivedType(tag: DW_TAG_member, name: "LocateProtocol", scope: !2599, file: !14, line: 1957, baseType: !2723, size: 64, offset: 2560)
!2723 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_PROTOCOL", file: !14, line: 1615, baseType: !2724)
!2724 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2725, size: 64)
!2725 = !DISubroutineType(types: !2726)
!2726 = !{!224, !2563, !53, !71}
!2727 = !DIDerivedType(tag: DW_TAG_member, name: "InstallMultipleProtocolInterfaces", scope: !2599, file: !14, line: 1958, baseType: !1279, size: 64, offset: 2624)
!2728 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallMultipleProtocolInterfaces", scope: !2599, file: !14, line: 1959, baseType: !1284, size: 64, offset: 2688)
!2729 = !DIDerivedType(tag: DW_TAG_member, name: "CalculateCrc32", scope: !2599, file: !14, line: 1964, baseType: !1289, size: 64, offset: 2752)
!2730 = !DIDerivedType(tag: DW_TAG_member, name: "CopyMem", scope: !2599, file: !14, line: 1969, baseType: !1294, size: 64, offset: 2816)
!2731 = !DIDerivedType(tag: DW_TAG_member, name: "SetMem", scope: !2599, file: !14, line: 1970, baseType: !1299, size: 64, offset: 2880)
!2732 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEventEx", scope: !2599, file: !14, line: 1971, baseType: !2733, size: 64, offset: 2944)
!2733 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT_EX", file: !14, line: 509, baseType: !2734)
!2734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2735, size: 64)
!2735 = !DISubroutineType(types: !2736)
!2736 = !{!224, !90, !1065, !1104, !1308, !2320, !1108}
!2737 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfTableEntries", scope: !2404, file: !14, line: 2047, baseType: !56, size: 64, offset: 832)
!2738 = !DIDerivedType(tag: DW_TAG_member, name: "ConfigurationTable", scope: !2404, file: !14, line: 2052, baseType: !2739, size: 64, offset: 896)
!2739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2740, size: 64)
!2740 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1987, baseType: !2741)
!2741 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1978, size: 192, elements: !2742)
!2742 = !{!2743, !2744}
!2743 = !DIDerivedType(tag: DW_TAG_member, name: "VendorGuid", scope: !2741, file: !14, line: 1982, baseType: !191, size: 128)
!2744 = !DIDerivedType(tag: DW_TAG_member, name: "VendorTable", scope: !2741, file: !14, line: 1986, baseType: !53, size: 64, offset: 128)
!2745 = !DILocalVariable(name: "ImageHandle", arg: 1, scope: !2399, file: !213, line: 180, type: !821)
!2746 = !DILocation(line: 180, scope: !2399)
!2747 = !DILocalVariable(name: "SystemTable", arg: 2, scope: !2399, file: !213, line: 181, type: !2402)
!2748 = !DILocation(line: 181, scope: !2399)
!2749 = !DILocalVariable(name: "Status", scope: !2399, file: !213, line: 184, type: !224)
!2750 = !DILocation(line: 184, scope: !2399)
!2751 = !DILocalVariable(name: "DispatchHandle", scope: !2399, file: !213, line: 185, type: !821)
!2752 = !DILocation(line: 185, scope: !2399)
!2753 = !DILocalVariable(name: "HeapManagerNotifyRegistration", scope: !2399, file: !213, line: 186, type: !53)
!2754 = !DILocation(line: 186, scope: !2399)
!2755 = !DILocalVariable(name: "CharConverterNotifyRegistration", scope: !2399, file: !213, line: 187, type: !53)
!2756 = !DILocation(line: 187, scope: !2399)
!2757 = !DILocation(line: 189, scope: !2399)
!2758 = !DILocation(line: 190, scope: !2399)
!2759 = !DILocation(line: 194, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2761, file: !213, line: 190)
!2761 = distinct !DILexicalBlock(scope: !2399, file: !213, line: 190)
!2762 = !DILocation(line: 199, scope: !2760)
!2763 = !DILocation(line: 200, scope: !2764)
!2764 = distinct !DILexicalBlock(scope: !2765, file: !213, line: 199)
!2765 = distinct !DILexicalBlock(scope: !2760, file: !213, line: 199)
!2766 = !DILocation(line: 200, scope: !2767)
!2767 = distinct !DILexicalBlock(scope: !2764, file: !213, line: 200)
!2768 = !DILocation(line: 200, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2770, file: !213, line: 200)
!2770 = distinct !DILexicalBlock(scope: !2767, file: !213, line: 200)
!2771 = !DILocation(line: 200, scope: !2772)
!2772 = distinct !DILexicalBlock(scope: !2769, file: !213, line: 200)
!2773 = !DILocation(line: 200, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2775, file: !213, line: 200)
!2775 = distinct !DILexicalBlock(scope: !2772, file: !213, line: 200)
!2776 = !DILocation(line: 201, scope: !2764)
!2777 = !DILocation(line: 203, scope: !2760)
!2778 = !DILocation(line: 206, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2761, file: !213, line: 205)
!2780 = !DILocation(line: 207, scope: !2779)
!2781 = !DILocation(line: 208, scope: !2779)
!2782 = !DILocation(line: 210, scope: !2399)
!2783 = !DILocation(line: 211, scope: !2399)
!2784 = !DILocation(line: 216, scope: !2399)
!2785 = !DILocation(line: 221, scope: !2399)
!2786 = !DILocation(line: 222, scope: !2787)
!2787 = distinct !DILexicalBlock(scope: !2788, file: !213, line: 221)
!2788 = distinct !DILexicalBlock(scope: !2399, file: !213, line: 221)
!2789 = !DILocation(line: 222, scope: !2790)
!2790 = distinct !DILexicalBlock(scope: !2787, file: !213, line: 222)
!2791 = !DILocation(line: 222, scope: !2792)
!2792 = distinct !DILexicalBlock(scope: !2793, file: !213, line: 222)
!2793 = distinct !DILexicalBlock(scope: !2790, file: !213, line: 222)
!2794 = !DILocation(line: 222, scope: !2795)
!2795 = distinct !DILexicalBlock(scope: !2792, file: !213, line: 222)
!2796 = !DILocation(line: 222, scope: !2797)
!2797 = distinct !DILexicalBlock(scope: !2798, file: !213, line: 222)
!2798 = distinct !DILexicalBlock(scope: !2795, file: !213, line: 222)
!2799 = !DILocation(line: 223, scope: !2787)
!2800 = !DILocation(line: 230, scope: !2399)
!2801 = !DILocation(line: 235, scope: !2399)
!2802 = !DILocation(line: 236, scope: !2803)
!2803 = distinct !DILexicalBlock(scope: !2804, file: !213, line: 235)
!2804 = distinct !DILexicalBlock(scope: !2399, file: !213, line: 235)
!2805 = !DILocation(line: 236, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2803, file: !213, line: 236)
!2807 = !DILocation(line: 236, scope: !2808)
!2808 = distinct !DILexicalBlock(scope: !2809, file: !213, line: 236)
!2809 = distinct !DILexicalBlock(scope: !2806, file: !213, line: 236)
!2810 = !DILocation(line: 236, scope: !2811)
!2811 = distinct !DILexicalBlock(scope: !2808, file: !213, line: 236)
!2812 = !DILocation(line: 236, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2814, file: !213, line: 236)
!2814 = distinct !DILexicalBlock(scope: !2811, file: !213, line: 236)
!2815 = !DILocation(line: 237, scope: !2803)
!2816 = !DILocation(line: 240, scope: !2399)
!2817 = !DILocation(line: 241, scope: !2399)
