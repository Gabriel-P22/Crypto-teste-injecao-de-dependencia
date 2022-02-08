import Foundation

extension String {
	func currencyFormattedValue() -> String {
    
		guard let doubleValue = Double(self) else {
			return "NaN"
		}
    
		let formatter = NumberFormatter()
    
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 2
		formatter.locale = Locale(identifier: "en_US")
		formatter.numberStyle = .currency
		formatter.currencyCode = "USD"

		let number = NSNumber(value: doubleValue)
    
    let formattedValue = formatter.string(from: number)

    return formattedValue ?? self
    
  }
}
