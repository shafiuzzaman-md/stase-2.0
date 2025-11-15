/** @file
  Provides interface to advanced shell functionality for parsing both handle and protocol database.

  Copyright (c) 2011 - 2018, Intel Corporation. All rights reserved.<BR>
  (C) Copyright 2016 Hewlett Packard Enterprise Development LP<BR>
  (C) Copyright 2013-2016 Hewlett-Packard Development Company, L.P.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _UEFI_HANDLE_PARSING_LIB_INTERNAL_H_
#define _UEFI_HANDLE_PARSING_LIB_INTERNAL_H_

#include "../../../MdePkg/Include/Uefi.h"

#include "../../../MdePkg/Include/Guid/FileInfo.h"
#include "../../../MdeModulePkg/Include/Guid/ConsoleInDevice.h"
#include "../../../MdeModulePkg/Include/Guid/ConsoleOutDevice.h"
#include "../../../MdeModulePkg/Include/Guid/StandardErrorDevice.h"
#include "../../../MdePkg/Include/Guid/GlobalVariable.h"
#include "../../../MdePkg/Include/Guid/Gpt.h"
#include "../../../MdePkg/Include/Guid/FileSystemInfo.h"
#include "../../Include/Guid/ShellLibHiiGuid.h"

#include "../../../MdePkg/Include/Protocol/SimpleFileSystem.h"
#include "../../../MdePkg/Include/Protocol/LoadedImage.h"
#include "../../Include/Protocol/EfiShellInterface.h"
#include "../../Include/Protocol/EfiShellEnvironment2.h"
#include "../../../MdePkg/Include/Protocol/Shell.h"
#include "../../../MdePkg/Include/Protocol/ShellParameters.h"
#include "../../../MdePkg/Include/Protocol/DevicePathToText.h"
#include "../../../MdePkg/Include/Protocol/DriverBinding.h"
#include "../../../MdePkg/Include/Protocol/DriverConfiguration2.h"
#include "../../../MdePkg/Include/Protocol/DriverConfiguration.h"
#include "../../../MdePkg/Include/Protocol/DriverDiagnostics2.h"
#include "../../../MdePkg/Include/Protocol/DriverDiagnostics.h"
#include "../../../MdePkg/Include/Protocol/ComponentName2.h"
#include "../../../MdePkg/Include/Protocol/ComponentName.h"
#include "../../../MdePkg/Include/Protocol/PlatformDriverOverride.h"
#include "../../../BaseTools/Source/C/Include/Protocol/DevicePathUtilities.h"
#include "../../../MdePkg/Include/Protocol/DevicePathFromText.h"
#include "../../../MdePkg/Include/Protocol/BusSpecificDriverOverride.h"
#include "../../../MdePkg/Include/Protocol/PlatformToDriverConfiguration.h"
#include "../../../MdePkg/Include/Protocol/DriverSupportedEfiVersion.h"
#include "../../../MdePkg/Include/Protocol/SimpleTextInEx.h"
#include "../../../MdePkg/Include/Protocol/SimplePointer.h"
#include "../../../MdePkg/Include/Protocol/SerialIo.h"
#include "../../../MdePkg/Include/Protocol/AbsolutePointer.h"
#include "../../../BaseTools/Source/C/Include/Protocol/GraphicsOutput.h"
#include "../../../MdePkg/Include/Protocol/EdidDiscovered.h"
#include "../../../MdePkg/Include/Protocol/EdidActive.h"
#include "../../../MdePkg/Include/Protocol/EdidOverride.h"
#include "../../../MdePkg/Include/Protocol/LoadFile.h"
#include "../../../MdePkg/Include/Protocol/LoadFile2.h"
#include "../../../MdePkg/Include/Protocol/TapeIo.h"
#include "../../../MdePkg/Include/Protocol/DiskIo.h"
#include "../../../MdePkg/Include/Protocol/BlockIo.h"
#include "../../../MdePkg/Include/Protocol/UnicodeCollation.h"
#include "../../../MdePkg/Include/Protocol/PciRootBridgeIo.h"
#include "../../../MdePkg/Include/Protocol/PciIo.h"
#include "../../../MdePkg/Include/Protocol/ScsiPassThru.h"
#include "../../../MdePkg/Include/Protocol/ScsiPassThruExt.h"
#include "../../../MdePkg/Include/Protocol/ScsiIo.h"
#include "../../../MdePkg/Include/Protocol/IScsiInitiatorName.h"
#include "../../../MdePkg/Include/Protocol/UsbIo.h"
#include "../../../MdePkg/Include/Protocol/UsbHostController.h"
#include "../../../MdePkg/Include/Protocol/Usb2HostController.h"
#include "../../../MdePkg/Include/Protocol/DebugSupport.h"
#include "../../../MdePkg/Include/Protocol/DebugPort.h"
#include "../../../MdePkg/Include/Protocol/Decompress.h"
#include "../../../MdePkg/Include/Protocol/AcpiTable.h"
#include "../../../MdePkg/Include/Protocol/Ebc.h"
#include "../../../MdePkg/Include/Protocol/SimpleNetwork.h"
#include "../../../MdePkg/Include/Protocol/NetworkInterfaceIdentifier.h"
#include "../../../MdePkg/Include/Protocol/PxeBaseCode.h"
#include "../../../MdePkg/Include/Protocol/PxeBaseCodeCallBack.h"
#include "../../../MdePkg/Include/Protocol/Bis.h"
#include "../../../MdePkg/Include/Protocol/ManagedNetwork.h"
#include "../../../MdePkg/Include/Protocol/Arp.h"
#include "../../../MdePkg/Include/Protocol/Dhcp4.h"
#include "../../../MdePkg/Include/Protocol/Tcp4.h"
#include "../../../MdePkg/Include/Protocol/Ip4.h"
#include "../../../MdePkg/Include/Protocol/Ip4Config.h"
#include "../../../MdePkg/Include/Protocol/Ip4Config2.h"
#include "../../../MdePkg/Include/Protocol/Udp4.h"
#include "../../../MdePkg/Include/Protocol/Mtftp4.h"
#include "../../../MdePkg/Include/Protocol/AuthenticationInfo.h"
#include "../../../MdePkg/Include/Protocol/Hash.h"
#include "../../../MdePkg/Include/Protocol/HiiFont.h"
#include "../../../MdePkg/Include/Protocol/HiiString.h"
#include "../../../MdePkg/Include/Protocol/HiiImage.h"
#include "../../../MdePkg/Include/Protocol/HiiDatabase.h"
#include "../../../MdePkg/Include/Protocol/HiiConfigRouting.h"
#include "../../../MdePkg/Include/Protocol/HiiConfigAccess.h"
#include "../../../MdePkg/Include/Protocol/FormBrowser2.h"
#include "../../../MdePkg/Include/Protocol/DeviceIo.h"
#include "../../../BaseTools/Source/C/Include/Protocol/UgaDraw.h"
#include "../../../MdePkg/Include/Protocol/UgaIo.h"
#include "../../../MdePkg/Include/Protocol/DriverConfiguration.h"
#include "../../../MdePkg/Include/Protocol/DriverConfiguration2.h"
#include "../../../BaseTools/Source/C/Include/Protocol/DevicePathUtilities.h"
// #include <Protocol/FirmwareVolume.h>
// #include <Protocol/FirmwareVolume2.h>
#include "../../../MdePkg/Include/Protocol/DriverFamilyOverride.h"
#include "../../../MdePkg/Include/Protocol/Pcd.h"
#include "../../../MdePkg/Include/Protocol/TcgService.h"
#include "../../../MdePkg/Include/Protocol/HiiPackageList.h"
#include "../../../MdePkg/Include/Protocol/Ip6.h"
#include "../../../MdePkg/Include/Protocol/Ip6Config.h"
#include "../../../MdePkg/Include/Protocol/Mtftp6.h"
#include "../../../MdePkg/Include/Protocol/Dhcp6.h"
#include "../../../MdePkg/Include/Protocol/Udp6.h"
#include "../../../MdePkg/Include/Protocol/Tcp6.h"
#include "../../../MdePkg/Include/Protocol/VlanConfig.h"
#include "../../../MdePkg/Include/Protocol/Eap.h"
#include "../../../MdePkg/Include/Protocol/EapManagement.h"
#include "../../../MdePkg/Include/Protocol/Ftp4.h"
#include "../../../MdePkg/Include/Protocol/IpSecConfig.h"
#include "../../../MdePkg/Include/Protocol/DriverHealth.h"
#include "../../../MdePkg/Include/Protocol/DeferredImageLoad.h"
#include "../../../MdePkg/Include/Protocol/UserCredential.h"
#include "../../../MdePkg/Include/Protocol/UserManager.h"
#include "../../../MdePkg/Include/Protocol/AtaPassThru.h"
#include "../../../MdePkg/Include/Protocol/FirmwareManagement.h"
#include "../../../MdePkg/Include/Protocol/IpSec.h"
#include "../../../MdePkg/Include/Protocol/Kms.h"
#include "../../../MdePkg/Include/Protocol/BlockIo2.h"
#include "../../../MdePkg/Include/Protocol/StorageSecurityCommand.h"
#include "../../../MdePkg/Include/Protocol/UserCredential2.h"
#include "../../../MdePkg/Include/Protocol/IdeControllerInit.h"
#include "../../../MdePkg/Include/Protocol/DiskIo2.h"
#include "../../../MdePkg/Include/Protocol/AdapterInformation.h"
#include "../../../MdePkg/Include/Protocol/ShellDynamicCommand.h"
#include "../../../MdePkg/Include/Protocol/DiskInfo.h"
#include "../../../MdePkg/Include/Protocol/PartitionInfo.h"

#include "../../Include/Library/HandleParsingLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdeModulePkg/Include/Library/HiiLib.h"
#include "../../Include/Library/ShellLib.h"
#include "../../../MdeModulePkg/Include/Library/SortLib.h"
#include "../../Include/Library/ShellCommandLib.h"
#include "../../../MdePkg/Include/Library/PeCoffGetEntryPointLib.h"

#define   EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION_V1  1
#define   EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION_V2  2

///
/// EFI_FIRMWARE_IMAGE_DESCRIPTOR in UEFI spec < 2.4a
///
typedef struct {
  ///
  /// A unique number identifying the firmware image within the device.  The number is
  /// between 1 and DescriptorCount.
  ///
  UINT8       ImageIndex;
  ///
  /// A unique number identifying the firmware image type.
  ///
  EFI_GUID    ImageTypeId;
  ///
  /// A unique number identifying the firmware image.
  ///
  UINT64      ImageId;
  ///
  /// A pointer to a null-terminated string representing the firmware image name.
  ///
  CHAR16      *ImageIdName;
  ///
  /// Identifies the version of the device firmware. The format is vendor specific and new
  /// version must have a greater value than an old version.
  ///
  UINT32      Version;
  ///
  /// A pointer to a null-terminated string representing the firmware image version name.
  ///
  CHAR16      *VersionName;
  ///
  /// Size of the image in bytes.  If size=0, then only ImageIndex and ImageTypeId are valid.
  ///
  UINTN       Size;
  ///
  /// Image attributes that are supported by this device.  See 'Image Attribute Definitions'
  /// for possible returned values of this parameter.  A value of 1 indicates the attribute is
  /// supported and the current setting value is indicated in AttributesSetting.  A
  /// value of 0 indicates the attribute is not supported and the current setting value in
  /// AttributesSetting is meaningless.
  ///
  UINT64      AttributesSupported;
  ///
  /// Image attributes.  See 'Image Attribute Definitions' for possible returned values of
  /// this parameter.
  ///
  UINT64      AttributesSetting;
  ///
  /// Image compatibilities.  See 'Image Compatibility Definitions' for possible returned
  /// values of this parameter.
  ///
  UINT64      Compatibilities;
} EFI_FIRMWARE_IMAGE_DESCRIPTOR_V1;

///
/// EFI_FIRMWARE_IMAGE_DESCRIPTOR in UEFI spec > 2.4a and < 2.5
///
typedef struct {
  ///
  /// A unique number identifying the firmware image within the device.  The number is
  /// between 1 and DescriptorCount.
  ///
  UINT8       ImageIndex;
  ///
  /// A unique number identifying the firmware image type.
  ///
  EFI_GUID    ImageTypeId;
  ///
  /// A unique number identifying the firmware image.
  ///
  UINT64      ImageId;
  ///
  /// A pointer to a null-terminated string representing the firmware image name.
  ///
  CHAR16      *ImageIdName;
  ///
  /// Identifies the version of the device firmware. The format is vendor specific and new
  /// version must have a greater value than an old version.
  ///
  UINT32      Version;
  ///
  /// A pointer to a null-terminated string representing the firmware image version name.
  ///
  CHAR16      *VersionName;
  ///
  /// Size of the image in bytes.  If size=0, then only ImageIndex and ImageTypeId are valid.
  ///
  UINTN       Size;
  ///
  /// Image attributes that are supported by this device.  See 'Image Attribute Definitions'
  /// for possible returned values of this parameter.  A value of 1 indicates the attribute is
  /// supported and the current setting value is indicated in AttributesSetting.  A
  /// value of 0 indicates the attribute is not supported and the current setting value in
  /// AttributesSetting is meaningless.
  ///
  UINT64      AttributesSupported;
  ///
  /// Image attributes.  See 'Image Attribute Definitions' for possible returned values of
  /// this parameter.
  ///
  UINT64      AttributesSetting;
  ///
  /// Image compatibilities.  See 'Image Compatibility Definitions' for possible returned
  /// values of this parameter.
  ///
  UINT64      Compatibilities;
  ///
  /// Describes the lowest ImageDescriptor version that the device will accept. Only
  /// present in version 2 or higher.
  UINT32      LowestSupportedImageVersion;
} EFI_FIRMWARE_IMAGE_DESCRIPTOR_V2;

typedef struct {
  LIST_ENTRY    Link;
  EFI_HANDLE    TheHandle;
  UINTN         TheIndex;
} HANDLE_LIST;

typedef struct {
  HANDLE_LIST    List;
  UINTN          NextIndex;
} HANDLE_INDEX_LIST;

typedef
CHAR16 *
(EFIAPI *DUMP_PROTOCOL_INFO)(
  IN CONST EFI_HANDLE TheHandle,
  IN CONST BOOLEAN    Verbose
  );

typedef struct _GUID_INFO_BLOCK {
  EFI_STRING_ID         StringId;
  EFI_GUID              *GuidId;
  DUMP_PROTOCOL_INFO    DumpInfo;
} GUID_INFO_BLOCK;

#endif
