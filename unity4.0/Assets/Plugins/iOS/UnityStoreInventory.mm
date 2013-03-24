#import "UnityStoreAssets.h"
#import "VirtualCategory.h"
#import "VirtualCurrency.h"
#import "VirtualGood.h"
#import "VirtualCurrencyPack.h"
#import "StaticPriceModel.h"
#import "StoreInventory.h"
#import "StoreController.h"
#import "VirtualItemNotFoundException.h"
#import "UnityCommons.h"

extern "C"{
	
	int storeInventory_GetCurrencyBalance(const char* itemId, int* outBalance){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			*outBalance = [StoreInventory getCurrencyBalance: itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualCurrency with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_AddCurrencyAmount(const char* itemId, int amount, int* outBalance){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			*outBalance = [StoreInventory addAmount: amount toCurrency: itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualCurrency with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_RemoveCurrencyAmount(const char* itemId, int amount, int* outBalance){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			*outBalance = [StoreInventory removeAmount: amount fromCurrency: itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualCurrency with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_GetGoodBalance(const char* itemId, int* outBalance){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			*outBalance = [StoreInventory getGoodBalance: itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualGood with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_AddGoodAmount(const char* itemId, int amount, int* outBalance){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];        
		@try {
			*outBalance = [StoreInventory addAmount: amount toGood: itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualGood with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_RemoveGoodAmount(const char* itemId, int amount, int* outBalance){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			*outBalance = [StoreInventory removeAmount: amount fromGood: itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualGood with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_EquipVirtualGood(const char* itemId){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			[StoreInventory equipVirtualGoodWithItemId:itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualGood with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_UnEquipVirtualGood(const char* itemId){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			[StoreInventory unEquipVirtualGoodWithItemId:itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualGood with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_IsVirtualGoodEquipped(const char* itemId, bool* outResult){
        NSString* itemIdS = [NSString stringWithUTF8String:itemId];
		@try {
			*outResult = [StoreInventory isVirtualGoodWithItemIdEquipped:itemIdS];
		}
		
		@catch (VirtualItemNotFoundException* e) {
            NSLog(@"Couldn't find a VirtualGood with itemId: %@.", itemIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
        }

		return NO_ERR;
	}
	
	int storeInventory_NonConsumableItemExists(const char* productId, bool* outResult){
	NSString* productIdS = [NSString stringWithUTF8String:productId];
		@try {
			*outResult = [StoreInventory nonConsumableItemExists:productIdS];
		}

		@catch (VirtualItemNotFoundException* e) {
	    NSLog(@"Couldn't find a NonConsumableItem with itemId: %@.", productIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
		}

		return NO_ERR;
	}

	int storeInventory_AddNonConsumableItem(const char* productId){
	NSString* productIdS = [NSString stringWithUTF8String:productId];
		@try {
			[StoreInventory addNonConsumableItem:productIdS];
		}

		@catch (VirtualItemNotFoundException* e) {
	    NSLog(@"Couldn't find a NonConsumableItem with itemId: %@.", productIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
		}

		return NO_ERR;
	}

	int storeInventory_RemoveNonConsumableItem(const char* productId){
	NSString* productIdS = [NSString stringWithUTF8String:productId];
		@try {
			[StoreInventory removeNonConsumableItem:productIdS];
		}

		@catch (VirtualItemNotFoundException* e) {
	    NSLog(@"Couldn't find a NonConsumableItem with itemId: %@.", productIdS);
			return EXCEPTION_ITEM_NOT_FOUND;
		}

		return NO_ERR;
	}

}