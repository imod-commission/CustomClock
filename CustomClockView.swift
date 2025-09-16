import UIKit

@objc class CustomClockView: UIView {
    private let timeLabel = UILabel()
    private var timer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        updateTime()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        updateTime()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        layer.cornerRadius = 12
        timeLabel.textColor = .white
        timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 32, weight: .medium)
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel);

        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    @objc private func updateTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        timeLabel.text = formatter.string(from: Date())
    }

    deinit {
        timer?.invalidate()
    }
}