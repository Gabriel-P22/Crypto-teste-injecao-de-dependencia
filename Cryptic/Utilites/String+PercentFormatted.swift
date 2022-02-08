import Foundation

extension String {
	func percentFormattedValue() -> String {
		guard let doubleValue = Double(self) else {
			return "NaN"
		}
		let formatter = NumberFormatter()
		formatter.locale = Locale(identifier: "en_US")
		formatter.numberStyle = .percent
		formatter.minimumIntegerDigits = 1
		formatter.maximumIntegerDigits = 3
		formatter.maximumFractionDigits = 2
		formatter.minimumFractionDigits = 2
		formatter.multiplier = 1

    let number = NSNumber(value: doubleValue)
    let formattedValue = formatter.string(from: number)
    return formattedValue ?? self
	}
}
