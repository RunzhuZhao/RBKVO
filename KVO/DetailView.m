//
//  DetailView.m
//  KVO
//
//  Created by Run on 2024/3/16.
//

#import "DetailView.h"
#import "Person.h"

@interface DetailView ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.nameLabel];
    }
    return self;
}

- (void)dealloc {
    [_person removeObserver:self forKeyPath:@"name"];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSString *name = change[NSKeyValueChangeNewKey];
        self.nameLabel.text = name;
    }
}

#pragma mark - Setters && Getters

- (void)setPerson:(Person *)person {
    if (_person != person) {
        _person = person;
        self.nameLabel.text = person.name;
        [_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

@end
